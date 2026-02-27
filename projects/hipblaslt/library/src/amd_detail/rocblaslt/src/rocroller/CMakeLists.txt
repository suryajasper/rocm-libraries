# Copyright Advanced Micro Devices, Inc., or its affiliates.
# SPDX-License-Identifier:  MIT

add_library(hipblaslt-rocroller OBJECT)

add_subdirectory(custom_kernels)

target_sources(hipblaslt-rocroller
    PRIVATE
        "${CMAKE_CURRENT_SOURCE_DIR}/custom_kernel_registry.cpp"
        "${CMAKE_CURRENT_SOURCE_DIR}/custom_kernels.cpp"
        "${CMAKE_CURRENT_SOURCE_DIR}/gemm.cpp"
        "${CMAKE_CURRENT_SOURCE_DIR}/parameter_selection.cpp"
        "${CMAKE_CURRENT_SOURCE_DIR}/runtime_args_selection.cpp"
        "${CMAKE_CURRENT_SOURCE_DIR}/rocroller_host.cpp"
        "${CMAKE_CURRENT_SOURCE_DIR}/solution_cache.cpp"
        "${CMAKE_CURRENT_SOURCE_DIR}/solution_selection.cpp"
)

target_compile_features(hipblaslt-rocroller PRIVATE cxx_std_20)
set_target_properties(hipblaslt-rocroller PROPERTIES POSITION_INDEPENDENT_CODE ON)
target_link_libraries(hipblaslt-rocroller PRIVATE roc::origami-headers)
if(TARGET roc::rocroller-interface)
    target_link_libraries(hipblaslt-rocroller PRIVATE roc::rocroller-interface)
else()
    target_link_libraries(hipblaslt-rocroller PRIVATE roc::rocroller_interface)
endif()
target_link_libraries(hipblaslt-rocroller PRIVATE hip::host roc::hipblas-common)
# yaml-cpp for parsing custom_kernels/kernels.yaml (optional; preload falls back if missing)
if(TARGET yaml-cpp::yaml-cpp)
    target_link_libraries(hipblaslt-rocroller PRIVATE yaml-cpp::yaml-cpp)
    target_compile_definitions(hipblaslt-rocroller PRIVATE HIPBLASLT_ROCROLLER_USE_YAML_CPP)
endif()
target_compile_definitions(hipblaslt-rocroller PRIVATE HIPBLASLT_USE_ROCROLLER)
target_include_directories(hipblaslt-rocroller
    PRIVATE
        "${CMAKE_CURRENT_SOURCE_DIR}/include"
        "${CMAKE_CURRENT_SOURCE_DIR}/../include"
        "${CMAKE_CURRENT_SOURCE_DIR}/../../include"
        "${PROJECT_BINARY_DIR}/library/include"
        "${PROJECT_SOURCE_DIR}/library/include"
        "${PROJECT_SOURCE_DIR}/tensilelite/include"
)
# OBJECT library link dependencies are not propagated in CMake; hipblaslt must
# link rocroller explicitly so symbols like Operations::Tensor are resolved.
if(TARGET roc::rocroller-interface)
    target_link_libraries(hipblaslt PRIVATE hipblaslt-rocroller roc::rocroller-interface)
else()
    target_link_libraries(hipblaslt PRIVATE hipblaslt-rocroller roc::rocroller_interface)
endif()
# Ensure the in-tree librocroller is found at runtime (e.g. when using add_subdirectory
# rocroller). The system /opt/rocm librocroller may lack the 4-arg Operations::Tensor
# constructor, causing "undefined symbol" when the wrong lib is loaded.
if(NOT ROCM_LIBS_SUPERBUILD AND TARGET rocroller)
    get_target_property(_hipblaslt_rpath hipblaslt BUILD_RPATH)
    if(NOT _hipblaslt_rpath)
        set(_hipblaslt_rpath "")
    endif()
    list(APPEND _hipblaslt_rpath "${CMAKE_BINARY_DIR}/rocroller")
    set_target_properties(hipblaslt PROPERTIES BUILD_RPATH "${_hipblaslt_rpath}")
    unset(_hipblaslt_rpath)
endif()
