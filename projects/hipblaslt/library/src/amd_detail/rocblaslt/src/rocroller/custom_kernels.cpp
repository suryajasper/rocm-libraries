// Copyright Advanced Micro Devices, Inc., or its affiliates.
// SPDX-License-Identifier: MIT

#include "custom_kernels.hpp"
#include "custom_kernel_registry.hpp"

#include <hip/hip_ext.h>
#include <hip/hip_runtime.h>
#include <iostream>

#ifdef HIPBLASLT_ROCROLLER_USE_YAML_CPP
#include <yaml-cpp/yaml.h>
#include <fstream>
#endif

std::shared_ptr<GemmKernel> createCustomGemmKernel(const std::string&           customKernelName,
                                                   const KernelType&            kernelType,
                                                   const WorkGroupTileSize&     wgt,
                                                   const std::filesystem::path& path,
                                                   const std::string&           symbolNameForLoad)
{
    auto gemmKernel = std::make_shared<GemmKernel>();

    gemmKernel->params                = std::make_shared<SolutionParameters>();
    gemmKernel->params->kernelType    = kernelType;
    gemmKernel->params->workgroupTile = wgt;

    gemmKernel->module = GemmHipModuleWrapper(
        customKernelName, path.string(), symbolNameForLoad);

    return gemmKernel;
}

std::filesystem::path getCoPath()
{
    std::filesystem::path libraryPath;
    bool                  staticLib = false;

#ifdef HIPBLASLT_STATIC_LIB
    staticLib = true;
#endif

    const char* env = getenv("HIPBLASLT_TENSILE_LIBPATH");
    if(env)
    {
        libraryPath = env;
    }
    else
    {
        // Find the location of librocblaslt.so
        // Fall back on hard-coded path if static library or not found
        std::optional<std::filesystem::path> default_lib_path;
        if(staticLib)
        {
            // Assume library files are in "/opt/rocm"
            default_lib_path = "/opt/rocm/lib";
        }

        if(auto maybe_path = rocblaslt_find_library_relative_path(
               /*relpath=*/std::nullopt, default_lib_path))
        {
            // Worst case use "./"
            libraryPath = maybe_path.value_or(".");
        }
    }

    return libraryPath;
}

namespace
{
    KernelType getKernelTypePresetMxfp4()
    {
        KernelType k;
        k.typeA                     = rocRoller::DataType::FP4;
        k.typeB                     = rocRoller::DataType::FP4;
        k.typeC                     = rocRoller::DataType::BFloat16;
        k.typeD                     = rocRoller::DataType::BFloat16;
        k.transA                    = true;
        k.transB                    = false;
        k.swizzleB = true;
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
        return k;
    }

    KernelType getKernelTypeFromPresetName(const std::string& name)
    {
        if(name == "mxfp4")
            return getKernelTypePresetMxfp4();
        // Default to mxfp4 for backward compatibility
        return getKernelTypePresetMxfp4();
    }

    std::filesystem::path resolveKernelPath(const std::filesystem::path& basePath,
                                            const std::string&            pathStr)
    {
        std::filesystem::path p(pathStr);
        if(p.is_absolute())
            return p;
        // Try basePath / path and basePath / "library" / path (build layout)
        std::filesystem::path inBase = basePath / pathStr;
        if(std::filesystem::exists(inBase))
            return inBase;
        std::filesystem::path inLibrary = basePath / "library" / pathStr;
        if(std::filesystem::exists(inLibrary))
            return inLibrary;
        return inBase; // let loader report missing file
    }
} // namespace

#ifdef HIPBLASLT_ROCROLLER_USE_YAML_CPP
static std::filesystem::path findCustomKernelsYaml()
{
    std::filesystem::path base = getCoPath();
    std::filesystem::path inLibrary = base / "library" / "custom_kernels.yaml";
    if(std::filesystem::exists(inLibrary))
        return inLibrary;
    std::filesystem::path inBase = base / "custom_kernels.yaml";
    if(std::filesystem::exists(inBase))
        return inBase;
    return {};
}
#endif

// Add all custom kernels to the SolutionCache from kernels.yaml (when yaml-cpp available).
void preloadCustomKernels(SolutionCache& cache)
{
#ifdef HIPBLASLT_ROCROLLER_USE_YAML_CPP
    std::filesystem::path yamlPath = findCustomKernelsYaml();
    if(yamlPath.empty())
    {
        std::cout << "custom_kernels: no custom_kernels.yaml found, skipping custom kernel load"
                  << std::endl;
        return;
    }

    YAML::Node root;
    try
    {
        root = YAML::LoadFile(yamlPath.string());
    }
    catch(const std::exception& e)
    {
        std::cerr << "custom_kernels: failed to load " << yamlPath << ": " << e.what() << std::endl;
        return;
    }

    const YAML::Node kernels = root["kernels"];
    if(!kernels || !kernels.IsSequence())
    {
        std::cerr << "custom_kernels: missing or invalid 'kernels' sequence in " << yamlPath
                  << std::endl;
        return;
    }

    std::filesystem::path basePath = getCoPath();

    SolutionIndexParameters params;
    params.streamK       = false;
    params.tailLoops     = true;

    for(size_t i = 0; i < kernels.size(); ++i)
    {
        const YAML::Node& entry = kernels[i];
        if(!entry["name"] || !entry["path"] || !entry["workgroup_size"])
        {
            std::cerr << "custom_kernels: entry " << i << " missing name/path/workgroup_size"
                      << std::endl;
            continue;
        }

        std::string name = entry["name"].as<std::string>();
        std::string pathStr = entry["path"].as<std::string>();
        std::string entryFunction = entry["entry_function"] ? entry["entry_function"].as<std::string>() : name;
        std::string kernelTypePreset = entry["kernel_type"] ? entry["kernel_type"].as<std::string>() : "mxfp4";

        if(!entry["workgroup_size"].IsSequence() || entry["workgroup_size"].size() != 3)
        {
            std::cerr << "custom_kernels: entry " << i << " workgroup_size must be [m, n, k]"
                      << std::endl;
            continue;
        }
        WorkGroupTileSize wgt;
        wgt.m = entry["workgroup_size"][0].as<int>();
        wgt.n = entry["workgroup_size"][1].as<int>();
        wgt.k = entry["workgroup_size"][2].as<int>();

        KernelType kernelType = getKernelTypeFromPresetName(kernelTypePreset);
        std::filesystem::path resolvedPath = resolveKernelPath(basePath, pathStr);

        registerCustomKernelWorkgroupSize(kernelType, wgt);

        auto kernel = createCustomGemmKernel(name, kernelType, wgt, resolvedPath, entryFunction);

        for (bool workgroupMapping : {false, true}) {
            for (bool streamK : {false, true}) {
                params.workgroupTile = wgt;
                params.workgroupMapping = workgroupMapping;
                params.streamK = streamK;
                params.tailLoops = true;
                cache.addKernel(kernelType, params, kernel);
            }
        }
    }
#else
    (void)cache;
    std::cout << "custom_kernels: yaml-cpp not available, skipping custom kernel load" << std::endl;
#endif
}

// Wave GEMM kernel ABI: 120 bytes. Kernel signature: gemm(a, a_scale, b, b_scale, c) with
// C[M,N] = A[M,K] @ B[N,K]^T (scaled). The kernel expects transA=N, transB=T.
// Layout: 5 pointers (40 B) then 10 strides as uint64_t (80 B). Stride order = buffer order
// (a, a_scale, b, b_scale, c), per buffer dim0 then dim1. hipBLASLt is column-major; we pass
// row_stride_* for dim0 and col_stride_* for dim1. Scale strides are inferred (layout [rows, K/32]).
// For K > 256 the Wave-generated kernel can fault (multi K-tile bug); safe for K <= 256.
struct __attribute__((packed)) WaveGemmKernelArgs
{
    const void* ptr_a;        // 0:   A [M,K]
    const void* ptr_a_scale;  // 8:   A scale
    const void* ptr_b;        // 16:  B [N,K]
    const void* ptr_b_scale;  // 24:  B scale
    void*       ptr_c;        // 32:  C [M,N] output
    uint64_t    stride_a_dim0;       // 40:  a dim0 (row stride)
    uint64_t    stride_a_dim1;       // 48:  a dim1 (col stride)
    uint64_t    stride_a_scale_dim0; // 56
    uint64_t    stride_a_scale_dim1; // 64
    uint64_t    stride_b_dim0;       // 72
    uint64_t    stride_b_dim1;       // 80
    uint64_t    stride_b_scale_dim0; // 88
    uint64_t    stride_b_scale_dim1; // 96
    uint64_t    stride_c_dim0;       // 104: C leading dim (kernel arg13)
    uint64_t    stride_c_dim1;       // 112
};
static_assert(sizeof(WaveGemmKernelArgs) == 120, "Wave kernel kernarg is 120 bytes");

inline WaveGemmKernelArgs makeWaveGemmKernelArgs(const RocblasltContractionProblem& prob)
{
    // A_scale [M, K/32], B_scale [N, K/32] in column-major: dim0 stride = 1, dim1 stride = leading dim (M or N).
    WaveGemmKernelArgs w = {};
    w.ptr_a                 = prob.A;
    w.ptr_a_scale           = prob.scaleA;
    w.ptr_b                 = prob.B;
    w.ptr_b_scale           = prob.scaleB;
    w.ptr_c                 = prob.D;
    w.stride_a_dim0         = prob.row_stride_a;
    w.stride_a_dim1         = prob.col_stride_a;
    w.stride_a_scale_dim0   = 1;
    w.stride_a_scale_dim1   = static_cast<uint64_t>(prob.m); // leading dimension for [M, K/32]
    w.stride_b_dim0         = prob.row_stride_b;
    w.stride_b_dim1         = prob.col_stride_b;
    w.stride_b_scale_dim0   = 1;
    w.stride_b_scale_dim1   = static_cast<uint64_t>(prob.n); // leading dimension for [N, K/32]
    w.stride_c_dim0         = prob.row_stride_d;
    w.stride_c_dim1         = prob.col_stride_d;
    return w;
}

// F4 GEMM Kernel Args (AITER / other kernels with padded layout).
// AITER kernels take stride_D0/1, stride_C0/1, stride_A0/1, stride_B0/1 (and scale strides).
// They are stride-based and work with column-major: we pass col_stride_* as the non-zero
// stride (leading dimension); the code object metadata confirms strideD0/1, strideC0/1,
// strideA0/1, strideB0/1, Mdim, Ndim, Kdim, ScaleA/B, etc.

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
    p3          _p23; // trailing pad to match .kernarg_segment_size 384 (assembly metadata)

    F4GemmKernelArgs() = default;

    // AITER kernel computes D[N,M] = B^T * A instead of C[M,N] = A^T * B
    // So we swap A<->B pointers/scales and M<->N dimensions
    F4GemmKernelArgs(const RocblasltContractionProblem& prob)
        : ptr_D(prob.D)
        , ptr_C(prob.C)
        , ptr_A(const_cast<void*>(prob.B)) // Swapped: kernel's A = hipBLASLt's B
        , ptr_B(const_cast<void*>(prob.A)) // Swapped: kernel's B = hipBLASLt's A
        , alpha(*static_cast<const float*>(prob.alpha))
        , beta(*static_cast<const float*>(prob.beta))
        , stride_D0(static_cast<uint32_t>(prob.row_stride_d))
        , stride_D1(static_cast<uint32_t>(prob.col_stride_d))
        , stride_C0(static_cast<uint32_t>(prob.col_stride_c))
        , stride_C1(0)
        , stride_A0(static_cast<uint32_t>(prob.col_stride_b)) // Swapped
        , stride_A1(0)
        , stride_B0(static_cast<uint32_t>(prob.col_stride_a)) // Swapped
        , stride_B1(0)
        , M(static_cast<uint32_t>(prob.n)) // Swapped: kernel's M = hipBLASLt's N
        , N(static_cast<uint32_t>(prob.m)) // Swapped: kernel's N = hipBLASLt's M
        , K(static_cast<uint32_t>(prob.k))
        , ptr_ScaleA(prob.scaleB) // Swapped
        , ptr_ScaleB(prob.scaleA) // Swapped
        , stride_ScaleA0(static_cast<uint32_t>(prob.k / 32))
        , stride_ScaleA1(0)
        , stride_ScaleB0(static_cast<uint32_t>(prob.k / 32))
        , stride_ScaleB1(0)
        , log2_k_split(0)
    {
    }
};
// AITER kernel .amdgpu_metadata: kernarg layout D,C,A,B,alpha,beta, strideD0/1, strideC0/1,
// strideA0/1, strideB0/1, Mdim, Ndim, Kdim, ScaleA, ScaleB, strideScaleA0/1, strideScaleB0/1, log2_k_split; total 384.
static_assert(sizeof(F4GemmKernelArgs) == 384, "AITER kernarg segment size must be 384");

rocblaslt_status runCustomKernel(std::shared_ptr<GemmKernel>        gemm,
                                 const RocblasltContractionProblem& prob)
{
    if(!gemm->module.has_value())
    {
        std::cerr << "runCustomKernel failed: Module not loadable" << std::endl;
        return rocblaslt_status_internal_error;
    }

    const uint32_t tileM = gemm->params->workgroupTile.m;
    const uint32_t tileN = gemm->params->workgroupTile.n;
    std::string    name  = gemm->module->getKernelName();

    const bool isAiter = (name.find("aiter") != std::string::npos)
                         || (name.find("f4gemm") != std::string::npos);

    void*  argsPtr  = nullptr;
    size_t argsSize = 0;
    dim3   grid;
    dim3   block;

    if(isAiter)
    {
        // AITER / F4 kernels: F4GemmKernelArgs (strides, alpha, beta, etc.), grid = (tilesN, tilesM), block = (256, 1, 1).
        // Static buffer so the pointer remains valid for the async launch (driver may copy args when the kernel runs).
        static F4GemmKernelArgs f4ArgsStorage;
        f4ArgsStorage = F4GemmKernelArgs(prob);
        argsPtr      = &f4ArgsStorage;
        argsSize     = sizeof(F4GemmKernelArgs);

        uint32_t tilesM = (prob.m + tileM - 1) / tileM;
        uint32_t tilesN = (prob.n + tileN - 1) / tileN;
        grid.x          = tilesN;
        grid.y          = tilesM;
        grid.z  = 1;
        block.x        = 256;
        block.y        = 1;
        block.z        = 1;
    }
    else
    {
        // Wave kernel ABI: 120-byte args, grid = (tilesN, tilesM), block = (64, 4, 1).
        // Static buffer so the pointer remains valid for the async launch.
        static WaveGemmKernelArgs waveArgsStorage;
        waveArgsStorage = makeWaveGemmKernelArgs(prob);
        uint32_t tilesM = (static_cast<uint32_t>(prob.m) + tileM - 1) / tileM;
        uint32_t tilesN = (static_cast<uint32_t>(prob.n) + tileN - 1) / tileN;

        grid.x   = tilesN;
        grid.y   = tilesM;
        grid.z   = 1;
        block.x  = 64; // .reqd_workgroup_size 64 x 4 x 1
        block.y  = 4;
        block.z  = 1;
        argsPtr  = &waveArgsStorage;
        argsSize = sizeof(waveArgsStorage);
    }

    if(getenv("HIPBLASLT_ROCROLLER_DEBUG_CUSTOM_KERNEL"))
    {
        std::cerr << "runCustomKernel: " << name << " grid=(" << grid.x << "," << grid.y << ","
                  << grid.z << ") block=(" << block.x << "," << block.y << "," << block.z << ")"
                  << " argsSize=" << argsSize << std::endl;
    }

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
        std::cerr << "hipExtModuleLaunchKernel in runCustomKernel failed: " << name << std::endl
                  << " error: " << hipGetErrorString(error) << std::endl;
        return rocblaslt_status_internal_error;
    }

    return rocblaslt_status_success;
}
