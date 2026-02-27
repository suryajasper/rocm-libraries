// Copyright Advanced Micro Devices, Inc., or its affiliates.
// SPDX-License-Identifier: MIT

#include "custom_kernel_registry.hpp"

#include <unordered_map>

namespace
{
    std::unordered_map<KernelType, std::vector<WorkGroupTileSize>>& getRegistry()
    {
        static std::unordered_map<KernelType, std::vector<WorkGroupTileSize>> s_registry;
        return s_registry;
    }
} // namespace

void registerCustomKernelWorkgroupSize(const KernelType&           kernelType,
                                       const WorkGroupTileSize&    wgt)
{
    auto& vec = getRegistry()[kernelType];
    // Avoid duplicate tile sizes
    for(const auto& existing : vec)
    {
        if(existing.m == wgt.m && existing.n == wgt.n && existing.k == wgt.k)
            return;
    }
    vec.push_back(wgt);
}

std::vector<WorkGroupTileSize> getCustomKernelWorkgroupSizes(const KernelType& kernelType)
{
    const auto& reg = getRegistry();
    auto        it  = reg.find(kernelType);
    if(it == reg.end())
        return {};
    return it->second;
}
