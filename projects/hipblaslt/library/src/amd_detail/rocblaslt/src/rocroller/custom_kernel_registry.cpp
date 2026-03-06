// Copyright Advanced Micro Devices, Inc., or its affiliates.
// SPDX-License-Identifier: MIT

#include "custom_kernel_registry.hpp"

#include "rocblaslt.h"

#include <cstdlib>
#include <fstream>
#include <iostream>
#include <unordered_map>

#include <yaml-cpp/yaml.h>

namespace
{
    std::unordered_map<KernelType, std::vector<WorkGroupTileSize>>& getRegistry()
    {
        static std::unordered_map<KernelType, std::vector<WorkGroupTileSize>> s_registry;
        return s_registry;
    }

    std::vector<CustomKernelDescriptor>
        loadCustomKernelsFromYamlImpl(const std::filesystem::path& basePath)
    {
        std::vector<CustomKernelDescriptor> out;
        std::filesystem::path               yamlPath = basePath / "kernels.yaml";
        std::ifstream                       file(yamlPath);
        if(!file)
            return out;

        try
        {
            YAML::Node doc = YAML::Load(file);
            file.close();
            const YAML::Node& kernels = doc["kernels"];
            if(!kernels || !kernels.IsSequence())
                return out;
            for(const auto& node : kernels)
            {
                CustomKernelDescriptor d;
                if(!node["name"])
                    continue;
                d.name = node["name"].as<std::string>();
                d.entryFunction
                    = node["entry_function"] ? node["entry_function"].as<std::string>() : d.name;
                if(node["shuffle"])
                    d.shuffle = node["shuffle"].as<bool>();
                if(node["kernel_type"])
                    d.kernelType = node["kernel_type"].as<std::string>();
                if(!node["workgroup_size"] || !node["workgroup_size"].IsSequence()
                   || node["workgroup_size"].size() != 3)
                    continue;
                d.workgroupSize.m = node["workgroup_size"][0].as<int>();
                d.workgroupSize.n = node["workgroup_size"][1].as<int>();
                d.workgroupSize.k = node["workgroup_size"][2].as<int>();
                if(!node["block_size"] || !node["block_size"].IsSequence()
                   || node["block_size"].size() != 3)
                    continue; // required: HIP launch block dims [x, y, z]
                d.blockSize[0] = node["block_size"][0].as<int>();
                d.blockSize[1] = node["block_size"][1].as<int>();
                d.blockSize[2] = node["block_size"][2].as<int>();
                out.push_back(d);
            }

            std::cout << "Loaded " << out.size() << " kernels from " << yamlPath << std::endl;
        }
        catch(const std::exception& e)
        {
            std::cerr << "Error loading kernels from YAML: " << e.what() << std::endl;
            return {};
        }
        return out;
    }
} // namespace

std::vector<CustomKernelDescriptor> loadCustomKernelsFromYaml(const std::filesystem::path& basePath)
{
    return loadCustomKernelsFromYamlImpl(basePath);
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
        std::optional<std::filesystem::path> default_lib_path;
        if(staticLib)
            default_lib_path = "/opt/rocm/lib";

        if(auto maybe_path
           = rocblaslt_find_library_relative_path(/*relpath=*/std::nullopt, default_lib_path))
        {
            libraryPath = maybe_path.value_or(".");
        }
    }

    return libraryPath;
}

std::filesystem::path getCoFilePath(const std::filesystem::path& basePath)
{
    std::filesystem::path p = basePath / "rr_custom_kernels.co";
    if(std::filesystem::exists(p))
        return p;
    return basePath / "library" / "rr_custom_kernels.co";
}

void registerCustomKernelWorkgroupSize(const KernelType& kernelType, const WorkGroupTileSize& wgt)
{
    auto& vec = getRegistry()[kernelType];
    for(const auto& existing : vec)
    {
        if(existing.m == wgt.m && existing.n == wgt.n && existing.k == wgt.k)
            return;
    }
    vec.push_back(wgt);
}

// Match KernelType to YAML descriptor (kernel_type string + shuffle).
static bool descriptorMatchesKernelType(const CustomKernelDescriptor& d, const KernelType& kt)
{
    if(kt.typeA == rocRoller::DataType::FP4 && kt.typeB == rocRoller::DataType::FP4
       && d.kernelType == "mxfp4")
        return d.shuffle == kt.swizzleA;
    // Extend for other kernel types as needed.
    return false;
}

std::vector<WorkGroupTileSize> getCustomKernelWorkgroupSizes(const KernelType& kernelType)
{

    const std::filesystem::path         basePath    = getCoPath();
    std::vector<CustomKernelDescriptor> descriptors = loadCustomKernelsFromYamlImpl(basePath);

    std::vector<WorkGroupTileSize> out;
    for(const auto& d : descriptors)
    {
        if(!descriptorMatchesKernelType(d, kernelType))
            continue;
        // Deduplicate by (m, n, k)
        bool duplicate = false;
        for(const auto& w : out)
        {
            if(w.m == d.workgroupSize.m && w.n == d.workgroupSize.n && w.k == d.workgroupSize.k)
            {
                duplicate = true;
                break;
            }
        }
        if(!duplicate)
            out.push_back(d.workgroupSize);
    }
    return out;
}
