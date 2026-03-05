# Copyright Advanced Micro Devices, Inc., or its affiliates.
# SPDX-License-Identifier:  MIT

if(NOT "${HIPBLASLT_TENSILE_LIBPATH}")
    set(CUSTOM_KERNEL_DST_DIR "${hipblaslt_BINARY_DIR}/Tensile/library")
else()
    set(CUSTOM_KERNEL_DST_DIR "${HIPBLASLT_TENSILE_LIBPATH}/library")
endif()

file(MAKE_DIRECTORY "${CUSTOM_KERNEL_DST_DIR}")

find_program(ROCM_LLD
    NAMES ld.lld
    PATH_SUFFIXES lib/llvm/bin llvm/bin bin
)

# Copy kernels.yaml so runtime can load custom kernel metadata from getCoPath()/kernels.yaml
set(CUSTOM_KERNELS_YAML_SRC "${CMAKE_CURRENT_SOURCE_DIR}/kernels.yaml")
set(CUSTOM_KERNELS_YAML_DST "${CUSTOM_KERNEL_DST_DIR}/kernels.yaml")
add_custom_command(
    OUTPUT "${CUSTOM_KERNELS_YAML_DST}"
    COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CUSTOM_KERNELS_YAML_SRC}" "${CUSTOM_KERNELS_YAML_DST}"
    DEPENDS "${CUSTOM_KERNELS_YAML_SRC}"
    COMMENT "Copying kernels.yaml"
    VERBATIM
)
list(APPEND CUSTOM_KERNEL_OUTPUTS "${CUSTOM_KERNELS_YAML_DST}")

# Create output directory for built files
set(BUILT_OBJ_DIR "${CMAKE_CURRENT_BINARY_DIR}/obj")
file(MAKE_DIRECTORY "${BUILT_OBJ_DIR}")

# Assembly source files for custom kernels (glob wave/*.s and subdirs)
file(GLOB_RECURSE CUSTOM_KERNEL_ASM_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/wave/*.s"
)

# Build combined .co from all assembly sources
if(ROCM_LLD)
    message(STATUS "Building custom kernels from assembly sources")
    message(STATUS "  ROCm clang: ${ROCM_CLANG}")
    message(STATUS "  ROCm ld.lld: ${ROCM_LLD}")
    message(STATUS "  GPU arch: ${CUSTOM_KERNEL_GPU_ARCH}")
    
    # Assemble each .s file into a .o file
    set(BUILT_OBJ_FILES)
    foreach(ASM_FILE ${CUSTOM_KERNEL_ASM_SOURCES})
        get_filename_component(ASM_NAME "${ASM_FILE}" NAME_WE)
        set(OBJ_OUTPUT "${BUILT_OBJ_DIR}/${ASM_NAME}.o")
        
        add_custom_command(
            OUTPUT "${OBJ_OUTPUT}"
            COMMAND ${CMAKE_CXX_COMPILER}
                -x assembler
                -target amdgcn-amd-amdhsa
                "-mcpu=gfx950"
                -c
                "${ASM_FILE}"
                -o "${OBJ_OUTPUT}"
            DEPENDS "${ASM_FILE}"
            COMMENT "Assembling ${ASM_NAME}.s"
            VERBATIM
        )
        list(APPEND BUILT_OBJ_FILES "${OBJ_OUTPUT}")
    endforeach()
    
    # Link all .o files into a single combined .co file
    set(COMBINED_CO_FILE "${BUILT_OBJ_DIR}/rr_custom_kernels.co")
    set(COMBINED_CO_DST "${CUSTOM_KERNEL_DST_DIR}/rr_custom_kernels.co")
    
    add_custom_command(
        OUTPUT "${COMBINED_CO_FILE}"
        COMMAND ${ROCM_LLD}
            -shared
            -o "${COMBINED_CO_FILE}"
            ${BUILT_OBJ_FILES}
        DEPENDS ${BUILT_OBJ_FILES}
        COMMENT "Linking all kernel objects into rr_custom_kernels.co"
        VERBATIM
    )
    
    add_custom_command(
        OUTPUT "${COMBINED_CO_DST}"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${COMBINED_CO_FILE}" "${COMBINED_CO_DST}"
        DEPENDS "${COMBINED_CO_FILE}"
        COMMENT "Copying rr_custom_kernels.co to ${CUSTOM_KERNEL_DST_DIR}"
        VERBATIM
    )
    
    add_custom_target(custom-kernels ALL
        DEPENDS "${COMBINED_CO_DST}" "${CUSTOM_KERNELS_YAML_DST}"
    )
    
    message(STATUS "  Combined output: ${COMBINED_CO_DST}")
else()
    if(NOT ROCM_LLD)
        message(FATAL_ERROR "ROCm ld.lld not found, cannot build custom kernels from assembly")
    endif()
endif()

add_dependencies(hipblaslt-rocroller custom-kernels)
