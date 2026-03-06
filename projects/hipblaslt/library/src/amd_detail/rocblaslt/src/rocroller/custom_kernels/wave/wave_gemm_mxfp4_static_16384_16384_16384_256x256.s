; To reproduce the .rocmasm from .optimized.ll, run:
; llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx950 -mattr='-fma-mix-insts' -O3 <.optimized.ll> -o <out.rocmasm>

	.amdgcn_target "amdgcn-amd-amdhsa--gfx950"
	.amdhsa_code_object_version 5
	.text
	.globl	wave_gemm_static_16k_256x256x256
	.p2align	8
	.type	wave_gemm_static_16k_256x256x256,@function
wave_gemm_static_16k_256x256x256:
	s_load_dwordx2 s[2:3], s[0:1], 0x0
	s_load_dwordx8 s[4:11], s[0:1], 0x8
	s_load_dwordx4 s[12:15], s[0:1], 0x28
	s_waitcnt lgkmcnt(0)
	s_branch .LBB0_0
	.p2align	8
.LBB0_0:
	v_bfe_u32 v7, v0, 10, 10
	s_lshr_b32 s48, s16, 5
	s_mov_b64 s[20:21], s[2:3]
	v_and_b32_e32 v6, 0x3ff, v0
	v_lshlrev_b32_e32 v1, 3, v7
	s_lshl_b32 s2, s48, 8
	s_lshl_b32 s3, s17, 9
	s_mov_b64 s[12:13], s[6:7]
	v_lshrrev_b32_e32 v0, 3, v6
	s_lshr_b32 s47, s17, 5
	v_readfirstlane_b32 s6, v1
	s_or_b32 s49, s3, s2
	v_bitop3_b32 v2, v6, v0, 7 bitop3:0x6c
	s_lshl_b32 s25, s6, 7
	s_lshl_b32 s50, s47, 14
	v_or3_b32 v0, v0, v1, s49
	v_lshlrev_b32_e32 v2, 4, v2
	s_and_b32 s7, s21, 0xffff
	s_add_i32 s26, s25, 0x8000
	v_subrev_u32_e32 v0, s50, v0
	s_or_b32 s21, s7, 0x60000000
	s_mov_b32 s23, 0x27000
	s_mov_b32 s22, 0x7ffffffe
	v_lshl_or_b32 v1, v0, 13, v2
	s_mov_b32 m0, s26
	s_or_b32 s27, s25, 0x1000
	buffer_load_dwordx4 v1, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x80, v1
	s_mov_b32 m0, s25
	s_add_i32 s28, s27, 0x8000
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x40000, v1
	s_mov_b32 m0, s28
	s_or_b32 s29, s25, 0x2000
	v_accvgpr_write_b32 a162, v0
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x40080, v1
	s_mov_b32 m0, s27
	s_add_i32 s30, s29, 0x8000
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x80000, v1
	s_mov_b32 m0, s30
	s_or_b32 s31, s25, 0x3000
	v_accvgpr_write_b32 a163, v0
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x80080, v1
	s_mov_b32 m0, s29
	s_add_i32 s33, s31, 0x8000
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0xc0000, v1
	s_mov_b32 m0, s33
	s_or_b32 s34, s25, 0x4000
	v_accvgpr_write_b32 a164, v0
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0xc0080, v1
	s_mov_b32 m0, s31
	s_add_i32 s35, s34, 0x8000
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x100000, v1
	s_mov_b32 m0, s35
	s_or_b32 s36, s25, 0x5000
	v_accvgpr_write_b32 a165, v0
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x100080, v1
	s_mov_b32 m0, s34
	s_add_i32 s37, s36, 0x8000
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x140000, v1
	s_mov_b32 m0, s37
	s_or_b32 s38, s25, 0x6000
	v_accvgpr_write_b32 a166, v0
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x140080, v1
	s_mov_b32 m0, s36
	s_add_i32 s39, s38, 0x8000
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x180000, v1
	s_mov_b32 m0, s39
	s_or_b32 s40, s25, 0x7000
	v_accvgpr_write_b32 a167, v0
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x180080, v1
	s_mov_b32 m0, s38
	s_add_i32 s41, s40, 0x8000
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x1c0000, v1
	s_mov_b32 m0, s41
	v_accvgpr_write_b32 a168, v0
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	v_or_b32_e32 v0, 0x1c0080, v1
	s_mov_b32 m0, s40
	s_sub_i32 s24, s2, s50
	v_readfirstlane_b32 s2, v7
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	s_add_i32 s24, s24, s3
	v_lshlrev_b32_e32 v0, 5, v7
	s_lshl_b32 s43, s2, 8
	v_accvgpr_write_b32 a161, v1
	v_or_b32_e32 v1, s24, v0
	v_lshlrev_b32_e32 v12, 2, v6
	s_and_b32 s2, s5, 0xffff
	s_add_i32 s42, s43, 0x10800
	s_or_b32 s5, s2, 0x42000000
	s_mov_b32 s6, s22
	s_mov_b32 s7, s23
	v_lshl_or_b32 v1, v1, 9, v12
	s_mov_b32 m0, s42
	s_add_i32 s43, s43, 0x10000
	buffer_load_dword v1, s[4:7], 0 offen lds
	v_or_b32_e32 v1, 0x100, v1
	s_mov_b32 m0, s43
	s_lshl_b32 s3, s48, 13
	buffer_load_dword v1, s[4:7], 0 offen lds
	v_or_b32_e32 v1, 4, v7
	v_lshlrev_b32_e32 v2, 19, v7
	v_readfirstlane_b32 s2, v1
	s_lshl_b32 s45, s2, 8
	s_lshl_b32 s2, s24, 9
	v_lshlrev_b32_e32 v1, 14, v1
	v_or3_b32 v1, v1, s2, v12
	s_lshl_b32 s2, s16, 8
	s_sub_i32 s2, s2, s3
	s_lshl_b32 s3, s47, 13
	s_add_i32 s16, s2, s3
	s_lshl_b32 s2, s16, 13
	s_add_i32 s44, s45, 0x10800
	s_add_i32 s45, s45, 0x10000
	s_ashr_i32 s3, s2, 31
	s_mov_b32 m0, s44
	s_add_u32 s12, s12, s2
	buffer_load_dword v1, s[4:7], 0 offen lds
	v_or_b32_e32 v1, 0x100, v1
	s_mov_b32 m0, s45
	s_addc_u32 s2, s13, s3
	buffer_load_dword v1, s[4:7], 0 offen lds
	v_lshlrev_b32_e32 v1, 4, v6
	s_and_b32 s2, s2, 0xffff
	s_or_b32 s13, s2, 0x60000000
	v_accvgpr_write_b32 a169, v1
	v_or_b32_e32 v1, v2, v1
	s_mov_b32 s52, s12
	s_mov_b32 s53, s13
	s_mov_b32 s54, s22
	s_mov_b32 s55, s23
	v_accvgpr_write_b32 a170, v2
	v_or_b32_e32 v2, 0x20000, v1
	buffer_load_dwordx4 a[20:23], v2, s[52:55], 0 offen
	buffer_load_dwordx4 a[16:19], v2, s[52:55], 0 offen offset:1024
	v_or_b32_e32 v2, 0x40000, v1
	buffer_load_dwordx4 a[0:3], v2, s[52:55], 0 offen
	buffer_load_dwordx4 a[4:7], v2, s[52:55], 0 offen offset:1024
	v_or_b32_e32 v2, 0x60000, v1
	buffer_load_dwordx4 a[28:31], v1, s[52:55], 0 offen
	buffer_load_dwordx4 a[24:27], v1, s[52:55], 0 offen offset:1024
	buffer_load_dwordx4 a[8:11], v2, s[52:55], 0 offen
	buffer_load_dwordx4 a[12:15], v2, s[52:55], 0 offen offset:1024
	s_load_dwordx2 s[18:19], s[0:1], 0x68
	s_mov_b32 s14, s22
	s_mov_b32 s15, s23
	s_mov_b32 s46, 0
	v_lshrrev_b32_e32 v8, 4, v6
	s_lshl_b32 s0, s16, 9
	s_ashr_i32 s1, s0, 31
	s_add_u32 s0, s8, s0
	s_addc_u32 s1, s9, s1
	v_lshlrev_b32_e32 v2, 15, v7
	s_and_b32 s1, s1, 0xffff
	s_or_b32 s1, s1, 0x42000000
	s_mov_b32 s2, s22
	s_mov_b32 s3, s23
	v_or_b32_e32 v4, v2, v12
	v_or_b32_e32 v3, 0x4000, v4
	buffer_load_dword v20, v4, s[0:3], 0 offen
	buffer_load_dword v15, v3, s[0:3], 0 offen
	v_accvgpr_write_b32 a171, v4
	s_waitcnt vmcnt(0)
	s_barrier
	v_lshlrev_b32_e32 v4, 7, v6
	v_lshlrev_b32_e32 v5, 11, v8
	v_bitop3_b32 v3, v8, v6, 7 bitop3:0x78
	v_sub_u32_e32 v4, v4, v5
	v_lshl_or_b32 v14, v3, 4, v4
	v_and_b32_e32 v3, 7, v6
	v_bitop3_b32 v3, v8, v3, 4 bitop3:0x36
	v_lshl_or_b32 v13, v3, 4, v4
	ds_read_b128 a[72:75], v14 offset:32768
	ds_read_b128 a[80:83], v14 offset:34816
	ds_read_b128 a[88:91], v13 offset:32768
	ds_read_b128 a[96:99], v13 offset:34816
	ds_read_b128 a[76:79], v14 offset:36864
	ds_read_b128 a[68:71], v14 offset:38912
	ds_read_b128 a[92:95], v13 offset:36864
	ds_read_b128 a[112:115], v13 offset:38912
	ds_read_b128 a[84:87], v14 offset:40960
	ds_read_b128 v[26:29], v14 offset:43008
	ds_read_b128 a[104:107], v13 offset:40960
	ds_read_b128 a[120:123], v13 offset:43008
	ds_read_b128 a[100:103], v14 offset:45056
	ds_read_b128 a[64:67], v14 offset:47104
	ds_read_b128 a[108:111], v13 offset:45056
	ds_read_b128 a[116:119], v13 offset:47104
	s_lshl_b32 s2, s17, 18
	s_lshl_b32 s3, s48, 17
	s_or_b32 s2, s2, s3
	v_lshl_or_b32 v3, v7, 14, s2
	s_lshl_b32 s2, s47, 23
	v_or_b32_e32 v0, s49, v0
	v_subrev_u32_e32 v38, s2, v3
	v_subrev_u32_e32 v0, s50, v0
	v_mov_b32_e32 v3, 0x200
	v_accvgpr_write_b32 a228, 0
	v_lshl_or_b32 v17, v0, 9, v3
	v_accvgpr_read_b32 v3, a228
	v_or_b32_e32 v18, 0x4200, v2
	v_or_b32_e32 v19, 0x61400, v1
	v_accvgpr_read_b32 v0, a228
	v_accvgpr_read_b32 v1, a228
	v_accvgpr_read_b32 v2, a228
	v_accvgpr_write_b32 a199, v3
	v_accvgpr_write_b32 a207, v3
	v_accvgpr_write_b32 a203, v3
	v_accvgpr_write_b32 a211, v3
	v_accvgpr_write_b32 a215, v3
	v_accvgpr_write_b32 a219, v3
	v_accvgpr_write_b32 a198, v2
	v_accvgpr_write_b32 a197, v1
	v_accvgpr_write_b32 a196, v0
	v_accvgpr_write_b32 a206, v2
	v_accvgpr_write_b32 a205, v1
	v_accvgpr_write_b32 a204, v0
	v_accvgpr_write_b32 a202, v2
	v_accvgpr_write_b32 a201, v1
	v_accvgpr_write_b32 a200, v0
	v_accvgpr_write_b32 a210, v2
	v_accvgpr_write_b32 a209, v1
	v_accvgpr_write_b32 a208, v0
	v_accvgpr_write_b32 a214, v2
	v_accvgpr_write_b32 a213, v1
	v_accvgpr_write_b32 a212, v0
	v_accvgpr_write_b32 a218, v2
	v_accvgpr_write_b32 a217, v1
	v_accvgpr_write_b32 a216, v0
	v_or_b32_e32 v0, 0x10800, v12
	v_or_b32_e32 v3, 0x10b00, v12
	v_accvgpr_write_b32 a172, v0
	ds_read_b32 v2, v0
	ds_read_b32 v21, v3
	v_or_b32_e32 v0, 0x10900, v12
	v_accvgpr_write_b32 a173, v0
	ds_read_b32 v1, v0
	v_or_b32_e32 v0, 0x10a00, v12
	v_accvgpr_write_b32 a174, v0
	ds_read_b32 v0, v0
	v_accvgpr_write_b32 a188, v6
	v_accvgpr_write_b32 a189, v7
	v_accvgpr_read_b32 v6, a228
	v_accvgpr_read_b32 v7, a228
	v_accvgpr_read_b32 v4, a228
	v_accvgpr_read_b32 v5, a228
	v_accvgpr_write_b32 a195, v7
	v_mov_b64_e32 v[174:175], v[6:7]
	v_accvgpr_write_b32 a160, v8
	s_mov_b32 s8, -2
	v_accvgpr_mov_b32 a229, a228
	v_accvgpr_mov_b32 a230, a228
	v_accvgpr_mov_b32 a231, a228
	v_accvgpr_mov_b32 a224, a228
	v_accvgpr_mov_b32 a225, a228
	v_accvgpr_mov_b32 a226, a228
	v_accvgpr_mov_b32 a227, a228
	v_accvgpr_read_b32 v164, a228
	v_accvgpr_read_b32 v165, a228
	v_accvgpr_read_b32 v166, a228
	v_accvgpr_read_b32 v167, a228
	v_accvgpr_read_b32 v30, a228
	v_accvgpr_read_b32 v31, a228
	v_accvgpr_read_b32 v32, a228
	v_accvgpr_read_b32 v33, a228
	v_accvgpr_read_b32 v40, a228
	v_accvgpr_read_b32 v41, a228
	v_accvgpr_read_b32 v42, a228
	v_accvgpr_read_b32 v43, a228
	v_accvgpr_read_b32 v34, a228
	v_accvgpr_read_b32 v35, a228
	v_accvgpr_read_b32 v36, a228
	v_accvgpr_read_b32 v37, a228
	v_accvgpr_read_b32 v60, a228
	v_accvgpr_read_b32 v61, a228
	v_accvgpr_read_b32 v62, a228
	v_accvgpr_read_b32 v63, a228
	v_accvgpr_read_b32 v56, a228
	v_accvgpr_read_b32 v57, a228
	v_accvgpr_read_b32 v58, a228
	v_accvgpr_read_b32 v59, a228
	v_accvgpr_read_b32 v108, a228
	v_accvgpr_read_b32 v109, a228
	v_accvgpr_read_b32 v110, a228
	v_accvgpr_read_b32 v111, a228
	v_accvgpr_read_b32 v72, a228
	v_accvgpr_read_b32 v73, a228
	v_accvgpr_read_b32 v74, a228
	v_accvgpr_read_b32 v75, a228
	v_accvgpr_read_b32 v92, a228
	v_accvgpr_read_b32 v93, a228
	v_accvgpr_read_b32 v94, a228
	v_accvgpr_read_b32 v95, a228
	v_accvgpr_read_b32 v88, a228
	v_accvgpr_read_b32 v89, a228
	v_accvgpr_read_b32 v90, a228
	v_accvgpr_read_b32 v91, a228
	v_accvgpr_mov_b32 a232, a228
	v_accvgpr_mov_b32 a233, a228
	v_accvgpr_mov_b32 a234, a228
	v_accvgpr_mov_b32 a235, a228
	v_accvgpr_mov_b32 a236, a228
	v_accvgpr_mov_b32 a237, a228
	v_accvgpr_mov_b32 a238, a228
	v_accvgpr_mov_b32 a239, a228
	v_accvgpr_read_b32 v136, a228
	v_accvgpr_read_b32 v137, a228
	v_accvgpr_read_b32 v138, a228
	v_accvgpr_read_b32 v139, a228
	v_accvgpr_read_b32 v96, a228
	v_accvgpr_read_b32 v97, a228
	v_accvgpr_read_b32 v98, a228
	v_accvgpr_read_b32 v99, a228
	v_accvgpr_read_b32 v116, a228
	v_accvgpr_read_b32 v117, a228
	v_accvgpr_read_b32 v118, a228
	v_accvgpr_read_b32 v119, a228
	v_accvgpr_read_b32 v128, a228
	v_accvgpr_read_b32 v129, a228
	v_accvgpr_read_b32 v130, a228
	v_accvgpr_read_b32 v131, a228
	v_accvgpr_read_b32 v140, a228
	v_accvgpr_read_b32 v141, a228
	v_accvgpr_read_b32 v142, a228
	v_accvgpr_read_b32 v143, a228
	v_accvgpr_read_b32 v144, a228
	v_accvgpr_read_b32 v145, a228
	v_accvgpr_read_b32 v146, a228
	v_accvgpr_read_b32 v147, a228
	v_accvgpr_read_b32 v156, a228
	v_accvgpr_read_b32 v157, a228
	v_accvgpr_read_b32 v158, a228
	v_accvgpr_read_b32 v159, a228
	v_accvgpr_read_b32 v160, a228
	v_accvgpr_read_b32 v161, a228
	v_accvgpr_read_b32 v162, a228
	v_accvgpr_read_b32 v163, a228
	v_accvgpr_mov_b32 a240, a228
	v_accvgpr_mov_b32 a241, a228
	v_accvgpr_mov_b32 a242, a228
	v_accvgpr_mov_b32 a243, a228
	v_accvgpr_mov_b32 a244, a228
	v_accvgpr_mov_b32 a245, a228
	v_accvgpr_mov_b32 a246, a228
	v_accvgpr_mov_b32 a247, a228
	v_accvgpr_mov_b32 a248, a228
	v_accvgpr_mov_b32 a249, a228
	v_accvgpr_mov_b32 a250, a228
	v_accvgpr_mov_b32 a251, a228
	v_accvgpr_mov_b32 a252, a228
	v_accvgpr_mov_b32 a253, a228
	v_accvgpr_mov_b32 a254, a228
	v_accvgpr_mov_b32 a255, a228
	v_accvgpr_read_b32 v44, a228
	v_accvgpr_read_b32 v45, a228
	v_accvgpr_read_b32 v46, a228
	v_accvgpr_read_b32 v47, a228
	v_accvgpr_read_b32 v48, a228
	v_accvgpr_read_b32 v49, a228
	v_accvgpr_read_b32 v50, a228
	v_accvgpr_read_b32 v51, a228
	v_accvgpr_read_b32 v52, a228
	v_accvgpr_read_b32 v53, a228
	v_accvgpr_read_b32 v54, a228
	v_accvgpr_read_b32 v55, a228
	v_accvgpr_read_b32 v76, a228
	v_accvgpr_read_b32 v77, a228
	v_accvgpr_read_b32 v78, a228
	v_accvgpr_read_b32 v79, a228
	v_accvgpr_read_b32 v64, a228
	v_accvgpr_read_b32 v65, a228
	v_accvgpr_read_b32 v66, a228
	v_accvgpr_read_b32 v67, a228
	v_accvgpr_read_b32 v68, a228
	v_accvgpr_read_b32 v69, a228
	v_accvgpr_read_b32 v70, a228
	v_accvgpr_read_b32 v71, a228
	v_accvgpr_read_b32 v152, a228
	v_accvgpr_read_b32 v153, a228
	v_accvgpr_read_b32 v154, a228
	v_accvgpr_read_b32 v155, a228
	v_accvgpr_read_b32 v112, a228
	v_accvgpr_read_b32 v113, a228
	v_accvgpr_read_b32 v114, a228
	v_accvgpr_read_b32 v115, a228
	v_accvgpr_read_b32 v148, a228
	v_accvgpr_read_b32 v149, a228
	v_accvgpr_read_b32 v150, a228
	v_accvgpr_read_b32 v151, a228
	v_accvgpr_read_b32 v80, a228
	v_accvgpr_read_b32 v81, a228
	v_accvgpr_read_b32 v82, a228
	v_accvgpr_read_b32 v83, a228
	v_accvgpr_read_b32 v124, a228
	v_accvgpr_read_b32 v125, a228
	v_accvgpr_read_b32 v126, a228
	v_accvgpr_read_b32 v127, a228
	v_accvgpr_read_b32 v84, a228
	v_accvgpr_read_b32 v85, a228
	v_accvgpr_read_b32 v86, a228
	v_accvgpr_read_b32 v87, a228
	v_accvgpr_read_b32 v132, a228
	v_accvgpr_read_b32 v133, a228
	v_accvgpr_read_b32 v134, a228
	v_accvgpr_read_b32 v135, a228
	v_accvgpr_read_b32 v120, a228
	v_accvgpr_read_b32 v121, a228
	v_accvgpr_read_b32 v122, a228
	v_accvgpr_read_b32 v123, a228
	v_accvgpr_read_b32 v168, a228
	v_accvgpr_read_b32 v169, a228
	v_accvgpr_read_b32 v170, a228
	v_accvgpr_read_b32 v171, a228
	v_accvgpr_read_b32 v188, a228
	v_accvgpr_read_b32 v189, a228
	v_accvgpr_read_b32 v190, a228
	v_accvgpr_read_b32 v191, a228
	v_accvgpr_read_b32 v192, a228
	v_accvgpr_read_b32 v193, a228
	v_accvgpr_read_b32 v194, a228
	v_accvgpr_read_b32 v195, a228
	v_accvgpr_read_b32 v204, a228
	v_accvgpr_read_b32 v205, a228
	v_accvgpr_read_b32 v206, a228
	v_accvgpr_read_b32 v207, a228
	v_accvgpr_read_b32 v200, a228
	v_accvgpr_read_b32 v201, a228
	v_accvgpr_read_b32 v202, a228
	v_accvgpr_read_b32 v203, a228
	v_accvgpr_read_b32 v196, a228
	v_accvgpr_read_b32 v197, a228
	v_accvgpr_read_b32 v198, a228
	v_accvgpr_read_b32 v199, a228
	v_accvgpr_read_b32 v212, a228
	v_accvgpr_read_b32 v213, a228
	v_accvgpr_read_b32 v214, a228
	v_accvgpr_read_b32 v215, a228
	v_accvgpr_read_b32 v216, a228
	v_accvgpr_read_b32 v217, a228
	v_accvgpr_read_b32 v218, a228
	v_accvgpr_read_b32 v219, a228
	v_accvgpr_read_b32 v228, a228
	v_accvgpr_read_b32 v229, a228
	v_accvgpr_read_b32 v230, a228
	v_accvgpr_read_b32 v231, a228
	v_accvgpr_read_b32 v232, a228
	v_accvgpr_read_b32 v233, a228
	v_accvgpr_read_b32 v234, a228
	v_accvgpr_read_b32 v235, a228
	v_accvgpr_read_b32 v240, a228
	v_accvgpr_read_b32 v241, a228
	v_accvgpr_read_b32 v242, a228
	v_accvgpr_read_b32 v243, a228
	v_accvgpr_read_b32 v244, a228
	v_accvgpr_read_b32 v245, a228
	v_accvgpr_read_b32 v246, a228
	v_accvgpr_read_b32 v247, a228
	v_accvgpr_read_b32 v236, a228
	v_accvgpr_read_b32 v237, a228
	v_accvgpr_read_b32 v238, a228
	v_accvgpr_read_b32 v239, a228
	v_accvgpr_read_b32 v252, a228
	v_accvgpr_read_b32 v253, a228
	v_accvgpr_read_b32 v254, a228
	v_accvgpr_read_b32 v255, a228
	v_accvgpr_read_b32 v248, a228
	v_accvgpr_read_b32 v249, a228
	v_accvgpr_read_b32 v250, a228
	v_accvgpr_read_b32 v251, a228
	v_accvgpr_write_b32 a175, v3
	v_accvgpr_read_b32 v224, a228
	v_accvgpr_read_b32 v225, a228
	v_accvgpr_read_b32 v226, a228
	v_accvgpr_read_b32 v227, a228
	v_accvgpr_write_b32 a194, v6
	v_accvgpr_write_b32 a193, v5
	v_accvgpr_write_b32 a192, v4
	v_mov_b64_e32 v[172:173], v[4:5]
.LBB0_1:
	s_waitcnt vmcnt(10) lgkmcnt(0)
	s_barrier
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[72:75], a[0:3], v[164:167], v2, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v3, 0xfff9f400, v19
	buffer_load_dwordx4 a[32:35], v3, s[12:15], 0 offen
	s_mov_b32 s2, s14
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[88:91], a[4:7], v[22:25], v2, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_mov_b32 s3, s15
	ds_read_b128 a[140:143], v13 offset:49152
	ds_read_b128 a[136:139], v13 offset:53248
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[72:75], a[8:11], v[30:33], v2, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[144:147], v13 offset:55296
	ds_read_b128 a[152:155], v14 offset:61440
	ds_read_b128 a[156:159], v13 offset:61440
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[88:91], a[12:15], v[22:25], v2, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b128 a[128:131], v14 offset:49152
	ds_read_b128 a[124:127], v14 offset:51200
	ds_read_b128 a[132:135], v13 offset:57344
	ds_read_b128 a[148:151], v13 offset:59392
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[80:83], a[28:31], v[40:43], v2, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[96:99], a[24:27], v[22:25], v2, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 1
	v_accvgpr_write_b32 a187, v7
	v_accvgpr_write_b32 a186, v6
	v_accvgpr_write_b32 a185, v5
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[80:83], a[20:23], v[34:37], v2, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a184, v4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[96:99], a[16:19], v[22:25], v2, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[80:83], a[0:3], v[60:63], v2, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[96:99], a[4:7], v[22:25], v2, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[80:83], a[8:11], v[56:59], v2, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[80:83], v14 offset:53248
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[96:99], a[12:15], v[22:25], v2, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b128 a[96:99], v13 offset:51200
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[76:79], a[28:31], v[108:111], v1, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], a[92:95], a[24:27], v[22:25], v1, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[76:79], a[20:23], v[72:75], v1, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[92:95], a[16:19], v[22:25], v1, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[76:79], a[0:3], v[92:95], v1, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[220:223], a[72:75], a[28:31], a[228:231], v2, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[180:183], a[72:75], a[20:23], a[224:227], v2, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[72:75], v14 offset:55296
	v_mfma_scale_f32_16x16x128_f8f6f4 a[60:63], a[68:71], a[28:31], a[232:235], v1, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[92:95], a[4:7], v[22:25], v1, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[76:79], a[8:11], v[88:91], v1, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[76:79], v14 offset:59392
	v_mfma_scale_f32_16x16x128_f8f6f4 a[228:231], a[88:91], a[24:27], a[220:223], v2, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[180:183], a[88:91], a[16:19], a[180:183], v2, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_add_u32_e32 v2, 0xfffdf400, v19
	buffer_load_dwordx4 a[52:55], v2, s[12:15], 0 offen
	v_add_u32_e32 v3, 0xfff9f800, v19
	v_mfma_scale_f32_16x16x128_f8f6f4 a[232:235], a[112:115], a[24:27], a[60:63], v1, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_add_u32_e32 v2, 0xfffdf800, v19
	buffer_load_dwordx4 a[36:39], v3, s[12:15], 0 offen
	buffer_load_dwordx4 a[48:51], v2, s[12:15], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 a[60:63], a[68:71], a[20:23], a[236:239], v1, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v3, 0xfffbf400, v19
	v_add_u32_e32 v2, 0xfffff400, v19
	buffer_load_dwordx4 a[40:43], v3, s[12:15], 0 offen
	buffer_load_dwordx4 a[56:59], v2, s[12:15], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], a[68:71], a[0:3], v[136:139], v1, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v3, 0xfffbf800, v19
	v_add_u32_e32 v2, 0xfffff800, v19
	buffer_load_dwordx4 a[44:47], v3, s[12:15], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[68:71], a[8:11], v[96:99], v1, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[68:71], v14 offset:57344
	v_accvgpr_write_b32 a223, v7
	v_accvgpr_write_b32 a222, v6
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[92:95], a[12:15], v[22:25], v1, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a221, v5
	v_accvgpr_write_b32 a220, v4
	s_nop 0
	v_add_u32_e32 v24, v18, v12
	v_mfma_scale_f32_16x16x128_f8f6f4 a[236:239], a[112:115], a[16:19], a[60:63], v1, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 2
	buffer_load_dwordx4 a[60:63], v2, s[12:15], 0 offen
	v_add_u32_e32 v2, 0xffffbf00, v24
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], a[112:115], a[4:7], v[136:139], v1, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	buffer_load_dword v22, v2, s[0:3], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[112:115], a[12:15], v[96:99], v1, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_add_u32_e32 v1, 0xffffff00, v24
	buffer_load_dword v23, v1, s[0:3], 0 offen
	ds_read_b128 a[112:115], v13 offset:63488
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[84:87], a[28:31], v[116:119], v0, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[84:87], a[20:23], v[128:131], v0, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[140:143], a[84:87], a[0:3], v[140:143], v0, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[84:87], a[8:11], v[144:147], v0, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[84:87], v[26:29], a[0:3], a[240:243], v0, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], v[26:29], a[28:31], v[156:159], v0, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], v[26:29], a[20:23], v[160:163], v0, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[240:243], a[120:123], a[4:7], a[84:87], v0, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[84:87], v[26:29], a[8:11], a[244:247], v0, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[104:107], a[24:27], v[116:119], v0, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[104:107], a[16:19], v[128:131], v0, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[140:143], a[104:107], a[4:7], v[140:143], v0, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[104:107], a[12:15], v[144:147], v0, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], a[120:123], a[24:27], v[156:159], v0, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], a[120:123], a[16:19], v[160:163], v0, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[244:247], a[120:123], a[12:15], a[84:87], v0, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[100:103], a[0:3], v[44:47], v21, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], a[108:111], a[4:7], v[0:3], v21, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[100:103], a[8:11], v[48:51], v21, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], a[108:111], a[12:15], v[0:3], v21, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[64:67], a[28:31], v[52:55], v21, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], a[116:119], a[24:27], v[0:3], v21, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[64:67], a[20:23], v[76:79], v21, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[116:119], a[16:19], v[0:3], v21, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[64:67], a[0:3], v[64:67], v21, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[84:87], a[100:103], a[28:31], a[248:251], v21, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[116:119], a[4:7], v[0:3], v21, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[64:67], a[8:11], v[68:71], v21, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[248:251], a[108:111], a[24:27], a[84:87], v21, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[84:87], a[100:103], a[20:23], a[252:255], v21, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[116:119], a[12:15], v[0:3], v21, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 4
	v_or_b32_e32 v0, 0x10c00, v12
	ds_read_b32 v16, v0
	v_or_b32_e32 v0, 0x10d00, v12
	v_mfma_scale_f32_16x16x128_f8f6f4 a[252:255], a[108:111], a[16:19], a[84:87], v21, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b32 v21, v0
	v_or_b32_e32 v0, 0x10e00, v12
	ds_read_b32 v34, v0
	v_or_b32_e32 v0, 0x10f00, v12
	ds_read_b128 a[84:87], v14 offset:63488
	ds_read_b32 v33, v0
	s_waitcnt vmcnt(10) lgkmcnt(0)
	s_barrier
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[128:131], a[28:31], v[152:155], v16, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v25, a161
	v_add_u32_e32 v29, s46, v25
	v_add_u32_e32 v25, 0x100, v29
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[140:143], a[24:27], v[0:3], v16, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_mov_b32 s22, s14
	s_mov_b32 s23, s15
	s_mov_b32 m0, s26
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[128:131], a[20:23], v[112:115], v16, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_load_dwordx4 v25, s[20:23], 0 offen lds
	v_accvgpr_read_b32 v25, a162
	v_add_u32_e32 v27, s46, v25
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], a[140:143], a[16:19], v[0:3], v16, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a64, a204
	v_add_u32_e32 v25, 0x100, v27
	s_mov_b32 m0, s28
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[128:131], a[0:3], v[148:151], v16, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a65, a205
	v_accvgpr_mov_b32 a66, a206
	v_accvgpr_mov_b32 a67, a207
	v_mfma_scale_f32_16x16x128_f8f6f4 v[148:151], a[140:143], a[4:7], v[0:3], v16, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	ds_read_b128 a[88:91], v14
	buffer_load_dwordx4 v25, s[20:23], 0 offen lds
	v_accvgpr_read_b32 v25, a163
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[128:131], a[8:11], v[80:83], v16, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v31, s46, v25
	v_add_u32_e32 v25, 0x100, v31
	s_mov_b32 m0, s30
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[140:143], a[12:15], v[0:3], v16, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	ds_read_b128 a[100:103], v13
	buffer_load_dwordx4 v25, s[20:23], 0 offen lds
	v_accvgpr_read_b32 v25, a164
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[124:127], a[28:31], v[124:127], v16, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v28, s46, v25
	v_add_u32_e32 v25, 0x100, v28
	s_mov_b32 m0, s33
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[96:99], a[24:27], v[0:3], v16, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	ds_read_b128 a[104:107], v14 offset:2048
	buffer_load_dwordx4 v25, s[20:23], 0 offen lds
	s_mov_b32 m0, s35
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[124:127], a[20:23], v[84:87], v16, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_mov_b32 s6, s14
	s_mov_b32 s7, s15
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], a[96:99], a[16:19], v[0:3], v16, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[124:127], a[0:3], v[132:135], v16, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[96:99], a[4:7], v[0:3], v16, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[124:127], a[8:11], v[120:123], v16, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	ds_read_b128 a[124:127], v13 offset:2048
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[96:99], a[12:15], v[0:3], v16, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v16, a165
	v_add_u32_e32 v30, s46, v16
	v_add_u32_e32 v16, 0x100, v30
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[80:83], a[28:31], v[168:171], v21, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_load_dwordx4 v16, s[20:23], 0 offen lds
	v_accvgpr_read_b32 v16, a166
	v_add_u32_e32 v16, s46, v16
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[136:139], a[24:27], v[0:3], v21, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_add_u32_e32 v25, 0x100, v16
	s_mov_b32 m0, s37
	s_waitcnt vmcnt(0)
	ds_read_b128 a[92:95], v14 offset:4096
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[80:83], a[20:23], v[188:191], v21, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_load_dwordx4 v25, s[20:23], 0 offen lds
	v_accvgpr_read_b32 v25, a167
	v_add_u32_e32 v26, s46, v25
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[72:75], a[28:31], a[64:67], v21, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v25, 0x100, v26
	s_mov_b32 m0, s39
	s_waitcnt vmcnt(0)
	ds_read_b128 a[108:111], v13 offset:4096
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[136:139], a[16:19], v[0:3], v21, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	buffer_load_dwordx4 v25, s[20:23], 0 offen lds
	v_accvgpr_read_b32 v25, a168
	v_add_u32_e32 v25, s46, v25
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[80:83], a[8:11], v[192:195], v21, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v35, 0x100, v25
	s_mov_b32 m0, s41
	s_waitcnt vmcnt(0)
	ds_read_b128 a[96:99], v14 offset:6144
	v_mfma_scale_f32_16x16x128_f8f6f4 a[204:207], a[144:147], a[24:27], a[64:67], v21, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	buffer_load_dwordx4 v35, s[20:23], 0 offen lds
	v_add_u32_e32 v35, v17, v12
	s_mov_b32 m0, s42
	v_accvgpr_mov_b32 a64, a200
	v_accvgpr_mov_b32 a65, a201
	v_accvgpr_mov_b32 a66, a202
	v_accvgpr_mov_b32 a67, a203
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[136:139], a[12:15], v[0:3], v21, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	buffer_load_dword v35, s[4:7], 0 offen lds
	s_mov_b32 m0, s44
	s_waitcnt vmcnt(0)
	ds_read_b128 a[128:131], v13 offset:6144
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[72:75], a[20:23], a[64:67], v21, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[200:203], a[144:147], a[16:19], a[64:67], v21, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 1
	v_accvgpr_write_b32 a227, v3
	v_accvgpr_write_b32 a226, v2
	v_accvgpr_write_b32 a225, v1
	v_mfma_scale_f32_16x16x128_f8f6f4 a[196:199], a[80:83], a[0:3], a[196:199], v21, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_accvgpr_mov_b32 a64, a208
	v_accvgpr_mov_b32 a65, a209
	v_accvgpr_mov_b32 a66, a210
	v_accvgpr_mov_b32 a67, a211
	v_accvgpr_write_b32 a224, v0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[72:75], a[0:3], v[204:207], v21, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[72:75], a[8:11], a[64:67], v21, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[196:199], a[136:139], a[4:7], a[196:199], v21, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[144:147], a[4:7], v[0:3], v21, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[208:211], a[144:147], a[12:15], a[64:67], v21, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_add_u32_e32 v21, v38, v12
	v_add_u32_e32 v35, 0x10200, v21
	buffer_load_dword v35, s[4:7], 0 offen lds
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[68:71], a[28:31], v[200:203], v34, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_accvgpr_mov_b32 a64, a212
	v_accvgpr_mov_b32 a65, a213
	v_accvgpr_mov_b32 a66, a214
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[132:135], a[24:27], v[0:3], v34, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a67, a215
	s_waitcnt vmcnt(0)
	ds_read_b128 a[116:119], v14 offset:8192
	ds_read_b128 a[72:75], v14 offset:10240
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[68:71], a[0:3], v[196:199], v34, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[120:123], v13 offset:8192
	ds_read_b128 a[80:83], v14 offset:14336
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], a[132:135], a[4:7], v[0:3], v34, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[76:79], a[28:31], v[212:215], v34, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[212:215], a[148:151], a[24:27], v[0:3], v34, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[76:79], a[20:23], v[216:219], v34, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[216:219], a[148:151], a[16:19], v[0:3], v34, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[76:79], a[0:3], v[228:231], v34, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[228:231], a[148:151], a[4:7], v[0:3], v34, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[76:79], a[8:11], v[232:235], v34, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[76:79], v13 offset:10240
	v_mfma_scale_f32_16x16x128_f8f6f4 v[232:235], a[148:151], a[12:15], v[0:3], v34, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b128 a[148:151], v13 offset:14336
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[152:155], a[28:31], v[240:243], v33, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[240:243], a[156:159], a[24:27], v[0:3], v33, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[152:155], a[20:23], v[244:247], v33, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[244:247], a[156:159], a[16:19], v[0:3], v33, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[152:155], a[0:3], v[236:239], v33, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[156:159], a[4:7], v[0:3], v33, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[68:71], a[20:23], a[64:67], v34, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[212:215], a[132:135], a[16:19], a[64:67], v34, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_write_b32 a179, v3
	v_accvgpr_write_b32 a178, v2
	v_accvgpr_write_b32 a177, v1
	v_accvgpr_write_b32 a176, v0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[152:155], a[8:11], v[252:255], v33, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a64, a216
	v_accvgpr_mov_b32 a65, a217
	v_accvgpr_mov_b32 a66, a218
	v_mfma_scale_f32_16x16x128_f8f6f4 v[252:255], a[156:159], a[12:15], v[0:3], v33, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a67, a219
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[84:87], a[28:31], v[248:251], v33, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[68:71], a[8:11], a[64:67], v34, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[68:71], v13 offset:12288
	v_mfma_scale_f32_16x16x128_f8f6f4 v[248:251], a[112:115], a[24:27], v[0:3], v33, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[84:87], a[20:23], v[224:227], v33, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[192:195], a[84:87], a[0:3], a[192:195], v33, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[84:87], a[8:11], v[172:175], v33, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[216:219], a[132:135], a[12:15], a[64:67], v34, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[224:227], a[112:115], a[16:19], v[0:3], v33, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_or_b32_e32 v20, 0x10100, v12
	s_nop 0
	ds_read_b128 a[64:67], v14 offset:12288
	v_mfma_scale_f32_16x16x128_f8f6f4 a[192:195], a[112:115], a[4:7], a[192:195], v33, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[112:115], a[12:15], v[4:7], v33, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_or_b32_e32 v15, 0x10000, v12
	ds_read_b32 v15, v15
	ds_read_b32 v33, v20
	v_or_b32_e32 v20, 0x10200, v12
	ds_read_b32 v32, v20
	v_or_b32_e32 v20, 0x10300, v12
	ds_read_b32 v39, v20
	s_waitcnt vmcnt(10) lgkmcnt(0)
	s_barrier
	v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], a[88:91], a[32:35], a[228:231], v15, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v34, a220
	v_accvgpr_read_b32 v35, a221
	v_accvgpr_read_b32 v36, a222
	v_mfma_scale_f32_16x16x128_f8f6f4 a[228:231], a[100:103], a[36:39], a[0:3], v15, v22 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v37, a223
	v_add_u32_e32 v20, 0xfff9fc00, v19
	buffer_load_dwordx4 a[28:31], v20, s[12:15], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 a[12:15], a[96:99], a[32:35], a[232:235], v33, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a0, a180
	v_accvgpr_mov_b32 a1, a181
	v_accvgpr_mov_b32 a2, a182
	v_accvgpr_mov_b32 a3, a183
	v_mfma_scale_f32_16x16x128_f8f6f4 v[236:239], a[88:91], a[52:55], v[164:167], v15, v23 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[132:135], v14 offset:20480
	ds_read_b128 a[84:87], v14 offset:22528
	ds_read_b128 a[112:115], v13 offset:22528
	v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], a[88:91], a[40:43], a[0:3], v15, v22 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[140:143], v14 offset:16384
	ds_read_b128 a[136:139], v14 offset:18432
	ds_read_b128 a[144:147], v13 offset:18432
	v_mfma_scale_f32_16x16x128_f8f6f4 a[152:155], a[100:103], a[44:47], a[0:3], v15, v22 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[104:107], a[32:35], v[40:43], v15, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_mov_b32 a0, a184
	v_accvgpr_mov_b32 a1, a185
	v_accvgpr_mov_b32 a2, a186
	v_accvgpr_mov_b32 a3, a187
	v_mfma_scale_f32_16x16x128_f8f6f4 v[34:37], a[104:107], a[40:43], v[34:37], v15, v22 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], a[88:91], a[56:59], a[0:3], v15, v23 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[88:91], v13 offset:16384
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[104:107], a[52:55], v[60:63], v15, v23 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[104:107], a[56:59], v[56:59], v15, v23 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[104:107], v14 offset:24576
	v_mfma_scale_f32_16x16x128_f8f6f4 a[232:235], a[128:131], a[36:39], a[12:15], v33, v22 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[12:15], a[96:99], a[40:43], a[236:239], v33, v22 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[100:103], a[48:51], v[236:239], v15, v23 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[156:159], a[100:103], a[60:63], a[0:3], v15, v23 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b128 a[100:103], v14 offset:26624
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[124:127], a[36:39], v[40:43], v15, v22 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[34:37], a[124:127], a[44:47], v[34:37], v15, v22 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[124:127], a[48:51], v[60:63], v15, v23 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[124:127], a[60:63], v[56:59], v15, v23 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_add_u32_e32 v15, 0xfffdfc00, v19
	buffer_load_dwordx4 a[0:3], v15, s[12:15], 0 offen
	ds_read_b128 a[124:127], v14 offset:30720
	v_mfma_scale_f32_16x16x128_f8f6f4 a[236:239], a[128:131], a[44:47], a[12:15], v33, v22 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 2
	buffer_load_dwordx4 a[12:15], v19, s[12:15], 0 offen
	v_add_u32_e32 v15, 0xfffe0000, v19
	buffer_load_dwordx4 a[4:7], v15, s[12:15], 0 offen
	v_add_u32_e32 v20, 0xfffa0000, v19
	v_add_u32_e32 v15, 0xfffffc00, v19
	buffer_load_dwordx4 a[24:27], v20, s[12:15], 0 offen
	buffer_load_dwordx4 a[8:11], v15, s[12:15], 0 offen
	v_add_u32_e32 v20, 0xfffbfc00, v19
	buffer_load_dwordx4 a[20:23], v20, s[12:15], 0 offen
	v_add_u32_e32 v20, 0xfffc0000, v19
	v_add_u32_e32 v15, 0xffffc000, v24
	buffer_load_dwordx4 a[16:19], v20, s[12:15], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], a[96:99], a[52:55], v[136:139], v33, v23 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_load_dword v20, v15, s[0:3], 0 offen
	s_nop 0
	buffer_load_dword v15, v24, s[0:3], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[96:99], a[56:59], v[96:99], v33, v23 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_or_b32_e32 v24, 0x10400, v12
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[116:119], a[32:35], v[116:119], v32, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[116:119], a[40:43], v[128:131], v32, v22 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[140:143], a[116:119], a[52:55], v[140:143], v32, v23 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[116:119], a[56:59], v[144:147], v32, v23 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[116:119], v13 offset:26624
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], a[72:75], a[32:35], v[156:159], v32, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], a[72:75], a[40:43], v[160:163], v32, v22 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[96:99], a[72:75], a[52:55], a[240:243], v32, v23 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[72:75], a[72:75], a[56:59], a[244:247], v32, v23 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], a[92:95], a[32:35], v[108:111], v33, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[92:95], a[40:43], v[72:75], v33, v22 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[92:95], a[52:55], v[92:95], v33, v23 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[92:95], a[56:59], v[88:91], v33, v23 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[92:95], v13 offset:20480
	v_mfma_scale_f32_16x16x128_f8f6f4 a[244:247], a[64:67], a[32:35], a[248:251], v39, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[248:251], a[64:67], a[40:43], a[252:255], v39, v22 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], a[64:67], a[52:55], v[44:47], v39, v23 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], a[64:67], a[56:59], v[48:51], v39, v23 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[64:67], v13 offset:28672
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], a[80:83], a[32:35], v[52:55], v39, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[80:83], a[40:43], v[76:79], v39, v22 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[80:83], a[52:55], v[64:67], v39, v23 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[80:83], a[56:59], v[68:71], v39, v23 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[120:123], a[36:39], v[116:119], v32, v22 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[120:123], a[44:47], v[128:131], v32, v22 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[140:143], a[120:123], a[48:51], v[140:143], v32, v23 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[120:123], a[60:63], v[144:147], v32, v23 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b128 a[120:123], v13 offset:24576
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], a[76:79], a[36:39], v[156:159], v32, v22 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], a[76:79], a[44:47], v[160:163], v32, v22 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[240:243], a[76:79], a[48:51], a[96:99], v32, v23 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[180:183], a[76:79], a[60:63], a[72:75], v32, v23 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b32 v32, v24
	v_or_b32_e32 v24, 0x10500, v12
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], a[108:111], a[36:39], v[108:111], v33, v22 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[108:111], a[44:47], v[72:75], v33, v22 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[108:111], a[48:51], v[92:95], v33, v23 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[108:111], a[60:63], v[88:91], v33, v23 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b128 a[108:111], v14 offset:28672
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], a[128:131], a[48:51], v[136:139], v33, v23 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[128:131], a[60:63], v[96:99], v33, v23 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b32 v33, v24
	v_or_b32_e32 v24, 0x10600, v12
	ds_read_b128 a[128:131], v13 offset:30720
	v_mfma_scale_f32_16x16x128_f8f6f4 a[244:247], a[68:71], a[36:39], a[244:247], v39, v22 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[252:255], a[68:71], a[44:47], a[248:251], v39, v22 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], a[68:71], a[48:51], v[44:47], v39, v23 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], a[68:71], a[60:63], v[48:51], v39, v23 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], a[148:151], a[36:39], v[52:55], v39, v22 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[148:151], a[44:47], v[76:79], v39, v22 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[148:151], a[48:51], v[64:67], v39, v23 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[148:151], a[60:63], v[68:71], v39, v23 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b32 v39, v24
	v_or_b32_e32 v24, 0x10700, v12
	ds_read_b32 v24, v24
	s_waitcnt vmcnt(10) lgkmcnt(0)
	s_barrier
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[140:143], a[32:35], v[152:155], v32, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v29, 0x180, v29
	s_mov_b32 m0, s25
	v_add_u32_e32 v27, 0x180, v27
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], a[140:143], a[40:43], v[112:115], v32, v22 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_load_dwordx4 v29, s[20:23], 0 offen lds
	s_mov_b32 m0, s27
	s_waitcnt vmcnt(0)
	ds_read_b128 a[72:75], v14 offset:32768
	v_mfma_scale_f32_16x16x128_f8f6f4 v[148:151], a[140:143], a[52:55], v[148:151], v32, v23 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_load_dwordx4 v27, s[20:23], 0 offen lds
	v_add_u32_e32 v27, 0x180, v31
	s_mov_b32 m0, s29
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[140:143], a[56:59], v[80:83], v32, v23 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a68, a224
	v_accvgpr_mov_b32 a69, a225
	v_accvgpr_mov_b32 a70, a226
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[88:91], a[36:39], v[152:155], v32, v22 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a71, a227
	v_add_u32_e32 v16, 0x180, v16
	v_accvgpr_read_b32 v0, a176
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], a[88:91], a[44:47], v[112:115], v32, v22 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v1, a177
	v_accvgpr_read_b32 v2, a178
	v_accvgpr_read_b32 v3, a179
	v_mfma_scale_f32_16x16x128_f8f6f4 v[148:151], a[88:91], a[48:51], v[148:151], v32, v23 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a251, a247
	v_accvgpr_mov_b32 a250, a246
	v_accvgpr_mov_b32 a249, a245
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[88:91], a[60:63], v[80:83], v32, v23 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	ds_read_b128 a[88:91], v13 offset:32768
	buffer_load_dwordx4 v27, s[20:23], 0 offen lds
	v_add_u32_e32 v27, 0x180, v28
	s_mov_b32 m0, s31
	s_waitcnt vmcnt(0)
	ds_read_b128 a[80:83], v14 offset:34816
	buffer_load_dwordx4 v27, s[20:23], 0 offen lds
	v_add_u32_e32 v27, 0x180, v30
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], a[132:135], a[40:43], v[188:191], v33, v22 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_mov_b32 m0, s34
	s_waitcnt vmcnt(0)
	ds_read_b128 a[96:99], v13 offset:34816
	buffer_load_dwordx4 v27, s[20:23], 0 offen lds
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[132:135], a[32:35], v[168:171], v33, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_mov_b32 m0, s36
	s_waitcnt vmcnt(0)
	ds_read_b128 a[76:79], v14 offset:36864
	buffer_load_dwordx4 v16, s[20:23], 0 offen lds
	v_mfma_scale_f32_16x16x128_f8f6f4 a[196:199], a[132:135], a[52:55], a[196:199], v33, v23 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v16, 0x180, v26
	s_mov_b32 m0, s38
	v_accvgpr_mov_b32 a248, a244
	v_mfma_scale_f32_16x16x128_f8f6f4 a[68:71], a[132:135], a[56:59], a[68:71], v33, v23 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a247, a183
	v_accvgpr_mov_b32 a227, a155
	v_accvgpr_mov_b32 a246, a182
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[92:95], a[44:47], v[28:31], v33, v22 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a245, a181
	v_accvgpr_mov_b32 a244, a180
	v_accvgpr_mov_b32 a226, a154
	v_mfma_scale_f32_16x16x128_f8f6f4 a[204:207], a[84:87], a[32:35], a[204:207], v33, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a225, a153
	v_accvgpr_mov_b32 a224, a152
	v_mfma_scale_f32_16x16x128_f8f6f4 a[200:203], a[84:87], a[40:43], a[200:203], v33, v22 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[26:29], a[84:87], a[52:55], v[204:207], v33, v23 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[208:211], a[84:87], a[56:59], a[208:211], v33, v23 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[92:95], a[36:39], v[168:171], v33, v22 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[196:199], a[92:95], a[48:51], a[196:199], v33, v23 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[132:135], a[92:95], a[60:63], a[68:71], v33, v23 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	ds_read_b128 a[92:95], v13 offset:36864
	buffer_load_dwordx4 v16, s[20:23], 0 offen lds
	v_add_u32_e32 v16, 0x180, v25
	s_mov_b32 m0, s40
	s_waitcnt vmcnt(0)
	ds_read_b128 a[68:71], v14 offset:38912
	buffer_load_dwordx4 v16, s[20:23], 0 offen lds
	v_add_u32_e32 v16, 0x300, v21
	s_mov_b32 m0, s43
	v_mfma_scale_f32_16x16x128_f8f6f4 a[204:207], a[112:115], a[36:39], a[204:207], v33, v22 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	buffer_load_dword v16, s[4:7], 0 offen lds
	v_add_u32_e32 v16, 0x10300, v21
	s_mov_b32 m0, s45
	v_mfma_scale_f32_16x16x128_f8f6f4 a[200:203], a[112:115], a[44:47], a[200:203], v33, v22 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v195, a135
	v_accvgpr_read_b32 v194, a134
	v_accvgpr_read_b32 v193, a133
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[112:115], a[48:51], v[26:29], v33, v23 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v192, a132
	v_mfma_scale_f32_16x16x128_f8f6f4 a[208:211], a[112:115], a[60:63], a[208:211], v33, v23 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	ds_read_b128 a[112:115], v13 offset:38912
	buffer_load_dword v16, s[4:7], 0 offen lds
	s_waitcnt vmcnt(0)
	ds_read_b128 a[84:87], v14 offset:40960
	v_mfma_scale_f32_16x16x128_f8f6f4 v[26:29], a[104:107], a[32:35], v[200:203], v39, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[236:239], a[108:111], a[32:35], v[240:243], v24, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[120:123], a[36:39], v[26:29], v39, v22 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[26:29], a[104:107], a[52:55], v[196:199], v39, v23 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[240:243], a[64:67], a[36:39], v[236:239], v24, v22 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[236:239], a[108:111], a[40:43], v[244:247], v24, v22 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], a[120:123], a[48:51], v[26:29], v39, v23 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[26:29], a[100:103], a[32:35], v[212:215], v39, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[244:247], a[64:67], a[44:47], v[236:239], v24, v22 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[236:239], a[108:111], a[52:55], v[0:3], v24, v23 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[124:127], a[56:59], v[172:175], v24, v23 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[212:215], a[104:107], a[40:43], a[212:215], v39, v22 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[216:219], a[104:107], a[56:59], a[216:219], v39, v23 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[104:107], v13 offset:40960
	v_mfma_scale_f32_16x16x128_f8f6f4 v[212:215], a[116:119], a[36:39], v[26:29], v39, v22 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[26:29], a[100:103], a[40:43], v[216:219], v39, v22 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[228:231], a[100:103], a[52:55], v[228:231], v39, v23 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[232:235], a[100:103], a[56:59], v[232:235], v39, v23 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[100:103], v14 offset:45056
	v_mfma_scale_f32_16x16x128_f8f6f4 v[252:255], a[108:111], a[56:59], v[252:255], v24, v23 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[108:111], v13 offset:45056
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[136:139], a[32:35], v[124:127], v32, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], a[136:139], a[40:43], v[84:87], v32, v22 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[136:139], a[52:55], v[132:135], v32, v23 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[136:139], a[56:59], v[120:123], v32, v23 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[248:251], a[124:127], a[32:35], v[248:251], v24, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[224:227], a[124:127], a[40:43], v[224:227], v24, v22 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[192:195], a[124:127], a[52:55], a[192:195], v24, v23 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[128:131], a[60:63], v[0:3], v24, v23 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_read_b32 v0, a172
	v_accvgpr_read_b32 v3, a175
	ds_read_b32 v2, v0
	ds_read_b32 v21, v3
	v_accvgpr_read_b32 v0, a173
	ds_read_b32 v1, v0
	v_accvgpr_read_b32 v0, a174
	v_mfma_scale_f32_16x16x128_f8f6f4 a[212:215], a[120:123], a[44:47], a[212:215], v39, v22 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b32 v0, v0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[216:219], a[120:123], a[60:63], a[216:219], v39, v23 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b128 a[120:123], v13 offset:43008
	v_mfma_scale_f32_16x16x128_f8f6f4 v[216:219], a[116:119], a[44:47], v[26:29], v39, v22 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 2
	ds_read_b128 v[26:29], v14 offset:43008
	v_mfma_scale_f32_16x16x128_f8f6f4 v[228:231], a[116:119], a[48:51], v[228:231], v39, v23 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[232:235], a[116:119], a[60:63], v[232:235], v39, v23 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b128 a[116:119], v13 offset:47104
	v_mfma_scale_f32_16x16x128_f8f6f4 v[236:239], a[64:67], a[48:51], v[236:239], v24, v23 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[252:255], a[64:67], a[60:63], v[252:255], v24, v23 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b128 a[64:67], v14 offset:47104
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[144:147], a[36:39], v[124:127], v32, v22 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], a[144:147], a[44:47], v[84:87], v32, v22 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[144:147], a[48:51], v[132:135], v32, v23 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[144:147], a[60:63], v[120:123], v32, v23 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v30, a156
	v_accvgpr_read_b32 v31, a157
	v_accvgpr_read_b32 v32, a158
	v_mfma_scale_f32_16x16x128_f8f6f4 v[248:251], a[128:131], a[36:39], v[248:251], v24, v22 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v33, a159
	v_mfma_scale_f32_16x16x128_f8f6f4 v[224:227], a[128:131], a[44:47], v[224:227], v24, v22 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[192:195], a[128:131], a[48:51], a[192:195], v24, v23 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(10) lgkmcnt(0)
	s_barrier
	s_add_i32 s8, s8, 2
	s_addk_i32 s46, 0x100
	v_add_u32_e32 v38, 0x200, v38
	v_add_u32_e32 v17, 0x200, v17
	v_add_u32_e32 v18, 0x200, v18
	s_cmp_lt_u32 s8, 60
	v_add_u32_e32 v19, 0x1000, v19
	s_cbranch_scc1 .LBB0_1
	v_accvgpr_read_b32 v3, a170
	v_add_u32_e32 v3, 0x1e000, v3
	v_accvgpr_read_b32 v16, a169
	v_add_u32_e32 v3, v3, v16
	v_add_u32_e32 v16, 0x1000, v3
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier
	buffer_load_dwordx4 a[32:35], v16, s[12:15], 0 offen offset:2048
	buffer_load_dwordx4 a[36:39], v16, s[12:15], 0 offen offset:3072
	v_add_u32_e32 v16, 0x21000, v3
	buffer_load_dwordx4 a[40:43], v16, s[12:15], 0 offen offset:2048
	buffer_load_dwordx4 a[44:47], v16, s[12:15], 0 offen offset:3072
	v_add_u32_e32 v16, 0x41000, v3
	buffer_load_dwordx4 a[48:51], v16, s[12:15], 0 offen offset:2048
	buffer_load_dwordx4 a[52:55], v16, s[12:15], 0 offen offset:3072
	v_add_u32_e32 v3, 0x61000, v3
	v_accvgpr_read_b32 v16, a171
	buffer_load_dwordx4 a[56:59], v3, s[12:15], 0 offen offset:2048
	buffer_load_dwordx4 a[60:63], v3, s[12:15], 0 offen offset:3072
	v_add_u32_e32 v3, 0x3000, v16
	v_add_u32_e32 v16, 0x7000, v16
	buffer_load_dword v3, v3, s[0:3], 0 offen offset:3840
	s_nop 0
	buffer_load_dword v208, v16, s[0:3], 0 offen offset:3840
	v_accvgpr_read_b32 v17, a160
	v_mul_i32_i24_e32 v16, -16, v17
	v_accvgpr_write_b32 a190, v16
	v_or_b32_e32 v16, 0x10c00, v12
	v_accvgpr_mov_b32 a191, a160
	v_or_b32_e32 v17, 0x10d00, v12
	v_or_b32_e32 v18, 0x10e00, v12
	v_or_b32_e32 v19, 0x10f00, v12
	ds_read_b32 v38, v16
	ds_read_b32 v39, v17
	ds_read_b32 v209, v18
	ds_read_b32 v210, v19
	ds_read_b128 a[124:127], v14 offset:49152
	ds_read_b128 a[128:131], v14 offset:51200
	ds_read_b128 a[132:135], v13 offset:49152
	ds_read_b128 a[136:139], v13 offset:51200
	ds_read_b128 a[140:143], v14 offset:53248
	ds_read_b128 a[144:147], v14 offset:55296
	ds_read_b128 a[148:151], v13 offset:53248
	ds_read_b128 a[152:155], v13 offset:55296
	ds_read_b128 a[156:159], v14 offset:57344
	ds_read_b128 a[160:163], v14 offset:59392
	ds_read_b128 a[164:167], v13 offset:57344
	ds_read_b128 a[168:171], v13 offset:59392
	ds_read_b128 a[172:175], v14 offset:61440
	ds_read_b128 a[176:179], v14 offset:63488
	ds_read_b128 a[180:183], v13 offset:61440
	ds_read_b128 a[184:187], v13 offset:63488
	s_ashr_i32 s17, s16, 31
	s_ashr_i32 s0, s24, 31
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], a[128:131], a[20:23], v[84:87], v38, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v8, a196
	v_accvgpr_read_b32 v9, a197
	v_accvgpr_read_b32 v10, a198
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[136:139], a[16:19], v[84:87], v38, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v11, a199
	v_accvgpr_read_b32 v16, a192
	v_accvgpr_read_b32 v17, a193
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[140:143], a[0:3], v[8:11], v39, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v18, a194
	v_accvgpr_read_b32 v19, a195
	s_nop 0
	v_accvgpr_read_b32 v8, a204
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[144:147], a[0:3], v[204:207], v39, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v9, a205
	v_accvgpr_read_b32 v10, a206
	v_accvgpr_read_b32 v11, a207
	v_mfma_scale_f32_16x16x128_f8f6f4 a[220:223], a[72:75], a[28:31], a[228:231], v2, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[228:231], a[68:71], a[28:31], a[232:235], v1, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[232:235], a[68:71], a[20:23], a[236:239], v1, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[236:239], v[26:29], a[0:3], a[240:243], v0, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[240:243], v[26:29], a[8:11], a[244:247], v0, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[244:247], a[100:103], a[28:31], a[248:251], v21, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[248:251], a[100:103], a[20:23], a[252:255], v21, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_write_b32 a255, v7
	v_mfma_scale_f32_16x16x128_f8f6f4 v[184:187], a[144:147], a[28:31], v[8:11], v39, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a254, v6
	v_accvgpr_write_b32 a253, v5
	v_accvgpr_write_b32 a252, v4
	v_accvgpr_read_b32 v8, a200
	v_mov_b64_e32 v[4:5], v[172:173]
	v_accvgpr_read_b32 v9, a201
	v_accvgpr_read_b32 v10, a202
	v_accvgpr_read_b32 v11, a203
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[72:75], a[0:3], v[164:167], v2, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mov_b64_e32 v[6:7], v[174:175]
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[140:143], a[28:31], v[168:171], v39, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[140:143], a[20:23], v[188:191], v39, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[140:143], a[8:11], v[192:195], v39, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[144:147], a[20:23], v[8:11], v39, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[152:155], a[4:7], v[204:207], v39, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[148:151], a[24:27], v[168:171], v39, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[148:151], a[16:19], v[164:167], v39, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[148:151], a[4:7], v[176:179], v39, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[148:151], a[12:15], v[172:175], v39, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 3
	v_accvgpr_write_b32 a151, v11
	v_accvgpr_write_b32 a150, v10
	v_accvgpr_write_b32 a149, v9
	v_accvgpr_write_b32 a148, v8
	v_accvgpr_read_b32 v8, a208
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[160:163], a[28:31], v[212:215], v209, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v9, a209
	v_accvgpr_read_b32 v10, a210
	v_accvgpr_read_b32 v11, a211
	v_mfma_scale_f32_16x16x128_f8f6f4 v[184:187], a[152:155], a[24:27], v[184:187], v39, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[144:147], a[8:11], v[8:11], v39, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_read_b32 v8, a212
	v_accvgpr_read_b32 v9, a213
	v_accvgpr_read_b32 v10, a214
	v_accvgpr_read_b32 v11, a215
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[152:155], a[16:19], v[180:183], v39, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[192:195], a[156:159], a[20:23], v[8:11], v209, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[168:171], a[24:27], v[204:207], v209, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[160:163], a[20:23], v[216:219], v209, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[152:155], a[12:15], v[188:191], v39, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_write_b32 a155, v11
	v_accvgpr_write_b32 a154, v10
	v_accvgpr_write_b32 a153, v9
	v_accvgpr_write_b32 a152, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[168:171], a[16:19], v[204:207], v209, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[160:163], a[0:3], v[228:231], v209, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], a[64:67], a[28:31], v[52:55], v21, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[64:67], a[20:23], v[76:79], v21, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[64:67], a[0:3], v[64:67], v21, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[64:67], a[8:11], v[68:71], v21, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a64, a216
	v_accvgpr_mov_b32 a65, a217
	v_accvgpr_mov_b32 a66, a218
	v_accvgpr_mov_b32 a67, a219
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[156:159], a[28:31], v[200:203], v209, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], a[156:159], a[0:3], v[196:199], v209, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[156:159], a[8:11], a[64:67], v209, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a159, v11
	v_accvgpr_write_b32 a158, v10
	v_accvgpr_write_b32 a157, v9
	v_accvgpr_write_b32 a156, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[168:171], a[4:7], v[204:207], v209, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[160:163], a[8:11], v[232:235], v209, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[164:167], a[24:27], v[200:203], v209, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[192:195], a[164:167], a[16:19], v[192:195], v209, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], a[164:167], a[4:7], v[196:199], v209, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[144:147], a[164:167], a[12:15], a[64:67], v209, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_write_b32 a167, v11
	v_accvgpr_write_b32 a166, v10
	v_accvgpr_write_b32 a165, v9
	v_accvgpr_write_b32 a164, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[168:171], a[12:15], v[204:207], v209, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[172:175], a[28:31], v[240:243], v210, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[30:33], a[72:75], a[8:11], v[30:33], v2, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_write_b32 a163, v11
	v_accvgpr_write_b32 a162, v10
	v_accvgpr_write_b32 a161, v9
	v_accvgpr_write_b32 a160, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[180:183], a[24:27], v[204:207], v210, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[172:175], a[20:23], v[244:247], v210, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[80:83], a[0:3], v[60:63], v2, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_write_b32 a171, v11
	v_accvgpr_write_b32 a170, v10
	v_accvgpr_write_b32 a169, v9
	v_accvgpr_write_b32 a168, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[180:183], a[16:19], v[204:207], v210, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[176:179], a[28:31], v[248:251], v210, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[80:83], a[8:11], v[56:59], v2, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_write_b32 a199, v11
	v_accvgpr_write_b32 a198, v10
	v_accvgpr_write_b32 a197, v9
	v_accvgpr_write_b32 a196, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[184:187], a[24:27], v[204:207], v210, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[176:179], a[20:23], v[224:227], v210, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[76:79], a[0:3], v[92:95], v1, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_write_b32 a203, v11
	v_accvgpr_write_b32 a202, v10
	v_accvgpr_write_b32 a201, v9
	v_accvgpr_write_b32 a200, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[184:187], a[16:19], v[204:207], v210, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[172:175], a[0:3], v[236:239], v210, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[76:79], a[8:11], v[88:91], v1, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_write_b32 a207, v11
	v_accvgpr_write_b32 a206, v10
	v_accvgpr_write_b32 a205, v9
	v_accvgpr_write_b32 a204, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[180:183], a[4:7], v[204:207], v210, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[172:175], a[8:11], v[252:255], v210, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], a[68:71], a[0:3], v[136:139], v1, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[68:71], a[8:11], v[96:99], v1, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[140:143], a[84:87], a[0:3], v[140:143], v0, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[84:87], a[8:11], v[144:147], v0, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], a[100:103], a[0:3], v[44:47], v21, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], a[100:103], a[8:11], v[48:51], v21, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[148:151], a[124:127], a[0:3], v[148:151], v38, v15 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[124:127], a[8:11], v[80:83], v38, v15 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[128:131], a[0:3], v[132:135], v38, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[128:131], a[8:11], v[120:123], v38, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[252:255], a[180:183], a[12:15], v[204:207], v210, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[176:179], a[0:3], v[16:19], v210, v15 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[176:179], a[8:11], v[4:7], v210, v15 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[224:227], a[72:75], a[20:23], a[224:227], v2, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[80:83], a[28:31], v[40:43], v2, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[34:37], a[80:83], a[20:23], v[34:37], v2, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], a[76:79], a[28:31], v[108:111], v1, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[76:79], a[20:23], v[72:75], v1, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[84:87], a[28:31], v[116:119], v0, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[84:87], a[20:23], v[128:131], v0, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], v[26:29], a[28:31], v[156:159], v0, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], v[26:29], a[20:23], v[160:163], v0, v20 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[124:127], a[28:31], v[152:155], v38, v20 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], a[124:127], a[20:23], v[112:115], v38, v20 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[128:131], a[28:31], v[124:127], v38, v20 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[22:25], a[88:91], a[4:7], v[22:25], v2, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[30:33], a[88:91], a[12:15], v[30:33], v2, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[96:99], a[4:7], v[60:63], v2, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[96:99], a[12:15], v[56:59], v2, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[92:95], a[4:7], v[92:95], v1, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[92:95], a[12:15], v[88:91], v1, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], a[112:115], a[4:7], v[136:139], v1, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[112:115], a[12:15], v[96:99], v1, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[140:143], a[104:107], a[4:7], v[140:143], v0, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[104:107], a[12:15], v[144:147], v0, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[236:239], a[120:123], a[4:7], a[236:239], v0, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[240:243], a[120:123], a[12:15], a[240:243], v0, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], a[108:111], a[4:7], v[44:47], v21, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], a[108:111], a[12:15], v[48:51], v21, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[116:119], a[4:7], v[64:67], v21, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[116:119], a[12:15], v[68:71], v21, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[148:151], a[132:135], a[4:7], v[148:151], v38, v15 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[132:135], a[12:15], v[80:83], v38, v15 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[136:139], a[4:7], v[132:135], v38, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[136:139], a[12:15], v[120:123], v38, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], a[184:187], a[4:7], v[204:207], v210, v15 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], a[184:187], a[12:15], v[4:7], v210, v15 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_or_b32_e32 v15, 0x10300, v12
	v_mfma_scale_f32_16x16x128_f8f6f4 a[220:223], a[88:91], a[24:27], a[220:223], v2, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[224:227], a[88:91], a[16:19], a[224:227], v2, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[96:99], a[24:27], v[40:43], v2, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[34:37], a[96:99], a[16:19], v[34:37], v2, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_or_b32_e32 v2, 0x10200, v12
	ds_read_b32 v2, v2
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], a[92:95], a[24:27], v[108:111], v1, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[92:95], a[16:19], v[72:75], v1, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[228:231], a[112:115], a[24:27], a[228:231], v1, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[232:235], a[112:115], a[16:19], a[232:235], v1, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_or_b32_e32 v1, 0x10100, v12
	ds_read_b32 v1, v1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[104:107], a[24:27], v[116:119], v0, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[104:107], a[16:19], v[128:131], v0, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], a[120:123], a[24:27], v[156:159], v0, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], a[120:123], a[16:19], v[160:163], v0, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_or_b32_e32 v0, 0x10000, v12
	ds_read_b32 v0, v0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[244:247], a[108:111], a[24:27], a[244:247], v21, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[248:251], a[108:111], a[16:19], a[248:251], v21, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], a[116:119], a[24:27], v[52:55], v21, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[116:119], a[16:19], v[76:79], v21, v20 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[132:135], a[24:27], v[152:155], v38, v20 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], a[132:135], a[16:19], v[112:115], v38, v20 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[136:139], a[24:27], v[124:127], v38, v20 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_read_b32 v209, v15
	ds_read_b128 v[100:103], v14
	ds_read_b128 v[204:207], v14 offset:2048
	ds_read_b128 v[212:215], v13
	ds_read_b128 v[216:219], v13 offset:2048
	ds_read_b128 a[0:3], v14 offset:4096
	ds_read_b128 a[4:7], v14 offset:6144
	ds_read_b128 a[8:11], v13 offset:4096
	ds_read_b128 a[12:15], v13 offset:6144
	ds_read_b128 a[16:19], v14 offset:8192
	ds_read_b128 a[20:23], v14 offset:10240
	ds_read_b128 a[24:27], v13 offset:8192
	ds_read_b128 a[28:31], v13 offset:10240
	ds_read_b128 a[64:67], v14 offset:12288
	ds_read_b128 a[68:71], v14 offset:14336
	ds_read_b128 a[72:75], v13 offset:12288
	ds_read_b128 a[76:79], v13 offset:14336
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier
	ds_read_b128 a[80:83], v14 offset:16384
	ds_read_b128 a[84:87], v14 offset:18432
	ds_read_b128 a[88:91], v14 offset:20480
	ds_read_b128 a[92:95], v14 offset:22528
	ds_read_b128 a[96:99], v14 offset:24576
	ds_read_b128 a[100:103], v14 offset:26624
	ds_read_b128 a[104:107], v14 offset:28672
	ds_read_b128 a[108:111], v14 offset:30720
	ds_read_b128 a[112:115], v13 offset:16384
	ds_read_b128 a[116:119], v13 offset:18432
	ds_read_b128 a[120:123], v13 offset:20480
	ds_read_b128 a[124:127], v13 offset:22528
	ds_read_b128 a[128:131], v13 offset:24576
	ds_read_b128 a[132:135], v13 offset:26624
	ds_read_b128 a[136:139], v13 offset:28672
	ds_read_b128 a[140:143], v13 offset:30720
	v_or_b32_e32 v13, 0x10400, v12
	v_or_b32_e32 v14, 0x10500, v12
	v_or_b32_e32 v15, 0x10600, v12
	v_or_b32_e32 v12, 0x10700, v12
	ds_read_b32 v210, v13
	ds_read_b32 v211, v14
	ds_read_b32 v4, v15
	ds_read_b32 v28, v12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier
	v_accvgpr_read_b32 v12, a220
	v_accvgpr_read_b32 v13, a221
	v_accvgpr_read_b32 v14, a222
	v_accvgpr_read_b32 v15, a223
	s_movk_i32 s1, 0x7fff
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[104:107], a[48:51], v[8:11], v28, v208 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_mul_i32 s0, s18, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[100:103], a[32:35], v[12:15], v0, v3 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[212:215], a[36:39], v[12:15], v0, v3 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], a[108:111], a[48:51], v[16:19], v28, v208 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_read_b32 v12, a224
	v_accvgpr_read_b32 v13, a225
	v_accvgpr_read_b32 v14, a226
	v_accvgpr_read_b32 v15, a227
	v_cmp_o_f32_e32 vcc, v87, v87
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[136:139], a[52:55], v[8:11], v28, v208 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[100:103], a[40:43], v[12:15], v0, v3 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[248:251], v[212:215], a[44:47], v[12:15], v0, v3 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[100:103], a[48:51], v[22:25], v0, v208 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[244:247], v[212:215], a[52:55], v[12:15], v0, v208 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 1
	v_accvgpr_read_b32 v24, a236
	v_accvgpr_read_b32 v25, a237
	v_accvgpr_read_b32 v26, a238
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[100:103], a[56:59], v[30:33], v0, v208 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v27, a239
	v_mfma_scale_f32_16x16x128_f8f6f4 v[240:243], v[212:215], a[60:63], v[12:15], v0, v208 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[204:207], a[32:35], v[40:43], v0, v3 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[236:239], v[216:219], a[36:39], v[12:15], v0, v3 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[204:207], a[40:43], v[34:37], v0, v3 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[232:235], v[216:219], a[44:47], v[12:15], v0, v3 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[204:207], a[48:51], v[60:63], v0, v208 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[42:45], a[64:67], a[48:51], v[44:47], v209, v208 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[64:67], a[56:59], v[48:51], v209, v208 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[228:231], v[216:219], a[52:55], v[12:15], v0, v208 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[204:207], a[56:59], v[56:59], v0, v208 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[16:19], a[56:59], v[144:147], v2, v208 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[72:75], a[60:63], v[46:49], v209, v208 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[68:71], a[32:35], v[52:55], v209, v3 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[50:53], a[68:71], a[56:59], v[68:71], v209, v208 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 1
	v_mov_b32_e32 v55, 0x7fc0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[80:83], a[48:51], v[148:151], v210, v208 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[224:227], v[216:219], a[60:63], v[12:15], v0, v208 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_bfe_u32 v0, v87, 16, 1
	v_add3_u32 v0, v87, v0, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], a[0:3], a[32:35], v[108:111], v1, v3 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v86, v86
	v_mfma_scale_f32_16x16x128_f8f6f4 v[34:37], a[16:19], a[32:35], v[116:119], v2, v3 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[16:19], a[48:51], v[140:143], v2, v208 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[140:143], a[76:79], a[36:39], v[46:49], v209, v3 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[68:71], a[40:43], v[76:79], v209, v3 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[112:115], a[52:55], v[68:71], v210, v208 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[80:83], a[56:59], v[80:83], v210, v208 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[220:223], a[8:11], a[36:39], v[12:15], v1, v3 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], a[0:3], a[40:43], v[72:75], v1, v3 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], a[4:7], a[48:51], v[136:139], v1, v208 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], a[76:79], a[44:47], v[46:49], v209, v3 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[68:71], a[48:51], v[64:67], v209, v208 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[80:83], a[40:43], v[112:115], v210, v3 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], a[112:115], a[60:63], v[68:71], v210, v208 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[84:87], a[32:35], v[124:127], v210, v3 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[216:219], a[8:11], a[44:47], v[12:15], v1, v3 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], a[0:3], a[48:51], v[92:95], v1, v208 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[20:23], a[48:51], v[24:27], v2, v208 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_read_b32 v24, a240
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], a[116:119], a[36:39], v[68:71], v210, v3 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v25, a241
	v_accvgpr_read_b32 v26, a242
	v_accvgpr_read_b32 v27, a243
	v_accvgpr_read_b32 v68, a252
	v_accvgpr_read_b32 v69, a253
	v_accvgpr_read_b32 v70, a254
	v_accvgpr_read_b32 v71, a255
	v_mfma_scale_f32_16x16x128_f8f6f4 v[30:33], a[4:7], a[56:59], v[96:99], v1, v208 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[20:23], a[56:59], v[24:27], v2, v208 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[84:87], a[40:43], v[68:71], v210, v3 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 1
	v_accvgpr_read_b32 v24, a244
	v_accvgpr_read_b32 v25, a245
	v_accvgpr_read_b32 v26, a246
	v_accvgpr_read_b32 v27, a247
	v_mfma_scale_f32_16x16x128_f8f6f4 v[212:215], a[8:11], a[52:55], v[12:15], v1, v208 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], a[64:67], a[32:35], v[24:27], v209, v3 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], a[0:3], a[56:59], v[88:91], v1, v208 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[20:23], a[40:43], v[160:163], v2, v3 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], a[28:31], a[60:63], v[96:99], v2, v208 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[116:119], a[44:47], v[68:71], v210, v3 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[84:87], a[48:51], v[132:135], v210, v208 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[88:91], a[48:51], v[176:179], v211, v208 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 1
	v_accvgpr_read_b32 v132, a148
	v_accvgpr_read_b32 v133, a149
	v_accvgpr_read_b32 v134, a150
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[20:23], a[32:35], v[156:159], v2, v3 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v179, a159
	v_accvgpr_read_b32 v178, a158
	v_accvgpr_read_b32 v177, a157
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], a[72:75], a[36:39], v[24:27], v209, v3 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v176, a156
	v_accvgpr_read_b32 v135, a151
	s_nop 0
	v_accvgpr_read_b32 v24, a248
	v_accvgpr_read_b32 v25, a249
	v_accvgpr_read_b32 v26, a250
	v_accvgpr_read_b32 v27, a251
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[116:119], a[52:55], v[68:71], v210, v208 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], a[64:67], a[40:43], v[24:27], v209, v3 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a64, a200
	v_accvgpr_mov_b32 a65, a201
	v_accvgpr_mov_b32 a66, a202
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[120:123], a[52:55], v[80:83], v211, v208 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a67, a203
	v_mfma_scale_f32_16x16x128_f8f6f4 v[38:41], a[16:19], a[40:43], v[128:131], v2, v3 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[76:79], a[60:63], v[50:53], v209, v208 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[50:53], a[80:83], a[32:35], v[152:155], v210, v3 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a83, v71
	v_accvgpr_write_b32 a82, v70
	v_accvgpr_write_b32 a81, v69
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], a[72:75], a[44:47], v[24:27], v209, v3 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a80, v68
	v_mfma_scale_f32_16x16x128_f8f6f4 v[42:45], a[72:75], a[52:55], v[42:45], v209, v208 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a72, v80
	v_accvgpr_write_b32 a73, v81
	v_accvgpr_write_b32 a74, v82
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[84:87], a[56:59], v[120:123], v210, v208 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a75, v83
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[88:91], a[56:59], v[172:175], v211, v208 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_read_b32 v175, a147
	v_accvgpr_read_b32 v174, a146
	v_accvgpr_read_b32 v173, a145
	v_accvgpr_read_b32 v172, a144
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[116:119], a[60:63], v[68:71], v210, v208 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[96:99], a[56:59], v[172:175], v4, v208 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[92:95], a[32:35], v[184:187], v211, v3 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[92:95], a[40:43], v[180:183], v211, v3 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[148:151], a[92:95], a[56:59], v[188:191], v211, v208 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 1
	v_accvgpr_read_b32 v183, a167
	v_accvgpr_read_b32 v182, a166
	v_accvgpr_read_b32 v181, a165
	v_mfma_scale_f32_16x16x128_f8f6f4 v[184:187], a[128:131], a[60:63], v[172:175], v4, v208 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v191, a163
	v_accvgpr_read_b32 v180, a164
	v_accvgpr_read_b32 v190, a162
	v_accvgpr_read_b32 v175, a155
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[76:79], a[52:55], v[46:49], v209, v208 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a79, v71
	v_accvgpr_read_b32 v174, a154
	v_accvgpr_read_b32 v173, a153
	v_accvgpr_read_b32 v172, a152
	v_accvgpr_read_b32 v189, a161
	v_accvgpr_read_b32 v188, a160
	v_accvgpr_write_b32 a78, v70
	v_accvgpr_write_b32 a77, v69
	v_accvgpr_write_b32 a76, v68
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[88:91], a[32:35], v[168:171], v211, v3 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[88:91], a[40:43], v[164:167], v211, v3 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[96:99], a[32:35], v[200:203], v4, v3 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[96:99], a[40:43], v[192:195], v4, v3 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[96:99], a[48:51], v[196:199], v4, v208 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[100:103], a[32:35], v[172:175], v4, v3 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[100:103], a[40:43], v[176:179], v4, v3 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[100:103], a[48:51], v[180:183], v4, v208 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[100:103], a[56:59], v[188:191], v4, v208 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], a[8:11], a[60:63], v[12:15], v1, v208 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_read_b32 v12, a228
	v_accvgpr_read_b32 v13, a229
	v_accvgpr_read_b32 v14, a230
	v_accvgpr_read_b32 v15, a231
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[128:131], a[36:39], v[152:155], v4, v3 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], a[4:7], a[32:35], v[12:15], v1, v3 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[128:131], a[44:47], v[164:167], v4, v3 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[128:131], a[52:55], v[168:171], v4, v208 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[132:135], a[36:39], v[172:175], v4, v3 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[132:135], a[44:47], v[176:179], v4, v3 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[132:135], a[52:55], v[180:183], v4, v208 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[132:135], a[60:63], v[188:191], v4, v208 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v4, a168
	v_accvgpr_read_b32 v5, a169
	v_accvgpr_read_b32 v6, a170
	v_accvgpr_read_b32 v7, a171
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[108:111], a[32:35], a[64:67], v28, v3 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[192:195], a[104:107], a[32:35], v[4:7], v28, v3 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[12:15], a[36:39], v[12:15], v1, v3 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_nop 1
	v_accvgpr_read_b32 v4, a196
	v_accvgpr_read_b32 v5, a197
	v_accvgpr_read_b32 v6, a198
	v_accvgpr_read_b32 v12, a232
	v_accvgpr_read_b32 v13, a233
	v_accvgpr_read_b32 v14, a234
	v_accvgpr_read_b32 v15, a235
	v_mfma_scale_f32_16x16x128_f8f6f4 v[34:37], a[24:27], a[36:39], v[34:37], v2, v3 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v7, a199
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], a[4:7], a[40:43], v[12:15], v1, v3 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[28:31], a[36:39], v[72:75], v2, v3 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[50:53], a[112:115], a[36:39], v[50:53], v210, v3 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[120:123], a[36:39], v[68:71], v211, v3 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[124:127], a[36:39], v[120:123], v211, v3 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[192:195], a[136:139], a[36:39], v[192:195], v28, v3 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[140:143], a[36:39], a[64:67], v28, v3 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a34, a204
	v_accvgpr_mov_b32 a35, a205
	v_accvgpr_mov_b32 a36, a206
	v_accvgpr_mov_b32 a37, a207
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], a[104:107], a[40:43], v[4:7], v28, v3 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[34:37], a[108:111], a[40:43], a[34:37], v28, v3 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], a[12:15], a[44:47], v[12:15], v1, v3 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], a[12:15], a[52:55], v[20:23], v1, v208 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[30:33], a[12:15], a[60:63], v[30:33], v1, v208 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_bfe_u32 v1, v86, 16, 1
	v_add3_u32 v1, v86, v1, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[38:41], a[24:27], a[44:47], v[38:41], v2, v3 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a15, v0
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v85, v85
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[24:27], a[52:55], v[56:59], v2, v208 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a16, v0
	v_bfe_u32 v1, v250, 16, 1
	v_add3_u32 v1, v250, v1, s1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[24:27], a[60:63], v[60:63], v2, v208 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v1, 16, v1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[28:31], a[44:47], v[88:91], v2, v3 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[28:31], a[52:55], v[92:95], v2, v208 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_bfe_u32 v2, v85, 16, 1
	v_add3_u32 v2, v85, v2, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[112:115], a[44:47], v[64:67], v210, v3 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v84, v84
	v_accvgpr_write_b32 a17, v0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[120:123], a[44:47], v[76:79], v211, v3 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_bfe_u32 v2, v249, 16, 1
	v_add3_u32 v2, v249, v2, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[124:127], a[44:47], v[124:127], v211, v3 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], a[136:139], a[44:47], v[196:199], v28, v3 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[34:37], a[140:143], a[44:47], a[34:37], v28, v3 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_bfe_u32 v3, v84, 16, 1
	v_add3_u32 v3, v84, v3, s1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a29, v0
	v_bfe_u32 v0, v251, 16, 1
	v_add3_u32 v0, v251, v0, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v251, v251
	v_bfe_u32 v3, v248, 16, 1
	v_add3_u32 v3, v248, v3, s1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v250, v250
	v_accvgpr_write_b32 a18, v0
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v249, v249
	v_accvgpr_write_b32 a19, v0
	v_bfe_u32 v1, v246, 16, 1
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v248, v248
	v_accvgpr_write_b32 a20, v0
	v_bfe_u32 v2, v245, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a21, v0
	v_bfe_u32 v0, v247, 16, 1
	v_add3_u32 v0, v247, v0, s1
	v_add3_u32 v1, v246, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v247, v247
	v_bfe_u32 v3, v244, 16, 1
	v_add3_u32 v2, v245, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v246, v246
	v_add3_u32 v3, v244, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a22, v0
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v245, v245
	v_lshrrev_b32_e32 v3, 16, v3
	v_accvgpr_write_b32 a23, v0
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v244, v244
	v_accvgpr_write_b32 a24, v0
	v_bfe_u32 v1, v242, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a25, v0
	v_bfe_u32 v0, v243, 16, 1
	v_add3_u32 v0, v243, v0, s1
	v_bfe_u32 v2, v241, 16, 1
	v_add3_u32 v1, v242, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v243, v243
	v_bfe_u32 v3, v240, 16, 1
	v_add3_u32 v2, v241, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v242, v242
	v_add3_u32 v3, v240, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a0, v0
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v241, v241
	v_lshrrev_b32_e32 v3, 16, v3
	v_accvgpr_write_b32 a26, v0
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v240, v240
	v_accvgpr_write_b32 a27, v0
	v_bfe_u32 v1, v238, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a28, v0
	v_bfe_u32 v0, v239, 16, 1
	v_add3_u32 v0, v239, v0, s1
	v_bfe_u32 v2, v237, 16, 1
	v_add3_u32 v1, v238, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v239, v239
	v_bfe_u32 v3, v236, 16, 1
	v_add3_u32 v2, v237, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v238, v238
	v_add3_u32 v3, v236, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a1, v0
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v237, v237
	v_lshrrev_b32_e32 v3, 16, v3
	v_accvgpr_write_b32 a2, v0
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v236, v236
	v_accvgpr_write_b32 a3, v0
	v_bfe_u32 v1, v234, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a4, v0
	v_bfe_u32 v0, v235, 16, 1
	v_add3_u32 v0, v235, v0, s1
	v_bfe_u32 v2, v233, 16, 1
	v_add3_u32 v1, v234, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v235, v235
	v_bfe_u32 v3, v232, 16, 1
	v_add3_u32 v2, v233, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v234, v234
	v_add3_u32 v3, v232, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a5, v0
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v233, v233
	v_lshrrev_b32_e32 v3, 16, v3
	v_accvgpr_write_b32 a6, v0
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v232, v232
	v_accvgpr_write_b32 a7, v0
	v_bfe_u32 v1, v230, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a8, v0
	v_bfe_u32 v0, v231, 16, 1
	v_add3_u32 v0, v231, v0, s1
	v_bfe_u32 v2, v229, 16, 1
	v_add3_u32 v1, v230, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v231, v231
	v_bfe_u32 v3, v228, 16, 1
	v_add3_u32 v2, v229, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v230, v230
	v_add3_u32 v3, v228, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a9, v0
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v229, v229
	v_lshrrev_b32_e32 v3, 16, v3
	v_accvgpr_write_b32 a10, v0
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v228, v228
	v_accvgpr_write_b32 a11, v0
	v_bfe_u32 v1, v226, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a12, v0
	v_bfe_u32 v0, v227, 16, 1
	v_add3_u32 v0, v227, v0, s1
	v_add3_u32 v1, v226, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v227, v227
	v_bfe_u32 v2, v225, 16, 1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v226, v226
	v_bfe_u32 v3, v224, 16, 1
	v_add3_u32 v2, v225, v2, s1
	v_accvgpr_write_b32 a13, v0
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_add3_u32 v3, v224, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a14, v0
	v_cmp_o_f32_e32 vcc, v225, v225
	v_bfe_u32 v0, v223, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v243, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v224, v224
	v_bfe_u32 v1, v222, 16, 1
	v_add3_u32 v0, v223, v0, s1
	v_cndmask_b32_e32 v239, v55, v3, vcc
	v_bfe_u32 v2, v221, 16, 1
	v_add3_u32 v1, v222, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v223, v223
	v_bfe_u32 v3, v220, 16, 1
	v_add3_u32 v2, v221, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v238, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v222, v222
	v_add3_u32 v3, v220, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v237, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v221, v221
	v_bfe_u32 v0, v219, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v236, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v220, v220
	v_bfe_u32 v1, v218, 16, 1
	v_add3_u32 v0, v219, v0, s1
	v_cndmask_b32_e32 v235, v55, v3, vcc
	v_bfe_u32 v2, v217, 16, 1
	v_add3_u32 v1, v218, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v219, v219
	v_bfe_u32 v3, v216, 16, 1
	v_add3_u32 v2, v217, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v234, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v218, v218
	v_add3_u32 v3, v216, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v233, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v217, v217
	v_bfe_u32 v0, v215, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v232, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v216, v216
	v_bfe_u32 v1, v214, 16, 1
	v_add3_u32 v0, v215, v0, s1
	v_cndmask_b32_e32 v231, v55, v3, vcc
	v_bfe_u32 v2, v213, 16, 1
	v_add3_u32 v1, v214, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v215, v215
	v_bfe_u32 v3, v212, 16, 1
	v_add3_u32 v2, v213, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v230, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v214, v214
	v_add3_u32 v3, v212, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v229, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v213, v213
	v_bfe_u32 v0, v103, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v228, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v212, v212
	v_bfe_u32 v1, v102, 16, 1
	v_add3_u32 v0, v103, v0, s1
	v_cndmask_b32_e32 v227, v55, v3, vcc
	v_bfe_u32 v2, v101, 16, 1
	v_add3_u32 v1, v102, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v103, v103
	v_bfe_u32 v3, v100, 16, 1
	v_add3_u32 v2, v101, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v226, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v102, v102
	v_add3_u32 v3, v100, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v225, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v101, v101
	v_bfe_u32 v0, v207, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v224, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v100, v100
	v_bfe_u32 v1, v206, 16, 1
	v_add3_u32 v0, v207, v0, s1
	v_cndmask_b32_e32 v223, v55, v3, vcc
	v_bfe_u32 v2, v205, 16, 1
	v_add3_u32 v1, v206, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v207, v207
	v_bfe_u32 v3, v204, 16, 1
	v_add3_u32 v2, v205, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v222, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v206, v206
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[108:111], a[56:59], v[104:107], v28, v208 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add3_u32 v3, v204, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v221, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v205, v205
	v_bfe_u32 v0, v15, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v220, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v204, v204
	v_bfe_u32 v1, v14, 16, 1
	v_add3_u32 v0, v15, v0, s1
	v_cndmask_b32_e32 v219, v55, v3, vcc
	v_bfe_u32 v2, v13, 16, 1
	v_add3_u32 v1, v14, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v15, v15
	v_bfe_u32 v3, v12, 16, 1
	v_add3_u32 v2, v13, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v218, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v14, v14
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[104:107], a[56:59], v[252:255], v28, v208 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_bfe_u32 v0, v23, 16, 1
	v_cndmask_b32_e32 v217, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v13, v13
	v_mfma_scale_f32_16x16x128_f8f6f4 v[252:255], a[140:143], a[60:63], v[4:7], v28, v208 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_bfe_u32 v1, v22, 16, 1
	v_add3_u32 v0, v23, v0, s1
	v_add3_u32 v1, v22, v1, s1
	v_add3_u32 v4, v12, v3, s1
	v_lshrrev_b32_e32 v3, 16, v2
	v_lshrrev_b32_e32 v2, 16, v4
	v_cndmask_b32_e32 v216, v55, v3, vcc
	v_cmp_o_f32_e32 vcc, v12, v12
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[92:95], a[48:51], v[132:135], v211, v208 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v0, 16, v0
	v_cndmask_b32_e32 v215, v55, v2, vcc
	v_bfe_u32 v2, v21, 16, 1
	v_cmp_o_f32_e32 vcc, v23, v23
	v_bfe_u32 v3, v20, 16, 1
	v_add3_u32 v2, v21, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v214, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v22, v22
	v_add3_u32 v3, v20, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v213, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v21, v21
	v_bfe_u32 v0, v33, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v212, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v20, v20
	v_bfe_u32 v1, v32, 16, 1
	v_add3_u32 v0, v33, v0, s1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[120:123], a[60:63], v[80:83], v211, v208 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_bfe_u32 v2, v31, 16, 1
	v_add3_u32 v1, v32, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[124:127], a[52:55], v[132:135], v211, v208 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_add3_u32 v2, v31, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_lshrrev_b32_e32 v2, 16, v2
	v_mfma_scale_f32_16x16x128_f8f6f4 v[148:151], a[124:127], a[60:63], v[148:151], v211, v208 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v211, v55, v3, vcc
	v_cmp_o_f32_e32 vcc, v33, v33
	v_bfe_u32 v3, v30, 16, 1
	v_add3_u32 v3, v30, v3, s1
	v_cndmask_b32_e32 v210, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v32, v32
	v_bfe_u32 v0, v37, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[136:139], a[60:63], v[200:203], v28, v208 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v209, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v31, v31
	v_lshrrev_b32_e32 v3, 16, v3
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], a[140:143], a[52:55], v[16:19], v28, v208 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v208, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v30, v30
	v_bfe_u32 v1, v36, 16, 1
	v_add3_u32 v0, v37, v0, s1
	v_cndmask_b32_e32 v207, v55, v3, vcc
	v_bfe_u32 v2, v35, 16, 1
	v_add3_u32 v1, v36, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v37, v37
	v_bfe_u32 v3, v34, 16, 1
	v_add3_u32 v2, v35, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v206, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v36, v36
	v_add3_u32 v3, v34, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v35, v35
	v_lshrrev_b32_e32 v3, 16, v3
	v_accvgpr_write_b32 a30, v0
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v34, v34
	v_accvgpr_write_b32 a31, v0
	v_bfe_u32 v1, v40, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a32, v0
	v_bfe_u32 v0, v41, 16, 1
	v_add3_u32 v0, v41, v0, s1
	v_bfe_u32 v2, v39, 16, 1
	v_add3_u32 v1, v40, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v41, v41
	v_bfe_u32 v3, v38, 16, 1
	v_add3_u32 v2, v39, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v205, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v40, v40
	v_add3_u32 v3, v38, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v204, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v39, v39
	v_lshrrev_b32_e32 v3, 16, v3
	v_bfe_u32 v1, v58, 16, 1
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v38, v38
	v_accvgpr_write_b32 a33, v0
	v_bfe_u32 v2, v57, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a38, v0
	v_bfe_u32 v0, v59, 16, 1
	v_add3_u32 v0, v59, v0, s1
	v_add3_u32 v1, v58, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v59, v59
	v_bfe_u32 v3, v56, 16, 1
	v_add3_u32 v2, v57, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v58, v58
	v_add3_u32 v3, v56, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a39, v0
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v57, v57
	v_lshrrev_b32_e32 v3, 16, v3
	v_accvgpr_write_b32 a40, v0
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v56, v56
	v_accvgpr_write_b32 a41, v0
	v_bfe_u32 v1, v62, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a42, v0
	v_bfe_u32 v0, v63, 16, 1
	v_add3_u32 v0, v63, v0, s1
	v_bfe_u32 v2, v61, 16, 1
	v_add3_u32 v1, v62, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v63, v63
	v_bfe_u32 v3, v60, 16, 1
	v_add3_u32 v2, v61, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v62, v62
	v_add3_u32 v3, v60, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a43, v0
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v61, v61
	v_lshrrev_b32_e32 v3, 16, v3
	v_accvgpr_write_b32 a44, v0
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v60, v60
	v_accvgpr_write_b32 a45, v0
	v_bfe_u32 v1, v74, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a46, v0
	v_bfe_u32 v0, v75, 16, 1
	v_add3_u32 v0, v75, v0, s1
	v_bfe_u32 v2, v73, 16, 1
	v_add3_u32 v1, v74, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v75, v75
	v_bfe_u32 v3, v72, 16, 1
	v_add3_u32 v2, v73, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v74, v74
	v_add3_u32 v3, v72, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v251, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v73, v73
	v_lshrrev_b32_e32 v3, 16, v3
	v_accvgpr_write_b32 a47, v0
	v_cndmask_b32_e32 v250, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v72, v72
	v_bfe_u32 v1, v90, 16, 1
	v_bfe_u32 v2, v89, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a48, v0
	v_bfe_u32 v0, v91, 16, 1
	v_add3_u32 v0, v91, v0, s1
	v_add3_u32 v1, v90, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v91, v91
	v_add3_u32 v2, v89, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v90, v90
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a49, v0
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v89, v89
	v_bfe_u32 v3, v88, 16, 1
	v_accvgpr_write_b32 a50, v0
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_add3_u32 v3, v88, v3, s1
	v_accvgpr_write_b32 a51, v0
	v_bfe_u32 v0, v95, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cmp_o_f32_e32 vcc, v88, v88
	v_bfe_u32 v1, v94, 16, 1
	v_add3_u32 v0, v95, v0, s1
	v_cndmask_b32_e32 v249, v55, v3, vcc
	v_bfe_u32 v2, v93, 16, 1
	v_add3_u32 v1, v94, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v95, v95
	v_bfe_u32 v3, v92, 16, 1
	v_add3_u32 v2, v93, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v248, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v94, v94
	v_add3_u32 v3, v92, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v0, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v93, v93
	v_lshrrev_b32_e32 v3, 16, v3
	v_accvgpr_write_b32 a52, v0
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v92, v92
	v_accvgpr_write_b32 a53, v0
	v_bfe_u32 v1, v162, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a54, v0
	v_bfe_u32 v0, v163, 16, 1
	v_add3_u32 v0, v163, v0, s1
	v_bfe_u32 v2, v161, 16, 1
	v_add3_u32 v1, v162, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v163, v163
	v_bfe_u32 v3, v160, 16, 1
	v_add3_u32 v2, v161, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v162, v162
	v_add3_u32 v3, v160, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v247, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v161, v161
	v_lshrrev_b32_e32 v3, 16, v3
	v_accvgpr_write_b32 a55, v0
	v_cndmask_b32_e32 v246, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v160, v160
	v_bfe_u32 v1, v158, 16, 1
	v_bfe_u32 v2, v157, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a56, v0
	v_bfe_u32 v0, v159, 16, 1
	v_add3_u32 v0, v159, v0, s1
	v_add3_u32 v1, v158, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v159, v159
	v_bfe_u32 v3, v156, 16, 1
	v_add3_u32 v2, v157, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v158, v158
	v_add3_u32 v3, v156, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a57, v0
	v_cndmask_b32_e32 v163, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v157, v157
	v_bfe_u32 v0, v27, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v162, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v156, v156
	v_bfe_u32 v1, v26, 16, 1
	v_add3_u32 v0, v27, v0, s1
	v_cndmask_b32_e32 v161, v55, v3, vcc
	v_bfe_u32 v2, v25, 16, 1
	v_add3_u32 v1, v26, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v27, v27
	v_bfe_u32 v3, v24, 16, 1
	v_add3_u32 v2, v25, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v160, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v26, v26
	v_add3_u32 v3, v24, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v245, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v25, v25
	v_lshrrev_b32_e32 v3, 16, v3
	v_bfe_u32 v1, v44, 16, 1
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v24, v24
	v_accvgpr_write_b32 a58, v0
	v_bfe_u32 v2, v43, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a59, v0
	v_bfe_u32 v0, v45, 16, 1
	v_add3_u32 v0, v45, v0, s1
	v_add3_u32 v1, v44, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v45, v45
	v_bfe_u32 v3, v42, 16, 1
	v_add3_u32 v2, v43, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v159, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v44, v44
	v_add3_u32 v3, v42, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v244, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v43, v43
	v_lshrrev_b32_e32 v3, 16, v3
	v_bfe_u32 v1, v146, 16, 1
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v42, v42
	v_accvgpr_write_b32 a60, v0
	v_bfe_u32 v2, v145, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a61, v0
	v_bfe_u32 v0, v147, 16, 1
	v_add3_u32 v0, v147, v0, s1
	v_add3_u32 v1, v146, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v147, v147
	v_bfe_u32 v3, v144, 16, 1
	v_add3_u32 v2, v145, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v158, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v146, v146
	v_add3_u32 v3, v144, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v157, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v145, v145
	v_bfe_u32 v0, v143, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v156, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v144, v144
	v_bfe_u32 v1, v142, 16, 1
	v_add3_u32 v0, v143, v0, s1
	v_cndmask_b32_e32 v147, v55, v3, vcc
	v_bfe_u32 v2, v141, 16, 1
	v_add3_u32 v1, v142, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v143, v143
	v_bfe_u32 v3, v140, 16, 1
	v_add3_u32 v2, v141, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v146, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v142, v142
	v_add3_u32 v3, v140, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v145, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v141, v141
	v_bfe_u32 v0, v139, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v144, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v140, v140
	v_bfe_u32 v1, v138, 16, 1
	v_add3_u32 v0, v139, v0, s1
	v_cndmask_b32_e32 v143, v55, v3, vcc
	v_bfe_u32 v2, v137, 16, 1
	v_add3_u32 v1, v138, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v139, v139
	v_bfe_u32 v3, v136, 16, 1
	v_add3_u32 v2, v137, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v142, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v138, v138
	v_add3_u32 v3, v136, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v141, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v137, v137
	v_bfe_u32 v0, v49, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v140, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v136, v136
	v_bfe_u32 v1, v48, 16, 1
	v_add3_u32 v0, v49, v0, s1
	v_cndmask_b32_e32 v139, v55, v3, vcc
	v_bfe_u32 v2, v47, 16, 1
	v_add3_u32 v1, v48, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v49, v49
	v_bfe_u32 v3, v46, 16, 1
	v_add3_u32 v2, v47, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v138, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v48, v48
	v_add3_u32 v3, v46, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v137, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v47, v47
	v_lshrrev_b32_e32 v3, 16, v3
	v_bfe_u32 v1, v130, 16, 1
	v_cndmask_b32_e32 v242, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v46, v46
	v_bfe_u32 v2, v129, 16, 1
	v_add3_u32 v1, v130, v1, s1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a62, v0
	v_bfe_u32 v0, v131, 16, 1
	v_add3_u32 v0, v131, v0, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v131, v131
	v_bfe_u32 v3, v128, 16, 1
	v_add3_u32 v2, v129, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v130, v130
	v_add3_u32 v3, v128, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a63, v0
	v_cndmask_b32_e32 v136, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v129, v129
	v_bfe_u32 v0, v53, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v131, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v128, v128
	v_bfe_u32 v1, v52, 16, 1
	v_add3_u32 v0, v53, v0, s1
	v_cndmask_b32_e32 v130, v55, v3, vcc
	v_bfe_u32 v2, v51, 16, 1
	v_add3_u32 v1, v52, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v53, v53
	v_bfe_u32 v3, v50, 16, 1
	v_add3_u32 v2, v51, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v129, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v52, v52
	v_add3_u32 v3, v50, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v241, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v51, v51
	v_lshrrev_b32_e32 v3, 16, v3
	v_bfe_u32 v1, v66, 16, 1
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v50, v50
	v_accvgpr_write_b32 a68, v0
	v_bfe_u32 v2, v65, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a69, v0
	v_bfe_u32 v0, v67, 16, 1
	v_add3_u32 v0, v67, v0, s1
	v_add3_u32 v1, v66, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v67, v67
	v_bfe_u32 v3, v64, 16, 1
	v_add3_u32 v2, v65, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v128, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v66, v66
	v_add3_u32 v3, v64, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v240, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v65, v65
	v_lshrrev_b32_e32 v3, 16, v3
	v_bfe_u32 v1, v118, 16, 1
	v_cndmask_b32_e32 v0, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v64, v64
	v_accvgpr_write_b32 a70, v0
	v_bfe_u32 v2, v117, 16, 1
	v_cndmask_b32_e32 v0, v55, v3, vcc
	v_accvgpr_write_b32 a71, v0
	v_bfe_u32 v0, v119, 16, 1
	v_add3_u32 v0, v119, v0, s1
	v_add3_u32 v1, v118, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v119, v119
	v_bfe_u32 v3, v116, 16, 1
	v_add3_u32 v2, v117, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v119, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v118, v118
	v_add3_u32 v3, v116, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v118, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v117, v117
	v_bfe_u32 v0, v115, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v117, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v116, v116
	v_bfe_u32 v1, v114, 16, 1
	v_add3_u32 v0, v115, v0, s1
	v_cndmask_b32_e32 v116, v55, v3, vcc
	v_bfe_u32 v2, v113, 16, 1
	v_add3_u32 v1, v114, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v115, v115
	v_bfe_u32 v3, v112, 16, 1
	v_add3_u32 v2, v113, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v115, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v114, v114
	v_add3_u32 v3, v112, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v114, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v113, v113
	v_bfe_u32 v0, v111, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v113, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v112, v112
	v_bfe_u32 v1, v110, 16, 1
	v_add3_u32 v0, v111, v0, s1
	v_cndmask_b32_e32 v112, v55, v3, vcc
	v_bfe_u32 v2, v109, 16, 1
	v_add3_u32 v1, v110, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v111, v111
	v_bfe_u32 v3, v108, 16, 1
	v_add3_u32 v2, v109, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v111, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v110, v110
	v_add3_u32 v3, v108, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v110, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v109, v109
	v_bfe_u32 v0, v99, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v109, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v108, v108
	v_bfe_u32 v1, v98, 16, 1
	v_add3_u32 v0, v99, v0, s1
	v_cndmask_b32_e32 v108, v55, v3, vcc
	v_bfe_u32 v2, v97, 16, 1
	v_add3_u32 v1, v98, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v99, v99
	v_accvgpr_read_b32 v4, a80
	v_bfe_u32 v3, v96, 16, 1
	v_add3_u32 v2, v97, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v107, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v98, v98
	v_accvgpr_read_b32 v7, a83
	v_add3_u32 v3, v96, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v106, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v97, v97
	v_accvgpr_read_b32 v6, a82
	v_bfe_u32 v0, v7, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v105, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v96, v96
	v_accvgpr_read_b32 v5, a81
	v_bfe_u32 v1, v6, 16, 1
	v_add3_u32 v0, v7, v0, s1
	v_cndmask_b32_e32 v104, v55, v3, vcc
	v_bfe_u32 v2, v5, 16, 1
	v_add3_u32 v1, v6, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v7, v7
	v_add3_u32 v2, v5, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v103, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v6, v6
	v_bfe_u32 v3, v4, 16, 1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v102, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v5, v5
	v_add3_u32 v3, v4, v3, s1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v101, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v4, v4
	v_accvgpr_read_b32 v4, a76
	v_accvgpr_read_b32 v7, a79
	v_accvgpr_read_b32 v6, a78
	v_bfe_u32 v0, v7, 16, 1
	v_accvgpr_read_b32 v5, a77
	v_bfe_u32 v1, v6, 16, 1
	v_add3_u32 v0, v7, v0, s1
	v_cndmask_b32_e32 v100, v55, v3, vcc
	v_bfe_u32 v2, v5, 16, 1
	v_add3_u32 v1, v6, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v7, v7
	v_bfe_u32 v3, v4, 16, 1
	v_add3_u32 v2, v5, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v99, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v6, v6
	v_add3_u32 v3, v4, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v98, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v5, v5
	v_bfe_u32 v0, v71, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v97, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v4, v4
	v_bfe_u32 v1, v70, 16, 1
	v_add3_u32 v0, v71, v0, s1
	v_cndmask_b32_e32 v96, v55, v3, vcc
	v_bfe_u32 v2, v69, 16, 1
	v_add3_u32 v1, v70, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v71, v71
	v_bfe_u32 v3, v68, 16, 1
	v_add3_u32 v2, v69, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v95, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v70, v70
	v_add3_u32 v3, v68, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v94, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v69, v69
	v_bfe_u32 v0, v79, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v93, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v68, v68
	v_bfe_u32 v1, v78, 16, 1
	v_add3_u32 v0, v79, v0, s1
	v_cndmask_b32_e32 v92, v55, v3, vcc
	v_bfe_u32 v2, v77, 16, 1
	v_add3_u32 v1, v78, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v79, v79
	v_accvgpr_read_b32 v4, a72
	v_bfe_u32 v3, v76, 16, 1
	v_add3_u32 v2, v77, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v91, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v78, v78
	v_accvgpr_read_b32 v7, a75
	v_add3_u32 v3, v76, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v90, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v77, v77
	v_accvgpr_read_b32 v6, a74
	v_bfe_u32 v0, v7, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v89, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v76, v76
	v_accvgpr_read_b32 v5, a73
	v_bfe_u32 v1, v6, 16, 1
	v_add3_u32 v0, v7, v0, s1
	v_cndmask_b32_e32 v88, v55, v3, vcc
	v_bfe_u32 v2, v5, 16, 1
	v_add3_u32 v1, v6, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v7, v7
	v_bfe_u32 v3, v4, 16, 1
	v_add3_u32 v2, v5, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v87, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v6, v6
	v_add3_u32 v3, v4, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v86, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v5, v5
	v_bfe_u32 v0, v83, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v85, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v4, v4
	v_bfe_u32 v1, v82, 16, 1
	v_add3_u32 v0, v83, v0, s1
	v_cndmask_b32_e32 v84, v55, v3, vcc
	v_bfe_u32 v2, v81, 16, 1
	v_add3_u32 v1, v82, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v83, v83
	v_bfe_u32 v3, v80, 16, 1
	v_add3_u32 v2, v81, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v83, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v82, v82
	v_add3_u32 v3, v80, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v82, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v81, v81
	v_bfe_u32 v0, v123, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v81, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v80, v80
	v_bfe_u32 v1, v122, 16, 1
	v_add3_u32 v0, v123, v0, s1
	v_cndmask_b32_e32 v80, v55, v3, vcc
	v_bfe_u32 v2, v121, 16, 1
	v_add3_u32 v1, v122, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v123, v123
	v_bfe_u32 v3, v120, 16, 1
	v_add3_u32 v2, v121, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v79, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v122, v122
	v_add3_u32 v3, v120, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v78, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v121, v121
	v_bfe_u32 v0, v127, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v77, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v120, v120
	v_bfe_u32 v1, v126, 16, 1
	v_add3_u32 v0, v127, v0, s1
	v_cndmask_b32_e32 v76, v55, v3, vcc
	v_bfe_u32 v2, v125, 16, 1
	v_add3_u32 v1, v126, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v127, v127
	v_bfe_u32 v3, v124, 16, 1
	v_add3_u32 v2, v125, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v75, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v126, v126
	v_add3_u32 v3, v124, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v74, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v125, v125
	v_bfe_u32 v0, v135, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v73, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v124, v124
	v_bfe_u32 v1, v134, 16, 1
	v_add3_u32 v0, v135, v0, s1
	v_cndmask_b32_e32 v72, v55, v3, vcc
	v_bfe_u32 v2, v133, 16, 1
	v_add3_u32 v1, v134, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v135, v135
	v_bfe_u32 v3, v132, 16, 1
	v_add3_u32 v2, v133, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v71, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v134, v134
	v_add3_u32 v3, v132, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v70, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v133, v133
	v_bfe_u32 v0, v151, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v69, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v132, v132
	v_bfe_u32 v1, v150, 16, 1
	v_add3_u32 v0, v151, v0, s1
	v_cndmask_b32_e32 v68, v55, v3, vcc
	v_bfe_u32 v2, v149, 16, 1
	v_add3_u32 v1, v150, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v151, v151
	v_bfe_u32 v3, v148, 16, 1
	v_add3_u32 v2, v149, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v67, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v150, v150
	v_add3_u32 v3, v148, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v66, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v149, v149
	v_bfe_u32 v0, v155, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v65, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v148, v148
	v_bfe_u32 v1, v154, 16, 1
	v_add3_u32 v0, v155, v0, s1
	v_cndmask_b32_e32 v64, v55, v3, vcc
	v_bfe_u32 v2, v153, 16, 1
	v_add3_u32 v1, v154, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v155, v155
	v_bfe_u32 v3, v152, 16, 1
	v_add3_u32 v2, v153, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v63, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v154, v154
	v_add3_u32 v3, v152, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v62, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v153, v153
	v_bfe_u32 v0, v167, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v61, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v152, v152
	v_bfe_u32 v1, v166, 16, 1
	v_add3_u32 v0, v167, v0, s1
	v_cndmask_b32_e32 v60, v55, v3, vcc
	v_bfe_u32 v2, v165, 16, 1
	v_add3_u32 v1, v166, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v167, v167
	v_bfe_u32 v3, v164, 16, 1
	v_add3_u32 v2, v165, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v59, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v166, v166
	v_add3_u32 v3, v164, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v58, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v165, v165
	v_bfe_u32 v0, v171, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v57, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v164, v164
	v_bfe_u32 v1, v170, 16, 1
	v_add3_u32 v0, v171, v0, s1
	v_cndmask_b32_e32 v56, v55, v3, vcc
	v_bfe_u32 v2, v169, 16, 1
	v_add3_u32 v1, v170, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v171, v171
	v_bfe_u32 v3, v168, 16, 1
	v_add3_u32 v2, v169, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v124, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v170, v170
	v_add3_u32 v3, v168, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v54, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v169, v169
	v_bfe_u32 v0, v187, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v53, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v168, v168
	v_bfe_u32 v1, v186, 16, 1
	v_add3_u32 v0, v187, v0, s1
	v_cndmask_b32_e32 v52, v55, v3, vcc
	v_bfe_u32 v2, v185, 16, 1
	v_add3_u32 v1, v186, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v187, v187
	v_bfe_u32 v3, v184, 16, 1
	v_add3_u32 v2, v185, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v51, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v186, v186
	v_add3_u32 v3, v184, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v50, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v185, v185
	v_bfe_u32 v0, v175, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v49, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v184, v184
	v_bfe_u32 v1, v174, 16, 1
	v_add3_u32 v0, v175, v0, s1
	v_cndmask_b32_e32 v48, v55, v3, vcc
	v_bfe_u32 v2, v173, 16, 1
	v_add3_u32 v1, v174, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v175, v175
	v_bfe_u32 v3, v172, 16, 1
	v_add3_u32 v2, v173, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v47, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v174, v174
	v_add3_u32 v3, v172, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v46, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v173, v173
	v_bfe_u32 v0, v179, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v45, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v172, v172
	v_bfe_u32 v1, v178, 16, 1
	v_add3_u32 v0, v179, v0, s1
	v_cndmask_b32_e32 v44, v55, v3, vcc
	v_bfe_u32 v2, v177, 16, 1
	v_add3_u32 v1, v178, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v179, v179
	v_bfe_u32 v3, v176, 16, 1
	v_add3_u32 v2, v177, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v43, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v178, v178
	v_add3_u32 v3, v176, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v42, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v177, v177
	v_bfe_u32 v0, v183, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v41, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v176, v176
	v_bfe_u32 v1, v182, 16, 1
	v_add3_u32 v0, v183, v0, s1
	v_cndmask_b32_e32 v40, v55, v3, vcc
	v_bfe_u32 v2, v181, 16, 1
	v_add3_u32 v1, v182, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v183, v183
	v_bfe_u32 v3, v180, 16, 1
	v_add3_u32 v2, v181, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v39, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v182, v182
	v_add3_u32 v3, v180, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v38, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v181, v181
	v_bfe_u32 v0, v191, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v37, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v180, v180
	v_bfe_u32 v1, v190, 16, 1
	v_add3_u32 v0, v191, v0, s1
	v_cndmask_b32_e32 v36, v55, v3, vcc
	v_bfe_u32 v2, v189, 16, 1
	v_add3_u32 v1, v190, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v191, v191
	v_bfe_u32 v3, v188, 16, 1
	v_add3_u32 v2, v189, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v35, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v190, v190
	v_add3_u32 v3, v188, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v34, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v189, v189
	v_bfe_u32 v0, v195, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v33, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v188, v188
	v_bfe_u32 v1, v194, 16, 1
	v_add3_u32 v0, v195, v0, s1
	v_cndmask_b32_e32 v32, v55, v3, vcc
	v_bfe_u32 v2, v193, 16, 1
	v_add3_u32 v1, v194, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v195, v195
	v_bfe_u32 v3, v192, 16, 1
	v_add3_u32 v2, v193, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v31, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v194, v194
	v_add3_u32 v3, v192, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v30, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v193, v193
	v_bfe_u32 v0, v199, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v29, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v192, v192
	v_bfe_u32 v1, v198, 16, 1
	v_add3_u32 v0, v199, v0, s1
	v_cndmask_b32_e32 v28, v55, v3, vcc
	v_bfe_u32 v2, v197, 16, 1
	v_add3_u32 v1, v198, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v199, v199
	v_bfe_u32 v3, v196, 16, 1
	v_add3_u32 v2, v197, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v27, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v198, v198
	v_add3_u32 v3, v196, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v26, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v197, v197
	v_bfe_u32 v0, v11, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v25, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v196, v196
	v_bfe_u32 v1, v10, 16, 1
	v_add3_u32 v0, v11, v0, s1
	v_cndmask_b32_e32 v24, v55, v3, vcc
	v_bfe_u32 v2, v9, 16, 1
	v_add3_u32 v1, v10, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v11, v11
	v_bfe_u32 v3, v8, 16, 1
	v_add3_u32 v2, v9, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v23, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v10, v10
	v_add3_u32 v3, v8, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v22, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v9, v9
	v_bfe_u32 v0, v203, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v21, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v8, v8
	v_bfe_u32 v1, v202, 16, 1
	v_add3_u32 v0, v203, v0, s1
	v_cndmask_b32_e32 v20, v55, v3, vcc
	v_bfe_u32 v2, v201, 16, 1
	v_add3_u32 v1, v202, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v203, v203
	v_accvgpr_read_b32 v4, a64
	v_bfe_u32 v3, v200, 16, 1
	v_add3_u32 v2, v201, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v8, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v202, v202
	v_accvgpr_read_b32 v7, a67
	v_add3_u32 v3, v200, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v9, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v201, v201
	v_accvgpr_read_b32 v6, a66
	v_bfe_u32 v0, v7, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v10, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v200, v200
	v_accvgpr_read_b32 v5, a65
	v_bfe_u32 v1, v6, 16, 1
	v_add3_u32 v0, v7, v0, s1
	v_cndmask_b32_e32 v11, v55, v3, vcc
	v_bfe_u32 v2, v5, 16, 1
	v_add3_u32 v1, v6, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v7, v7
	v_add3_u32 v2, v5, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v15, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v6, v6
	v_bfe_u32 v3, v4, 16, 1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v14, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v5, v5
	v_add3_u32 v3, v4, v3, s1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v13, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v4, v4
	v_accvgpr_read_b32 v4, a34
	v_accvgpr_read_b32 v7, a37
	v_accvgpr_read_b32 v6, a36
	v_bfe_u32 v0, v7, 16, 1
	v_accvgpr_read_b32 v5, a35
	v_bfe_u32 v1, v6, 16, 1
	v_add3_u32 v0, v7, v0, s1
	v_cndmask_b32_e32 v12, v55, v3, vcc
	v_bfe_u32 v2, v5, 16, 1
	v_add3_u32 v1, v6, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v7, v7
	v_bfe_u32 v3, v4, 16, 1
	v_add3_u32 v2, v5, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v120, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v6, v6
	v_add3_u32 v3, v4, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v121, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v5, v5
	v_bfe_u32 v0, v19, 16, 1
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v122, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v4, v4
	v_bfe_u32 v1, v18, 16, 1
	v_add3_u32 v0, v19, v0, s1
	v_cndmask_b32_e32 v123, v55, v3, vcc
	v_bfe_u32 v2, v17, 16, 1
	v_add3_u32 v1, v18, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v19, v19
	v_bfe_u32 v3, v16, 16, 1
	v_add3_u32 v2, v17, v2, s1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v7, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v18, v18
	v_add3_u32 v3, v16, v3, s1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v6, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v17, v17
	v_lshrrev_b32_e32 v3, 16, v3
	v_bfe_u32 v0, v255, 16, 1
	v_cndmask_b32_e32 v5, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v16, v16
	v_bfe_u32 v1, v254, 16, 1
	v_bfe_u32 v2, v253, 16, 1
	v_cndmask_b32_e32 v4, v55, v3, vcc
	v_bfe_u32 v3, v252, 16, 1
	v_add3_u32 v0, v255, v0, s1
	v_add3_u32 v3, v252, v3, s1
	v_add3_u32 v2, v253, v2, s1
	v_add3_u32 v1, v254, v1, s1
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v255, v255
	s_mul_hi_u32 s1, s18, s24
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v255, v55, v0, vcc
	v_cmp_o_f32_e32 vcc, v254, v254
	s_add_i32 s0, s1, s0
	s_mul_i32 s1, s19, s24
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v254, v55, v1, vcc
	v_cmp_o_f32_e32 vcc, v253, v253
	s_add_i32 s1, s0, s1
	s_mul_i32 s0, s18, s24
	v_lshrrev_b32_e32 v3, 16, v3
	v_cndmask_b32_e32 v253, v55, v2, vcc
	v_cmp_o_f32_e32 vcc, v252, v252
	s_lshl_b64 s[0:1], s[0:1], 1
	v_accvgpr_read_b32 v2, a188
	v_cndmask_b32_e32 v1, v55, v3, vcc
	s_add_u32 s2, s10, s0
	v_lshlrev_b32_e32 v2, 1, v2
	v_accvgpr_read_b32 v3, a189
	v_accvgpr_read_b32 v0, a191
	s_addc_u32 s3, s11, s1
	s_lshl_b64 s[0:1], s[16:17], 1
	v_lshl_or_b32 v2, v3, 7, v2
	v_accvgpr_read_b32 v3, a190
	v_mul_lo_u32 v0, v0, s18
	s_add_u32 s0, s2, s0
	v_lshl_add_u32 v252, v3, 1, v2
	s_addc_u32 s1, s3, s1
	v_lshl_add_u32 v2, v0, 3, v252
	s_lshl_b32 s4, s18, 1
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	s_lshl_b32 s5, s18, 4
	s_and_b32 s1, s1, 0xffff
	s_mov_b32 s3, 0x27000
	s_mov_b32 s2, 0x7ffffffd
	v_add_u32_e32 v17, s4, v16
	v_lshl_add_u32 v0, v0, 2, s5
	buffer_store_short a29, v2, s[0:3], 0 offen
	buffer_store_short a17, v3, s[0:3], 0 offen
	buffer_store_short a16, v16, s[0:3], 0 offen
	buffer_store_short a15, v17, s[0:3], 0 offen
	buffer_store_short a21, v2, s[0:3], 0 offen offset:32
	buffer_store_short a20, v3, s[0:3], 0 offen offset:32
	buffer_store_short a19, v16, s[0:3], 0 offen offset:32
	buffer_store_short a18, v17, s[0:3], 0 offen offset:32
	buffer_store_short a25, v2, s[0:3], 0 offen offset:64
	buffer_store_short a24, v3, s[0:3], 0 offen offset:64
	buffer_store_short a23, v16, s[0:3], 0 offen offset:64
	buffer_store_short a22, v17, s[0:3], 0 offen offset:64
	buffer_store_short a28, v2, s[0:3], 0 offen offset:96
	buffer_store_short a27, v3, s[0:3], 0 offen offset:96
	buffer_store_short a26, v16, s[0:3], 0 offen offset:96
	buffer_store_short a0, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short a4, v2, s[0:3], 0 offen
	buffer_store_short a3, v3, s[0:3], 0 offen
	buffer_store_short a2, v16, s[0:3], 0 offen
	buffer_store_short a1, v17, s[0:3], 0 offen
	buffer_store_short a8, v2, s[0:3], 0 offen offset:32
	buffer_store_short a7, v3, s[0:3], 0 offen offset:32
	buffer_store_short a6, v16, s[0:3], 0 offen offset:32
	buffer_store_short a5, v17, s[0:3], 0 offen offset:32
	buffer_store_short a12, v2, s[0:3], 0 offen offset:64
	buffer_store_short a11, v3, s[0:3], 0 offen offset:64
	buffer_store_short a10, v16, s[0:3], 0 offen offset:64
	buffer_store_short a9, v17, s[0:3], 0 offen offset:64
	buffer_store_short v239, v2, s[0:3], 0 offen offset:96
	buffer_store_short v243, v3, s[0:3], 0 offen offset:96
	buffer_store_short a14, v16, s[0:3], 0 offen offset:96
	buffer_store_short a13, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short v235, v2, s[0:3], 0 offen
	buffer_store_short v236, v3, s[0:3], 0 offen
	buffer_store_short v237, v16, s[0:3], 0 offen
	buffer_store_short v238, v17, s[0:3], 0 offen
	buffer_store_short v231, v2, s[0:3], 0 offen offset:32
	buffer_store_short v232, v3, s[0:3], 0 offen offset:32
	buffer_store_short v233, v16, s[0:3], 0 offen offset:32
	buffer_store_short v234, v17, s[0:3], 0 offen offset:32
	buffer_store_short v227, v2, s[0:3], 0 offen offset:64
	buffer_store_short v228, v3, s[0:3], 0 offen offset:64
	buffer_store_short v229, v16, s[0:3], 0 offen offset:64
	buffer_store_short v230, v17, s[0:3], 0 offen offset:64
	buffer_store_short v223, v2, s[0:3], 0 offen offset:96
	buffer_store_short v224, v3, s[0:3], 0 offen offset:96
	buffer_store_short v225, v16, s[0:3], 0 offen offset:96
	buffer_store_short v226, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short v219, v2, s[0:3], 0 offen
	buffer_store_short v220, v3, s[0:3], 0 offen
	buffer_store_short v221, v16, s[0:3], 0 offen
	buffer_store_short v222, v17, s[0:3], 0 offen
	buffer_store_short v215, v2, s[0:3], 0 offen offset:32
	buffer_store_short v216, v3, s[0:3], 0 offen offset:32
	buffer_store_short v217, v16, s[0:3], 0 offen offset:32
	buffer_store_short v218, v17, s[0:3], 0 offen offset:32
	buffer_store_short v211, v2, s[0:3], 0 offen offset:64
	buffer_store_short v212, v3, s[0:3], 0 offen offset:64
	buffer_store_short v213, v16, s[0:3], 0 offen offset:64
	buffer_store_short v214, v17, s[0:3], 0 offen offset:64
	buffer_store_short v207, v2, s[0:3], 0 offen offset:96
	buffer_store_short v208, v3, s[0:3], 0 offen offset:96
	buffer_store_short v209, v16, s[0:3], 0 offen offset:96
	buffer_store_short v210, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short a32, v2, s[0:3], 0 offen
	buffer_store_short a31, v3, s[0:3], 0 offen
	buffer_store_short a30, v16, s[0:3], 0 offen
	buffer_store_short v206, v17, s[0:3], 0 offen
	buffer_store_short a38, v2, s[0:3], 0 offen offset:32
	buffer_store_short a33, v3, s[0:3], 0 offen offset:32
	buffer_store_short v204, v16, s[0:3], 0 offen offset:32
	buffer_store_short v205, v17, s[0:3], 0 offen offset:32
	buffer_store_short a42, v2, s[0:3], 0 offen offset:64
	buffer_store_short a41, v3, s[0:3], 0 offen offset:64
	buffer_store_short a40, v16, s[0:3], 0 offen offset:64
	buffer_store_short a39, v17, s[0:3], 0 offen offset:64
	buffer_store_short a46, v2, s[0:3], 0 offen offset:96
	buffer_store_short a45, v3, s[0:3], 0 offen offset:96
	buffer_store_short a44, v16, s[0:3], 0 offen offset:96
	buffer_store_short a43, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short a48, v2, s[0:3], 0 offen
	buffer_store_short v250, v3, s[0:3], 0 offen
	buffer_store_short v251, v16, s[0:3], 0 offen
	buffer_store_short a47, v17, s[0:3], 0 offen
	buffer_store_short v249, v2, s[0:3], 0 offen offset:32
	buffer_store_short a51, v3, s[0:3], 0 offen offset:32
	buffer_store_short a50, v16, s[0:3], 0 offen offset:32
	buffer_store_short a49, v17, s[0:3], 0 offen offset:32
	buffer_store_short a54, v2, s[0:3], 0 offen offset:64
	buffer_store_short a53, v3, s[0:3], 0 offen offset:64
	buffer_store_short a52, v16, s[0:3], 0 offen offset:64
	buffer_store_short v248, v17, s[0:3], 0 offen offset:64
	buffer_store_short a56, v2, s[0:3], 0 offen offset:96
	buffer_store_short v246, v3, s[0:3], 0 offen offset:96
	buffer_store_short v247, v16, s[0:3], 0 offen offset:96
	buffer_store_short a55, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short v161, v2, s[0:3], 0 offen
	buffer_store_short v162, v3, s[0:3], 0 offen
	buffer_store_short v163, v16, s[0:3], 0 offen
	buffer_store_short a57, v17, s[0:3], 0 offen
	buffer_store_short a59, v2, s[0:3], 0 offen offset:32
	buffer_store_short a58, v3, s[0:3], 0 offen offset:32
	buffer_store_short v245, v16, s[0:3], 0 offen offset:32
	buffer_store_short v160, v17, s[0:3], 0 offen offset:32
	buffer_store_short a61, v2, s[0:3], 0 offen offset:64
	buffer_store_short a60, v3, s[0:3], 0 offen offset:64
	buffer_store_short v244, v16, s[0:3], 0 offen offset:64
	buffer_store_short v159, v17, s[0:3], 0 offen offset:64
	buffer_store_short v147, v2, s[0:3], 0 offen offset:96
	buffer_store_short v156, v3, s[0:3], 0 offen offset:96
	buffer_store_short v157, v16, s[0:3], 0 offen offset:96
	buffer_store_short v158, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short v143, v2, s[0:3], 0 offen
	buffer_store_short v144, v3, s[0:3], 0 offen
	buffer_store_short v145, v16, s[0:3], 0 offen
	buffer_store_short v146, v17, s[0:3], 0 offen
	buffer_store_short v139, v2, s[0:3], 0 offen offset:32
	buffer_store_short v140, v3, s[0:3], 0 offen offset:32
	buffer_store_short v141, v16, s[0:3], 0 offen offset:32
	buffer_store_short v142, v17, s[0:3], 0 offen offset:32
	buffer_store_short a62, v2, s[0:3], 0 offen offset:64
	buffer_store_short v242, v3, s[0:3], 0 offen offset:64
	buffer_store_short v137, v16, s[0:3], 0 offen offset:64
	buffer_store_short v138, v17, s[0:3], 0 offen offset:64
	buffer_store_short v130, v2, s[0:3], 0 offen offset:96
	buffer_store_short v131, v3, s[0:3], 0 offen offset:96
	buffer_store_short v136, v16, s[0:3], 0 offen offset:96
	buffer_store_short a63, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short a69, v2, s[0:3], 0 offen
	buffer_store_short a68, v3, s[0:3], 0 offen
	buffer_store_short v241, v16, s[0:3], 0 offen
	buffer_store_short v129, v17, s[0:3], 0 offen
	buffer_store_short a71, v2, s[0:3], 0 offen offset:32
	buffer_store_short a70, v3, s[0:3], 0 offen offset:32
	buffer_store_short v240, v16, s[0:3], 0 offen offset:32
	buffer_store_short v128, v17, s[0:3], 0 offen offset:32
	buffer_store_short v116, v2, s[0:3], 0 offen offset:64
	buffer_store_short v117, v3, s[0:3], 0 offen offset:64
	buffer_store_short v118, v16, s[0:3], 0 offen offset:64
	buffer_store_short v119, v17, s[0:3], 0 offen offset:64
	buffer_store_short v112, v2, s[0:3], 0 offen offset:96
	buffer_store_short v113, v3, s[0:3], 0 offen offset:96
	buffer_store_short v114, v16, s[0:3], 0 offen offset:96
	buffer_store_short v115, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short v108, v2, s[0:3], 0 offen
	buffer_store_short v109, v3, s[0:3], 0 offen
	buffer_store_short v110, v16, s[0:3], 0 offen
	buffer_store_short v111, v17, s[0:3], 0 offen
	buffer_store_short v104, v2, s[0:3], 0 offen offset:32
	buffer_store_short v105, v3, s[0:3], 0 offen offset:32
	buffer_store_short v106, v16, s[0:3], 0 offen offset:32
	buffer_store_short v107, v17, s[0:3], 0 offen offset:32
	buffer_store_short v100, v2, s[0:3], 0 offen offset:64
	buffer_store_short v101, v3, s[0:3], 0 offen offset:64
	buffer_store_short v102, v16, s[0:3], 0 offen offset:64
	buffer_store_short v103, v17, s[0:3], 0 offen offset:64
	buffer_store_short v96, v2, s[0:3], 0 offen offset:96
	buffer_store_short v97, v3, s[0:3], 0 offen offset:96
	buffer_store_short v98, v16, s[0:3], 0 offen offset:96
	buffer_store_short v99, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short v92, v2, s[0:3], 0 offen
	buffer_store_short v93, v3, s[0:3], 0 offen
	buffer_store_short v94, v16, s[0:3], 0 offen
	buffer_store_short v95, v17, s[0:3], 0 offen
	buffer_store_short v88, v2, s[0:3], 0 offen offset:32
	buffer_store_short v89, v3, s[0:3], 0 offen offset:32
	buffer_store_short v90, v16, s[0:3], 0 offen offset:32
	buffer_store_short v91, v17, s[0:3], 0 offen offset:32
	buffer_store_short v84, v2, s[0:3], 0 offen offset:64
	buffer_store_short v85, v3, s[0:3], 0 offen offset:64
	buffer_store_short v86, v16, s[0:3], 0 offen offset:64
	buffer_store_short v87, v17, s[0:3], 0 offen offset:64
	buffer_store_short v80, v2, s[0:3], 0 offen offset:96
	buffer_store_short v81, v3, s[0:3], 0 offen offset:96
	buffer_store_short v82, v16, s[0:3], 0 offen offset:96
	buffer_store_short v83, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short v76, v2, s[0:3], 0 offen
	buffer_store_short v77, v3, s[0:3], 0 offen
	buffer_store_short v78, v16, s[0:3], 0 offen
	buffer_store_short v79, v17, s[0:3], 0 offen
	buffer_store_short v72, v2, s[0:3], 0 offen offset:32
	buffer_store_short v73, v3, s[0:3], 0 offen offset:32
	buffer_store_short v74, v16, s[0:3], 0 offen offset:32
	buffer_store_short v75, v17, s[0:3], 0 offen offset:32
	buffer_store_short v68, v2, s[0:3], 0 offen offset:64
	buffer_store_short v69, v3, s[0:3], 0 offen offset:64
	buffer_store_short v70, v16, s[0:3], 0 offen offset:64
	buffer_store_short v71, v17, s[0:3], 0 offen offset:64
	buffer_store_short v64, v2, s[0:3], 0 offen offset:96
	buffer_store_short v65, v3, s[0:3], 0 offen offset:96
	buffer_store_short v66, v16, s[0:3], 0 offen offset:96
	buffer_store_short v67, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short v60, v2, s[0:3], 0 offen
	buffer_store_short v61, v3, s[0:3], 0 offen
	buffer_store_short v62, v16, s[0:3], 0 offen
	buffer_store_short v63, v17, s[0:3], 0 offen
	buffer_store_short v56, v2, s[0:3], 0 offen offset:32
	buffer_store_short v57, v3, s[0:3], 0 offen offset:32
	buffer_store_short v58, v16, s[0:3], 0 offen offset:32
	buffer_store_short v59, v17, s[0:3], 0 offen offset:32
	buffer_store_short v52, v2, s[0:3], 0 offen offset:64
	buffer_store_short v53, v3, s[0:3], 0 offen offset:64
	buffer_store_short v54, v16, s[0:3], 0 offen offset:64
	buffer_store_short v124, v17, s[0:3], 0 offen offset:64
	buffer_store_short v48, v2, s[0:3], 0 offen offset:96
	buffer_store_short v49, v3, s[0:3], 0 offen offset:96
	buffer_store_short v50, v16, s[0:3], 0 offen offset:96
	buffer_store_short v51, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v0, s5, v0
	buffer_store_short v44, v2, s[0:3], 0 offen
	buffer_store_short v45, v3, s[0:3], 0 offen
	buffer_store_short v46, v16, s[0:3], 0 offen
	buffer_store_short v47, v17, s[0:3], 0 offen
	buffer_store_short v40, v2, s[0:3], 0 offen offset:32
	buffer_store_short v41, v3, s[0:3], 0 offen offset:32
	buffer_store_short v42, v16, s[0:3], 0 offen offset:32
	buffer_store_short v43, v17, s[0:3], 0 offen offset:32
	buffer_store_short v36, v2, s[0:3], 0 offen offset:64
	buffer_store_short v37, v3, s[0:3], 0 offen offset:64
	buffer_store_short v38, v16, s[0:3], 0 offen offset:64
	buffer_store_short v39, v17, s[0:3], 0 offen offset:64
	buffer_store_short v32, v2, s[0:3], 0 offen offset:96
	buffer_store_short v33, v3, s[0:3], 0 offen offset:96
	buffer_store_short v34, v16, s[0:3], 0 offen offset:96
	buffer_store_short v35, v17, s[0:3], 0 offen offset:96
	v_lshl_add_u32 v2, v0, 1, v252
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v16, s4, v3
	v_add_u32_e32 v0, s5, v0
	v_add_u32_e32 v17, s4, v16
	v_lshl_add_u32 v0, v0, 1, v252
	buffer_store_short v28, v2, s[0:3], 0 offen
	buffer_store_short v29, v3, s[0:3], 0 offen
	buffer_store_short v30, v16, s[0:3], 0 offen
	buffer_store_short v31, v17, s[0:3], 0 offen
	buffer_store_short v24, v2, s[0:3], 0 offen offset:32
	buffer_store_short v25, v3, s[0:3], 0 offen offset:32
	buffer_store_short v26, v16, s[0:3], 0 offen offset:32
	buffer_store_short v27, v17, s[0:3], 0 offen offset:32
	buffer_store_short v20, v2, s[0:3], 0 offen offset:64
	buffer_store_short v21, v3, s[0:3], 0 offen offset:64
	buffer_store_short v22, v16, s[0:3], 0 offen offset:64
	buffer_store_short v23, v17, s[0:3], 0 offen offset:64
	buffer_store_short v11, v2, s[0:3], 0 offen offset:96
	buffer_store_short v10, v3, s[0:3], 0 offen offset:96
	buffer_store_short v9, v16, s[0:3], 0 offen offset:96
	buffer_store_short v8, v17, s[0:3], 0 offen offset:96
	v_add_u32_e32 v2, s4, v0
	v_add_u32_e32 v3, s4, v2
	v_add_u32_e32 v8, s4, v3
	buffer_store_short v12, v0, s[0:3], 0 offen
	buffer_store_short v13, v2, s[0:3], 0 offen
	buffer_store_short v14, v3, s[0:3], 0 offen
	buffer_store_short v15, v8, s[0:3], 0 offen
	buffer_store_short v123, v0, s[0:3], 0 offen offset:32
	buffer_store_short v122, v2, s[0:3], 0 offen offset:32
	buffer_store_short v121, v3, s[0:3], 0 offen offset:32
	buffer_store_short v120, v8, s[0:3], 0 offen offset:32
	buffer_store_short v4, v0, s[0:3], 0 offen offset:64
	buffer_store_short v5, v2, s[0:3], 0 offen offset:64
	buffer_store_short v6, v3, s[0:3], 0 offen offset:64
	buffer_store_short v7, v8, s[0:3], 0 offen offset:64
	buffer_store_short v1, v0, s[0:3], 0 offen offset:96
	buffer_store_short v253, v2, s[0:3], 0 offen offset:96
	buffer_store_short v254, v3, s[0:3], 0 offen offset:96
	buffer_store_short v255, v8, s[0:3], 0 offen offset:96
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel wave_gemm_static_16k_256x256x256
		.amdhsa_group_segment_fixed_size 69632
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 120
		.amdhsa_user_sgpr_count 16
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_kernarg_preload_length 14
		.amdhsa_user_sgpr_kernarg_preload_offset 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_enable_private_segment 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 1
		.amdhsa_next_free_vgpr 512
		.amdhsa_next_free_sgpr 96
		.amdhsa_accum_offset 256
		.amdhsa_reserve_vcc 1
		.amdhsa_reserve_xnack_mask 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end0:
	.size	wave_gemm_static_16k_256x256x256, .Lfunc_end0-wave_gemm_static_16k_256x256x256

	.set wave_gemm_static_16k_256x256x256.num_vgpr, 256
	.set wave_gemm_static_16k_256x256x256.num_agpr, 256
	.set wave_gemm_static_16k_256x256x256.numbered_sgpr, 56
	.set wave_gemm_static_16k_256x256x256.num_named_barrier, 0
	.set wave_gemm_static_16k_256x256x256.private_seg_size, 0
	.set wave_gemm_static_16k_256x256x256.uses_vcc, 1
	.set wave_gemm_static_16k_256x256x256.uses_flat_scratch, 0
	.set wave_gemm_static_16k_256x256x256.has_dyn_sized_stack, 0
	.set wave_gemm_static_16k_256x256x256.has_recursion, 0
	.set wave_gemm_static_16k_256x256x256.has_indirect_call, 0
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.section	.AMDGPU.gpr_maximums,"",@progbits
	.set amdgpu.max_num_vgpr, 0
	.set amdgpu.max_num_agpr, 0
	.set amdgpu.max_num_sgpr, 0
	.set amdgpu.max_num_named_barrier, 0
	.text
	.section	".note.GNU-stack","",@progbits
	.amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     256
    .args:
      - .actual_access:  read_only
        .address_space:  generic
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .actual_access:  read_only
        .address_space:  generic
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
      - .actual_access:  read_only
        .address_space:  generic
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
      - .actual_access:  read_only
        .address_space:  generic
        .offset:         24
        .size:           8
        .value_kind:     global_buffer
      - .actual_access:  write_only
        .address_space:  generic
        .offset:         32
        .size:           8
        .value_kind:     global_buffer
      - .offset:         40
        .size:           4
        .value_kind:     by_value
      - .offset:         44
        .size:           4
        .value_kind:     by_value
      - .offset:         48
        .size:           4
        .value_kind:     by_value
      - .offset:         52
        .size:           4
        .value_kind:     by_value
      - .offset:         56
        .size:           4
        .value_kind:     by_value
      - .offset:         60
        .size:           4
        .value_kind:     by_value
      - .offset:         64
        .size:           4
        .value_kind:     by_value
      - .offset:         68
        .size:           4
        .value_kind:     by_value
      - .offset:         72
        .size:           4
        .value_kind:     by_value
      - .offset:         76
        .size:           4
        .value_kind:     by_value
      - .offset:         80
        .size:           4
        .value_kind:     by_value
      - .offset:         84
        .size:           4
        .value_kind:     by_value
      - .offset:         88
        .size:           4
        .value_kind:     by_value
      - .offset:         92
        .size:           4
        .value_kind:     by_value
      - .offset:         96
        .size:           4
        .value_kind:     by_value
      - .offset:         100
        .size:           4
        .value_kind:     by_value
      - .offset:         104
        .size:           4
        .value_kind:     by_value
      - .offset:         108
        .size:           4
        .value_kind:     by_value
      - .offset:         112
        .size:           4
        .value_kind:     by_value
      - .offset:         116
        .size:           4
        .value_kind:     by_value
    .group_segment_fixed_size: 69632
    .kernarg_segment_align: 8
    .kernarg_segment_size: 120
    .max_flat_workgroup_size: 256
    .name:           wave_gemm_static_16k_256x256x256
    .private_segment_fixed_size: 0
    .reqd_workgroup_size:
      - 64
      - 4
      - 1
    .sgpr_count:     62
    .sgpr_spill_count: 0
    .symbol:         wave_gemm_static_16k_256x256x256.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     512
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx950
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata
