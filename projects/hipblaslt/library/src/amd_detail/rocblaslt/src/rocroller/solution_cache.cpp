// Copyright Advanced Micro Devices, Inc., or its affiliates.
// SPDX-License-Identifier: MIT

#include "solution_cache.hpp"

void SolutionCache::addKernel(const KernelType&              kernelType,
                              const SolutionIndexParameters& params,
                              std::shared_ptr<GemmKernel>    kernel)
{
    if(kernel->module.has_value())
        std::cout << "Adding kernel to cache: " << kernel->module->getKernelName() << std::endl;
    else
        std::cout << "Adding kernel to cache: (origami)" << std::endl;
    auto existingKernelType = m_generatedKernels.find(kernelType);
    if(existingKernelType == m_generatedKernels.end())
    {
        m_generatedKernels[kernelType] = {};
    }

    auto index = parametersToIndex(params);

    m_generatedKernels[kernelType][index] = kernel;
}

std::optional<std::shared_ptr<GemmKernel>>
    SolutionCache::getKernel(const KernelType& kernelType, const SolutionIndexParameters& params)
{
    auto existingKernelType = m_generatedKernels.find(kernelType);
    if(existingKernelType == m_generatedKernels.end())
    {
        return std::nullopt;
    }

    auto index = parametersToIndex(params);

    auto kernel = existingKernelType->second.find(index);

    if(kernel == existingKernelType->second.end())
        return std::nullopt;
    else
    {
        const auto& k = kernel->second;
        if(k->module.has_value())
            std::cout << "Loading kernel from cache (external): " << k->module->getKernelName() << std::endl;
        else
            std::cout << "Loading kernel from cache (rocroller):" << std::endl;
        return k;
    }
}
