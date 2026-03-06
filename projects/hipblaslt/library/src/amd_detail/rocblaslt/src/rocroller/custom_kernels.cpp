// Copyright Advanced Micro Devices, Inc., or its affiliates.
// SPDX-License-Identifier: MIT

#include "custom_kernels.hpp"
#include "custom_kernel_registry.hpp"

#include <hip/hip_ext.h>
#include <hip/hip_runtime.h>
#include <iostream>
#include <vector>

namespace
{
    KernelType makeMxfp4KernelType(bool swizzleA)
    {
        KernelType k;
        k.typeA                     = rocRoller::DataType::FP4;
        k.typeB                     = rocRoller::DataType::FP4;
        k.typeC                     = rocRoller::DataType::BFloat16;
        k.typeD                     = rocRoller::DataType::BFloat16;
        k.transA                    = true;
        k.transB                    = false;
        k.scaleTypeA.mode           = rocRoller::Operations::ScaleMode::Separate;
        k.scaleTypeA.blockRowSize   = 32;
        k.scaleTypeA.blockColSize   = 1;
        k.scaleTypeA.preSwizzleTile = {32, 8, 4};
        k.scaleTypeA.preTile        = {32, 8};
        k.scaleTypeB.mode           = rocRoller::Operations::ScaleMode::Separate;
        k.scaleTypeB.blockRowSize   = 1;
        k.scaleTypeB.blockColSize   = 32;
        k.scaleTypeB.preSwizzleTile = {32, 8, 4};
        k.scaleTypeB.preTile        = {8, 32};
        k.swizzleA                  = swizzleA;
        return k;
    }
} // namespace

std::shared_ptr<GemmKernel> createCustomGemmKernel(const std::string&           customKernelName,
                                                   const KernelType&            kernelType,
                                                   const WorkGroupTileSize&     wgt,
                                                   const std::array<int, 3>&    blockSize,
                                                   const std::filesystem::path& path)
{
    auto gemmKernel = std::make_shared<GemmKernel>();

    gemmKernel->params                = std::make_shared<SolutionParameters>();
    gemmKernel->params->kernelType    = kernelType;
    gemmKernel->params->workgroupTile = wgt;

    gemmKernel->module          = GemmHipModuleWrapper(customKernelName, path);
    gemmKernel->customBlockSize = blockSize;

    return gemmKernel;
}

// Add all custom kernels to the SolutionCache from kernels.yaml.
// Kernels are registered so solution selection uses their workgroup sizes via the registry.
void preloadCustomKernels(SolutionCache& cache)
{
    const std::filesystem::path basePath = getCoPath();
    const std::filesystem::path coPath   = getCoFilePath(basePath);

    std::vector<CustomKernelDescriptor> descriptors = loadCustomKernelsFromYaml(basePath);

    for(const auto& d : descriptors)
    {
        // Only mxfp4 kernel type is supported from YAML for now
        if(d.kernelType != "mxfp4")
            continue;

        KernelType              kernelType = makeMxfp4KernelType(d.shuffle);
        SolutionIndexParameters params;
        params.tailLoops     = true;
        params.workgroupTile = d.workgroupSize;

        for(bool streamK : {false, true})
        {
            for(bool workgroupMapping : {false, true})
            {
                params.streamK          = streamK;
                params.workgroupMapping = workgroupMapping;
                cache.addKernel(
                    kernelType,
                    params,
                    createCustomGemmKernel(
                        d.entryFunction, kernelType, params.workgroupTile, d.blockSize, coPath));
            }
        }
        registerCustomKernelWorkgroupSize(kernelType, d.workgroupSize);
    }
}

// Wave GEMM kernel ABI: 120 bytes. Kernel signature: gemm(a, a_scale, b, b_scale, c) with
// C[M,N] = A[M,K] @ B[N,K]^T (scaled). The kernel expects transA=N, transB=T.
//
// LAYOUT (Wave NT ↔ hipBLASLt TN, column-major). See wave_hipblaslt_scale_layouts.md.
// - Wave indexes: A(m,k), B(n,k), C(m,n); a_scale(m, k_block), b_scale(n, k_block).
// - hipBLASLt stores: A as K×M (dataRow=K, dataCol=M), B as K×N, D as N×M; scale A (K/32,M), B (K/32,N).
//   So we pass strides so Wave's (dim0, dim1) produces the same linear offset as column-major storage:
//   A: offset = k + m*K  → stride_a_dim0 = K (col_stride_a), stride_a_dim1 = 1 (row_stride_a).
//   B: offset = k + n*K  → stride_b_dim0 = K, stride_b_dim1 = 1.
//   C: offset = n + m*N  → stride_c_dim0 = N, stride_c_dim1 = 1.
// - Scale: hipBLASLt (K/32, M) col-major has (k_block, m) at k_block + m*(K/32). Wave indexes (m, k_block)
//   and needs the same address → stride_a_scale_dim0 = K/32, stride_a_scale_dim1 = 1 (same for B).
//
// Kernarg: 5 pointers (40 B) then 10 strides as uint64_t (80 B). Stride order = buffer order
// (a, a_scale, b, b_scale, c), per buffer dim0 then dim1. For K > 256 the kernel can fault; safe for K<=256.
struct __attribute__((packed)) WaveGemmKernelArgs
{
    const void* ptr_a; // 0:   A [M,K]
    const void* ptr_a_scale; // 8:   A scale
    const void* ptr_b; // 16:  B [N,K]
    const void* ptr_b_scale; // 24:  B scale
    void*       ptr_c; // 32:  C [M,N] output
    uint64_t    m; // 40:  M
    uint64_t    n; // 48:  N
    uint64_t    k; // 56:  K
    uint64_t    stride_a_dim0; // 64:  a dim0 (row stride)
    uint64_t    stride_a_scale_dim0; // 72
    uint64_t    stride_b_dim0; // 80
    uint64_t    stride_b_scale_dim0; // 88
    uint64_t    stride_c_dim0; // 96: C leading dim (kernel arg13)
};
static_assert(sizeof(WaveGemmKernelArgs) == 104, "Wave kernel kernarg is 104 bytes");

inline WaveGemmKernelArgs makeWaveGemmKernelArgs(const RocblasltContractionProblem& prob)
{
    WaveGemmKernelArgs w  = {};
    w.ptr_a               = prob.B; // swap
    w.ptr_a_scale         = prob.scaleB; // swap
    w.ptr_b               = prob.A; // swap
    w.ptr_b_scale         = prob.scaleA; // swap
    w.ptr_c               = prob.D;
    w.m                   = prob.n; // swap
    w.n                   = prob.m; // swap
    w.k                   = prob.k;
    w.stride_a_dim0       = prob.col_stride_b / 2; // swap; FP4 byte stride = elements / 2
    w.stride_a_scale_dim0 = prob.k / 32;
    w.stride_b_dim0       = prob.col_stride_a / 2; // swap; FP4 byte stride = elements / 2
    w.stride_b_scale_dim0 = prob.k / 32;
    w.stride_c_dim0       = prob.col_stride_c;
    return w;
}

// F4 GEMM Kernel Args

struct __attribute__((packed)) p3
{
    uint32_t _p0 = 0;
    uint32_t _p1 = 0;
    uint32_t _p2 = 0;
};
struct __attribute__((packed)) p2
{
    uint32_t _p0 = 0;
    uint32_t _p1 = 0;
};
struct __attribute__((packed)) F4GemmKernelArgs
{
    void*       ptr_D;
    p2          _p0;
    const void* ptr_C;
    p2          _p1;
    const void* ptr_A;
    p2          _p2;
    const void* ptr_B;
    p2          _p3;
    float       alpha;
    p3          _p4;
    float       beta;
    p3          _p5;
    uint32_t    stride_D0;
    p3          _p6;
    uint32_t    stride_D1;
    p3          _p7;
    uint32_t    stride_C0;
    p3          _p8;
    uint32_t    stride_C1;
    p3          _p9;
    uint32_t    stride_A0;
    p3          _p10;
    uint32_t    stride_A1;
    p3          _p11;
    uint32_t    stride_B0;
    p3          _p12;
    uint32_t    stride_B1;
    p3          _p13;
    uint32_t    M;
    p3          _p14;
    uint32_t    N;
    p3          _p15;
    uint32_t    K;
    p3          _p16;
    const void* ptr_ScaleA;
    p2          _p17;
    const void* ptr_ScaleB;
    p2          _p18;
    uint32_t    stride_ScaleA0;
    p3          _p19;
    uint32_t    stride_ScaleA1;
    p3          _p20;
    uint32_t    stride_ScaleB0;
    p3          _p21;
    uint32_t    stride_ScaleB1;
    p3          _p22;
    int         log2_k_split;
};

inline F4GemmKernelArgs makeF4GemmKernelArgs(const RocblasltContractionProblem& prob)
{
    F4GemmKernelArgs a = {};
    a.ptr_D            = prob.D;
    a.ptr_C            = nullptr;
    a.ptr_A            = const_cast<void*>(prob.B); // swap
    a.ptr_B            = const_cast<void*>(prob.A); // swap
    a.alpha            = *static_cast<const float*>(prob.alpha);
    a.beta             = *static_cast<const float*>(prob.beta);
    a.stride_C0        = static_cast<uint32_t>(prob.col_stride_c);
    a.stride_A0        = static_cast<uint32_t>(prob.col_stride_b); // swap
    a.stride_B0        = static_cast<uint32_t>(prob.col_stride_a); // swap
    a.M                = static_cast<uint32_t>(prob.n); // swap
    a.N                = static_cast<uint32_t>(prob.m); // swap
    a.K                = static_cast<uint32_t>(prob.k);
    a.ptr_ScaleA       = prob.scaleB; // swap
    a.ptr_ScaleB       = prob.scaleA; // swap
    a.stride_ScaleA0   = static_cast<uint32_t>(prob.k / 32);
    a.stride_ScaleB0   = static_cast<uint32_t>(prob.k / 32);
    return a;
}

rocblaslt_status runCustomKernel(std::shared_ptr<GemmKernel>        gemm,
                                 const RocblasltContractionProblem& prob)
{
    if(!gemm->module.has_value())
    {
        std::cerr << "runCustomKernel failed: Module not loadable" << std::endl;
        return rocblaslt_status_internal_error;
    }

    if(prob.beta && *static_cast<const float*>(prob.beta) != 0)
    {
        std::cerr << "Kernel only supports when beta is 0" << std::endl;
        return rocblaslt_status_invalid_value;
    }

    if(!gemm->customBlockSize.has_value())
    {
        std::cerr << "runCustomKernel failed: custom kernel missing block_size (kernels.yaml)"
                  << std::endl;
        return rocblaslt_status_internal_error;
    }
    const auto& bs = *gemm->customBlockSize;

    const std::string& kernelName   = gemm->module->getKernelName();
    bool               isWaveKernel = kernelName.rfind("wave", 0) == 0;

    static WaveGemmKernelArgs waveArgsStorage;
    static F4GemmKernelArgs   aiterArgsStorage;

    void*  argsPtr;
    size_t argsSize;

    if(isWaveKernel)
    {
        waveArgsStorage = makeWaveGemmKernelArgs(prob);
        argsPtr         = &waveArgsStorage;
        argsSize        = sizeof(waveArgsStorage);
    }
    else
    {
        aiterArgsStorage = makeF4GemmKernelArgs(prob);
        argsPtr          = &aiterArgsStorage;
        argsSize         = sizeof(aiterArgsStorage);
    }

    const uint32_t tileM = gemm->params->workgroupTile.m;
    const uint32_t tileN = gemm->params->workgroupTile.n;

    uint32_t tilesM = (static_cast<uint32_t>(prob.n) + tileM - 1) / tileM;
    uint32_t tilesN = (static_cast<uint32_t>(prob.m) + tileN - 1) / tileN;

    dim3 grid;
    dim3 block;
    block.x = bs[0];
    block.y = bs[1];
    block.z = bs[2];

    if(isWaveKernel)
    {
        // Wave compiler: M → grid dim 0 (x), N → grid dim 1 (y)
        // hipModuleLaunchKernel takes grid as number of blocks
        grid.x = tilesM;
        grid.y = tilesN;
        grid.z = 1;
    }
    else
    {
        // AITER: hipExtModuleLaunchKernel takes grid as total threads
        grid.x = tilesN * bs[0];
        grid.y = tilesM * bs[1];
        grid.z = 1;
    }

    std::cout << "Launching kernel with grid: " << grid.x << " " << grid.y << " " << grid.z
              << " and block: " << block.x << " " << block.y << " " << block.z << std::endl;

    void* hipLaunchParams[] = {HIP_LAUNCH_PARAM_BUFFER_POINTER,
                               argsPtr,
                               HIP_LAUNCH_PARAM_BUFFER_SIZE,
                               &argsSize,
                               HIP_LAUNCH_PARAM_END};

    hipFunction_t function;
    if(hipError_t error = gemm->module->getHipFunction(function))
    {
        std::cerr << "GemmHipModuleWrapper::getHipFunction failed: " << std::endl
                  << " error: " << hipGetErrorString(error) << std::endl;
        return rocblaslt_status_internal_error;
    }

    if(isWaveKernel)
    {
        if(hipError_t error = hipModuleLaunchKernel(function,
                                                    grid.x,
                                                    grid.y,
                                                    grid.z,
                                                    block.x,
                                                    block.y,
                                                    block.z,
                                                    0, // sharedMem
                                                    prob.stream, // stream
                                                    nullptr,
                                                    (void**)&hipLaunchParams))
        {
            std::cerr << "hipModuleLaunchKernel in runCustomKernel failed: "
                      << gemm->module->getKernelName() << std::endl
                      << " error: " << hipGetErrorString(error) << std::endl;
            return rocblaslt_status_internal_error;
        }
    }
    else
    {
        if(hipError_t error = hipExtModuleLaunchKernel(function,
                                                       grid.x,
                                                       grid.y,
                                                       grid.z,
                                                       block.x,
                                                       block.y,
                                                       block.z,
                                                       0, // sharedMem
                                                       prob.stream, // stream
                                                       nullptr,
                                                       (void**)&hipLaunchParams,
                                                       nullptr, // event
                                                       nullptr // event
                                                       ))
        {
            std::cerr << "hipExtModuleLaunchKernel in runCustomKernel failed: "
                      << gemm->module->getKernelName() << std::endl
                      << " error: " << hipGetErrorString(error) << std::endl;
            return rocblaslt_status_internal_error;
        }
    }

    return rocblaslt_status_success;
}