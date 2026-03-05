// Copyright Advanced Micro Devices, Inc., or its affiliates.
// SPDX-License-Identifier: MIT

#pragma once

#include "kernel_type.hpp"
#include "solution_selection.hpp"

#include <array>
#include <filesystem>
#include <string>
#include <vector>

/**
 * Descriptor for a custom kernel loaded from kernels.yaml.
 * Used by preloadCustomKernels() to create GemmKernels and register workgroup sizes.
 */
struct CustomKernelDescriptor
{
    std::string        name;
    std::string        entryFunction;
    WorkGroupTileSize  workgroupSize{};
    std::array<int, 3> blockSize{64, 4, 1}; // HIP launch block dims [x, y, z]
    bool               shuffle = true;
    std::string        kernelType;
};

/**
 * Load custom kernel descriptors from basePath/kernels.yaml.
 * Returns an empty vector if the file is missing or invalid.
 * Does not register workgroup sizes; the caller should call registerCustomKernelWorkgroupSize
 * for each descriptor when mapping to a KernelType.
 */
std::vector<CustomKernelDescriptor> loadCustomKernelsFromYaml(const std::filesystem::path& basePath);

/**
 * Base path for custom kernel files (kernels.yaml, rr_custom_kernels.co).
 * Uses HIPBLASLT_TENSILE_LIBPATH if set, otherwise the library directory.
 */
std::filesystem::path getCoPath();

/**
 * Full path to the combined .co file. Looks in basePath then basePath/library.
 */
std::filesystem::path getCoFilePath(const std::filesystem::path& basePath);

/**
 * Register a custom kernel's workgroup tile size for a given KernelType.
 * Called during preloadCustomKernels() so solution selection can consider these tiles.
 */
void registerCustomKernelWorkgroupSize(const KernelType&       kernelType,
                                       const WorkGroupTileSize& wgt);

/**
 * Return custom kernel workgroup sizes for the given KernelType by loading
 * kernels.yaml (via getCoPath()). Matches descriptors by kernel type (e.g. mxfp4)
 * and shuffle; returns deduplicated workgroup sizes. Used by getTileListForKernelType().
 */
std::vector<WorkGroupTileSize> getCustomKernelWorkgroupSizes(const KernelType& kernelType);
