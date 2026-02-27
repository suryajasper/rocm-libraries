// Copyright Advanced Micro Devices, Inc., or its affiliates.
// SPDX-License-Identifier: MIT

#pragma once

#include "kernel_type.hpp"
#include "solution_selection.hpp"

#include <vector>

/**
 * Register a custom kernel's workgroup tile size for a given KernelType.
 * Called during preloadCustomKernels() so solution selection can consider these tiles.
 */
void registerCustomKernelWorkgroupSize(const KernelType& kernelType,
                                       const WorkGroupTileSize& wgt);

/**
 * Return all custom kernel workgroup sizes registered for the given KernelType.
 * Used by getTileListForKernelType() to merge custom tiles into the origami config list.
 */
std::vector<WorkGroupTileSize> getCustomKernelWorkgroupSizes(const KernelType& kernelType);
