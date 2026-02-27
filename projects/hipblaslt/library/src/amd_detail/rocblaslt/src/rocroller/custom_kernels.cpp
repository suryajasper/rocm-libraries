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

    F4GemmKernelArgs(const RocblasltContractionProblem& prob)
        : ptr_D(prob.D)
        , ptr_C(nullptr)
        , ptr_A(const_cast<void*>(prob.A))
        , ptr_B(const_cast<void*>(prob.B))
        , alpha(*static_cast<const float*>(prob.alpha))
        , beta(*static_cast<const float*>(prob.beta))
        , stride_D0(0)
        , stride_D1(0)
        , stride_C0(static_cast<uint32_t>(prob.col_stride_c))
        , stride_C1(0)
        , stride_A0(static_cast<uint32_t>(prob.col_stride_a))
        , stride_A1(0)
        , stride_B0(static_cast<uint32_t>(prob.col_stride_b))
        , stride_B1(0)
        , M(static_cast<uint32_t>(prob.m))
        , N(static_cast<uint32_t>(prob.n))
        , K(static_cast<uint32_t>(prob.k))
        , ptr_ScaleA(prob.scaleA)
        , ptr_ScaleB(prob.scaleB)
        , stride_ScaleA0(static_cast<uint32_t>(prob.k / 32))
        , stride_ScaleA1(0)
        , stride_ScaleB0(static_cast<uint32_t>(prob.k / 32))
        , stride_ScaleB1(0)
        , log2_k_split(0)
    {
    }
};

rocblaslt_status runCustomKernel(std::shared_ptr<GemmKernel>        gemm,
                                 const RocblasltContractionProblem& prob)
{
    if(!gemm->module.has_value())
    {
        std::cerr << "runCustomKernel failed: Module not loadable" << std::endl;
        return rocblaslt_status_internal_error;
    }

    if (prob.beta && *static_cast<const float*>(prob.beta) != 0)
    {
        std::cerr << "Kernel only supports when beta is 0" << std::endl;;
        return rocblaslt_status_invalid_value;
    }

    F4GemmKernelArgs args(prob);

    const uint32_t tileM     = gemm->params->workgroupTile.m;
    const uint32_t tileN     = gemm->params->workgroupTile.n;
    const uint32_t blockSize = 256; // Threads per workgroup

    // Number of tiles in each dimension
    uint32_t tilesM = (args.M + tileM - 1) / tileM;
    uint32_t tilesN = (args.N + tileN - 1) / tileN;

    dim3 grid;
    grid.x = tilesN;
    grid.y = tilesM;
    grid.z = 1;

    dim3 block{blockSize, 1, 1};

    void*  argsPtr  = &args;
    size_t argsSize = sizeof(args);

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
                                                   (void**)&hipLaunchParams
                                                   ))
    {
        std::cerr << "hipExtModuleLaunchKernel in runCustomKernel failed: "
                  << gemm->module->getKernelName() << std::endl
                  << " error: " << hipGetErrorString(error) << std::endl;
        return rocblaslt_status_internal_error;
    }

    return rocblaslt_status_success;
}
