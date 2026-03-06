; To reproduce the .rocmasm from .optimized.ll, run:
; llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx950 -mattr='-fma-mix-insts' -O3 <.optimized.ll> -o <out.rocmasm>

	.amdgcn_target "amdgcn-amd-amdhsa--gfx950"
	.amdhsa_code_object_version 5
	.text
	.globl	gemm_256x224x256
	.p2align	8
	.type	gemm_256x224x256,@function
gemm_256x224x256:
	s_load_dwordx2 s[2:3], s[0:1], 0x0
	s_load_dwordx8 s[4:11], s[0:1], 0x8
	s_load_dwordx4 s[12:15], s[0:1], 0x28
	s_waitcnt lgkmcnt(0)
	s_branch .LBB0_0
	.p2align	8
.LBB0_0:
	s_mov_b64 s[20:21], s[2:3]
	s_lshl_b32 s2, s17, 6
	s_or_b32 s14, s2, s16
	s_mul_i32 s2, s14, 0x199a
	s_addk_i32 s2, 0x6668
	s_lshr_b32 s2, s2, 16
	s_mul_i32 s3, s2, -10
	s_add_i32 s3, s14, s3
	s_mov_b64 s[12:13], s[6:7]
	s_lshr_b32 s30, s16, 5
	s_add_i32 s15, s3, 0x44
	s_and_b32 s6, s16, 31
	s_mul_i32 s3, s17, 0x3800
	s_mulk_i32 s16, 0xe0
	s_mulk_i32 s2, 0xf740
	s_add_i32 s3, s3, s16
	s_lshr_b32 s31, s17, 5
	s_add_i32 s2, s3, s2
	s_add_i32 s18, s2, 0x3b80
	s_sub_i32 s2, s31, s30
	s_mulk_i32 s2, 0x1c00
	s_and_b32 s7, s17, 0x60
	s_add_i32 s16, s2, s16
	s_cmp_gt_u32 s17, 63
	s_cselect_b64 s[2:3], -1, 0
	s_and_b64 s[2:3], s[2:3], exec
	s_cselect_b32 s2, s18, s16
	s_or_b32 s3, s6, s7
	s_cmp_gt_u32 s17, 63
	s_cselect_b64 s[6:7], -1, 0
	s_and_b64 s[6:7], s[6:7], exec
	s_cselect_b32 s33, s15, s3
	s_add_i32 s3, s14, 0xf000
	s_sub_i32 s14, 0xfff, s14
	s_cmp_lt_u32 s17, 64
	s_cselect_b64 s[6:7], -1, 0
	v_cndmask_b32_e64 v1, 0, -1, s[6:7]
	s_and_b64 s[6:7], s[6:7], exec
	s_cselect_b32 s3, s14, s3
	s_sext_i32_i16 s3, s3
	s_mulk_i32 s3, 0x6667
	s_lshr_b32 s6, s3, 31
	s_ashr_i32 s3, s3, 18
	s_add_i32 s3, s3, s6
	v_readfirstlane_b32 s6, v1
	s_xor_b32 s16, s3, s6
	s_lshl_b32 s3, s17, 1
	s_and_b32 s3, s3, 62
	s_or_b32 s3, s3, s30
	s_cmp_gt_u32 s17, 63
	s_cselect_b64 s[28:29], -1, 0
	v_and_b32_e32 v1, 0x3ff, v0
	v_bfe_u32 v0, v0, 10, 10
	v_lshlrev_b32_e32 v3, 3, v0
	s_and_b64 s[6:7], s[28:29], exec
	v_lshrrev_b32_e32 v2, 3, v1
	s_cselect_b32 s3, s16, s3
	v_readfirstlane_b32 s6, v3
	s_lshl_b32 s55, s3, 8
	v_bitop3_b32 v5, v1, v2, 7 bitop3:0x6c
	s_lshl_b32 s34, s6, 7
	v_or3_b32 v4, v2, v3, s55
	v_lshlrev_b32_e32 v5, 4, v5
	s_and_b32 s7, s21, 0xffff
	s_add_i32 s35, s34, 0x8000
	s_or_b32 s21, s7, 0x60000000
	s_mov_b32 s23, 0x27000
	s_mov_b32 s22, 0x7ffffffe
	v_lshl_or_b32 v4, v4, 13, v5
	s_mov_b32 m0, s35
	s_or_b32 s36, s34, 0x1000
	buffer_load_dwordx4 v4, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x80, v4
	s_mov_b32 m0, s34
	s_add_i32 s37, s36, 0x8000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x40000, v4
	s_mov_b32 m0, s37
	s_or_b32 s38, s34, 0x2000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x40080, v4
	s_mov_b32 m0, s36
	s_add_i32 s39, s38, 0x8000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x80000, v4
	s_mov_b32 m0, s39
	s_or_b32 s40, s34, 0x3000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x80080, v4
	s_mov_b32 m0, s38
	s_add_i32 s41, s40, 0x8000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0xc0000, v4
	s_mov_b32 m0, s41
	s_or_b32 s42, s34, 0x4000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0xc0080, v4
	s_mov_b32 m0, s40
	s_add_i32 s43, s42, 0x8000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x100000, v4
	s_mov_b32 m0, s43
	s_or_b32 s44, s34, 0x5000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x100080, v4
	s_mov_b32 m0, s42
	s_add_i32 s45, s44, 0x8000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x140000, v4
	s_mov_b32 m0, s45
	s_or_b32 s46, s34, 0x6000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x140080, v4
	s_mov_b32 m0, s44
	s_add_i32 s47, s46, 0x8000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x180000, v4
	s_mov_b32 m0, s47
	s_or_b32 s48, s34, 0x7000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x180080, v4
	s_mov_b32 m0, s46
	s_add_i32 s49, s48, 0x8000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v6, 0x1c0000, v4
	s_mov_b32 m0, s49
	v_readfirstlane_b32 s6, v0
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_or_b32_e32 v4, 0x1c0080, v4
	s_mov_b32 m0, s48
	s_lshl_b32 s51, s6, 8
	s_lshl_b32 s3, s3, 17
	buffer_load_dwordx4 v4, s[20:23], 0 offen lds
	v_lshlrev_b32_e32 v9, 2, v1
	v_lshl_or_b32 v4, v0, 14, s3
	s_and_b32 s5, s5, 0xffff
	s_add_i32 s50, s51, 0x10800
	s_or_b32 s5, s5, 0x42000000
	s_mov_b32 s6, s22
	s_mov_b32 s7, s23
	v_mov_b32_e32 v55, v4
	v_or_b32_e32 v4, v4, v9
	s_mov_b32 m0, s50
	s_add_i32 s51, s51, 0x10000
	buffer_load_dword v4, s[4:7], 0 offen lds
	v_or_b32_e32 v4, 0x100, v4
	s_mov_b32 m0, s51
	v_lshrrev_b32_e32 v36, 4, v1
	buffer_load_dword v4, s[4:7], 0 offen lds
	v_or_b32_e32 v4, 4, v0
	v_mad_u32_u24 v13, v0, 56, v1
	v_readfirstlane_b32 s14, v4
	s_lshl_b32 s53, s14, 8
	v_lshlrev_b32_e32 v4, 14, v4
	s_add_i32 s52, s53, 0x10800
	v_or3_b32 v4, v4, s3, v9
	s_mov_b32 m0, s52
	s_add_i32 s53, s53, 0x10000
	buffer_load_dword v4, s[4:7], 0 offen lds
	v_or_b32_e32 v4, 0x100, v4
	s_mov_b32 m0, s53
	s_mul_i32 s3, s17, 0xe0
	buffer_load_dword v4, s[4:7], 0 offen lds
	v_mad_u32_u24 v4, v0, 56, s3
	s_ashr_i32 s3, s2, 31
	v_and_b32_e32 v6, 15, v1
	v_mul_u32_u24_e32 v7, 0x380, v0
	v_lshlrev_b32_e32 v12, 8, v36
	v_lshrrev_b32_e32 v14, 4, v13
	v_lshlrev_b32_e32 v21, 4, v1
	s_lshl_b64 s[6:7], s[2:3], 13
	v_mad_u32_u24 v8, v0, 56, v6
	v_add3_u32 v10, v21, v7, v12
	v_lshlrev_b32_e32 v22, 8, v14
	s_add_u32 s12, s12, s6
	v_min_u32_e32 v4, 0x3fc8, v4
	v_and_b32_e32 v6, 0x1f0, v8
	s_mulk_i32 s33, 0xe0
	v_sub_u32_e32 v17, v10, v22
	v_lshlrev_b32_e32 v10, 13, v8
	s_addc_u32 s6, s13, s7
	v_add_u32_e32 v33, 56, v4
	v_add_u32_e32 v18, s33, v6
	v_and_b32_e32 v23, 0x3e0000, v10
	s_and_b32 s6, s6, 0xffff
	v_add_u32_e32 v11, 0x400, v17
	v_add_u32_e32 v10, v17, v23
	s_or_b32 s13, s6, 0x60000000
	v_bfrev_b32_e32 v15, -2
	v_cmp_lt_i32_e32 vcc, v18, v33
	v_add_u32_e32 v16, v11, v23
	s_mov_b32 s24, s12
	s_mov_b32 s25, s13
	s_mov_b32 s26, s22
	s_mov_b32 s27, s23
	v_cndmask_b32_e32 v10, v15, v10, vcc
	v_cndmask_b32_e32 v16, v15, v16, vcc
	v_lshlrev_b32_e32 v6, 13, v6
	v_mov_b32_e32 v51, v8
	buffer_load_dwordx4 a[28:31], v10, s[24:27], 0 offen
	buffer_load_dwordx4 a[20:23], v16, s[24:27], 0 offen
	v_add_u32_e32 v8, 40, v4
	v_add_u32_e32 v16, 0x20000, v6
	v_add_u32_e32 v10, v17, v16
	v_cmp_lt_i32_e32 vcc, v18, v8
	v_mov_b32_e32 v50, v16
	v_add_u32_e32 v16, v11, v16
	v_cndmask_b32_e32 v10, v15, v10, vcc
	v_cndmask_b32_e32 v16, v15, v16, vcc
	buffer_load_dwordx4 a[24:27], v10, s[24:27], 0 offen
	buffer_load_dwordx4 a[0:3], v16, s[24:27], 0 offen
	v_add_u32_e32 v34, 24, v4
	v_add_u32_e32 v10, 0x40000, v6
	v_add_u32_e32 v16, v17, v10
	v_cmp_lt_i32_e32 vcc, v18, v34
	v_add_u32_e32 v10, v11, v10
	v_add_u32_e32 v6, 0x60000, v6
	v_cndmask_b32_e32 v16, v15, v16, vcc
	v_cndmask_b32_e32 v10, v15, v10, vcc
	buffer_load_dwordx4 a[4:7], v16, s[24:27], 0 offen
	buffer_load_dwordx4 a[8:11], v10, s[24:27], 0 offen
	v_add_u32_e32 v10, v17, v6
	v_cmp_le_i32_e32 vcc, v18, v4
	v_add_u32_e32 v6, v11, v6
	s_load_dwordx2 s[18:19], s[0:1], 0x68
	v_cndmask_b32_e32 v10, v15, v10, vcc
	v_cndmask_b32_e32 v6, v15, v6, vcc
	buffer_load_dwordx4 a[12:15], v10, s[24:27], 0 offen
	buffer_load_dwordx4 a[16:19], v6, s[24:27], 0 offen
	v_accvgpr_write_b32 a166, v8
	v_accvgpr_write_b32 a180, v18
	s_mov_b32 s14, s22
	s_mov_b32 s15, s23
	s_mov_b32 s54, 0
	scratch_store_dword off, v17, off offset:16
	s_movk_i32 s1, 0xe0
	v_mad_i32_i24 v8, v36, -16, v13
	v_ashrrev_i16_e32 v10, 15, v8
	v_lshrrev_b16_e32 v10, 11, v10
	v_add_u16_e32 v10, v8, v10
	v_and_b32_e32 v10, 0xffffffe0, v10
	v_sub_u16_e32 v10, v8, v10
	v_bfe_i32 v11, v10, 0, 16
	v_ashrrev_i32_e32 v16, 31, v11
	v_add_u16_e32 v17, 32, v10
	v_cmp_gt_i16_e32 vcc, 0, v10
	v_mad_u32_u24 v6, v0, s1, v9
	v_mul_u32_u24_e32 v38, 0xe0, v0
	v_cndmask_b32_e32 v10, v11, v17, vcc
	v_cndmask_b32_e64 v11, v16, 0, vcc
	v_xor_b32_e32 v10, v11, v10
	v_lshrrev_b32_e32 v16, 28, v10
	v_add_u32_e32 v10, v10, v16
	v_ashrrev_i32_e32 v10, 4, v10
	v_xor_b32_e32 v42, v10, v11
	v_lshlrev_b32_e32 v16, 6, v36
	v_add_u32_e32 v10, v42, v16
	v_mul_i32_i24_e32 v11, 0xffffffc0, v14
	v_add3_u32 v24, v10, v6, v11
	v_ashrrev_i32_e32 v10, 31, v24
	v_xor_b32_e32 v11, v10, v24
	v_ashrrev_i32_e32 v17, 31, v11
	v_lshrrev_b32_e32 v17, 23, v17
	v_add_u32_e32 v11, v11, v17
	v_ashrrev_i32_e32 v17, 31, v8
	v_xor_b32_e32 v18, v17, v8
	v_ashrrev_i32_e32 v19, 31, v18
	v_lshrrev_b32_e32 v19, 27, v19
	v_add_u32_e32 v18, v18, v19
	v_ashrrev_i32_e32 v18, 5, v18
	v_xor_b32_e32 v17, v18, v17
	v_ashrrev_i32_e32 v11, 9, v11
	v_lshlrev_b32_e32 v37, 5, v17
	v_xad_u32 v10, v11, v10, v37
	v_add_u32_e32 v11, s33, v10
	v_and_b32_e32 v18, 0x1ff, v24
	v_lshl_or_b32 v10, v10, 9, v18
	v_cmp_lt_i32_e32 vcc, v11, v33
	v_add_u32_e32 v19, 2, v24
	v_sub_u32_e32 v20, -3, v24
	v_cndmask_b32_e32 v18, v15, v10, vcc
	v_cmp_gt_i32_e32 vcc, -2, v24
	s_movk_i32 s0, 0xffc0
	v_add_u32_e32 v28, v16, v9
	v_cndmask_b32_e32 v19, v19, v20, vcc
	v_ashrrev_i32_e32 v20, 31, v19
	v_lshrrev_b32_e32 v20, 23, v20
	v_add_u32_e32 v19, v19, v20
	v_ashrrev_i32_e32 v19, 9, v19
	v_cndmask_b32_e64 v20, 0, -1, vcc
	v_xor_b32_e32 v19, v19, v20
	v_mad_i32_i24 v25, v14, s0, v38
	v_add_u32_e32 v20, v19, v37
	scratch_store_dword off, v25, off offset:80
	v_add3_u32 v25, v28, v25, v42
	v_lshlrev_b32_e32 v19, 9, v19
	v_sub_u32_e32 v19, v25, v19
	scratch_store_dword off, v24, off offset:32
	v_add_u32_e32 v24, s33, v20
	v_lshl_add_u32 v19, v20, 9, v19
	v_add_u32_e32 v20, 2, v19
	v_cmp_lt_i32_e32 vcc, v24, v33
	v_add_u32_e32 v26, 16, v8
	v_sub_u32_e32 v25, 0xffef, v8
	v_cndmask_b32_e32 v20, v15, v20, vcc
	v_cmp_gt_i32_e32 vcc, -16, v8
	scratch_store_dword off, v26, off offset:8
	scratch_store_dword off, v28, off offset:116
	v_cndmask_b32_e32 v25, v26, v25, vcc
	v_ashrrev_i16_e32 v26, 15, v25
	v_lshrrev_b16_e32 v26, 11, v26
	v_add_u16_e32 v25, v25, v26
	v_ashrrev_i16_e32 v25, 5, v25
	v_cndmask_b32_e64 v26, 0, -1, vcc
	v_xor_b32_e32 v25, v25, v26
	v_bfe_i32 v25, v25, 0, 16
	v_mul_i32_i24_e32 v26, 0xffffffc1, v14
	v_mad_i32_i24 v39, v25, -2, v26
	v_sub_u32_e32 v26, v39, v36
	v_add3_u32 v31, v26, v6, v16
	v_add_u32_e32 v6, 1, v31
	v_sub_u32_e32 v26, -2, v31
	v_cmp_gt_i32_e32 vcc, -1, v31
	v_lshlrev_b32_e32 v40, 5, v25
	v_sub_u32_e32 v28, v28, v36
	v_cndmask_b32_e32 v6, v6, v26, vcc
	v_ashrrev_i32_e32 v26, 31, v6
	v_lshrrev_b32_e32 v26, 23, v26
	v_add_u32_e32 v6, v6, v26
	v_ashrrev_i32_e32 v6, 9, v6
	v_cndmask_b32_e64 v26, 0, -1, vcc
	v_xor_b32_e32 v6, v6, v26
	v_mad_u32_u24 v29, v0, s1, v39
	v_add_u32_e32 v26, v6, v40
	v_add3_u32 v35, v29, v28, 1
	v_lshlrev_b32_e32 v28, 9, v6
	v_add_u32_e32 v27, s33, v26
	v_sub_u32_e32 v28, v35, v28
	v_lshl_add_u32 v26, v26, 9, v28
	v_cmp_lt_i32_e32 vcc, v27, v33
	v_add_u32_e32 v27, 3, v31
	v_sub_u32_e32 v30, -4, v31
	v_cndmask_b32_e32 v26, v15, v26, vcc
	v_cmp_gt_i32_e32 vcc, -3, v31
	scratch_store_dword off, v31, off offset:64
	scratch_store_dword off, v8, off offset:12
	v_cndmask_b32_e32 v27, v27, v30, vcc
	v_ashrrev_i32_e32 v30, 31, v27
	v_lshrrev_b32_e32 v30, 23, v30
	v_add_u32_e32 v27, v27, v30
	v_ashrrev_i32_e32 v27, 9, v27
	v_cndmask_b32_e64 v30, 0, -1, vcc
	v_xor_b32_e32 v27, v27, v30
	v_lshlrev_b32_e32 v32, 9, v27
	v_add_u32_e32 v30, v27, v40
	v_sub_u32_e32 v32, v35, v32
	v_add_u32_e32 v31, s33, v30
	v_add_u32_e32 v32, 2, v32
	v_add_u32_e32 v8, 48, v8
	s_lshl_b32 s6, s2, 9
	v_lshl_add_u32 v30, v30, 9, v32
	v_cmp_lt_i32_e32 vcc, v31, v33
	v_and_b32_e32 v41, 0xffffffe0, v8
	s_ashr_i32 s7, s6, 31
	v_cndmask_b32_e32 v30, v15, v30, vcc
	v_add_u32_e32 v10, 0x4000, v10
	v_cmp_lt_i32_e32 vcc, v11, v34
	v_add_u32_e32 v6, v6, v41
	s_add_u32 s24, s8, s6
	v_cndmask_b32_e32 v10, v15, v10, vcc
	v_add_u32_e32 v11, 0x4002, v19
	v_cmp_lt_i32_e32 vcc, v24, v34
	v_add_u32_e32 v19, s33, v6
	s_addc_u32 s6, s9, s7
	v_cndmask_b32_e32 v11, v15, v11, vcc
	v_cmp_lt_i32_e32 vcc, v19, v33
	v_add_u32_e32 v19, v27, v41
	s_and_b32 s6, s6, 0xffff
	v_lshl_add_u32 v6, v6, 9, v28
	v_add_u32_e32 v24, s33, v19
	s_or_b32 s25, s6, 0x42000000
	v_cndmask_b32_e32 v6, v15, v6, vcc
	v_lshl_add_u32 v19, v19, 9, v32
	v_cmp_lt_i32_e32 vcc, v24, v33
	scratch_store_dword off, v35, off offset:48
	v_accvgpr_write_b32 a193, v34
	v_accvgpr_write_b32 a167, v33
	v_cndmask_b32_e32 v19, v15, v19, vcc
	buffer_load_ubyte v31, v18, s[24:27], 0 offen
	buffer_load_ubyte v32, v20, s[24:27], 0 offen
	buffer_load_ubyte v33, v26, s[24:27], 0 offen
	buffer_load_ubyte v109, v30, s[24:27], 0 offen
	buffer_load_ubyte v35, v10, s[24:27], 0 offen
	buffer_load_ubyte v108, v11, s[24:27], 0 offen
	buffer_load_ubyte v34, v6, s[24:27], 0 offen
	buffer_load_ubyte v209, v19, s[24:27], 0 offen
	s_mov_b32 s8, -2
	s_waitcnt vmcnt(0)
	s_barrier
	v_lshlrev_b32_e32 v10, 7, v1
	v_lshlrev_b32_e32 v11, 11, v36
	v_bitop3_b32 v6, v36, v1, 7 bitop3:0x78
	v_sub_u32_e32 v10, v10, v11
	v_lshl_or_b32 v11, v6, 4, v10
	v_and_b32_e32 v6, 7, v1
	v_bitop3_b32 v6, v36, v6, 4 bitop3:0x36
	v_add_u32_e32 v18, 8, v4
	v_lshl_or_b32 v10, v6, 4, v10
	ds_read_b128 a[96:99], v11 offset:32768
	ds_read_b128 a[88:91], v11 offset:34816
	ds_read_b128 a[108:111], v10 offset:32768
	ds_read_b128 a[104:107], v10 offset:34816
	ds_read_b128 a[92:95], v11 offset:36864
	ds_read_b128 a[84:87], v11 offset:38912
	ds_read_b128 a[112:115], v10 offset:36864
	ds_read_b128 a[100:103], v10 offset:38912
	ds_read_b128 a[76:79], v11 offset:40960
	ds_read_b128 a[72:75], v11 offset:43008
	ds_read_b128 a[80:83], v10 offset:40960
	ds_read_b128 a[124:127], v10 offset:43008
	ds_read_b128 a[116:119], v11 offset:45056
	ds_read_b128 a[64:67], v11 offset:47104
	ds_read_b128 a[120:123], v10 offset:45056
	ds_read_b128 a[68:71], v10 offset:47104
	v_accvgpr_write_b32 a165, v18
	v_add_u32_e32 v18, 55, v4
	v_add_u32_e32 v4, 23, v4
	v_accvgpr_write_b32 a182, v4
	v_mad_i32_i24 v4, v14, s0, v42
	v_mul_i32_i24_e32 v0, 0xffffff20, v0
	v_accvgpr_write_b32 a183, v0
	v_add3_u32 v0, v4, v9, v16
	v_add3_u32 v14, v4, v38, v16
	v_sub_u32_e32 v16, 0, v0
	v_mul_u32_u24_e32 v0, 63, v36
	v_add3_u32 v0, v39, v9, v0
	v_lshl_add_u32 v112, v17, 14, v14
	v_sub_u32_e32 v17, 0, v0
	v_lshlrev_b32_e32 v0, 9, v8
	v_accvgpr_write_b32 a181, v18
	v_mad_u32_u24 v18, v36, 63, v29
	v_and_b32_e32 v0, 0xffffc000, v0
	v_add_u32_e32 v19, v18, v0
	v_or_b32_e32 v0, v23, v7
	v_add3_u32 v0, v0, v12, v21
	v_sub_u32_e32 v0, v0, v22
	v_add_u32_e32 v21, 0x61400, v0
	v_or3_b32 v0, v2, s55, v3
	v_mov_b32_e32 v72, 0
	v_and_b32_e32 v1, 48, v1
	v_lshl_add_u32 v20, v25, 14, v18
	v_lshl_or_b32 v0, v0, 13, v5
	v_mov_b32_e32 v25, v72
	v_and_b32_e32 v6, 0x1f0, v13
	v_accvgpr_write_b32 a184, v0
	v_add_u32_e32 v0, v13, v1
	v_mov_b32_e32 v22, v72
	v_mov_b32_e32 v23, v72
	v_mov_b32_e32 v24, v72
	v_accvgpr_write_b32 a231, v25
	v_accvgpr_write_b32 a215, v25
	v_accvgpr_write_b32 a227, v25
	v_accvgpr_write_b32 a211, v25
	v_accvgpr_write_b32 a223, v25
	v_accvgpr_write_b32 a219, v25
	v_accvgpr_write_b32 a239, v25
	v_accvgpr_write_b32 a235, v25
	v_accvgpr_write_b32 a247, v25
	v_accvgpr_write_b32 a243, v25
	v_accvgpr_write_b32 a255, v25
	v_accvgpr_write_b32 a251, v25
	v_or_b32_e32 v12, 0x10800, v9
	v_or_b32_e32 v13, 0x10a00, v9
	v_accvgpr_write_b32 a230, v24
	v_accvgpr_write_b32 a229, v23
	v_accvgpr_write_b32 a228, v22
	v_accvgpr_write_b32 a214, v24
	v_accvgpr_write_b32 a213, v23
	v_accvgpr_write_b32 a212, v22
	v_accvgpr_write_b32 a226, v24
	v_accvgpr_write_b32 a225, v23
	v_accvgpr_write_b32 a224, v22
	v_accvgpr_write_b32 a210, v24
	v_accvgpr_write_b32 a209, v23
	v_accvgpr_write_b32 a208, v22
	v_accvgpr_write_b32 a222, v24
	v_accvgpr_write_b32 a221, v23
	v_accvgpr_write_b32 a220, v22
	v_accvgpr_write_b32 a218, v24
	v_accvgpr_write_b32 a217, v23
	v_accvgpr_write_b32 a216, v22
	v_accvgpr_write_b32 a238, v24
	v_accvgpr_write_b32 a237, v23
	v_accvgpr_write_b32 a236, v22
	v_accvgpr_write_b32 a234, v24
	v_accvgpr_write_b32 a233, v23
	v_accvgpr_write_b32 a232, v22
	v_accvgpr_write_b32 a246, v24
	v_accvgpr_write_b32 a245, v23
	v_accvgpr_write_b32 a244, v22
	v_accvgpr_write_b32 a242, v24
	v_accvgpr_write_b32 a241, v23
	v_accvgpr_write_b32 a240, v22
	v_accvgpr_write_b32 a254, v24
	v_accvgpr_write_b32 a253, v23
	v_accvgpr_write_b32 a252, v22
	v_accvgpr_write_b32 a250, v24
	v_accvgpr_write_b32 a249, v23
	v_accvgpr_write_b32 a248, v22
	v_accvgpr_write_b32 a195, v12
	ds_read_b32 v22, v12
	ds_read_b32 v26, v13
	v_or_b32_e32 v12, 0x10900, v9
	v_accvgpr_write_b32 a172, v13
	v_or_b32_e32 v13, 0x10b00, v9
	scratch_store_dword off, v39, off offset:112
	scratch_store_dword off, v8, off offset:4
	v_sub_u32_e32 v8, v0, v6
	v_accvgpr_write_b32 a164, v12
	ds_read_b32 v12, v12
	ds_read_b32 v39, v13
	v_accvgpr_write_b32 a185, v8
	v_sub_u32_e32 v23, 0xff3f, v8
	v_add_u32_e32 v8, s33, v41
	v_mov_b32_e32 v45, v72
	v_accvgpr_write_b32 a186, v8
	v_add_u32_e32 v8, s33, v40
	scratch_store_dword off, v42, off offset:120
	v_mov_b32_e32 v42, v72
	v_mov_b32_e32 v43, v72
	v_mov_b32_e32 v44, v72
	v_accvgpr_write_b32 a203, v45
	v_accvgpr_write_b32 a207, v45
	v_accvgpr_write_b32 a192, v8
	v_add_u32_e32 v8, s33, v37
	s_movk_i32 s9, 0xff80
	s_movk_i32 s55, 0xff40
	s_movk_i32 s56, 0xff00
	s_movk_i32 s57, 0xfeff
	s_movk_i32 s58, 0xfefe
	s_movk_i32 s59, 0xfefd
	s_movk_i32 s60, 0xfdfe
	s_movk_i32 s61, 0xfdfd
	v_mov_b32_e32 v73, v72
	v_mov_b32_e32 v74, v72
	v_mov_b32_e32 v75, v72
	v_mov_b32_e32 v124, v72
	v_mov_b32_e32 v125, v72
	v_mov_b32_e32 v126, v72
	v_mov_b32_e32 v127, v72
	v_mov_b32_e32 v132, v72
	v_mov_b32_e32 v133, v72
	v_mov_b32_e32 v134, v72
	v_mov_b32_e32 v135, v72
	v_mov_b32_e32 v80, v72
	v_mov_b32_e32 v81, v72
	v_mov_b32_e32 v82, v72
	v_mov_b32_e32 v83, v72
	v_mov_b32_e32 v116, v72
	v_mov_b32_e32 v117, v72
	v_mov_b32_e32 v118, v72
	v_mov_b32_e32 v119, v72
	v_mov_b32_e32 v60, v72
	v_mov_b32_e32 v61, v72
	v_mov_b32_e32 v62, v72
	v_mov_b32_e32 v63, v72
	v_mov_b32_e32 v128, v72
	v_mov_b32_e32 v129, v72
	v_mov_b32_e32 v130, v72
	v_mov_b32_e32 v131, v72
	v_mov_b32_e32 v120, v72
	v_mov_b32_e32 v121, v72
	v_mov_b32_e32 v122, v72
	v_mov_b32_e32 v123, v72
	v_mov_b32_e32 v140, v72
	v_mov_b32_e32 v141, v72
	v_mov_b32_e32 v142, v72
	v_mov_b32_e32 v143, v72
	v_mov_b32_e32 v136, v72
	v_mov_b32_e32 v137, v72
	v_mov_b32_e32 v138, v72
	v_mov_b32_e32 v139, v72
	v_mov_b32_e32 v160, v72
	v_mov_b32_e32 v161, v72
	v_mov_b32_e32 v162, v72
	v_mov_b32_e32 v163, v72
	v_mov_b32_e32 v148, v72
	v_mov_b32_e32 v149, v72
	v_mov_b32_e32 v150, v72
	v_mov_b32_e32 v151, v72
	v_mov_b32_e32 v172, v72
	v_mov_b32_e32 v173, v72
	v_mov_b32_e32 v174, v72
	v_mov_b32_e32 v175, v72
	v_mov_b32_e32 v152, v72
	v_mov_b32_e32 v153, v72
	v_mov_b32_e32 v154, v72
	v_mov_b32_e32 v155, v72
	v_mov_b32_e32 v200, v72
	v_mov_b32_e32 v201, v72
	v_mov_b32_e32 v202, v72
	v_mov_b32_e32 v203, v72
	v_mov_b32_e32 v144, v72
	v_mov_b32_e32 v145, v72
	v_mov_b32_e32 v146, v72
	v_mov_b32_e32 v147, v72
	v_mov_b32_e32 v204, v72
	v_mov_b32_e32 v205, v72
	v_mov_b32_e32 v206, v72
	v_mov_b32_e32 v207, v72
	v_mov_b32_e32 v156, v72
	v_mov_b32_e32 v157, v72
	v_mov_b32_e32 v158, v72
	v_mov_b32_e32 v159, v72
	v_mov_b32_e32 v196, v72
	v_mov_b32_e32 v197, v72
	v_mov_b32_e32 v198, v72
	v_mov_b32_e32 v199, v72
	v_mov_b32_e32 v168, v72
	v_mov_b32_e32 v169, v72
	v_mov_b32_e32 v170, v72
	v_mov_b32_e32 v171, v72
	v_mov_b32_e32 v192, v72
	v_mov_b32_e32 v193, v72
	v_mov_b32_e32 v194, v72
	v_mov_b32_e32 v195, v72
	v_mov_b32_e32 v164, v72
	v_mov_b32_e32 v165, v72
	v_mov_b32_e32 v166, v72
	v_mov_b32_e32 v167, v72
	v_mov_b32_e32 v180, v72
	v_mov_b32_e32 v181, v72
	v_mov_b32_e32 v182, v72
	v_mov_b32_e32 v183, v72
	v_mov_b32_e32 v176, v72
	v_mov_b32_e32 v177, v72
	v_mov_b32_e32 v178, v72
	v_mov_b32_e32 v179, v72
	v_mov_b32_e32 v188, v72
	v_mov_b32_e32 v189, v72
	v_mov_b32_e32 v190, v72
	v_mov_b32_e32 v191, v72
	v_mov_b32_e32 v184, v72
	v_mov_b32_e32 v185, v72
	v_mov_b32_e32 v186, v72
	v_mov_b32_e32 v187, v72
	v_mov_b32_e32 v56, v72
	v_mov_b32_e32 v57, v72
	v_mov_b32_e32 v58, v72
	v_mov_b32_e32 v59, v72
	v_mov_b32_e32 v216, v72
	v_mov_b32_e32 v217, v72
	v_mov_b32_e32 v218, v72
	v_mov_b32_e32 v219, v72
	v_mov_b32_e32 v252, v72
	v_mov_b32_e32 v253, v72
	v_mov_b32_e32 v254, v72
	v_mov_b32_e32 v255, v72
	v_mov_b32_e32 v248, v72
	v_mov_b32_e32 v249, v72
	v_mov_b32_e32 v250, v72
	v_mov_b32_e32 v251, v72
	v_mov_b32_e32 v0, v72
	v_mov_b32_e32 v1, v72
	v_mov_b32_e32 v2, v72
	v_mov_b32_e32 v3, v72
	v_mov_b32_e32 v4, v72
	v_mov_b32_e32 v5, v72
	v_mov_b32_e32 v6, v72
	v_mov_b32_e32 v7, v72
	v_mov_b32_e32 v68, v72
	v_mov_b32_e32 v69, v72
	v_mov_b32_e32 v70, v72
	v_mov_b32_e32 v71, v72
	v_mov_b32_e32 v64, v72
	v_mov_b32_e32 v65, v72
	v_mov_b32_e32 v66, v72
	v_mov_b32_e32 v67, v72
	v_mov_b32_e32 v88, v72
	v_mov_b32_e32 v89, v72
	v_mov_b32_e32 v90, v72
	v_mov_b32_e32 v91, v72
	v_mov_b32_e32 v76, v72
	v_mov_b32_e32 v77, v72
	v_mov_b32_e32 v78, v72
	v_mov_b32_e32 v79, v72
	v_mov_b32_e32 v84, v72
	v_mov_b32_e32 v85, v72
	v_mov_b32_e32 v86, v72
	v_mov_b32_e32 v87, v72
	v_accvgpr_write_b32 a196, v72
	v_accvgpr_write_b32 a197, v72
	v_accvgpr_write_b32 a198, v72
	v_accvgpr_write_b32 a199, v72
	v_mov_b32_e32 v92, v72
	v_mov_b32_e32 v93, v72
	v_mov_b32_e32 v94, v72
	v_mov_b32_e32 v95, v72
	v_mov_b32_e32 v96, v72
	v_mov_b32_e32 v97, v72
	v_mov_b32_e32 v98, v72
	v_mov_b32_e32 v99, v72
	v_mov_b32_e32 v100, v72
	v_mov_b32_e32 v101, v72
	v_mov_b32_e32 v102, v72
	v_mov_b32_e32 v103, v72
	v_mov_b32_e32 v104, v72
	v_mov_b32_e32 v105, v72
	v_mov_b32_e32 v106, v72
	v_mov_b32_e32 v107, v72
	v_mov_b32_e32 v220, v72
	v_mov_b32_e32 v221, v72
	v_mov_b32_e32 v222, v72
	v_mov_b32_e32 v223, v72
	v_mov_b32_e32 v224, v72
	v_mov_b32_e32 v225, v72
	v_mov_b32_e32 v226, v72
	v_mov_b32_e32 v227, v72
	v_mov_b32_e32 v232, v72
	v_mov_b32_e32 v233, v72
	v_mov_b32_e32 v234, v72
	v_mov_b32_e32 v235, v72
	v_mov_b32_e32 v228, v72
	v_mov_b32_e32 v229, v72
	v_mov_b32_e32 v230, v72
	v_mov_b32_e32 v231, v72
	v_mov_b32_e32 v240, v72
	v_mov_b32_e32 v241, v72
	v_mov_b32_e32 v242, v72
	v_mov_b32_e32 v243, v72
	v_mov_b32_e32 v236, v72
	v_mov_b32_e32 v237, v72
	v_mov_b32_e32 v238, v72
	v_mov_b32_e32 v239, v72
	v_mov_b32_e32 v244, v72
	v_mov_b32_e32 v245, v72
	v_mov_b32_e32 v246, v72
	v_mov_b32_e32 v247, v72
	v_mov_b32_e32 v212, v72
	v_mov_b32_e32 v213, v72
	v_mov_b32_e32 v214, v72
	v_mov_b32_e32 v215, v72
	v_accvgpr_write_b32 a179, v13
	v_accvgpr_write_b32 a202, v44
	v_accvgpr_write_b32 a201, v43
	v_accvgpr_write_b32 a200, v42
	v_accvgpr_write_b32 a206, v44
	v_accvgpr_write_b32 a205, v43
	v_accvgpr_write_b32 a204, v42
	v_accvgpr_write_b32 a187, v40
	v_accvgpr_write_b32 a173, v37
	v_accvgpr_write_b32 a194, v8
	scratch_store_dword off, v38, off offset:96
	scratch_store_dword off, v36, off
	scratch_store_dword off, v41, off offset:124
.LBB0_1:
	s_waitcnt vmcnt(10) lgkmcnt(0)
	s_barrier
	v_and_b32_e32 v47, 0xff, v31
	v_and_b32_e32 v46, 0xff, v32
	v_and_b32_e32 v45, 0xff, v33
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[96:99], a[28:31], v[72:75], v22, v47 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_and_b32_e32 v28, 0xff, v35
	v_accvgpr_read_b32 v8, a185
	v_add_u32_e32 v31, s54, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[108:111], a[20:23], v[40:43], v22, v46 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v13, 0x80, v31
	v_cmp_gt_i32_e32 vcc, s9, v31
	v_add_u32_e32 v24, 64, v23
	v_accvgpr_read_b32 v37, a180
	v_and_b32_e32 v43, 0xff, v34
	v_and_b32_e32 v40, 0xff, v209
	v_and_b32_e32 v41, 0xff, v109
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[96:99], a[12:15], v[80:83], v22, v43 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_and_b32_e32 v42, 0xff, v108
	v_cndmask_b32_e32 v13, v13, v24, vcc
	v_ashrrev_i16_e32 v24, 15, v13
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[108:111], a[16:19], v[32:35], v22, v40 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_lshrrev_b16_e32 v24, 7, v24
	v_add_u16_e32 v13, v13, v24
	v_ashrrev_i16_e32 v13, 9, v13
	v_cndmask_b32_e64 v24, 0, -1, vcc
	v_xor_b32_e32 v13, v13, v24
	v_add_u32_sdwa v13, v37, sext(v13) dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:DWORD src1_sel:WORD_0
	v_accvgpr_read_b32 v111, a167
	v_cmp_lt_i32_e32 vcc, v13, v111
	v_accvgpr_write_b32 a177, v35
	v_accvgpr_write_b32 a176, v34
	v_accvgpr_write_b32 a175, v33
	v_accvgpr_write_b32 a174, v32
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[88:91], a[28:31], v[116:119], v22, v47 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v24, 0xfff9f400, v21
	v_cndmask_b32_e32 v24, v15, v24, vcc
	buffer_load_dwordx4 a[32:35], v24, s[12:15], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[104:107], a[20:23], v[32:35], v22, v46 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v24, 0xc0, v31
	v_cmp_gt_i32_e32 vcc, s55, v31
	v_accvgpr_read_b32 v110, a166
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[88:91], a[24:27], v[60:63], v22, v45 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v24, v24, v23, vcc
	v_ashrrev_i16_e32 v25, 15, v24
	v_lshrrev_b16_e32 v25, 7, v25
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[104:107], a[0:3], v[32:35], v22, v41 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u16_e32 v24, v24, v25
	v_ashrrev_i16_e32 v24, 9, v24
	v_cndmask_b32_e64 v25, 0, -1, vcc
	v_xor_b32_e32 v24, v24, v25
	v_add_u32_sdwa v24, v37, sext(v24) dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:DWORD src1_sel:WORD_0
	v_cmp_lt_i32_e32 vcc, v24, v111
	v_add_u32_e32 v25, 0xfff9f800, v21
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[96:99], a[24:27], v[124:127], v22, v45 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a191, v35
	v_accvgpr_write_b32 a190, v34
	v_accvgpr_write_b32 a189, v33
	v_accvgpr_write_b32 a188, v32
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[88:91], a[4:7], v[128:131], v22, v28 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v25, v15, v25, vcc
	buffer_load_dwordx4 a[36:39], v25, s[12:15], 0 offen
	v_cmp_lt_i32_e32 vcc, v13, v110
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[104:107], a[8:11], v[32:35], v22, v42 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v25, 0xfffbf400, v21
	v_cndmask_b32_e32 v25, v15, v25, vcc
	buffer_load_dwordx4 a[40:43], v25, s[12:15], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[88:91], a[12:15], v[120:123], v22, v43 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_lt_i32_e32 vcc, v24, v110
	v_add_u32_e32 v25, 0xfffbf800, v21
	v_accvgpr_read_b32 v108, a193
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[104:107], a[16:19], v[32:35], v22, v40 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v25, v15, v25, vcc
	v_cmp_lt_i32_e32 vcc, v13, v108
	v_accvgpr_read_b32 v109, a165
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[92:95], a[28:31], v[140:143], v12, v47 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v8, a183
	buffer_load_dwordx4 a[44:47], v25, s[12:15], 0 offen
	v_accvgpr_read_b32 v114, a194
	v_mfma_scale_f32_16x16x128_f8f6f4 v[140:143], a[112:115], a[20:23], v[32:35], v12, v46 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v36, v8, v17
	v_accvgpr_read_b32 v113, a192
	v_add_u32_e32 v54, v9, v20
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[92:95], a[24:27], v[136:139], v12, v45 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_mov_b32 s26, s14
	s_mov_b32 s27, s15
	v_add_u32_e32 v38, 0xfffffefc, v36
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], a[112:115], a[0:3], v[32:35], v12, v41 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v115, a186
	ds_read_b128 a[128:131], v11 offset:49152
	ds_read_b128 a[104:107], v11 offset:53248
	ds_read_b128 a[88:91], v11 offset:55296
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[92:95], a[4:7], v[160:163], v12, v28 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[132:135], v10 offset:51200
	ds_read_b128 a[152:155], v11 offset:63488
	ds_read_b128 a[156:159], v10 offset:63488
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], a[112:115], a[8:11], v[32:35], v12, v42 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[92:95], a[12:15], v[148:151], v12, v43 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[92:95], v10 offset:53248
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[96:99], a[4:7], v[132:135], v22, v28 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[96:99], v11 offset:51200
	v_mfma_scale_f32_16x16x128_f8f6f4 v[148:151], a[112:115], a[16:19], v[32:35], v12, v40 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b128 a[112:115], v11 offset:61440
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[84:87], a[28:31], v[172:175], v12, v47 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[108:111], a[0:3], v[124:127], v22, v41 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[108:111], a[8:11], v[132:135], v22, v42 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v22, 0xfffdf400, v21
	v_cndmask_b32_e32 v22, v15, v22, vcc
	buffer_load_dwordx4 a[52:55], v22, s[12:15], 0 offen
	v_cmp_lt_i32_e32 vcc, v24, v108
	v_add_u32_e32 v22, 0xfffdf800, v21
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[100:103], a[20:23], v[32:35], v12, v46 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v22, v15, v22, vcc
	v_cmp_lt_i32_e32 vcc, v13, v109
	v_add_u32_e32 v13, 0xfffff400, v21
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[84:87], a[24:27], v[152:155], v12, v45 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v13, v15, v13, vcc
	buffer_load_dwordx4 a[48:51], v22, s[12:15], 0 offen
	buffer_load_dwordx4 a[56:59], v13, s[12:15], 0 offen
	v_cmp_lt_i32_e32 vcc, v24, v109
	v_add_u32_e32 v13, 0xfffff800, v21
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[100:103], a[0:3], v[32:35], v12, v41 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v13, v15, v13, vcc
	buffer_load_dwordx4 a[60:63], v13, s[12:15], 0 offen
	ds_read_b128 a[108:111], v10 offset:49152
	v_add_u32_e32 v32, v9, v14
	v_add_u32_e32 v34, v8, v16
	v_add_u32_e32 v13, 0x100, v32
	v_cmp_gt_i32_e32 vcc, s56, v32
	v_add_u32_e32 v22, 0xfffffeff, v34
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[84:87], a[4:7], v[200:203], v12, v28 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v22, v13, v22, vcc
	v_ashrrev_i32_e32 v24, 31, v22
	v_lshrrev_b32_e32 v24, 23, v24
	v_add_u32_e32 v22, v22, v24
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[84:87], a[12:15], v[144:147], v12, v43 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_ashrrev_i32_e32 v22, 9, v22
	v_ashrrev_i32_e32 v24, 31, v13
	v_xad_u32 v27, v22, v24, v114
	v_add_u32_e32 v33, v9, v112
	v_cmp_lt_i32_e32 vcc, v27, v111
	v_add_u32_e32 v22, 0x100, v33
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[100:103], a[8:11], v[200:203], v12, v42 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v22, v15, v22, vcc
	v_cmp_gt_i32_e32 vcc, s58, v32
	v_add_u32_e32 v24, 0xfffffefd, v34
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[100:103], a[16:19], v[144:147], v12, v40 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v12, 0x102, v32
	v_cndmask_b32_e32 v25, v12, v24, vcc
	v_ashrrev_i32_e32 v29, 31, v25
	v_lshrrev_b32_e32 v29, 23, v29
	v_cmp_gt_i32_e64 s[0:1], -2, v13
	v_add_u32_e32 v25, v25, v29
	v_ashrrev_i32_e32 v29, 31, v12
	v_cndmask_b32_e64 v12, v12, v24, s[0:1]
	v_ashrrev_i32_e32 v13, 31, v12
	v_lshrrev_b32_e32 v13, 23, v13
	v_add_u32_e32 v12, v12, v13
	v_ashrrev_i32_e32 v25, 9, v25
	v_lshrrev_b32_e32 v12, 9, v12
	v_xor_b32_e32 v25, v25, v29
	v_xor_b32_e32 v12, v12, v29
	v_lshlrev_b32_e32 v12, 9, v12
	v_lshlrev_b32_e32 v13, 9, v25
	v_sub_u32_e32 v12, v13, v12
	v_add_u32_e32 v30, v25, v114
	v_add_u32_e32 v13, v33, v12
	v_cmp_lt_i32_e32 vcc, v30, v111
	v_add_u32_e32 v12, 0x102, v13
	v_add_u32_e32 v35, v9, v18
	v_cndmask_b32_e32 v12, v15, v12, vcc
	v_add_u32_e32 v24, 0x101, v35
	v_cmp_gt_i32_e32 vcc, s57, v35
	v_add_u32_e32 v25, 0xfffffefe, v36
	buffer_load_ubyte v22, v22, s[24:27], 0 offen
	v_cndmask_b32_e32 v25, v24, v25, vcc
	v_ashrrev_i32_e32 v29, 31, v25
	v_lshrrev_b32_e32 v29, 23, v29
	v_add_u32_e32 v25, v25, v29
	v_ashrrev_i32_e32 v25, 9, v25
	v_ashrrev_i32_e32 v24, 31, v24
	v_xor_b32_e32 v29, v25, v24
	v_add_u32_e32 v24, v29, v113
	v_cmp_lt_i32_e32 vcc, v24, v111
	v_add_u32_e32 v24, 0x101, v54
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[76:79], a[28:31], v[204:207], v26, v47 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v24, v15, v24, vcc
	buffer_load_ubyte v25, v24, s[24:27], 0 offen
	v_add_u32_e32 v24, 0x103, v35
	v_cmp_gt_i32_e32 vcc, s59, v35
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], a[76:79], a[24:27], v[156:159], v26, v45 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v13, 0x4102, v13
	v_cndmask_b32_e32 v38, v24, v38, vcc
	v_ashrrev_i32_e32 v48, 31, v38
	v_lshrrev_b32_e32 v48, 23, v48
	v_add_u32_e32 v38, v38, v48
	v_ashrrev_i32_e32 v38, 9, v38
	v_ashrrev_i32_e32 v24, 31, v24
	v_xor_b32_e32 v48, v38, v24
	v_add_u32_e32 v24, v48, v113
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], a[76:79], a[4:7], v[196:199], v26, v28 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_lt_i32_e32 vcc, v24, v111
	v_add_u32_e32 v24, 0x103, v54
	buffer_load_ubyte v12, v12, s[24:27], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[76:79], a[12:15], v[168:171], v26, v43 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v24, v15, v24, vcc
	v_cmp_lt_i32_e32 vcc, v27, v108
	v_add_u32_e32 v27, 0x4100, v33
	v_mfma_scale_f32_16x16x128_f8f6f4 v[192:195], a[72:75], a[28:31], v[192:195], v26, v47 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v27, v15, v27, vcc
	v_cmp_lt_i32_e32 vcc, v30, v108
	v_add_u32_e32 v38, v9, v19
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[72:75], a[24:27], v[164:167], v26, v45 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v13, v15, v13, vcc
	buffer_load_ubyte v24, v24, s[24:27], 0 offen
	ds_read_b128 a[84:87], v10 offset:55296
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[72:75], a[4:7], v[180:183], v26, v28 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_load_ubyte v27, v27, s[24:27], 0 offen
	ds_read_b128 a[100:103], v11 offset:57344
	ds_read_b128 a[76:79], v10 offset:57344
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[72:75], a[12:15], v[176:179], v26, v43 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[72:75], v10 offset:59392
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[80:83], a[20:23], v[204:207], v26, v46 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], a[80:83], a[0:3], v[156:159], v26, v41 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], a[80:83], a[8:11], v[196:199], v26, v42 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[80:83], a[16:19], v[168:171], v26, v40 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b128 a[80:83], v11 offset:59392
	v_mfma_scale_f32_16x16x128_f8f6f4 v[192:195], a[124:127], a[20:23], v[192:195], v26, v46 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[124:127], a[0:3], v[164:167], v26, v41 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[124:127], a[8:11], v[180:183], v26, v42 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[124:127], a[16:19], v[176:179], v26, v40 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	buffer_load_ubyte v26, v13, s[24:27], 0 offen
	v_add_u32_e32 v13, v29, v115
	v_cmp_lt_i32_e32 vcc, v13, v111
	v_add_u32_e32 v13, 0x101, v38
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[116:119], a[28:31], v[188:191], v39, v47 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v13, v15, v13, vcc
	buffer_load_ubyte v29, v13, s[24:27], 0 offen
	v_add_u32_e32 v13, v48, v115
	v_cmp_lt_i32_e32 vcc, v13, v111
	v_add_u32_e32 v13, 0x103, v38
	v_mfma_scale_f32_16x16x128_f8f6f4 v[184:187], a[116:119], a[24:27], v[184:187], v39, v45 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v13, v15, v13, vcc
	buffer_load_ubyte v30, v13, s[24:27], 0 offen
	v_or_b32_e32 v13, 0x10c00, v9
	v_mfma_scale_f32_16x16x128_f8f6f4 v[208:211], a[116:119], a[4:7], v[56:59], v39, v28 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b32 v52, v13
	v_or_b32_e32 v13, 0x10d00, v9
	ds_read_b32 v80, v13
	v_mfma_scale_f32_16x16x128_f8f6f4 v[216:219], a[116:119], a[12:15], v[216:219], v39, v43 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_or_b32_e32 v13, 0x10e00, v9
	ds_read_b128 a[116:119], v10 offset:61440
	ds_read_b32 v44, v13
	v_mfma_scale_f32_16x16x128_f8f6f4 v[252:255], a[64:67], a[28:31], v[252:255], v39, v47 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_or_b32_e32 v13, 0x10f00, v9
	ds_read_b32 v13, v13
	v_mfma_scale_f32_16x16x128_f8f6f4 v[248:251], a[64:67], a[24:27], v[248:251], v39, v45 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[64:67], a[4:7], v[0:3], v39, v28 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[64:67], a[12:15], v[4:7], v39, v43 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[120:123], a[20:23], v[188:191], v39, v46 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[184:187], a[120:123], a[0:3], v[184:187], v39, v41 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[208:211], a[120:123], a[8:11], v[208:211], v39, v42 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[216:219], a[120:123], a[16:19], v[216:219], v39, v40 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[252:255], a[68:71], a[20:23], v[252:255], v39, v46 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[248:251], a[68:71], a[0:3], v[248:251], v39, v41 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[68:71], a[8:11], v[0:3], v39, v42 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[68:71], a[16:19], v[4:7], v39, v40 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(10) lgkmcnt(0)
	s_barrier
	v_accvgpr_mov_b32 a64, a228
	v_accvgpr_mov_b32 a65, a229
	v_accvgpr_mov_b32 a66, a230
	v_accvgpr_mov_b32 a67, a231
	v_accvgpr_read_b32 v8, a184
	v_add_u32_e32 v39, s54, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[128:131], a[28:31], a[64:67], v52, v47 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v53, 0x100, v39
	s_mov_b32 s22, s14
	s_mov_b32 s23, s15
	v_mfma_scale_f32_16x16x128_f8f6f4 a[228:231], a[108:111], a[20:23], a[64:67], v52, v46 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_mov_b32 m0, s35
	v_add_u32_e32 v81, 0x140100, v39
	buffer_load_dwordx4 v53, s[20:23], 0 offen lds
	v_add_u32_e32 v53, 0x40100, v39
	v_accvgpr_mov_b32 a64, a212
	v_accvgpr_mov_b32 a65, a213
	v_accvgpr_mov_b32 a66, a214
	v_accvgpr_mov_b32 a67, a215
	s_mov_b32 m0, s37
	s_waitcnt vmcnt(0)
	ds_read_b128 a[136:139], v11
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[128:131], a[24:27], a[64:67], v52, v45 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_load_dwordx4 v53, s[20:23], 0 offen lds
	v_add_u32_e32 v53, 0x80100, v39
	s_mov_b32 m0, s39
	v_mfma_scale_f32_16x16x128_f8f6f4 a[212:215], a[108:111], a[0:3], a[64:67], v52, v41 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	ds_read_b128 a[148:151], v10
	buffer_load_dwordx4 v53, s[20:23], 0 offen lds
	v_add_u32_e32 v53, 0xc0100, v39
	s_mov_b32 m0, s41
	v_accvgpr_mov_b32 a64, a224
	v_accvgpr_mov_b32 a65, a225
	v_accvgpr_mov_b32 a66, a226
	v_accvgpr_mov_b32 a67, a227
	s_waitcnt vmcnt(0)
	ds_read_b128 a[140:143], v11 offset:2048
	buffer_load_dwordx4 v53, s[20:23], 0 offen lds
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[128:131], a[4:7], a[64:67], v52, v28 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_mov_b32 m0, s43
	s_waitcnt vmcnt(0)
	ds_read_b128 a[144:147], v10 offset:2048
	v_mov_b32_e32 v8, v55
	v_mfma_scale_f32_16x16x128_f8f6f4 a[224:227], a[108:111], a[8:11], a[64:67], v52, v42 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_mov_b32 s6, s14
	s_mov_b32 s7, s15
	v_mfma_scale_f32_16x16x128_f8f6f4 a[240:243], a[104:107], a[24:27], a[240:243], v80, v45 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a64, a208
	v_accvgpr_mov_b32 a65, a209
	v_accvgpr_mov_b32 a66, a210
	v_accvgpr_mov_b32 a67, a211
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[88:91], a[28:31], v[68:71], v80, v47 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[128:131], a[12:15], a[64:67], v52, v43 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[208:211], a[108:111], a[16:19], a[64:67], v52, v40 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[88:91], a[24:27], v[64:67], v80, v45 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_mov_b32 a64, a220
	v_accvgpr_mov_b32 a65, a221
	v_accvgpr_mov_b32 a66, a222
	v_accvgpr_mov_b32 a67, a223
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[88:91], a[4:7], v[88:91], v80, v28 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[96:99], a[28:31], a[64:67], v52, v47 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[220:223], a[132:135], a[20:23], a[64:67], v52, v46 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[88:91], a[12:15], v[76:79], v80, v43 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_mov_b32 a64, a216
	v_accvgpr_mov_b32 a65, a217
	v_accvgpr_mov_b32 a66, a218
	v_accvgpr_mov_b32 a67, a219
	v_mfma_scale_f32_16x16x128_f8f6f4 a[240:243], a[92:95], a[0:3], a[240:243], v80, v41 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[96:99], a[24:27], a[64:67], v52, v45 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[216:219], a[132:135], a[0:3], a[64:67], v52, v41 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[84:87], a[20:23], v[68:71], v80, v46 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_mov_b32 a64, a236
	v_accvgpr_mov_b32 a65, a237
	v_accvgpr_mov_b32 a66, a238
	v_accvgpr_mov_b32 a67, a239
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[84:87], a[0:3], v[64:67], v80, v41 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[96:99], a[4:7], a[64:67], v52, v28 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[236:239], a[132:135], a[8:11], a[64:67], v52, v42 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[84:87], a[8:11], v[88:91], v80, v42 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_mov_b32 a64, a232
	v_accvgpr_mov_b32 a65, a233
	v_accvgpr_mov_b32 a66, a234
	v_accvgpr_mov_b32 a67, a235
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[84:87], a[16:19], v[76:79], v80, v40 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[96:99], a[12:15], a[64:67], v52, v43 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[232:235], a[132:135], a[16:19], a[64:67], v52, v40 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v52, 0x100100, v39
	buffer_load_dwordx4 v52, s[20:23], 0 offen lds
	s_mov_b32 m0, s45
	s_waitcnt vmcnt(0)
	ds_read_b128 a[128:131], v11 offset:4096
	s_nop 1
	v_accvgpr_mov_b32 a64, a244
	v_accvgpr_mov_b32 a65, a245
	v_accvgpr_mov_b32 a66, a246
	v_accvgpr_mov_b32 a67, a247
	buffer_load_dwordx4 v81, s[20:23], 0 offen lds
	v_add_u32_e32 v81, 0x180100, v39
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[104:107], a[28:31], a[64:67], v80, v47 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_mov_b32 m0, s47
	s_waitcnt vmcnt(0)
	ds_read_b128 a[132:135], v10 offset:4096
	buffer_load_dwordx4 v81, s[20:23], 0 offen lds
	v_mfma_scale_f32_16x16x128_f8f6f4 a[244:247], a[92:95], a[20:23], a[64:67], v80, v46 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v81, 0x1c0100, v39
	s_mov_b32 m0, s49
	v_add_u32_e32 v52, v8, v9
	s_waitcnt vmcnt(0)
	ds_read_b128 a[120:123], v11 offset:6144
	v_accvgpr_mov_b32 a64, a252
	v_accvgpr_mov_b32 a65, a253
	v_accvgpr_mov_b32 a66, a254
	v_accvgpr_mov_b32 a67, a255
	buffer_load_dwordx4 v81, s[20:23], 0 offen lds
	v_add_u32_e32 v81, 0x200, v52
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[104:107], a[4:7], a[64:67], v80, v28 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_mov_b32 m0, s50
	s_nop 0
	buffer_load_dword v81, s[4:7], 0 offen lds
	v_mfma_scale_f32_16x16x128_f8f6f4 a[252:255], a[92:95], a[8:11], a[64:67], v80, v42 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_mov_b32 m0, s52
	s_waitcnt vmcnt(0)
	ds_read_b128 a[124:127], v10 offset:6144
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], a[80:83], a[24:27], v[104:107], v44, v45 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a64, a248
	v_accvgpr_mov_b32 a65, a249
	v_accvgpr_mov_b32 a66, a250
	v_accvgpr_mov_b32 a67, a251
	v_mfma_scale_f32_16x16x128_f8f6f4 v[228:231], a[112:115], a[24:27], v[228:231], v13, v45 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[104:107], a[12:15], a[64:67], v80, v43 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[248:251], a[92:95], a[16:19], a[64:67], v80, v40 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v80, 0x10200, v52
	buffer_load_dword v80, s[4:7], 0 offen lds
	s_waitcnt vmcnt(0)
	ds_read_b128 a[104:107], v11 offset:8192
	v_mfma_scale_f32_16x16x128_f8f6f4 v[212:215], a[152:155], a[24:27], v[212:215], v13, v45 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 1
	v_accvgpr_mov_b32 a64, a196
	v_accvgpr_mov_b32 a65, a197
	v_accvgpr_mov_b32 a66, a198
	v_accvgpr_mov_b32 a67, a199
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], a[72:75], a[0:3], v[104:107], v44, v41 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b128 a[108:111], v10 offset:8192
	ds_read_b128 a[68:71], v10 offset:10240
	ds_read_b128 a[96:99], v11 offset:12288
	ds_read_b128 a[160:163], v11 offset:14336
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[100:103], a[24:27], a[64:67], v44, v45 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[88:91], v10 offset:12288
	v_mfma_scale_f32_16x16x128_f8f6f4 a[196:199], a[76:79], a[0:3], a[64:67], v44, v41 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[228:231], a[116:119], a[0:3], v[228:231], v13, v41 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 4
	ds_read_b128 a[64:67], v11 offset:10240
	v_mfma_scale_f32_16x16x128_f8f6f4 v[212:215], a[156:159], a[0:3], v[212:215], v13, v41 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a0, a200
	v_accvgpr_mov_b32 a1, a201
	v_accvgpr_mov_b32 a2, a202
	v_accvgpr_mov_b32 a3, a203
	v_mfma_scale_f32_16x16x128_f8f6f4 v[232:235], a[112:115], a[28:31], v[232:235], v13, v47 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], a[152:155], a[4:7], a[0:3], v13, v28 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[200:203], a[156:159], a[8:11], a[0:3], v13, v42 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[240:243], a[112:115], a[4:7], v[240:243], v13, v28 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_mov_b32 a0, a204
	v_accvgpr_mov_b32 a1, a205
	v_accvgpr_mov_b32 a2, a206
	v_accvgpr_mov_b32 a3, a207
	v_mfma_scale_f32_16x16x128_f8f6f4 v[236:239], a[112:115], a[12:15], v[236:239], v13, v43 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[244:247], a[152:155], a[28:31], v[244:247], v13, v47 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], a[152:155], a[12:15], a[0:3], v13, v43 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[152:155], v10 offset:14336
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], a[100:103], a[28:31], v[84:87], v44, v47 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[100:103], a[4:7], v[92:95], v44, v28 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[100:103], a[12:15], v[96:99], v44, v43 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], a[80:83], a[28:31], v[100:103], v44, v47 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[220:223], a[80:83], a[4:7], v[220:223], v44, v28 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[224:227], a[80:83], a[12:15], v[224:227], v44, v43 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[232:235], a[116:119], a[20:23], v[232:235], v13, v46 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[240:243], a[116:119], a[8:11], v[240:243], v13, v42 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[116:119], a[16:19], v[236:239], v13, v40 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[244:247], a[156:159], a[20:23], v[244:247], v13, v46 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[156:159], a[156:159], a[16:19], a[0:3], v13, v40 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_or_b32_e32 v13, 0x10000, v9
	ds_read_b32 v28, v13
	v_or_b32_e32 v13, 0x10100, v9
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], a[76:79], a[20:23], v[84:87], v44, v46 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 1
	v_accvgpr_write_b32 a171, v59
	v_accvgpr_write_b32 a170, v58
	v_accvgpr_write_b32 a169, v57
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[76:79], a[8:11], v[92:95], v44, v42 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a168, v56
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[76:79], a[16:19], v[96:99], v44, v40 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], a[72:75], a[20:23], v[100:103], v44, v46 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[220:223], a[72:75], a[8:11], v[220:223], v44, v42 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[224:227], a[72:75], a[16:19], v[224:227], v44, v40 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b32 v44, v13
	v_or_b32_e32 v13, 0x10200, v9
	ds_read_b32 v45, v13
	v_or_b32_e32 v13, 0x10300, v9
	ds_read_b32 v13, v13
	s_waitcnt vmcnt(10) lgkmcnt(0)
	s_barrier
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[136:139], a[32:35], v[72:75], v28, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v46, 0x100, v31
	v_lshrrev_b32_e32 v46, 9, v46
	v_add_u32_e32 v46, v46, v37
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[148:151], a[36:39], v[40:43], v28, v12 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v31, 0x140, v31
	v_cmp_lt_i32_e32 vcc, v46, v111
	v_add_u32_e32 v47, 0xfff9fc00, v21
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[136:139], a[40:43], v[124:127], v28, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v31, 9, v31
	v_cndmask_b32_e32 v47, v15, v47, vcc
	v_add_u32_e32 v31, v31, v37
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[148:151], a[44:47], v[40:43], v28, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	buffer_load_dwordx4 a[28:31], v47, s[12:15], 0 offen
	v_cmp_lt_i32_e32 vcc, v31, v111
	v_add_u32_e32 v47, 0xfffa0000, v21
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[136:139], a[52:55], v[132:135], v28, v27 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v47, v15, v47, vcc
	buffer_load_dwordx4 a[20:23], v47, s[12:15], 0 offen
	v_cmp_lt_i32_e32 vcc, v46, v110
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[148:151], a[48:51], v[40:43], v28, v26 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v47, 0xfffbfc00, v21
	v_cndmask_b32_e32 v47, v15, v47, vcc
	buffer_load_dwordx4 a[24:27], v47, s[12:15], 0 offen
	v_cmp_lt_i32_e32 vcc, v31, v110
	v_accvgpr_read_b32 v40, a174
	v_accvgpr_read_b32 v41, a175
	v_accvgpr_read_b32 v42, a176
	v_accvgpr_read_b32 v43, a177
	v_add_u32_e32 v47, 0xfffc0000, v21
	v_cndmask_b32_e32 v47, v15, v47, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[136:139], a[56:59], v[40:43], v28, v29 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_lt_i32_e32 vcc, v46, v108
	buffer_load_dwordx4 a[0:3], v47, s[12:15], 0 offen
	v_accvgpr_read_b32 v37, a181
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[148:151], a[60:63], v[40:43], v28, v30 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v34, 0xfffffdfd, v34
	ds_read_b128 a[76:79], v11 offset:16384
	ds_read_b128 a[72:75], v11 offset:18432
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[140:143], a[32:35], v[116:119], v28, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[84:87], v10 offset:16384
	ds_read_b128 a[92:95], v10 offset:18432
	ds_read_b128 a[100:103], v11 offset:20480
	ds_read_b128 a[80:83], v11 offset:22528
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[144:147], a[36:39], v[40:43], v28, v12 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b128 a[112:115], v10 offset:20480
	ds_read_b128 a[116:119], v10 offset:22528
	ds_read_b128 a[136:139], v10 offset:30720
	v_accvgpr_read_b32 v40, a188
	v_accvgpr_read_b32 v41, a189
	v_accvgpr_read_b32 v42, a190
	v_accvgpr_read_b32 v43, a191
	v_mfma_scale_f32_16x16x128_f8f6f4 v[208:211], a[96:99], a[52:55], v[208:211], v13, v27 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[140:143], a[40:43], v[40:43], v28, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[144:147], a[44:47], v[40:43], v28, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[140:143], a[52:55], v[128:131], v28, v27 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[144:147], a[48:51], v[40:43], v28, v26 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[140:143], a[56:59], v[120:123], v28, v29 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[144:147], a[60:63], v[40:43], v28, v30 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v28, 0xfffdfc00, v21
	v_cndmask_b32_e32 v28, v15, v28, vcc
	buffer_load_dwordx4 a[4:7], v28, s[12:15], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[128:131], a[32:35], v[140:143], v44, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_lt_i32_e32 vcc, v31, v108
	v_add_u32_e32 v28, 0xfffe0000, v21
	v_mfma_scale_f32_16x16x128_f8f6f4 v[140:143], a[132:135], a[36:39], v[40:43], v44, v12 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v28, v15, v28, vcc
	buffer_load_dwordx4 a[8:11], v28, s[12:15], 0 offen
	v_cmp_lt_i32_e32 vcc, v46, v109
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[128:131], a[40:43], v[136:139], v44, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v28, 0xfffffc00, v21
	v_cndmask_b32_e32 v28, v15, v28, vcc
	v_cmp_lt_i32_e32 vcc, v31, v109
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], a[132:135], a[44:47], v[40:43], v44, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	buffer_load_dwordx4 a[12:15], v28, s[12:15], 0 offen
	v_cndmask_b32_e32 v28, v15, v21, vcc
	buffer_load_dwordx4 a[16:19], v28, s[12:15], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[128:131], a[52:55], v[160:163], v44, v27 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_ashrrev_i32_e32 v28, 31, v32
	v_xor_b32_e32 v31, v28, v32
	v_ashrrev_i32_e32 v46, 31, v31
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], a[132:135], a[48:51], v[40:43], v44, v26 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v46, 23, v46
	v_add_u32_e32 v31, v31, v46
	v_ashrrev_i32_e32 v31, 9, v31
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[128:131], a[56:59], v[148:151], v44, v29 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_xor_b32_e32 v28, v31, v28
	v_accvgpr_read_b32 v31, a173
	v_add_u32_e32 v46, v28, v114
	v_mfma_scale_f32_16x16x128_f8f6f4 v[148:151], a[132:135], a[60:63], v[40:43], v44, v30 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v28, v28, v31
	v_and_b32_e32 v31, 0x1ff, v32
	v_lshl_or_b32 v28, v28, 9, v31
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[120:123], a[32:35], v[172:175], v44, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_lt_i32_e32 vcc, v46, v37
	v_add_u32_e32 v31, 0x200, v28
	v_add_u32_e32 v28, 0x4200, v28
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[124:127], a[36:39], v[40:43], v44, v12 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v31, v15, v31, vcc
	v_cmp_gt_i32_e32 vcc, s60, v32
	buffer_load_ubyte v31, v31, s[24:27], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[120:123], a[40:43], v[152:155], v44, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[132:135], v10 offset:24576
	ds_read_b128 a[128:131], v11 offset:30720
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[124:127], a[44:47], v[40:43], v44, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[120:123], a[52:55], v[200:203], v44, v27 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[124:127], a[48:51], v[40:43], v44, v26 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[120:123], a[56:59], v[144:147], v44, v29 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[120:123], v10 offset:28672
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[124:127], a[60:63], v[40:43], v44, v30 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v44, 0x202, v32
	v_add_u32_e32 v32, 0x200, v32
	v_cmp_gt_i32_e64 s[0:1], -2, v32
	v_cndmask_b32_e32 v47, v44, v34, vcc
	v_ashrrev_i32_e32 v109, 31, v47
	v_cndmask_b32_e64 v32, v44, v34, s[0:1]
	v_ashrrev_i32_e32 v34, 31, v32
	v_lshrrev_b32_e32 v109, 23, v109
	v_lshrrev_b32_e32 v34, 23, v34
	v_add_u32_e32 v47, v47, v109
	v_add_u32_e32 v32, v32, v34
	v_ashrrev_i32_e32 v47, 9, v47
	v_ashrrev_i32_e32 v109, 31, v44
	v_lshrrev_b32_e32 v32, 9, v32
	v_xor_b32_e32 v47, v47, v109
	v_xor_b32_e32 v32, v32, v109
	v_lshlrev_b32_e32 v32, 9, v32
	v_lshlrev_b32_e32 v34, 9, v47
	v_sub_u32_e32 v32, v34, v32
	v_add_u32_e32 v110, v47, v114
	v_add_u32_e32 v34, v33, v32
	v_cmp_lt_i32_e32 vcc, v110, v111
	v_add_u32_e32 v32, 0x202, v34
	v_add_u32_e32 v33, 1, v35
	v_cndmask_b32_e32 v32, v15, v32, vcc
	v_cmp_gt_i32_e32 vcc, -1, v35
	v_add_u32_e32 v44, -2, v36
	buffer_load_ubyte v32, v32, s[24:27], 0 offen
	v_cndmask_b32_e32 v44, v33, v44, vcc
	v_ashrrev_i32_e32 v47, 31, v44
	v_lshrrev_b32_e32 v47, 23, v47
	v_add_u32_e32 v44, v44, v47
	v_ashrrev_i32_e32 v44, 9, v44
	v_ashrrev_i32_e32 v33, 31, v33
	v_xor_b32_e32 v44, v44, v33
	v_add_u32_e32 v33, v44, v113
	v_cmp_lt_i32_e32 vcc, v33, v37
	v_add_u32_e32 v33, 0x201, v54
	v_add_u32_e32 v47, 0x203, v35
	v_cndmask_b32_e32 v33, v15, v33, vcc
	v_cmp_gt_i32_e32 vcc, s61, v35
	v_add_u32_e32 v35, 0xfffffdfc, v36
	buffer_load_ubyte v33, v33, s[24:27], 0 offen
	v_cndmask_b32_e32 v35, v47, v35, vcc
	v_ashrrev_i32_e32 v36, 31, v35
	v_lshrrev_b32_e32 v36, 23, v36
	v_add_u32_e32 v35, v35, v36
	v_ashrrev_i32_e32 v35, 9, v35
	v_ashrrev_i32_e32 v36, 31, v47
	v_xor_b32_e32 v47, v35, v36
	v_add_u32_e32 v35, v47, v113
	v_cmp_lt_i32_e32 vcc, v35, v111
	v_add_u32_e32 v35, 0x203, v54
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[88:91], a[48:51], v[208:211], v13, v26 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v35, v15, v35, vcc
	buffer_load_ubyte v109, v35, s[24:27], 0 offen
	v_accvgpr_read_b32 v35, a182
	v_cmp_lt_i32_e32 vcc, v46, v35
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[104:107], a[32:35], v[204:207], v45, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[124:127], v11 offset:24576
	v_cndmask_b32_e32 v28, v15, v28, vcc
	buffer_load_ubyte v35, v28, s[24:27], 0 offen
	v_cmp_lt_i32_e32 vcc, v110, v108
	v_add_u32_e32 v28, 0x4202, v34
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[108:111], a[36:39], v[40:43], v45, v12 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v28, v15, v28, vcc
	buffer_load_ubyte v108, v28, s[24:27], 0 offen
	v_add_u32_e32 v28, v44, v115
	v_cmp_lt_i32_e32 vcc, v28, v37
	v_add_u32_e32 v28, 0x201, v38
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[104:107], a[40:43], v[156:159], v45, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v28, v15, v28, vcc
	buffer_load_ubyte v34, v28, s[24:27], 0 offen
	v_add_u32_e32 v28, v47, v115
	v_cmp_lt_i32_e32 vcc, v28, v111
	v_add_u32_e32 v28, 0x203, v38
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], a[108:111], a[44:47], v[40:43], v45, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v28, v15, v28, vcc
	buffer_load_ubyte v209, v28, s[24:27], 0 offen
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[104:107], a[52:55], v[196:199], v45, v27 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], a[108:111], a[48:51], v[40:43], v45, v26 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[104:107], a[56:59], v[168:171], v45, v29 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[236:239], a[160:163], a[32:35], v[252:255], v13, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[108:111], a[60:63], v[40:43], v45, v30 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[64:67], a[32:35], v[192:195], v45, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[96:99], a[32:35], v[188:191], v13, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[184:187], a[96:99], a[40:43], v[184:187], v13, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[216:219], a[96:99], a[56:59], v[216:219], v13, v29 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[252:255], a[152:155], a[36:39], v[236:239], v13, v12 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[236:239], a[160:163], a[40:43], v[248:251], v13, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[160:163], a[52:55], v[0:3], v13, v27 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[160:163], a[56:59], v[4:7], v13, v29 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[192:195], a[68:71], a[36:39], v[40:43], v45, v12 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[64:67], a[40:43], v[164:167], v45, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[64:67], a[52:55], v[180:183], v45, v27 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[64:67], a[56:59], v[176:179], v45, v29 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[64:67], v11 offset:28672
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[88:91], a[36:39], v[188:191], v13, v12 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[184:187], a[88:91], a[44:47], v[184:187], v13, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[216:219], a[88:91], a[60:63], v[216:219], v13, v30 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[248:251], a[152:155], a[44:47], v[236:239], v13, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[152:155], a[48:51], v[0:3], v13, v26 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[152:155], a[60:63], v[4:7], v13, v30 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_or_b32_e32 v13, 0x10400, v9
	ds_read_b32 v28, v13
	v_or_b32_e32 v13, 0x10500, v9
	ds_read_b32 v44, v13
	v_or_b32_e32 v13, 0x10600, v9
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[68:71], a[44:47], v[40:43], v45, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[68:71], a[48:51], v[180:183], v45, v26 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 1
	ds_read_b128 v[40:43], v11 offset:26624
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[68:71], a[60:63], v[176:179], v45, v30 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b128 a[68:71], v10 offset:26624
	ds_read_b32 v45, v13
	v_or_b32_e32 v13, 0x10700, v9
	ds_read_b32 v13, v13
	s_waitcnt vmcnt(10) lgkmcnt(0)
	s_barrier
	v_mfma_scale_f32_16x16x128_f8f6f4 a[228:231], a[76:79], a[32:35], a[228:231], v28, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v46, 0x180, v39
	s_mov_b32 m0, s34
	v_mov_b32_e32 v36, v52
	v_mfma_scale_f32_16x16x128_f8f6f4 a[212:215], a[76:79], a[40:43], a[212:215], v28, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_load_dwordx4 v46, s[20:23], 0 offen lds
	v_add_u32_e32 v46, 0x40180, v39
	s_mov_b32 m0, s36
	v_mfma_scale_f32_16x16x128_f8f6f4 a[224:227], a[76:79], a[52:55], a[224:227], v28, v27 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	ds_read_b128 a[96:99], v11 offset:32768
	buffer_load_dwordx4 v46, s[20:23], 0 offen lds
	v_add_u32_e32 v46, 0x80180, v39
	v_mfma_scale_f32_16x16x128_f8f6f4 a[208:211], a[76:79], a[56:59], a[208:211], v28, v29 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_mov_b32 m0, s38
	s_waitcnt vmcnt(0)
	ds_read_b128 a[108:111], v10 offset:32768
	buffer_load_dwordx4 v46, s[20:23], 0 offen lds
	v_mfma_scale_f32_16x16x128_f8f6f4 a[220:223], a[72:75], a[32:35], a[220:223], v28, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v46, 0xc0180, v39
	s_mov_b32 m0, s40
	s_waitcnt vmcnt(0)
	ds_read_b128 a[88:91], v11 offset:34816
	v_mfma_scale_f32_16x16x128_f8f6f4 a[216:219], a[72:75], a[40:43], a[216:219], v28, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_load_dwordx4 v46, s[20:23], 0 offen lds
	s_mov_b32 m0, s42
	s_waitcnt vmcnt(0)
	ds_read_b128 a[104:107], v10 offset:34816
	v_mfma_scale_f32_16x16x128_f8f6f4 a[236:239], a[72:75], a[52:55], a[236:239], v28, v27 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a207, a159
	v_accvgpr_mov_b32 a206, a158
	v_accvgpr_mov_b32 a205, a157
	v_mfma_scale_f32_16x16x128_f8f6f4 a[232:235], a[72:75], a[56:59], a[232:235], v28, v29 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a204, a156
	v_mfma_scale_f32_16x16x128_f8f6f4 a[244:247], a[100:103], a[32:35], a[244:247], v44, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[240:243], a[100:103], a[40:43], a[240:243], v44, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[252:255], a[100:103], a[52:55], a[252:255], v44, v27 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[248:251], a[100:103], a[56:59], a[248:251], v44, v29 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[228:231], a[84:87], a[36:39], a[228:231], v28, v12 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[212:215], a[84:87], a[44:47], a[212:215], v28, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[224:227], a[84:87], a[48:51], a[224:227], v28, v26 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[208:211], a[84:87], a[60:63], a[208:211], v28, v30 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[220:223], a[92:95], a[36:39], a[220:223], v28, v12 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[216:219], a[92:95], a[44:47], a[216:219], v28, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[236:239], a[92:95], a[48:51], a[236:239], v28, v26 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[232:235], a[92:95], a[60:63], a[232:235], v28, v30 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v28, 0x100180, v39
	buffer_load_dwordx4 v28, s[20:23], 0 offen lds
	v_add_u32_e32 v28, 0x140180, v39
	s_mov_b32 m0, s44
	s_waitcnt vmcnt(0)
	ds_read_b128 a[92:95], v11 offset:36864
	buffer_load_dwordx4 v28, s[20:23], 0 offen lds
	v_add_u32_e32 v28, 0x180180, v39
	s_mov_b32 m0, s46
	v_mfma_scale_f32_16x16x128_f8f6f4 a[244:247], a[112:115], a[36:39], a[244:247], v44, v12 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[240:243], a[112:115], a[44:47], a[240:243], v44, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[252:255], a[112:115], a[48:51], a[252:255], v44, v26 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[248:251], a[112:115], a[60:63], a[248:251], v44, v30 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	ds_read_b128 a[112:115], v10 offset:36864
	buffer_load_dwordx4 v28, s[20:23], 0 offen lds
	v_add_u32_e32 v28, 0x1c0180, v39
	s_mov_b32 m0, s48
	s_waitcnt vmcnt(0)
	ds_read_b128 a[84:87], v11 offset:38912
	buffer_load_dwordx4 v28, s[20:23], 0 offen lds
	v_add_u32_e32 v28, 0x300, v36
	s_mov_b32 m0, s51
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[80:83], a[32:35], v[68:71], v44, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_load_dword v28, s[4:7], 0 offen lds
	v_add_u32_e32 v28, 0x10300, v36
	s_mov_b32 m0, s53
	s_waitcnt vmcnt(0)
	ds_read_b128 a[100:103], v10 offset:38912
	buffer_load_dword v28, s[4:7], 0 offen lds
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[116:119], a[36:39], v[46:49], v44, v12 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v36, a168
	v_accvgpr_read_b32 v37, a169
	v_accvgpr_read_b32 v38, a170
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[80:83], a[40:43], v[64:67], v44, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v39, a171
	s_waitcnt vmcnt(0)
	ds_read_b128 a[76:79], v11 offset:40960
	ds_read_b128 a[72:75], v11 offset:43008
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[116:119], a[44:47], v[46:49], v44, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[80:83], a[52:55], v[88:91], v44, v27 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[116:119], a[48:51], v[46:49], v44, v26 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[80:83], a[56:59], v[76:79], v44, v29 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[80:83], v10 offset:40960
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[116:119], a[60:63], v[46:49], v44, v30 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b128 a[116:119], v11 offset:45056
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[124:127], a[32:35], v[84:87], v45, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], a[132:135], a[36:39], v[46:49], v45, v12 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[124:127], a[52:55], v[92:95], v45, v27 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[132:135], a[48:51], v[46:49], v45, v26 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], a[124:127], a[56:59], v[96:99], v45, v29 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[132:135], a[60:63], v[46:49], v45, v30 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], v[40:43], a[32:35], v[100:103], v45, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], a[68:71], a[36:39], v[46:49], v45, v12 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[46:49], v[40:43], a[40:43], v[104:107], v45, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[220:223], v[40:43], a[52:55], v[220:223], v45, v27 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[40:43], a[56:59], v[224:227], v45, v29 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[224:227], a[68:71], a[60:63], v[40:43], v45, v30 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[64:67], a[32:35], v[232:235], v13, v22 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[232:235], a[120:123], a[36:39], v[40:43], v13, v12 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[64:67], a[40:43], v[228:231], v13, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[228:231], a[120:123], a[44:47], v[40:43], v13, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[64:67], a[52:55], v[240:243], v13, v27 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[240:243], a[120:123], a[48:51], v[40:43], v13, v26 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[64:67], a[56:59], v[36:39], v13, v29 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[64:67], v11 offset:47104
	v_mfma_scale_f32_16x16x128_f8f6f4 v[236:239], a[120:123], a[60:63], v[40:43], v13, v30 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b128 a[120:123], v10 offset:45056
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[128:131], a[32:35], v[244:247], v13, v22 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[244:247], a[136:139], a[36:39], v[40:43], v13, v12 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v12, a195
	ds_read_b32 v22, v12
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[128:131], a[40:43], v[212:215], v13, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[200:203], a[128:131], a[52:55], a[200:203], v13, v27 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[204:207], a[128:131], a[56:59], a[204:207], v13, v29 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[196:199], a[124:127], a[40:43], a[196:199], v45, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 a[124:127], v10 offset:43008
	v_mfma_scale_f32_16x16x128_f8f6f4 v[212:215], a[136:139], a[44:47], v[40:43], v13, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[200:203], a[136:139], a[48:51], a[200:203], v13, v26 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[204:207], a[136:139], a[60:63], a[204:207], v13, v30 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v13, a172
	v_mfma_scale_f32_16x16x128_f8f6f4 v[220:223], a[68:71], a[48:51], v[220:223], v45, v26 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b32 v26, v13
	v_accvgpr_read_b32 v12, a164
	v_accvgpr_read_b32 v13, a179
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], a[68:71], a[44:47], v[46:49], v45, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b128 a[68:71], v10 offset:47104
	ds_read_b32 v12, v12
	ds_read_b32 v39, v13
	v_mfma_scale_f32_16x16x128_f8f6f4 a[196:199], a[132:135], a[44:47], a[196:199], v45, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(10) lgkmcnt(0)
	s_barrier
	s_add_i32 s8, s8, 2
	s_addk_i32 s54, 0x100
	v_add_u32_e32 v55, 0x200, v8
	v_add_u32_e32 v112, 0x200, v112
	v_add_u32_e32 v14, 0x200, v14
	v_add_u32_e32 v16, 0xfffffe00, v16
	v_add_u32_e32 v17, 0xfffffe00, v17
	v_add_u32_e32 v18, 0x200, v18
	v_add_u32_e32 v19, 0x200, v19
	v_add_u32_e32 v20, 0x200, v20
	v_add_u32_e32 v21, 0x1000, v21
	s_cmp_lt_u32 s8, 60
	v_add_u32_e32 v23, 0xffffff00, v23
	s_cbranch_scc1 .LBB0_1
	scratch_load_dword v36, off, off offset:116
	scratch_load_dword v8, off, off offset:80
	s_movk_i32 s0, 0x100
	v_accvgpr_read_b32 v19, a167
	v_bfrev_b32_e32 v18, -2
	v_accvgpr_read_b32 v20, a166
	v_accvgpr_read_b32 v30, a193
	v_accvgpr_read_b32 v21, a194
	v_accvgpr_read_b32 v37, a167
	s_movk_i32 s1, 0xfeff
	v_accvgpr_read_b32 v28, a192
	v_accvgpr_read_b32 v27, a187
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v13, v8, v36
	scratch_load_dword v8, off, off offset:120
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier
	scratch_store_dword off, v20, off offset:136
	scratch_store_dword off, v37, off offset:140
	scratch_store_dword off, v30, off offset:132
	v_add3_u32 v13, v13, v8, s0
	v_mov_b32_e32 v8, v51
	v_or_b32_e32 v14, 15, v8
	scratch_load_dword v8, off, off offset:16
	v_add_u32_e32 v15, s33, v14
	v_lshlrev_b32_e32 v14, 13, v14
	v_cmp_lt_i32_e32 vcc, v15, v19
	s_movk_i32 s0, 0xff00
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v16, 0x1800, v8
	v_add_u32_e32 v19, 0x1c00, v8
	v_add_u32_e32 v17, v16, v14
	v_add_u32_e32 v14, v19, v14
	v_cndmask_b32_e32 v17, v18, v17, vcc
	v_cndmask_b32_e32 v14, v18, v14, vcc
	v_mov_b32_e32 v8, v50
	buffer_load_dwordx4 a[32:35], v17, s[12:15], 0 offen
	buffer_load_dwordx4 a[36:39], v14, s[12:15], 0 offen
	v_add_u32_e32 v14, 0x1e000, v8
	v_add_u32_e32 v17, v16, v14
	v_cmp_lt_i32_e32 vcc, v15, v20
	v_add_u32_e32 v14, v19, v14
	s_nop 0
	v_cndmask_b32_e32 v17, v18, v17, vcc
	v_cndmask_b32_e32 v14, v18, v14, vcc
	buffer_load_dwordx4 a[40:43], v17, s[12:15], 0 offen
	buffer_load_dwordx4 a[44:47], v14, s[12:15], 0 offen
	v_add_u32_e32 v14, 0x3e000, v8
	v_add_u32_e32 v17, v16, v14
	v_cmp_lt_i32_e32 vcc, v15, v30
	v_add_u32_e32 v14, v19, v14
	s_nop 0
	v_cndmask_b32_e32 v17, v18, v17, vcc
	v_cndmask_b32_e32 v14, v18, v14, vcc
	buffer_load_dwordx4 a[48:51], v17, s[12:15], 0 offen
	buffer_load_dwordx4 a[52:55], v14, s[12:15], 0 offen
	v_add_u32_e32 v14, 0x5e000, v8
	v_add_u32_e32 v16, v16, v14
	v_add_u32_e32 v14, v19, v14
	scratch_load_dword v19, off, off offset:32
	v_accvgpr_read_b32 v8, a165
	v_cmp_lt_i32_e32 vcc, v15, v8
	scratch_store_dword off, v8, off offset:128
	v_accvgpr_read_b32 v8, a173
	v_cndmask_b32_e32 v15, v18, v16, vcc
	v_cndmask_b32_e32 v14, v18, v14, vcc
	buffer_load_dwordx4 a[56:59], v15, s[12:15], 0 offen
	buffer_load_dwordx4 a[60:63], v14, s[12:15], 0 offen
	s_waitcnt vmcnt(3)
	v_add_u32_e32 v16, 0x100, v19
	v_sub_u32_e32 v17, 0xfffffeff, v19
	v_cmp_gt_i32_e32 vcc, s0, v19
	v_add_u32_e32 v14, 0x3f00, v19
	v_lshrrev_b32_e32 v14, 9, v14
	v_cndmask_b32_e32 v16, v16, v17, vcc
	v_ashrrev_i32_e32 v17, 31, v16
	v_lshrrev_b32_e32 v17, 23, v17
	v_add_u32_e32 v16, v16, v17
	v_lshrrev_b32_e32 v16, 9, v16
	v_cndmask_b32_e64 v17, 0, -1, vcc
	v_xor_b32_e32 v16, v16, v17
	v_add_u32_e32 v17, 0x3f02, v19
	v_lshrrev_b32_e32 v19, 9, v17
	v_add_u32_e32 v15, v14, v8
	v_add_u32_e32 v20, v19, v8
	scratch_load_dword v8, off, off offset:64
	v_lshlrev_b32_e32 v16, 9, v16
	v_and_b32_e32 v17, 0xfffffe00, v17
	v_add_u32_e32 v14, v21, v14
	v_sub_u32_e32 v16, v13, v16
	v_sub_u32_e32 v13, v13, v17
	v_lshl_add_u32 v15, v15, 9, v16
	v_cmp_lt_i32_e32 vcc, v14, v37
	v_add_u32_e32 v19, v21, v19
	v_lshl_add_u32 v13, v20, 9, v13
	v_cndmask_b32_e32 v16, v18, v15, vcc
	v_add_u32_e32 v17, 0x3e02, v13
	v_cmp_lt_i32_e32 vcc, v19, v37
	v_add_u32_e32 v15, 0x4000, v15
	v_add_u32_e32 v13, 0x7e02, v13
	v_cndmask_b32_e32 v17, v18, v17, vcc
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v24, 0x101, v8
	v_sub_u32_e32 v25, 0xfffffefe, v8
	v_cmp_gt_i32_e32 vcc, s1, v8
	v_add_u32_e32 v20, 0x3f01, v8
	v_lshrrev_b32_e32 v20, 9, v20
	v_cndmask_b32_e32 v24, v24, v25, vcc
	v_ashrrev_i32_e32 v25, 31, v24
	v_lshrrev_b32_e32 v25, 23, v25
	v_add_u32_e32 v24, v24, v25
	v_add_u32_e32 v23, v28, v20
	v_lshrrev_b32_e32 v24, 9, v24
	v_cndmask_b32_e64 v25, 0, -1, vcc
	v_xor_b32_e32 v24, v24, v25
	scratch_load_dword v25, off, off offset:48
	v_cmp_lt_i32_e32 vcc, v23, v37
	v_add_u32_e32 v23, 0x3f03, v8
	scratch_load_dword v8, off, off offset:96
	v_lshlrev_b32_e32 v24, 9, v24
	v_add_u32_e32 v21, v20, v27
	s_waitcnt vmcnt(0)
	v_or_b32_e32 v29, 3, v8
	scratch_load_dword v8, off, off
	v_sub_u32_e32 v24, v25, v24
	v_lshrrev_b32_e32 v25, 9, v23
	v_and_b32_e32 v23, 0xfffffe00, v23
	v_add_u32_e32 v24, 0x100, v24
	v_lshl_add_u32 v21, v21, 9, v24
	v_add_u32_e32 v27, v25, v27
	v_add_u32_e32 v28, v28, v25
	v_cndmask_b32_e32 v21, v18, v21, vcc
	v_cmp_lt_i32_e32 vcc, v28, v37
	v_accvgpr_read_b32 v28, a186
	s_waitcnt vmcnt(0)
	v_sub_u32_e32 v29, v29, v8
	scratch_load_dword v8, off, off offset:112
	s_waitcnt vmcnt(0)
	v_add3_u32 v29, v36, v29, v8
	scratch_load_dword v8, off, off offset:124
	v_sub_u32_e32 v23, v29, v23
	v_add_u32_e32 v23, 0x3f00, v23
	v_lshl_add_u32 v27, v27, 9, v23
	v_cndmask_b32_e32 v27, v18, v27, vcc
	v_cmp_lt_i32_e32 vcc, v14, v30
	s_nop 1
	v_cndmask_b32_e32 v14, v18, v15, vcc
	v_cmp_lt_i32_e32 vcc, v19, v30
	v_add_u32_e32 v19, v28, v20
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v15, v20, v8
	v_cndmask_b32_e32 v13, v18, v13, vcc
	v_lshl_add_u32 v15, v15, 9, v24
	v_cmp_lt_i32_e32 vcc, v19, v37
	v_add_u32_e32 v19, v25, v8
	v_add_u32_e32 v20, v28, v25
	v_cndmask_b32_e32 v15, v18, v15, vcc
	v_lshl_add_u32 v19, v19, 9, v23
	v_cmp_lt_i32_e32 vcc, v20, v37
	s_nop 1
	v_cndmask_b32_e32 v18, v18, v19, vcc
	buffer_load_ubyte v8, v16, s[24:27], 0 offen
	buffer_load_ubyte v24, v17, s[24:27], 0 offen
	buffer_load_ubyte v25, v21, s[24:27], 0 offen
	s_nop 0
	buffer_load_ubyte v27, v27, s[24:27], 0 offen
	s_nop 0
	buffer_load_ubyte v36, v14, s[24:27], 0 offen
	buffer_load_ubyte v37, v13, s[24:27], 0 offen
	buffer_load_ubyte v38, v15, s[24:27], 0 offen
	buffer_load_ubyte v208, v18, s[24:27], 0 offen
	v_or_b32_e32 v13, 0x10c00, v9
	v_or_b32_e32 v14, 0x10d00, v9
	v_or_b32_e32 v15, 0x10e00, v9
	v_or_b32_e32 v16, 0x10f00, v9
	ds_read_b32 v13, v13
	ds_read_b32 v23, v14
	ds_read_b32 v28, v15
	ds_read_b32 v210, v16
	ds_read_b128 v[52:55], v11 offset:49152
	ds_read_b128 a[128:131], v11 offset:51200
	ds_read_b128 a[132:135], v10 offset:49152
	ds_read_b128 a[136:139], v10 offset:51200
	ds_read_b128 a[140:143], v11 offset:53248
	ds_read_b128 a[144:147], v11 offset:55296
	ds_read_b128 a[148:151], v10 offset:53248
	ds_read_b128 a[152:155], v10 offset:55296
	ds_read_b128 a[156:159], v11 offset:57344
	ds_read_b128 a[160:163], v11 offset:59392
	ds_read_b128 a[164:167], v10 offset:57344
	ds_read_b128 a[168:171], v10 offset:59392
	ds_read_b128 a[172:175], v11 offset:61440
	ds_read_b128 a[176:179], v11 offset:63488
	ds_read_b128 a[180:183], v10 offset:61440
	ds_read_b128 a[184:187], v10 offset:63488
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier
	v_mfma_scale_f32_16x16x128_f8f6f4 v[14:17], a[96:99], a[28:31], v[72:75], v22, v31 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mov_b32_e32 v29, v108
	v_mfma_scale_f32_16x16x128_f8f6f4 v[14:17], a[108:111], a[20:23], v[14:17], v22, v32 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[18:21], a[96:99], a[24:27], v[124:127], v22, v33 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], a[88:91], a[28:31], v[116:119], v22, v31 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_write_b32 a191, v17
	v_accvgpr_write_b32 a190, v16
	v_accvgpr_write_b32 a189, v15
	v_accvgpr_write_b32 a188, v14
	v_mfma_scale_f32_16x16x128_f8f6f4 v[14:17], a[108:111], a[0:3], v[18:21], v22, v109 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[88:91], a[24:27], v[60:63], v22, v33 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[96:99], a[4:7], v[132:135], v22, v35 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_write_b32 a195, v17
	v_accvgpr_write_b32 a194, v16
	v_accvgpr_write_b32 a193, v15
	v_accvgpr_write_b32 a192, v14
	v_mfma_scale_f32_16x16x128_f8f6f4 v[14:17], a[104:107], a[20:23], v[48:51], v22, v32 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], a[108:111], a[8:11], v[40:43], v22, v108 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[84:87], a[24:27], v[152:155], v12, v33 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	scratch_store_dwordx4 off, v[14:17], off offset:96
	s_nop 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[14:17], a[104:107], a[0:3], v[72:75], v22, v109 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], a[88:91], a[12:15], v[120:123], v22, v34 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[104:107], a[16:19], v[112:115], v22, v209 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 5
	scratch_store_dwordx4 off, v[14:17], off offset:16
	s_nop 1
	v_mov_b32_e32 v14, v109
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], a[88:91], a[4:7], v[128:131], v22, v35 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[84:87], a[28:31], v[172:175], v12, v31 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[72:75], a[12:15], v[176:179], v26, v34 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], a[104:107], a[8:11], v[108:111], v22, v29 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], a[100:103], a[0:3], v[132:135], v12, v14 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[124:127], a[16:19], v[172:175], v26, v209 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[116:119], a[28:31], v[188:191], v39, v31 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[64:67], a[28:31], v[252:255], v39, v31 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], a[92:95], a[28:31], v[140:143], v12, v31 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[92:95], a[24:27], v[136:139], v12, v33 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], a[84:87], a[4:7], v[200:203], v12, v35 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[64:67], a[4:7], v[0:3], v39, v35 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[252:255], a[68:71], a[20:23], v[188:191], v39, v32 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[64:67], a[24:27], v[248:251], v39, v33 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[64:67], a[12:15], v[4:7], v39, v34 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a64, a224
	v_accvgpr_mov_b32 a65, a225
	v_accvgpr_mov_b32 a66, a226
	v_accvgpr_mov_b32 a67, a227
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], a[112:115], a[20:23], v[112:115], v12, v32 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], v[52:55], a[4:7], a[64:67], v13, v35 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], a[100:103], a[8:11], v[136:139], v12, v29 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 4
	scratch_store_dwordx4 off, v[16:19], off offset:32
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], a[68:71], a[8:11], v[0:3], v39, v29 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_read_b32 v0, a228
	v_accvgpr_read_b32 v1, a229
	v_accvgpr_read_b32 v2, a230
	v_accvgpr_read_b32 v3, a231
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[92:95], a[4:7], v[160:163], v12, v35 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], a[72:75], a[28:31], v[192:195], v26, v31 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[192:195], v[52:55], a[28:31], v[0:3], v13, v31 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_read_b32 v0, a212
	v_accvgpr_read_b32 v1, a213
	v_accvgpr_read_b32 v2, a214
	v_accvgpr_read_b32 v3, a215
	v_mfma_scale_f32_16x16x128_f8f6f4 a[212:215], a[132:135], a[8:11], a[64:67], v13, v29 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_mov_b32 a64, a208
	v_accvgpr_mov_b32 a65, a209
	v_accvgpr_mov_b32 a66, a210
	v_accvgpr_mov_b32 a67, a211
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[76:79], a[4:7], v[196:199], v26, v35 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], v[52:55], a[12:15], a[64:67], v13, v34 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[208:211], a[132:135], a[16:19], a[64:67], v13, v209 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], v[52:55], a[24:27], v[0:3], v13, v33 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_mov_b32 a64, a220
	v_accvgpr_mov_b32 a65, a221
	v_accvgpr_mov_b32 a66, a222
	v_accvgpr_mov_b32 a67, a223
	v_accvgpr_read_b32 v0, a244
	v_accvgpr_read_b32 v1, a245
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[128:131], a[28:31], a[64:67], v13, v31 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v2, a246
	v_accvgpr_read_b32 v3, a247
	v_mfma_scale_f32_16x16x128_f8f6f4 a[220:223], a[136:139], a[20:23], a[64:67], v13, v32 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], a[140:143], a[28:31], v[0:3], v23, v31 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_mov_b32 a64, a216
	v_accvgpr_mov_b32 a65, a217
	v_accvgpr_mov_b32 a66, a218
	v_accvgpr_mov_b32 a67, a219
	v_accvgpr_read_b32 v0, a252
	v_accvgpr_read_b32 v1, a253
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[128:131], a[24:27], a[64:67], v13, v33 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v2, a254
	v_accvgpr_read_b32 v3, a255
	v_mfma_scale_f32_16x16x128_f8f6f4 a[216:219], a[136:139], a[0:3], a[64:67], v13, v14 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[140:143], a[4:7], v[0:3], v23, v35 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_mov_b32 a64, a236
	v_accvgpr_mov_b32 a65, a237
	v_accvgpr_mov_b32 a66, a238
	v_accvgpr_mov_b32 a67, a239
	v_accvgpr_read_b32 v0, a248
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[160:163], a[4:7], v[220:223], v28, v35 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v1, a249
	v_accvgpr_read_b32 v2, a250
	v_accvgpr_read_b32 v3, a251
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[128:131], a[4:7], a[64:67], v13, v35 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[224:227], a[136:139], a[8:11], a[64:67], v13, v29 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[92:95], a[12:15], v[148:151], v12, v34 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_mov_b32 a64, a232
	v_accvgpr_mov_b32 a65, a233
	v_accvgpr_mov_b32 a66, a234
	v_mfma_scale_f32_16x16x128_f8f6f4 v[148:151], a[76:79], a[24:27], v[156:159], v26, v33 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a67, a235
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], a[76:79], a[12:15], v[168:171], v26, v34 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[72:75], a[4:7], v[180:183], v26, v35 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[116:119], a[4:7], v[56:59], v39, v35 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[140:143], a[12:15], v[0:3], v23, v34 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_read_b32 v0, a196
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[128:131], a[12:15], a[64:67], v13, v34 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v1, a197
	v_accvgpr_read_b32 v2, a198
	v_accvgpr_read_b32 v3, a199
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], a[96:99], a[12:15], v[80:83], v22, v34 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[156:159], a[24:27], v[0:3], v28, v33 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[168:171], a[8:11], v[200:203], v28, v29 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], a[112:115], a[0:3], v[116:119], v12, v14 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[160:163], a[12:15], v[224:227], v28, v34 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[228:231], a[136:139], a[16:19], a[64:67], v13, v209 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 5
	scratch_store_dwordx4 off, v[16:19], off offset:48
	v_accvgpr_mov_b32 a64, a240
	v_accvgpr_mov_b32 a65, a241
	v_accvgpr_mov_b32 a66, a242
	v_accvgpr_mov_b32 a67, a243
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], a[156:159], a[28:31], v[84:87], v28, v31 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[156:159], a[4:7], v[92:95], v28, v35 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[156:159], a[12:15], v[96:99], v28, v34 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a159, v3
	v_accvgpr_write_b32 a158, v2
	v_accvgpr_write_b32 a157, v1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], a[112:115], a[8:11], v[120:123], v12, v29 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a156, v0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[140:143], a[84:87], a[12:15], v[144:147], v12, v34 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[76:79], a[28:31], v[204:207], v26, v31 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 4
	scratch_store_dwordx4 off, v[16:19], off offset:64
	v_mfma_scale_f32_16x16x128_f8f6f4 a[64:67], a[140:143], a[24:27], a[64:67], v23, v33 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[144:147], a[28:31], v[68:71], v23, v31 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[144:147], a[24:27], v[64:67], v23, v33 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[144:147], a[4:7], v[88:91], v23, v35 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[144:147], a[12:15], v[76:79], v23, v34 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], a[160:163], a[28:31], v[100:103], v28, v31 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], a[168:171], a[16:19], v[200:203], v28, v209 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[172:175], a[28:31], v[232:235], v210, v31 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[176:179], a[28:31], v[244:247], v210, v31 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], a[108:111], a[16:19], v[44:47], v22, v209 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], a[112:115], a[16:19], v[124:127], v12, v209 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[100:103], a[20:23], v[128:131], v12, v32 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[80:83], a[20:23], v[144:147], v26, v32 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 5
	scratch_store_dwordx4 off, v[16:19], off offset:80
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[80:83], a[0:3], v[148:151], v26, v14 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], a[124:127], a[20:23], v[160:163], v26, v32 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[72:75], a[24:27], v[164:167], v26, v33 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a72, a200
	v_accvgpr_mov_b32 a73, a201
	v_accvgpr_mov_b32 a74, a202
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[120:123], a[20:23], v[172:175], v39, v32 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a75, a203
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[116:119], a[24:27], v[184:187], v39, v33 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[192:195], a[132:135], a[20:23], v[192:195], v13, v32 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], a[148:151], a[20:23], v[52:55], v23, v32 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[232:235], a[148:151], a[0:3], a[64:67], v23, v14 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[148:151], a[8:11], v[60:63], v23, v29 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[148:151], a[16:19], v[56:59], v23, v209 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[152:155], a[20:23], v[68:71], v23, v32 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[152:155], a[0:3], v[64:67], v23, v14 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[152:155], a[8:11], v[88:91], v23, v29 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[152:155], a[16:19], v[76:79], v23, v209 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], a[164:167], a[20:23], v[84:87], v28, v32 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], a[168:171], a[20:23], v[100:103], v28, v32 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], a[160:163], a[24:27], v[104:107], v28, v33 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a163, v3
	v_accvgpr_write_b32 a162, v2
	v_accvgpr_write_b32 a161, v1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], a[180:183], a[20:23], v[200:203], v210, v32 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a160, v0
	v_or_b32_e32 v0, 0x10000, v9
	v_or_b32_e32 v1, 0x10500, v9
	v_mfma_scale_f32_16x16x128_f8f6f4 v[148:151], a[184:187], a[20:23], v[204:207], v210, v32 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_or_b32_e32 v2, 0x10600, v9
	v_or_b32_e32 v3, 0x10700, v9
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[172:175], a[24:27], v[228:231], v210, v33 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[30:33], a[176:179], a[24:27], v[212:215], v210, v33 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[100:103], a[16:19], v[140:143], v12, v209 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[140:143], a[184:187], a[0:3], v[30:33], v210, v14 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[30:33], a[172:175], a[4:7], v[240:243], v210, v35 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[72:75], a[176:179], a[4:7], a[72:75], v210, v35 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[124:127], a[0:3], v[164:167], v26, v14 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[120:123], a[0:3], v[176:179], v39, v14 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[68:71], a[0:3], v[188:191], v39, v14 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], a[132:135], a[0:3], v[196:199], v13, v14 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[164:167], a[0:3], v[80:83], v28, v14 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], a[168:171], a[0:3], v[104:107], v28, v14 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], a[180:183], a[0:3], v[200:203], v210, v14 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a0, a204
	v_accvgpr_mov_b32 a1, a205
	v_accvgpr_mov_b32 a2, a206
	v_mfma_scale_f32_16x16x128_f8f6f4 v[184:187], a[116:119], a[12:15], v[216:219], v39, v34 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a3, a207
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[80:83], a[8:11], v[152:155], v26, v29 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[124:127], a[8:11], v[168:171], v26, v29 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[120:123], a[8:11], v[180:183], v39, v29 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[164:167], a[8:11], v[92:95], v28, v29 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[164:167], a[16:19], v[96:99], v28, v209 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], a[180:183], a[8:11], v[30:33], v210, v29 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[164:167], a[184:187], a[8:11], a[72:75], v210, v29 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], a[172:175], a[12:15], v[236:239], v210, v34 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], a[176:179], a[12:15], a[0:3], v210, v34 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], a[80:83], a[16:19], v[156:159], v26, v209 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b32 v26, v0
	v_or_b32_e32 v0, 0x10100, v9
	v_mfma_scale_f32_16x16x128_f8f6f4 v[184:187], a[120:123], a[16:19], v[184:187], v39, v209 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[144:147], a[68:71], a[16:19], v[4:7], v39, v209 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b32 v39, v0
	v_or_b32_e32 v0, 0x10200, v9
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[180:183], a[16:19], v[28:31], v210, v209 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[168:171], a[184:187], a[16:19], a[0:3], v210, v209 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	ds_read_b32 v209, v0
	v_or_b32_e32 v0, 0x10300, v9
	ds_read_b32 v210, v0
	ds_read_b128 v[32:35], v11
	ds_read_b128 v[200:203], v11 offset:2048
	ds_read_b128 v[204:207], v10
	ds_read_b128 v[212:215], v10 offset:2048
	ds_read_b128 a[0:3], v11 offset:4096
	ds_read_b128 a[4:7], v11 offset:6144
	ds_read_b128 a[8:11], v10 offset:4096
	ds_read_b128 a[12:15], v10 offset:6144
	ds_read_b128 a[16:19], v11 offset:8192
	ds_read_b128 a[20:23], v11 offset:10240
	ds_read_b128 a[24:27], v10 offset:8192
	ds_read_b128 a[28:31], v10 offset:10240
	ds_read_b128 a[64:67], v11 offset:12288
	ds_read_b128 a[68:71], v11 offset:14336
	ds_read_b128 a[72:75], v10 offset:12288
	ds_read_b128 a[76:79], v10 offset:14336
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier
	ds_read_b128 a[80:83], v11 offset:16384
	ds_read_b128 a[84:87], v11 offset:18432
	ds_read_b128 a[88:91], v11 offset:20480
	ds_read_b128 a[92:95], v11 offset:22528
	ds_read_b128 a[96:99], v11 offset:24576
	ds_read_b128 a[100:103], v11 offset:26624
	ds_read_b128 a[104:107], v11 offset:28672
	ds_read_b128 a[108:111], v11 offset:30720
	ds_read_b128 a[112:115], v10 offset:16384
	ds_read_b128 a[116:119], v10 offset:18432
	ds_read_b128 a[120:123], v10 offset:20480
	ds_read_b128 a[124:127], v10 offset:22528
	ds_read_b128 a[128:131], v10 offset:24576
	ds_read_b128 a[132:135], v10 offset:26624
	ds_read_b128 a[136:139], v10 offset:28672
	ds_read_b128 a[140:143], v10 offset:30720
	v_or_b32_e32 v0, 0x10400, v9
	ds_read_b32 v9, v0
	ds_read_b32 v10, v1
	ds_read_b32 v11, v2
	ds_read_b32 v211, v3
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier
	v_accvgpr_read_b32 v0, a188
	v_accvgpr_read_b32 v1, a189
	v_accvgpr_read_b32 v2, a190
	v_accvgpr_read_b32 v3, a191
	v_accvgpr_write_b32 a147, v139
	v_accvgpr_write_b32 a146, v138
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[32:35], a[32:35], v[0:3], v26, v8 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a145, v137
	v_accvgpr_write_b32 a144, v136
	v_accvgpr_read_b32 v136, a212
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[204:207], a[36:39], v[28:31], v26, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v137, a213
	v_accvgpr_read_b32 v138, a214
	v_accvgpr_read_b32 v139, a215
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], a[88:91], a[32:35], v[52:55], v10, v8 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v28, a192
	v_accvgpr_read_b32 v29, a193
	v_accvgpr_read_b32 v30, a194
	v_accvgpr_read_b32 v31, a195
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[88:91], a[48:51], v[60:63], v10, v36 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_movk_i32 s0, 0x7fff
	v_cmp_o_f32_e32 vcc, v3, v3
	s_lshl_b32 s1, s17, 9
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[32:35], a[40:43], v[28:31], v26, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_lshl_b32 s5, s31, 14
	s_sub_i32 s1, s1, s5
	s_lshl_b32 s4, s16, 8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[248:251], v[204:207], a[44:47], v[28:31], v26, v27 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[88:91], a[56:59], v[56:59], v10, v38 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_mov_b64_e32 v[28:29], v[40:41]
	v_mov_b64_e32 v[30:31], v[42:43]
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[92:95], a[32:35], v[68:71], v10, v8 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[32:35], a[48:51], v[28:31], v26, v36 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[244:247], v[204:207], a[52:55], v[28:31], v26, v37 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[92:95], a[40:43], v[64:67], v10, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	v_mov_b64_e32 v[28:29], v[44:45]
	v_mov_b64_e32 v[30:31], v[46:47]
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[92:95], a[48:51], v[88:91], v10, v36 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[32:35], a[56:59], v[28:31], v26, v38 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[240:243], v[204:207], a[60:63], v[28:31], v26, v208 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[92:95], a[56:59], v[76:79], v10, v38 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	scratch_load_dwordx4 v[28:31], off, off offset:96
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], a[96:99], a[32:35], v[84:87], v11, v8 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[96:99], a[40:43], v[80:83], v11, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[96:99], a[48:51], v[92:95], v11, v36 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[96:99], a[56:59], v[96:99], v11, v38 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], a[100:103], a[32:35], v[100:103], v11, v8 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], a[100:103], a[40:43], v[104:107], v11, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], a[120:123], a[36:39], v[52:55], v10, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], a[120:123], a[52:55], v[60:63], v10, v37 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], a[120:123], a[60:63], v[56:59], v10, v208 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], a[124:127], a[36:39], v[68:71], v10, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[200:203], a[32:35], v[28:31], v26, v8 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[236:239], v[212:215], a[36:39], v[28:31], v26, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 6
	scratch_load_dwordx4 v[28:31], off, off offset:16
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], a[124:127], a[44:47], v[64:67], v10, v27 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], a[124:127], a[52:55], v[88:91], v10, v37 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], a[124:127], a[60:63], v[76:79], v10, v208 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], a[128:131], a[36:39], v[84:87], v11, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], a[128:131], a[44:47], v[80:83], v11, v27 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], a[128:131], a[52:55], v[92:95], v11, v37 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], a[128:131], a[60:63], v[96:99], v11, v208 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], a[132:135], a[36:39], v[100:103], v11, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], a[132:135], a[44:47], v[104:107], v11, v27 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[200:203], a[40:43], v[28:31], v26, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[232:235], v[212:215], a[44:47], v[28:31], v26, v27 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[200:203], a[48:51], v[48:51], v26, v36 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[228:231], v[212:215], a[52:55], v[28:31], v26, v37 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[200:203], a[56:59], v[72:75], v26, v38 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[224:227], v[212:215], a[60:63], v[28:31], v26, v208 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[16:19], a[32:35], v[120:123], v209, v8 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 5
	scratch_load_dwordx4 v[28:31], off, off offset:32
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[20:23], a[32:35], v[160:163], v209, v8 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[144:147], a[68:71], a[48:51], a[144:147], v210, v36 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[144:147], a[76:79], a[52:55], a[144:147], v210, v37 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], a[104:107], a[32:35], v[20:23], v211, v8 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], a[104:107], a[40:43], v[16:19], v211, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], a[0:3], a[32:35], v[28:31], v39, v8 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[220:223], a[8:11], a[36:39], v[28:31], v39, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 6
	scratch_load_dwordx4 v[28:31], off, off offset:48
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], a[136:139], a[44:47], v[16:19], v211, v27 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[104:107], a[56:59], v[4:7], v211, v38 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], a[136:139], a[60:63], v[4:7], v211, v208 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], a[24:27], a[36:39], v[72:75], v209, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], a[28:31], a[36:39], v[120:123], v209, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], a[0:3], a[40:43], v[28:31], v39, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[216:219], a[8:11], a[44:47], v[28:31], v39, v27 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 6
	scratch_load_dwordx4 v[28:31], off, off offset:64
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], a[136:139], a[36:39], v[20:23], v211, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], a[0:3], a[48:51], v[28:31], v39, v36 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[212:215], a[8:11], a[52:55], v[28:31], v39, v37 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 6
	scratch_load_dwordx4 v[28:31], off, off offset:80
	s_waitcnt vmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], a[0:3], a[56:59], v[28:31], v39, v38 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a0, a160
	v_accvgpr_mov_b32 a1, a161
	v_accvgpr_mov_b32 a2, a162
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], a[8:11], a[60:63], v[28:31], v39, v208 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a3, a163
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], a[4:7], a[32:35], v[128:131], v39, v8 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[20:23], a[48:51], v[168:171], v209, v36 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[204:207], a[12:15], a[36:39], v[28:31], v39, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], a[4:7], a[40:43], v[108:111], v39, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], a[16:19], a[40:43], v[124:127], v209, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[20:23], a[40:43], v[164:167], v209, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[164:167], a[28:31], a[52:55], v[128:131], v209, v37 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[20:23], a[56:59], v[132:135], v209, v38 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[200:203], a[12:15], a[44:47], v[28:31], v39, v27 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], a[4:7], a[48:51], v[112:115], v39, v36 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], a[28:31], a[60:63], v[128:131], v209, v208 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[64:67], a[32:35], v[172:175], v210, v8 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], a[12:15], a[52:55], v[28:31], v39, v37 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], a[4:7], a[56:59], v[116:119], v39, v38 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[16:19], a[56:59], v[156:159], v209, v38 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[156:159], a[72:75], a[36:39], v[128:131], v210, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[64:67], a[40:43], v[176:179], v210, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], a[16:19], a[48:51], v[152:155], v209, v36 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[152:155], a[72:75], a[44:47], v[128:131], v210, v27 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[64:67], a[48:51], v[180:183], v210, v36 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[132:135], a[72:75], a[52:55], v[128:131], v210, v37 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[64:67], a[56:59], v[184:187], v210, v38 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[72:75], a[60:63], v[128:131], v210, v208 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[80:83], a[48:51], v[136:139], v9, v36 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_read_b32 v136, a208
	s_nop 2
	v_accvgpr_write_b32 a155, v131
	v_accvgpr_read_b32 v137, a209
	v_accvgpr_read_b32 v138, a210
	v_accvgpr_read_b32 v139, a211
	v_accvgpr_write_b32 a154, v130
	v_accvgpr_write_b32 a153, v129
	v_accvgpr_write_b32 a152, v128
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[68:71], a[32:35], v[252:255], v210, v8 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[80:83], a[56:59], v[136:139], v9, v38 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_read_b32 v136, a220
	v_accvgpr_read_b32 v137, a221
	v_accvgpr_read_b32 v138, a222
	v_accvgpr_read_b32 v139, a223
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[80:83], a[32:35], v[192:195], v9, v8 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[80:83], a[40:43], v[196:199], v9, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a83, v23
	v_accvgpr_write_b32 a82, v22
	v_accvgpr_write_b32 a81, v21
	v_mfma_scale_f32_16x16x128_f8f6f4 v[184:187], a[84:87], a[32:35], v[136:139], v9, v8 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a80, v20
	v_accvgpr_read_b32 v20, a152
	v_accvgpr_read_b32 v23, a155
	v_accvgpr_read_b32 v136, a216
	v_accvgpr_read_b32 v137, a217
	v_accvgpr_read_b32 v138, a218
	v_accvgpr_read_b32 v139, a219
	v_mfma_scale_f32_16x16x128_f8f6f4 v[252:255], a[76:79], a[36:39], v[128:131], v210, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v22, a154
	v_accvgpr_read_b32 v21, a153
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[68:71], a[40:43], v[188:191], v210, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[84:87], a[40:43], v[136:139], v9, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[168:171], a[112:115], a[36:39], v[168:171], v9, v24 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 1
	v_accvgpr_read_b32 v136, a224
	v_accvgpr_read_b32 v137, a225
	v_accvgpr_read_b32 v138, a226
	v_mfma_scale_f32_16x16x128_f8f6f4 v[172:175], a[112:115], a[44:47], v[172:175], v9, v27 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_read_b32 v139, a227
	v_mfma_scale_f32_16x16x128_f8f6f4 v[176:179], a[112:115], a[52:55], v[176:179], v9, v37 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[180:183], a[112:115], a[60:63], v[180:183], v9, v208 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_mov_b32 a112, a228
	v_accvgpr_mov_b32 a113, a229
	v_accvgpr_mov_b32 a114, a230
	v_accvgpr_mov_b32 a115, a231
	v_mfma_scale_f32_16x16x128_f8f6f4 v[196:199], a[116:119], a[44:47], v[188:191], v9, v27 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[84:87], a[48:51], v[136:139], v9, v36 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[112:115], a[84:87], a[56:59], a[112:115], v9, v38 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 1
	v_accvgpr_read_b32 v136, a232
	v_accvgpr_mov_b32 a84, a156
	v_accvgpr_read_b32 v137, a233
	v_accvgpr_read_b32 v138, a234
	v_accvgpr_read_b32 v139, a235
	v_accvgpr_mov_b32 a85, a157
	v_accvgpr_mov_b32 a86, a158
	v_accvgpr_mov_b32 a87, a159
	v_mfma_scale_f32_16x16x128_f8f6f4 v[192:195], a[88:91], a[40:43], v[136:139], v10, v25 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[84:87], a[100:103], a[48:51], a[84:87], v11, v36 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], a[100:103], a[56:59], a[0:3], v11, v38 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[76:79], a[44:47], v[128:131], v210, v27 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[192:195], a[120:123], a[44:47], v[192:195], v10, v27 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[84:87], a[132:135], a[52:55], a[84:87], v11, v37 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_write_b32 a151, v131
	v_accvgpr_write_b32 a150, v130
	v_accvgpr_write_b32 a149, v129
	v_mfma_scale_f32_16x16x128_f8f6f4 a[100:103], a[132:135], a[60:63], a[0:3], v11, v208 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a148, v128
	v_mfma_scale_f32_16x16x128_f8f6f4 v[10:13], a[104:107], a[48:51], v[12:15], v211, v36 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[68:71], a[56:59], v[144:147], v210, v38 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 1
	v_bfe_u32 v14, v1, 16, 1
	v_bfe_u32 v15, v0, 16, 1
	v_add3_u32 v14, v1, v14, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[10:13], a[136:139], a[52:55], v[10:13], v211, v37 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add3_u32 v15, v0, v15, s0
	v_lshrrev_b32_e32 v14, 16, v14
	v_lshrrev_b32_e32 v15, 16, v15
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], a[76:79], a[60:63], v[128:131], v210, v208 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[184:187], a[116:119], a[36:39], v[184:187], v9, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	v_accvgpr_write_b32 a79, v13
	v_accvgpr_write_b32 a78, v12
	v_accvgpr_write_b32 a77, v11
	v_accvgpr_write_b32 a76, v10
	v_mfma_scale_f32_16x16x128_f8f6f4 v[10:13], a[108:111], a[32:35], v[148:151], v211, v8 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[188:191], a[116:119], a[52:55], v[188:191], v9, v37 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[112:115], a[116:119], a[60:63], a[112:115], v9, v208 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], a[140:143], a[36:39], v[10:13], v211, v24 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 a[72:75], a[108:111], a[48:51], a[164:167], v211, v36 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], a[24:27], a[44:47], v[108:111], v209, v27 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 5
	v_accvgpr_write_b32 a95, v11
	v_accvgpr_write_b32 a94, v10
	v_accvgpr_write_b32 a93, v9
	v_accvgpr_write_b32 a92, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[10:13], a[108:111], a[40:43], v[140:143], v211, v25 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_bfe_u32 v8, v3, 16, 1
	v_bfe_u32 v9, v2, 16, 1
	v_add3_u32 v8, v3, v8, s0
	v_add3_u32 v9, v2, v9, s0
	v_lshrrev_b32_e32 v8, 16, v8
	v_mov_b32_e32 v3, 0x7fc0
	v_lshrrev_b32_e32 v9, 16, v9
	v_cndmask_b32_e32 v26, v3, v8, vcc
	v_cmp_o_f32_e32 vcc, v2, v2
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], a[28:31], a[44:47], v[124:127], v209, v27 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_bfe_u32 v2, v249, 16, 1
	v_add3_u32 v2, v249, v2, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_mfma_scale_f32_16x16x128_f8f6f4 v[10:13], a[140:143], a[44:47], v[10:13], v211, v27 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v27, v3, v9, vcc
	v_cmp_o_f32_e32 vcc, v1, v1
	v_bfe_u32 v8, v248, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], a[24:27], a[52:55], v[112:115], v209, v37 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v1, v3, v14, vcc
	v_cmp_o_f32_e32 vcc, v0, v0
	v_add3_u32 v8, v248, v8, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 a[72:75], a[140:143], a[52:55], a[72:75], v211, v37 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v0, v3, v15, vcc
	v_accvgpr_write_b32 a54, v0
	v_bfe_u32 v0, v251, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], a[108:111], a[56:59], a[168:171], v211, v38 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a53, v1
	v_bfe_u32 v1, v250, 16, 1
	v_add3_u32 v0, v251, v0, s0
	v_add3_u32 v1, v250, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v251, v251
	v_lshrrev_b32_e32 v1, 16, v1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], a[12:15], a[60:63], v[28:31], v39, v208 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v250, v250
	v_lshrrev_b32_e32 v8, 16, v8
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], a[24:27], a[60:63], v[116:119], v209, v208 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_bfe_u32 v9, v34, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 a[96:99], a[140:143], a[60:63], a[0:3], v211, v208 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_accvgpr_write_b32 a60, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v249, v249
	v_accvgpr_write_b32 a61, v0
	v_bfe_u32 v1, v246, 16, 1
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_accvgpr_write_b32 a62, v0
	v_bfe_u32 v0, v247, 16, 1
	v_cmp_o_f32_e32 vcc, v248, v248
	v_add3_u32 v0, v247, v0, s0
	v_bfe_u32 v2, v245, 16, 1
	v_cndmask_b32_e32 v248, v3, v8, vcc
	v_add3_u32 v1, v246, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v247, v247
	v_bfe_u32 v8, v244, 16, 1
	v_add3_u32 v2, v245, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v246, v246
	v_add3_u32 v8, v244, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a55, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v245, v245
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a56, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v244, v244
	v_accvgpr_write_b32 a57, v0
	v_bfe_u32 v1, v242, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a58, v0
	v_bfe_u32 v0, v243, 16, 1
	v_add3_u32 v0, v243, v0, s0
	v_bfe_u32 v2, v241, 16, 1
	v_add3_u32 v1, v242, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v243, v243
	v_add3_u32 v2, v241, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v242, v242
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a35, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v241, v241
	v_bfe_u32 v8, v240, 16, 1
	v_accvgpr_write_b32 a37, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_add3_u32 v8, v240, v8, s0
	v_accvgpr_write_b32 a59, v0
	v_bfe_u32 v0, v239, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cmp_o_f32_e32 vcc, v240, v240
	v_bfe_u32 v1, v238, 16, 1
	v_add3_u32 v0, v239, v0, s0
	v_cndmask_b32_e32 v240, v3, v8, vcc
	v_bfe_u32 v2, v237, 16, 1
	v_add3_u32 v1, v238, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v239, v239
	v_bfe_u32 v8, v236, 16, 1
	v_add3_u32 v2, v237, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v238, v238
	v_add3_u32 v8, v236, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a15, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v237, v237
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a17, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v236, v236
	v_accvgpr_write_b32 a21, v0
	v_bfe_u32 v1, v234, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a39, v0
	v_bfe_u32 v0, v235, 16, 1
	v_add3_u32 v0, v235, v0, s0
	v_bfe_u32 v2, v233, 16, 1
	v_add3_u32 v1, v234, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v235, v235
	v_bfe_u32 v8, v232, 16, 1
	v_add3_u32 v2, v233, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v234, v234
	v_add3_u32 v8, v232, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a18, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v233, v233
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a22, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v232, v232
	v_accvgpr_write_b32 a24, v0
	v_bfe_u32 v1, v230, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a25, v0
	v_bfe_u32 v0, v231, 16, 1
	v_add3_u32 v0, v231, v0, s0
	v_bfe_u32 v2, v229, 16, 1
	v_add3_u32 v1, v230, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v231, v231
	v_bfe_u32 v8, v228, 16, 1
	v_add3_u32 v2, v229, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v230, v230
	v_add3_u32 v8, v228, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a67, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v229, v229
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a63, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v228, v228
	v_accvgpr_write_b32 a13, v0
	v_bfe_u32 v1, v226, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a26, v0
	v_bfe_u32 v0, v227, 16, 1
	v_add3_u32 v0, v227, v0, s0
	v_bfe_u32 v2, v225, 16, 1
	v_add3_u32 v1, v226, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v227, v227
	v_bfe_u32 v8, v224, 16, 1
	v_add3_u32 v2, v225, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v226, v226
	v_add3_u32 v8, v224, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a64, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v225, v225
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a65, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v224, v224
	v_accvgpr_write_b32 a0, v0
	v_bfe_u32 v1, v222, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a2, v0
	v_bfe_u32 v0, v223, 16, 1
	v_add3_u32 v0, v223, v0, s0
	v_bfe_u32 v2, v221, 16, 1
	v_add3_u32 v1, v222, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v223, v223
	v_bfe_u32 v8, v220, 16, 1
	v_add3_u32 v2, v221, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v222, v222
	v_add3_u32 v8, v220, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a66, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v221, v221
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a1, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v220, v220
	v_accvgpr_write_b32 a3, v0
	v_bfe_u32 v1, v218, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a5, v0
	v_bfe_u32 v0, v219, 16, 1
	v_add3_u32 v0, v219, v0, s0
	v_bfe_u32 v2, v217, 16, 1
	v_add3_u32 v1, v218, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v219, v219
	v_bfe_u32 v8, v216, 16, 1
	v_add3_u32 v2, v217, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v218, v218
	v_add3_u32 v8, v216, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a4, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v217, v217
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a6, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v216, v216
	v_accvgpr_write_b32 a7, v0
	v_bfe_u32 v1, v214, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a9, v0
	v_bfe_u32 v0, v215, 16, 1
	v_add3_u32 v0, v215, v0, s0
	v_bfe_u32 v2, v213, 16, 1
	v_add3_u32 v1, v214, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v215, v215
	v_bfe_u32 v8, v212, 16, 1
	v_add3_u32 v2, v213, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v214, v214
	v_add3_u32 v8, v212, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a8, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v213, v213
	v_bfe_u32 v1, v35, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a10, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v212, v212
	v_add3_u32 v1, v35, v1, s0
	v_accvgpr_write_b32 a11, v0
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_bfe_u32 v2, v33, 16, 1
	v_add3_u32 v8, v34, v9, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cmp_o_f32_e32 vcc, v35, v35
	v_accvgpr_write_b32 a12, v0
	v_bfe_u32 v0, v32, 16, 1
	v_add3_u32 v2, v33, v2, s0
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v1, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v34, v34
	v_add3_u32 v0, v32, v0, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a14, v1
	v_cndmask_b32_e32 v1, v3, v8, vcc
	v_cmp_o_f32_e32 vcc, v33, v33
	v_lshrrev_b32_e32 v0, 16, v0
	v_accvgpr_write_b32 a16, v1
	v_cndmask_b32_e32 v1, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v32, v32
	v_accvgpr_write_b32 a19, v1
	v_bfe_u32 v1, v206, 16, 1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_accvgpr_write_b32 a68, v0
	v_bfe_u32 v0, v207, 16, 1
	v_add3_u32 v0, v207, v0, s0
	v_add3_u32 v1, v206, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v207, v207
	v_bfe_u32 v2, v205, 16, 1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v206, v206
	v_bfe_u32 v8, v204, 16, 1
	v_add3_u32 v2, v205, v2, s0
	v_accvgpr_write_b32 a20, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_add3_u32 v8, v204, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a23, v0
	v_cmp_o_f32_e32 vcc, v205, v205
	v_bfe_u32 v0, v203, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v231, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v204, v204
	v_bfe_u32 v1, v202, 16, 1
	v_add3_u32 v0, v203, v0, s0
	v_cndmask_b32_e32 v227, v3, v8, vcc
	v_bfe_u32 v2, v201, 16, 1
	v_add3_u32 v1, v202, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v203, v203
	v_bfe_u32 v8, v200, 16, 1
	v_add3_u32 v2, v201, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v226, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v202, v202
	v_add3_u32 v8, v200, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v224, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v201, v201
	v_bfe_u32 v0, v51, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v223, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v200, v200
	v_bfe_u32 v1, v50, 16, 1
	v_add3_u32 v0, v51, v0, s0
	v_cndmask_b32_e32 v222, v3, v8, vcc
	v_bfe_u32 v2, v49, 16, 1
	v_add3_u32 v1, v50, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v51, v51
	v_bfe_u32 v8, v48, 16, 1
	v_add3_u32 v2, v49, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v221, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v50, v50
	v_add3_u32 v8, v48, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v220, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v49, v49
	v_bfe_u32 v0, v31, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v219, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v48, v48
	v_bfe_u32 v1, v30, 16, 1
	v_add3_u32 v0, v31, v0, s0
	v_cndmask_b32_e32 v218, v3, v8, vcc
	v_bfe_u32 v2, v29, 16, 1
	v_add3_u32 v1, v30, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v31, v31
	v_bfe_u32 v8, v28, 16, 1
	v_add3_u32 v2, v29, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v217, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v30, v30
	v_add3_u32 v8, v28, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v216, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v29, v29
	v_bfe_u32 v0, v75, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v214, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v28, v28
	v_bfe_u32 v1, v74, 16, 1
	v_add3_u32 v0, v75, v0, s0
	v_cndmask_b32_e32 v212, v3, v8, vcc
	v_bfe_u32 v2, v73, 16, 1
	v_add3_u32 v1, v74, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v75, v75
	v_bfe_u32 v8, v72, 16, 1
	v_add3_u32 v2, v73, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v215, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v74, v74
	v_add3_u32 v8, v72, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v37, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v73, v73
	v_lshrrev_b32_e32 v8, 16, v8
	v_bfe_u32 v1, v110, 16, 1
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v72, v72
	v_accvgpr_write_b32 a69, v0
	v_bfe_u32 v2, v109, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a70, v0
	v_bfe_u32 v0, v111, 16, 1
	v_add3_u32 v0, v111, v0, s0
	v_add3_u32 v1, v110, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v111, v111
	v_bfe_u32 v8, v108, 16, 1
	v_add3_u32 v2, v109, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v28, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v110, v110
	v_add3_u32 v8, v108, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v29, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v109, v109
	v_lshrrev_b32_e32 v8, 16, v8
	v_bfe_u32 v1, v114, 16, 1
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v108, v108
	v_accvgpr_write_b32 a27, v0
	v_bfe_u32 v2, v113, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a29, v0
	v_bfe_u32 v0, v115, 16, 1
	v_add3_u32 v0, v115, v0, s0
	v_add3_u32 v1, v114, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v115, v115
	v_bfe_u32 v8, v112, 16, 1
	v_add3_u32 v2, v113, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v114, v114
	v_add3_u32 v8, v112, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a28, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v113, v113
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a30, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v112, v112
	v_accvgpr_write_b32 a31, v0
	v_bfe_u32 v1, v118, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a33, v0
	v_bfe_u32 v0, v119, 16, 1
	v_add3_u32 v0, v119, v0, s0
	v_bfe_u32 v2, v117, 16, 1
	v_add3_u32 v1, v118, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v119, v119
	v_bfe_u32 v8, v116, 16, 1
	v_add3_u32 v2, v117, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v118, v118
	v_add3_u32 v8, v116, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a32, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v117, v117
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a34, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v116, v116
	v_accvgpr_write_b32 a36, v0
	v_bfe_u32 v1, v122, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a38, v0
	v_bfe_u32 v0, v123, 16, 1
	v_add3_u32 v0, v123, v0, s0
	v_bfe_u32 v2, v121, 16, 1
	v_add3_u32 v1, v122, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v123, v123
	v_bfe_u32 v8, v120, 16, 1
	v_add3_u32 v2, v121, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v122, v122
	v_add3_u32 v8, v120, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a40, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v121, v121
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a41, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v120, v120
	v_accvgpr_write_b32 a42, v0
	v_bfe_u32 v1, v126, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a45, v0
	v_bfe_u32 v0, v127, 16, 1
	v_add3_u32 v0, v127, v0, s0
	v_bfe_u32 v2, v125, 16, 1
	v_add3_u32 v1, v126, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v127, v127
	v_bfe_u32 v8, v124, 16, 1
	v_add3_u32 v2, v125, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v126, v126
	v_add3_u32 v8, v124, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a43, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v125, v125
	v_lshrrev_b32_e32 v8, 16, v8
	v_accvgpr_write_b32 a44, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v124, v124
	v_accvgpr_write_b32 a46, v0
	v_bfe_u32 v1, v166, 16, 1
	v_cndmask_b32_e32 v0, v3, v8, vcc
	v_accvgpr_write_b32 a47, v0
	v_bfe_u32 v0, v167, 16, 1
	v_add3_u32 v0, v167, v0, s0
	v_bfe_u32 v2, v165, 16, 1
	v_add3_u32 v1, v166, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v167, v167
	v_add3_u32 v2, v165, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v166, v166
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a48, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v165, v165
	v_bfe_u32 v8, v164, 16, 1
	v_accvgpr_write_b32 a49, v0
	v_cndmask_b32_e32 v0, v3, v2, vcc
	v_add3_u32 v8, v164, v8, s0
	v_accvgpr_write_b32 a50, v0
	v_bfe_u32 v0, v163, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cmp_o_f32_e32 vcc, v164, v164
	v_bfe_u32 v1, v162, 16, 1
	v_add3_u32 v0, v163, v0, s0
	v_cndmask_b32_e32 v207, v3, v8, vcc
	v_add3_u32 v1, v162, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v163, v163
	v_bfe_u32 v2, v161, 16, 1
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v0, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v162, v162
	v_bfe_u32 v8, v160, 16, 1
	v_add3_u32 v2, v161, v2, s0
	v_accvgpr_write_b32 a51, v0
	v_cndmask_b32_e32 v0, v3, v1, vcc
	v_add3_u32 v8, v160, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_accvgpr_write_b32 a52, v0
	v_cmp_o_f32_e32 vcc, v161, v161
	v_bfe_u32 v0, v159, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v206, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v160, v160
	v_bfe_u32 v1, v158, 16, 1
	v_add3_u32 v0, v159, v0, s0
	v_cndmask_b32_e32 v205, v3, v8, vcc
	v_bfe_u32 v2, v157, 16, 1
	v_add3_u32 v1, v158, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v159, v159
	v_bfe_u32 v8, v156, 16, 1
	v_add3_u32 v2, v157, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v204, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v158, v158
	v_add3_u32 v8, v156, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v203, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v157, v157
	v_bfe_u32 v0, v155, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v202, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v156, v156
	v_bfe_u32 v1, v154, 16, 1
	v_add3_u32 v0, v155, v0, s0
	v_cndmask_b32_e32 v201, v3, v8, vcc
	v_bfe_u32 v2, v153, 16, 1
	v_add3_u32 v1, v154, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v155, v155
	v_bfe_u32 v8, v152, 16, 1
	v_add3_u32 v2, v153, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v200, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v154, v154
	v_add3_u32 v8, v152, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v166, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v153, v153
	v_bfe_u32 v0, v135, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v165, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v152, v152
	v_bfe_u32 v1, v134, 16, 1
	v_add3_u32 v0, v135, v0, s0
	v_cndmask_b32_e32 v164, v3, v8, vcc
	v_bfe_u32 v2, v133, 16, 1
	v_add3_u32 v1, v134, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v135, v135
	v_bfe_u32 v8, v132, 16, 1
	v_add3_u32 v2, v133, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v163, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v134, v134
	v_add3_u32 v8, v132, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v162, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v133, v133
	v_bfe_u32 v0, v23, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v161, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v132, v132
	v_bfe_u32 v1, v22, 16, 1
	v_add3_u32 v0, v23, v0, s0
	v_cndmask_b32_e32 v159, v3, v8, vcc
	v_bfe_u32 v2, v21, 16, 1
	v_add3_u32 v1, v22, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v23, v23
	v_bfe_u32 v8, v20, 16, 1
	v_add3_u32 v2, v21, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v160, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v22, v22
	v_add3_u32 v8, v20, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v158, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v21, v21
	v_bfe_u32 v0, v255, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v157, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v20, v20
	v_bfe_u32 v1, v254, 16, 1
	v_add3_u32 v0, v255, v0, s0
	v_cndmask_b32_e32 v156, v3, v8, vcc
	v_bfe_u32 v2, v253, 16, 1
	v_add3_u32 v1, v254, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v255, v255
	v_accvgpr_read_b32 v20, a148
	v_bfe_u32 v8, v252, 16, 1
	v_add3_u32 v2, v253, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v155, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v254, v254
	v_accvgpr_read_b32 v23, a151
	v_add3_u32 v8, v252, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v154, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v253, v253
	v_accvgpr_read_b32 v22, a150
	v_bfe_u32 v0, v23, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v152, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v252, v252
	v_accvgpr_read_b32 v21, a149
	v_bfe_u32 v1, v22, 16, 1
	v_add3_u32 v0, v23, v0, s0
	v_cndmask_b32_e32 v150, v3, v8, vcc
	v_bfe_u32 v2, v21, 16, 1
	v_add3_u32 v1, v22, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v23, v23
	v_add3_u32 v2, v21, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v153, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v22, v22
	v_bfe_u32 v8, v20, 16, 1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v151, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v21, v21
	v_add3_u32 v8, v20, v8, s0
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v149, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v20, v20
	v_accvgpr_read_b32 v20, a144
	v_accvgpr_read_b32 v23, a147
	v_accvgpr_read_b32 v22, a146
	v_bfe_u32 v0, v23, 16, 1
	v_accvgpr_read_b32 v21, a145
	v_bfe_u32 v1, v22, 16, 1
	v_add3_u32 v0, v23, v0, s0
	v_cndmask_b32_e32 v147, v3, v8, vcc
	v_bfe_u32 v2, v21, 16, 1
	v_add3_u32 v1, v22, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v23, v23
	v_bfe_u32 v8, v20, 16, 1
	v_add3_u32 v2, v21, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v148, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v22, v22
	v_add3_u32 v8, v20, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v146, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v21, v21
	v_bfe_u32 v0, v131, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v145, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v20, v20
	v_bfe_u32 v1, v130, 16, 1
	v_add3_u32 v0, v131, v0, s0
	v_cndmask_b32_e32 v144, v3, v8, vcc
	v_bfe_u32 v2, v129, 16, 1
	v_add3_u32 v1, v130, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v131, v131
	v_bfe_u32 v8, v128, 16, 1
	v_add3_u32 v2, v129, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v143, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v130, v130
	v_add3_u32 v8, v128, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v142, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v129, v129
	v_bfe_u32 v0, v171, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v140, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v128, v128
	v_bfe_u32 v1, v170, 16, 1
	v_add3_u32 v0, v171, v0, s0
	v_cndmask_b32_e32 v138, v3, v8, vcc
	v_bfe_u32 v2, v169, 16, 1
	v_add3_u32 v1, v170, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v171, v171
	v_bfe_u32 v8, v168, 16, 1
	v_add3_u32 v2, v169, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v141, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v170, v170
	v_add3_u32 v8, v168, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v139, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v169, v169
	v_bfe_u32 v0, v175, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v137, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v168, v168
	v_bfe_u32 v1, v174, 16, 1
	v_add3_u32 v0, v175, v0, s0
	v_cndmask_b32_e32 v136, v3, v8, vcc
	v_bfe_u32 v2, v173, 16, 1
	v_add3_u32 v1, v174, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v175, v175
	v_bfe_u32 v8, v172, 16, 1
	v_add3_u32 v2, v173, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v168, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v174, v174
	v_add3_u32 v8, v172, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v169, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v173, v173
	v_bfe_u32 v0, v179, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v170, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v172, v172
	v_bfe_u32 v1, v178, 16, 1
	v_add3_u32 v0, v179, v0, s0
	v_cndmask_b32_e32 v130, v3, v8, vcc
	v_bfe_u32 v2, v177, 16, 1
	v_add3_u32 v1, v178, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v179, v179
	v_bfe_u32 v8, v176, 16, 1
	v_add3_u32 v2, v177, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v171, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v178, v178
	v_add3_u32 v8, v176, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v129, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v177, v177
	v_bfe_u32 v0, v183, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v128, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v176, v176
	v_bfe_u32 v1, v182, 16, 1
	v_add3_u32 v0, v183, v0, s0
	v_cndmask_b32_e32 v127, v3, v8, vcc
	v_bfe_u32 v2, v181, 16, 1
	v_add3_u32 v1, v182, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v183, v183
	v_bfe_u32 v8, v180, 16, 1
	v_add3_u32 v2, v181, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v126, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v182, v182
	v_add3_u32 v8, v180, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v125, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v181, v181
	v_bfe_u32 v0, v187, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v123, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v180, v180
	v_bfe_u32 v1, v186, 16, 1
	v_add3_u32 v0, v187, v0, s0
	v_cndmask_b32_e32 v121, v3, v8, vcc
	v_bfe_u32 v2, v185, 16, 1
	v_add3_u32 v1, v186, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v187, v187
	v_bfe_u32 v8, v184, 16, 1
	v_add3_u32 v2, v185, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v124, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v186, v186
	v_add3_u32 v8, v184, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v122, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v185, v185
	v_bfe_u32 v0, v199, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v120, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v184, v184
	v_bfe_u32 v1, v198, 16, 1
	v_add3_u32 v0, v199, v0, s0
	v_cndmask_b32_e32 v119, v3, v8, vcc
	v_bfe_u32 v2, v197, 16, 1
	v_add3_u32 v1, v198, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v199, v199
	v_bfe_u32 v8, v196, 16, 1
	v_add3_u32 v2, v197, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v118, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v198, v198
	v_add3_u32 v8, v196, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v117, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v197, v197
	v_bfe_u32 v0, v191, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v116, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v196, v196
	v_bfe_u32 v1, v190, 16, 1
	v_add3_u32 v0, v191, v0, s0
	v_cndmask_b32_e32 v115, v3, v8, vcc
	v_bfe_u32 v2, v189, 16, 1
	v_add3_u32 v1, v190, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v191, v191
	v_accvgpr_read_b32 v20, a112
	v_bfe_u32 v8, v188, 16, 1
	v_add3_u32 v2, v189, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v114, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v190, v190
	v_accvgpr_read_b32 v23, a115
	v_add3_u32 v8, v188, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v113, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v189, v189
	v_accvgpr_read_b32 v22, a114
	v_bfe_u32 v0, v23, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v112, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v188, v188
	v_accvgpr_read_b32 v21, a113
	v_bfe_u32 v1, v22, 16, 1
	v_add3_u32 v0, v23, v0, s0
	v_cndmask_b32_e32 v111, v3, v8, vcc
	v_bfe_u32 v2, v21, 16, 1
	v_add3_u32 v1, v22, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v23, v23
	v_bfe_u32 v8, v20, 16, 1
	v_add3_u32 v2, v21, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v110, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v22, v22
	v_add3_u32 v8, v20, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v109, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v21, v21
	v_bfe_u32 v0, v55, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v243, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v20, v20
	v_bfe_u32 v1, v54, 16, 1
	v_add3_u32 v0, v55, v0, s0
	v_cndmask_b32_e32 v251, v3, v8, vcc
	v_bfe_u32 v2, v53, 16, 1
	v_add3_u32 v1, v54, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v55, v55
	v_bfe_u32 v8, v52, 16, 1
	v_add3_u32 v2, v53, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v108, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v54, v54
	v_add3_u32 v8, v52, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v247, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v53, v53
	v_bfe_u32 v0, v195, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v235, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v52, v52
	v_bfe_u32 v1, v194, 16, 1
	v_add3_u32 v0, v195, v0, s0
	v_cndmask_b32_e32 v246, v3, v8, vcc
	v_bfe_u32 v2, v193, 16, 1
	v_add3_u32 v1, v194, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v195, v195
	v_bfe_u32 v8, v192, 16, 1
	v_add3_u32 v2, v193, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v250, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v194, v194
	v_add3_u32 v8, v192, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v234, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v193, v193
	v_bfe_u32 v0, v63, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v245, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v192, v192
	v_bfe_u32 v1, v62, 16, 1
	v_add3_u32 v0, v63, v0, s0
	v_cndmask_b32_e32 v242, v3, v8, vcc
	v_bfe_u32 v2, v61, 16, 1
	v_add3_u32 v1, v62, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v63, v63
	v_bfe_u32 v8, v60, 16, 1
	v_add3_u32 v2, v61, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v249, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v62, v62
	v_add3_u32 v8, v60, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v230, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v61, v61
	v_bfe_u32 v0, v59, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v241, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v60, v60
	v_bfe_u32 v1, v58, 16, 1
	v_add3_u32 v0, v59, v0, s0
	v_cndmask_b32_e32 v238, v3, v8, vcc
	v_bfe_u32 v2, v57, 16, 1
	v_add3_u32 v1, v58, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v59, v59
	v_bfe_u32 v8, v56, 16, 1
	v_add3_u32 v2, v57, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v229, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v58, v58
	v_add3_u32 v8, v56, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v244, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v57, v57
	v_bfe_u32 v0, v71, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v233, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v56, v56
	v_bfe_u32 v1, v70, 16, 1
	v_add3_u32 v0, v71, v0, s0
	v_cndmask_b32_e32 v239, v3, v8, vcc
	v_bfe_u32 v2, v69, 16, 1
	v_add3_u32 v1, v70, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v71, v71
	v_bfe_u32 v8, v68, 16, 1
	v_add3_u32 v2, v69, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v225, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v70, v70
	v_add3_u32 v8, v68, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v213, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v69, v69
	v_bfe_u32 v0, v67, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v232, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v68, v68
	v_bfe_u32 v1, v66, 16, 1
	v_add3_u32 v0, v67, v0, s0
	v_cndmask_b32_e32 v228, v3, v8, vcc
	v_bfe_u32 v2, v65, 16, 1
	v_add3_u32 v1, v66, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v67, v67
	v_bfe_u32 v8, v64, 16, 1
	v_add3_u32 v2, v65, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v237, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v66, v66
	v_add3_u32 v8, v64, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v167, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v65, v65
	v_bfe_u32 v0, v91, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v236, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v64, v64
	v_bfe_u32 v1, v90, 16, 1
	v_add3_u32 v0, v91, v0, s0
	v_cndmask_b32_e32 v75, v3, v8, vcc
	v_bfe_u32 v2, v89, 16, 1
	v_add3_u32 v1, v90, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v91, v91
	v_bfe_u32 v8, v88, 16, 1
	v_add3_u32 v2, v89, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v74, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v90, v90
	v_add3_u32 v8, v88, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v73, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v89, v89
	v_bfe_u32 v0, v79, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v72, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v88, v88
	v_bfe_u32 v1, v78, 16, 1
	v_add3_u32 v0, v79, v0, s0
	v_cndmask_b32_e32 v70, v3, v8, vcc
	v_bfe_u32 v2, v77, 16, 1
	v_add3_u32 v1, v78, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v79, v79
	v_bfe_u32 v8, v76, 16, 1
	v_add3_u32 v2, v77, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v71, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v78, v78
	v_add3_u32 v8, v76, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v69, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v77, v77
	v_bfe_u32 v0, v87, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v68, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v76, v76
	v_bfe_u32 v1, v86, 16, 1
	v_add3_u32 v0, v87, v0, s0
	v_cndmask_b32_e32 v67, v3, v8, vcc
	v_bfe_u32 v2, v85, 16, 1
	v_add3_u32 v1, v86, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v87, v87
	v_bfe_u32 v8, v84, 16, 1
	v_add3_u32 v2, v85, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v66, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v86, v86
	v_add3_u32 v8, v84, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v65, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v85, v85
	v_bfe_u32 v0, v83, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v64, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v84, v84
	v_bfe_u32 v1, v82, 16, 1
	v_add3_u32 v0, v83, v0, s0
	v_cndmask_b32_e32 v63, v3, v8, vcc
	v_bfe_u32 v2, v81, 16, 1
	v_add3_u32 v1, v82, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v83, v83
	v_bfe_u32 v8, v80, 16, 1
	v_add3_u32 v2, v81, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v62, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v82, v82
	v_add3_u32 v8, v80, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v61, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v81, v81
	v_bfe_u32 v0, v95, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v60, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v80, v80
	v_bfe_u32 v1, v94, 16, 1
	v_add3_u32 v0, v95, v0, s0
	v_cndmask_b32_e32 v59, v3, v8, vcc
	v_bfe_u32 v2, v93, 16, 1
	v_add3_u32 v1, v94, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v95, v95
	v_bfe_u32 v8, v92, 16, 1
	v_add3_u32 v2, v93, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v58, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v94, v94
	v_add3_u32 v8, v92, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v57, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v93, v93
	v_bfe_u32 v0, v99, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v56, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v92, v92
	v_bfe_u32 v1, v98, 16, 1
	v_add3_u32 v0, v99, v0, s0
	v_cndmask_b32_e32 v54, v3, v8, vcc
	v_bfe_u32 v2, v97, 16, 1
	v_add3_u32 v1, v98, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v99, v99
	v_bfe_u32 v8, v96, 16, 1
	v_add3_u32 v2, v97, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v55, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v98, v98
	v_add3_u32 v8, v96, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v53, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v97, v97
	v_bfe_u32 v0, v103, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v52, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v96, v96
	v_bfe_u32 v1, v102, 16, 1
	v_add3_u32 v0, v103, v0, s0
	v_cndmask_b32_e32 v51, v3, v8, vcc
	v_bfe_u32 v2, v101, 16, 1
	v_add3_u32 v1, v102, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v103, v103
	v_mov_b64_e32 v[20:21], v[104:105]
	v_bfe_u32 v8, v100, 16, 1
	v_add3_u32 v2, v101, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v50, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v102, v102
	v_mov_b64_e32 v[22:23], v[106:107]
	v_add3_u32 v8, v100, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v49, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v101, v101
	v_bfe_u32 v0, v23, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v48, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v100, v100
	v_bfe_u32 v1, v22, 16, 1
	v_add3_u32 v0, v23, v0, s0
	v_cndmask_b32_e32 v47, v3, v8, vcc
	v_bfe_u32 v2, v21, 16, 1
	v_add3_u32 v1, v22, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v23, v23
	v_add3_u32 v2, v21, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v46, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v22, v22
	v_bfe_u32 v8, v20, 16, 1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v45, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v21, v21
	v_add3_u32 v8, v20, v8, s0
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v44, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v20, v20
	v_accvgpr_read_b32 v20, a84
	v_accvgpr_read_b32 v23, a87
	v_accvgpr_read_b32 v22, a86
	v_bfe_u32 v0, v23, 16, 1
	v_accvgpr_read_b32 v21, a85
	v_bfe_u32 v1, v22, 16, 1
	v_add3_u32 v0, v23, v0, s0
	v_cndmask_b32_e32 v43, v3, v8, vcc
	v_bfe_u32 v2, v21, 16, 1
	v_add3_u32 v1, v22, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v23, v23
	v_bfe_u32 v8, v20, 16, 1
	v_add3_u32 v2, v21, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v42, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v22, v22
	v_accvgpr_read_b32 v107, a103
	v_add3_u32 v8, v20, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v41, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v21, v21
	v_accvgpr_read_b32 v106, a102
	v_bfe_u32 v0, v107, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v40, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v20, v20
	v_accvgpr_read_b32 v105, a101
	v_bfe_u32 v1, v106, 16, 1
	v_add3_u32 v0, v107, v0, s0
	v_cndmask_b32_e32 v39, v3, v8, vcc
	v_bfe_u32 v2, v105, 16, 1
	v_add3_u32 v1, v106, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v107, v107
	v_accvgpr_read_b32 v104, a100
	v_add3_u32 v2, v105, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v38, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v106, v106
	v_bfe_u32 v8, v104, 16, 1
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v23, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v105, v105
	v_add3_u32 v8, v104, v8, s0
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v36, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v104, v104
	v_accvgpr_read_b32 v107, a83
	v_accvgpr_read_b32 v106, a82
	v_bfe_u32 v0, v107, 16, 1
	v_accvgpr_read_b32 v105, a81
	v_bfe_u32 v1, v106, 16, 1
	v_add3_u32 v0, v107, v0, s0
	v_cndmask_b32_e32 v35, v3, v8, vcc
	v_accvgpr_read_b32 v104, a80
	v_bfe_u32 v2, v105, 16, 1
	v_add3_u32 v1, v106, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v107, v107
	v_bfe_u32 v8, v104, 16, 1
	v_add3_u32 v2, v105, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v34, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v106, v106
	v_add3_u32 v8, v104, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v33, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v105, v105
	v_bfe_u32 v0, v19, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v32, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v104, v104
	v_bfe_u32 v1, v18, 16, 1
	v_add3_u32 v0, v19, v0, s0
	v_cndmask_b32_e32 v31, v3, v8, vcc
	v_bfe_u32 v2, v17, 16, 1
	v_add3_u32 v1, v18, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v19, v19
	v_bfe_u32 v8, v16, 16, 1
	v_add3_u32 v2, v17, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v30, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v18, v18
	v_accvgpr_read_b32 v107, a79
	v_add3_u32 v8, v16, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v80, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v17, v17
	v_accvgpr_read_b32 v106, a78
	v_bfe_u32 v0, v107, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v81, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v16, v16
	v_accvgpr_read_b32 v105, a77
	v_bfe_u32 v1, v106, 16, 1
	v_add3_u32 v0, v107, v0, s0
	v_cndmask_b32_e32 v83, v3, v8, vcc
	v_accvgpr_read_b32 v104, a76
	v_bfe_u32 v2, v105, 16, 1
	v_add3_u32 v1, v106, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v107, v107
	v_bfe_u32 v8, v104, 16, 1
	v_add3_u32 v2, v105, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v82, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v106, v106
	v_add3_u32 v8, v104, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v25, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v105, v105
	v_bfe_u32 v0, v7, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v24, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v104, v104
	v_bfe_u32 v1, v6, 16, 1
	v_add3_u32 v0, v7, v0, s0
	v_cndmask_b32_e32 v21, v3, v8, vcc
	v_bfe_u32 v2, v5, 16, 1
	v_add3_u32 v1, v6, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v7, v7
	v_bfe_u32 v8, v4, 16, 1
	v_add3_u32 v2, v5, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v20, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v6, v6
	v_accvgpr_read_b32 v135, a95
	v_add3_u32 v8, v4, v8, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v22, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v5, v5
	v_accvgpr_read_b32 v134, a94
	v_bfe_u32 v0, v135, 16, 1
	v_lshrrev_b32_e32 v8, 16, v8
	v_cndmask_b32_e32 v76, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v4, v4
	v_accvgpr_read_b32 v133, a93
	v_bfe_u32 v1, v134, 16, 1
	v_add3_u32 v0, v135, v0, s0
	v_cndmask_b32_e32 v77, v3, v8, vcc
	v_accvgpr_read_b32 v132, a92
	v_bfe_u32 v2, v133, 16, 1
	v_add3_u32 v1, v134, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v135, v135
	v_bfe_u32 v4, v132, 16, 1
	v_add3_u32 v2, v133, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v79, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v134, v134
	v_add3_u32 v4, v132, v4, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v78, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v133, v133
	v_bfe_u32 v0, v13, 16, 1
	v_lshrrev_b32_e32 v4, 16, v4
	v_cndmask_b32_e32 v15, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v132, v132
	v_bfe_u32 v1, v12, 16, 1
	v_add3_u32 v0, v13, v0, s0
	v_cndmask_b32_e32 v14, v3, v4, vcc
	v_bfe_u32 v2, v11, 16, 1
	v_add3_u32 v1, v12, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v13, v13
	v_bfe_u32 v4, v10, 16, 1
	v_add3_u32 v2, v11, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v19, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v12, v12
	v_accvgpr_read_b32 v107, a75
	v_add3_u32 v4, v10, v4, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v131, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v11, v11
	v_accvgpr_read_b32 v106, a74
	v_bfe_u32 v0, v107, 16, 1
	v_lshrrev_b32_e32 v4, 16, v4
	v_cndmask_b32_e32 v253, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v10, v10
	v_accvgpr_read_b32 v105, a73
	v_bfe_u32 v1, v106, 16, 1
	v_add3_u32 v0, v107, v0, s0
	v_cndmask_b32_e32 v254, v3, v4, vcc
	v_accvgpr_read_b32 v104, a72
	v_bfe_u32 v2, v105, 16, 1
	v_add3_u32 v1, v106, v1, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cmp_o_f32_e32 vcc, v107, v107
	v_bfe_u32 v4, v104, 16, 1
	v_add3_u32 v2, v105, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cndmask_b32_e32 v252, v3, v0, vcc
	v_cmp_o_f32_e32 vcc, v106, v106
	v_accvgpr_read_b32 v211, a99
	v_add3_u32 v4, v104, v4, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v255, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v105, v105
	v_bfe_u32 v0, v211, 16, 1
	v_lshrrev_b32_e32 v4, 16, v4
	v_cndmask_b32_e32 v13, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v104, v104
	v_add3_u32 v0, v211, v0, s0
	v_lshrrev_b32_e32 v0, 16, v0
	v_cndmask_b32_e32 v11, v3, v4, vcc
	v_cmp_o_f32_e32 vcc, v211, v211
	scratch_load_dword v18, off, off offset:12
	v_accvgpr_read_b32 v210, a98
	v_cndmask_b32_e32 v12, v3, v0, vcc
	scratch_load_dword v0, off, off offset:140
	v_accvgpr_read_b32 v209, a97
	v_bfe_u32 v1, v210, 16, 1
	v_accvgpr_read_b32 v208, a96
	v_bfe_u32 v2, v209, 16, 1
	v_add3_u32 v1, v210, v1, s0
	v_bfe_u32 v4, v208, 16, 1
	v_add3_u32 v2, v209, v2, s0
	v_lshrrev_b32_e32 v1, 16, v1
	v_cmp_o_f32_e32 vcc, v210, v210
	v_add3_u32 v4, v208, v4, s0
	v_lshrrev_b32_e32 v2, 16, v2
	v_cndmask_b32_e32 v10, v3, v1, vcc
	v_cmp_o_f32_e32 vcc, v209, v209
	v_lshrrev_b32_e32 v4, 16, v4
	s_lshl_b32 s0, s30, 8
	v_cndmask_b32_e32 v9, v3, v2, vcc
	v_cmp_o_f32_e32 vcc, v208, v208
	s_or_b32 s5, s1, s0
	s_and_b64 s[0:1], s[28:29], exec
	v_cndmask_b32_e32 v1, v3, v4, vcc
	s_cselect_b32 s0, s4, s5
	s_ashr_i32 s1, s0, 31
	s_mul_i32 s1, s18, s1
	s_mul_hi_u32 s4, s18, s0
	s_add_i32 s1, s4, s1
	s_mul_i32 s4, s19, s0
	s_add_i32 s1, s1, s4
	s_mul_i32 s0, s18, s0
	s_lshl_b64 s[0:1], s[0:1], 1
	s_add_u32 s4, s10, s0
	s_addc_u32 s5, s11, s1
	s_lshl_b64 s[0:1], s[2:3], 1
	s_add_u32 s8, s4, s0
	v_not_b32_e32 v8, -2.0
	s_addc_u32 s0, s5, s1
	s_and_b32 s9, s0, 0xffff
	s_mov_b32 s11, 0x27000
	s_mov_b32 s10, 0x7ffffffd
	s_waitcnt vmcnt(1)
	v_add_u32_e32 v4, s33, v18
	s_waitcnt vmcnt(0)
	v_cmp_lt_i32_e32 vcc, v4, v0
	scratch_load_dword v0, off, off
	s_waitcnt vmcnt(0)
	v_mul_lo_u32 v0, v0, s18
	v_lshlrev_b32_e32 v0, 2, v0
	v_add_u32_e32 v5, v0, v18
	v_cndmask_b32_e32 v2, v8, v5, vcc
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a54, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, s18, v5
	v_cndmask_b32_e32 v2, v8, v2, vcc
	v_lshlrev_b32_e32 v2, 1, v2
	v_lshl_add_u32 v6, s18, 1, v0
	buffer_store_short a53, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v6, v18
	v_cndmask_b32_e32 v2, v8, v2, vcc
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v27, v2, s[8:11], 0 offen
	v_mad_u64_u32 v[2:3], s[0:1], s18, 3, v[0:1]
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short v26, v3, s[8:11], 0 offen
	scratch_load_dword v3, off, off offset:136
	v_lshl_add_u32 v16, s18, 5, v0
	scratch_load_dword v26, off, off offset:8
	scratch_load_dword v27, off, off offset:4
	s_waitcnt vmcnt(2)
	v_cmp_lt_i32_e64 s[0:1], v4, v3
	v_add_u32_e32 v3, 16, v5
	s_nop 0
	v_cndmask_b32_e64 v7, v8, v3, s[0:1]
	v_add_u32_e32 v3, s18, v3
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v7, 1, v7
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short v248, v7, s[8:11], 0 offen
	buffer_store_short a62, v3, s[8:11], 0 offen
	s_waitcnt vmcnt(3)
	v_add_u32_e32 v3, v6, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a61, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v2, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a60, v3, s[8:11], 0 offen
	scratch_load_dword v3, off, off offset:132
	v_add_u32_e32 v248, 32, v18
	s_waitcnt vmcnt(0)
	v_cmp_lt_i32_e64 s[2:3], v4, v3
	v_add_u32_e32 v3, 32, v5
	s_nop 0
	v_cndmask_b32_e64 v7, v8, v3, s[2:3]
	v_add_u32_e32 v3, s18, v3
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v7, 1, v7
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a58, v7, s[8:11], 0 offen
	buffer_store_short a57, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v6, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a56, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v2, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a55, v3, s[8:11], 0 offen
	scratch_load_dword v3, off, off offset:128
	v_add_u32_e32 v2, v2, v27
	s_waitcnt vmcnt(0)
	v_cmp_lt_i32_e64 s[4:5], v4, v3
	v_add_u32_e32 v3, 48, v5
	s_nop 0
	v_cndmask_b32_e64 v4, v8, v3, s[4:5]
	v_add_u32_e32 v3, s18, v3
	v_cndmask_b32_e64 v3, v8, v3, s[4:5]
	v_lshlrev_b32_e32 v4, 1, v4
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short v240, v4, s[8:11], 0 offen
	buffer_store_short a59, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v6, v27
	v_cndmask_b32_e64 v3, v8, v3, s[4:5]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v3, 1, v3
	v_lshlrev_b32_e32 v2, 1, v2
	v_lshl_add_u32 v240, s18, 4, v0
	buffer_store_short a37, v3, s[8:11], 0 offen
	buffer_store_short a35, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v240, v18
	v_cndmask_b32_e32 v2, v8, v2, vcc
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a39, v2, s[8:11], 0 offen
	v_mad_u64_u32 v[2:3], s[6:7], s18, 17, v[0:1]
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	v_mad_u64_u32 v[4:5], s[6:7], s18, 18, v[0:1]
	buffer_store_short a21, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v4, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	v_mad_u64_u32 v[6:7], s[6:7], s18, 19, v[0:1]
	buffer_store_short a17, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v6, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a15, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v240, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a25, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v2, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a24, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v4, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a22, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v6, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a18, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v240, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a26, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v2, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a13, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v4, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a63, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v6, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a67, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v240, v27
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v3, v8, v3, s[4:5]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v3, 1, v3
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a2, v3, s[8:11], 0 offen
	buffer_store_short a0, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a65, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v6, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a64, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v16, v18
	v_cndmask_b32_e32 v2, v8, v2, vcc
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a5, v2, s[8:11], 0 offen
	v_mad_u64_u32 v[2:3], s[6:7], s18, 33, v[0:1]
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	v_mad_u64_u32 v[4:5], s[6:7], s18, 34, v[0:1]
	buffer_store_short a3, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v4, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	v_mad_u64_u32 v[6:7], s[6:7], s18, 35, v[0:1]
	buffer_store_short a1, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v6, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a66, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v16, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a9, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v2, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a7, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v4, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a6, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v6, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a4, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v16, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a12, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v2, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a11, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v4, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a10, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v6, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a8, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v16, v27
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v3, v8, v3, s[4:5]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v3, 1, v3
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a68, v3, s[8:11], 0 offen
	buffer_store_short a19, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a16, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v6, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a14, v2, s[8:11], 0 offen
	v_mad_u64_u32 v[2:3], s[6:7], s18, 48, v[0:1]
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	v_mad_u64_u32 v[4:5], s[6:7], s18, 49, v[0:1]
	buffer_store_short v227, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v4, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	v_mad_u64_u32 v[6:7], s[6:7], s18, 50, v[0:1]
	buffer_store_short v231, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v6, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	v_mad_u64_u32 v[16:17], s[6:7], s18, 51, v[0:1]
	buffer_store_short a23, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v16, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short a20, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v2, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short v222, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v4, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short v223, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v6, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short v224, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v16, v26
	v_cndmask_b32_e64 v3, v8, v3, s[0:1]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short v226, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v2, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short v218, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v4, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short v219, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v6, v248
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_lshlrev_b32_e32 v3, 1, v3
	buffer_store_short v220, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, v16, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v3, v8, v3, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v3, 1, v3
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v221, v3, s[8:11], 0 offen
	buffer_store_short v212, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v214, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v6, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v216, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v16, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v217, v2, s[8:11], 0 offen
	v_lshl_add_u32 v2, s18, 6, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0x41
	buffer_store_short a70, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0x42
	buffer_store_short a69, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	s_mul_i32 s6, s18, 0x43
	buffer_store_short v37, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, s6, v0
	v_add_u32_e32 v6, v5, v18
	v_cndmask_b32_e32 v6, v8, v6, vcc
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v215, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a29, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a27, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v29, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v28, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a33, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a31, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a30, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v6, 1, v6
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a28, v6, s[8:11], 0 offen
	buffer_store_short a38, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v3, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a36, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a34, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v5, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	s_mul_i32 s6, s18, 0x50
	buffer_store_short a32, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, s6, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0x51
	buffer_store_short a45, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0x52
	buffer_store_short a42, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	s_mul_i32 s6, s18, 0x53
	buffer_store_short a41, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, s6, v0
	v_add_u32_e32 v6, v5, v18
	v_cndmask_b32_e32 v6, v8, v6, vcc
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a40, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a47, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a46, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a44, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a43, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v207, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a50, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short a49, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v6, 1, v6
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a48, v6, s[8:11], 0 offen
	buffer_store_short v205, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v3, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v206, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short a52, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v5, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	s_mul_i32 s6, s18, 0x60
	buffer_store_short a51, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, s6, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0x61
	buffer_store_short v201, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0x62
	buffer_store_short v202, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	s_mul_i32 s6, s18, 0x63
	buffer_store_short v203, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, s6, v0
	v_add_u32_e32 v6, v5, v18
	v_cndmask_b32_e32 v6, v8, v6, vcc
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v204, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v164, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v165, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v166, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v200, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v159, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v161, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v162, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v6, 1, v6
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v163, v6, s[8:11], 0 offen
	buffer_store_short v156, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v3, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v157, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v158, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v5, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	s_mul_i32 s6, s18, 0x70
	buffer_store_short v160, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, s6, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0x71
	buffer_store_short v150, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0x72
	buffer_store_short v152, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	s_mul_i32 s6, s18, 0x73
	buffer_store_short v154, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, s6, v0
	v_add_u32_e32 v6, v5, v18
	v_cndmask_b32_e32 v6, v8, v6, vcc
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v155, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v147, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v149, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v151, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v153, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v144, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v145, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v146, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v6, 1, v6
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v148, v6, s[8:11], 0 offen
	buffer_store_short v138, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v3, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v140, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v142, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v5, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v143, v2, s[8:11], 0 offen
	v_lshl_add_u32 v2, s18, 7, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0x81
	buffer_store_short v136, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0x82
	buffer_store_short v137, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	s_mul_i32 s6, s18, 0x83
	buffer_store_short v139, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, s6, v0
	v_add_u32_e32 v6, v5, v18
	v_cndmask_b32_e32 v6, v8, v6, vcc
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v141, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v130, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v170, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v169, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v168, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v127, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v128, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v129, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v6, 1, v6
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v171, v6, s[8:11], 0 offen
	buffer_store_short v121, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v3, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v123, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v125, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v5, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	s_mul_i32 s6, s18, 0x90
	buffer_store_short v126, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, s6, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0x91
	buffer_store_short v119, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0x92
	buffer_store_short v120, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	s_mul_i32 s6, s18, 0x93
	buffer_store_short v122, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, s6, v0
	v_add_u32_e32 v6, v5, v18
	v_cndmask_b32_e32 v6, v8, v6, vcc
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v124, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v115, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v116, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v117, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v118, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v111, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v112, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v113, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v6, 1, v6
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v114, v6, s[8:11], 0 offen
	buffer_store_short v251, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v3, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v243, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v109, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v5, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	s_mul_i32 s6, s18, 0xa0
	buffer_store_short v110, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, s6, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0xa1
	buffer_store_short v246, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0xa2
	buffer_store_short v235, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	s_mul_i32 s6, s18, 0xa3
	buffer_store_short v247, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, s6, v0
	v_add_u32_e32 v6, v5, v18
	v_cndmask_b32_e32 v6, v8, v6, vcc
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v108, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v242, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v245, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v234, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v250, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v238, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v241, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v230, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v6, 1, v6
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v249, v6, s[8:11], 0 offen
	buffer_store_short v239, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v3, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v233, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v244, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v5, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	s_mul_i32 s6, s18, 0xb0
	buffer_store_short v229, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, s6, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0xb1
	buffer_store_short v228, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0xb2
	buffer_store_short v232, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	s_mul_i32 s6, s18, 0xb3
	buffer_store_short v213, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, s6, v0
	v_add_u32_e32 v6, v5, v18
	v_cndmask_b32_e32 v6, v8, v6, vcc
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v225, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v75, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v236, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v167, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v237, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v70, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v72, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v73, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v6, 1, v6
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v74, v6, s[8:11], 0 offen
	buffer_store_short v67, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v3, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v68, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v69, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v5, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	s_mul_i32 s6, s18, 0xc0
	buffer_store_short v71, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, s6, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0xc1
	buffer_store_short v63, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0xc2
	buffer_store_short v64, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	s_mul_i32 s6, s18, 0xc3
	buffer_store_short v65, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, s6, v0
	v_add_u32_e32 v6, v5, v18
	v_cndmask_b32_e32 v6, v8, v6, vcc
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v66, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v59, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v60, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v61, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v62, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v54, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v56, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v57, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v6, 1, v6
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v58, v6, s[8:11], 0 offen
	buffer_store_short v51, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v3, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v52, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v53, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v5, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	s_mul_i32 s6, s18, 0xd0
	buffer_store_short v55, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, s6, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0xd1
	buffer_store_short v47, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0xd2
	buffer_store_short v48, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	s_mul_i32 s6, s18, 0xd3
	buffer_store_short v49, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, s6, v0
	v_add_u32_e32 v6, v5, v18
	v_cndmask_b32_e32 v6, v8, v6, vcc
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v50, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v43, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v44, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v45, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v46, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v39, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v40, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v41, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v6, 1, v6
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v42, v6, s[8:11], 0 offen
	buffer_store_short v35, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v3, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v36, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v23, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v5, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	s_mul_i32 s6, s18, 0xe0
	buffer_store_short v38, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, s6, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0xe1
	buffer_store_short v31, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0xe2
	buffer_store_short v32, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	s_mul_i32 s6, s18, 0xe3
	buffer_store_short v33, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, s6, v0
	v_add_u32_e32 v6, v5, v18
	v_cndmask_b32_e32 v6, v8, v6, vcc
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v34, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v83, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v81, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v80, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v26
	v_cndmask_b32_e64 v6, v8, v6, s[0:1]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v30, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v2, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v21, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v3, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v24, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v4, v248
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_lshlrev_b32_e32 v6, 1, v6
	buffer_store_short v25, v6, s[8:11], 0 offen
	v_add_u32_e32 v6, v5, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v6, v8, v6, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v6, 1, v6
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v82, v6, s[8:11], 0 offen
	buffer_store_short v77, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v3, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v76, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v4, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v22, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, v5, v27
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v2, 1, v2
	s_mul_i32 s6, s18, 0xf0
	buffer_store_short v20, v2, s[8:11], 0 offen
	v_add_u32_e32 v2, s6, v0
	v_add_u32_e32 v3, v2, v18
	v_cndmask_b32_e32 v3, v8, v3, vcc
	v_lshlrev_b32_e32 v3, 1, v3
	s_mul_i32 s6, s18, 0xf1
	buffer_store_short v14, v3, s[8:11], 0 offen
	v_add_u32_e32 v3, s6, v0
	v_add_u32_e32 v4, v3, v18
	v_cndmask_b32_e32 v4, v8, v4, vcc
	v_lshlrev_b32_e32 v4, 1, v4
	s_mul_i32 s6, s18, 0xf2
	buffer_store_short v15, v4, s[8:11], 0 offen
	v_add_u32_e32 v4, s6, v0
	v_add_u32_e32 v5, v4, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	s_mul_i32 s6, s18, 0xf3
	v_lshlrev_b32_e32 v5, 1, v5
	v_add_u32_e32 v0, s6, v0
	buffer_store_short v78, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, v0, v18
	v_cndmask_b32_e32 v5, v8, v5, vcc
	v_lshlrev_b32_e32 v5, 1, v5
	buffer_store_short v79, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, v2, v26
	v_cndmask_b32_e64 v5, v8, v5, s[0:1]
	v_lshlrev_b32_e32 v5, 1, v5
	buffer_store_short v254, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, v3, v26
	v_cndmask_b32_e64 v5, v8, v5, s[0:1]
	v_lshlrev_b32_e32 v5, 1, v5
	buffer_store_short v253, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, v4, v26
	v_cndmask_b32_e64 v5, v8, v5, s[0:1]
	v_lshlrev_b32_e32 v5, 1, v5
	buffer_store_short v131, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, v0, v26
	v_cndmask_b32_e64 v5, v8, v5, s[0:1]
	v_lshlrev_b32_e32 v5, 1, v5
	buffer_store_short v19, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, v2, v248
	v_cndmask_b32_e64 v5, v8, v5, s[2:3]
	v_lshlrev_b32_e32 v5, 1, v5
	buffer_store_short v11, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, v3, v248
	v_cndmask_b32_e64 v5, v8, v5, s[2:3]
	v_lshlrev_b32_e32 v5, 1, v5
	buffer_store_short v13, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, v4, v248
	v_cndmask_b32_e64 v5, v8, v5, s[2:3]
	v_lshlrev_b32_e32 v5, 1, v5
	buffer_store_short v255, v5, s[8:11], 0 offen
	v_add_u32_e32 v5, v0, v248
	v_add_u32_e32 v2, v2, v27
	v_cndmask_b32_e64 v5, v8, v5, s[2:3]
	v_cndmask_b32_e64 v2, v8, v2, s[4:5]
	v_lshlrev_b32_e32 v5, 1, v5
	v_lshlrev_b32_e32 v2, 1, v2
	buffer_store_short v252, v5, s[8:11], 0 offen
	buffer_store_short v1, v2, s[8:11], 0 offen
	v_add_u32_e32 v1, v3, v27
	v_cndmask_b32_e64 v1, v8, v1, s[4:5]
	v_lshlrev_b32_e32 v1, 1, v1
	buffer_store_short v9, v1, s[8:11], 0 offen
	v_add_u32_e32 v1, v4, v27
	v_add_u32_e32 v0, v0, v27
	v_cndmask_b32_e64 v1, v8, v1, s[4:5]
	v_cndmask_b32_e64 v0, v8, v0, s[4:5]
	v_lshlrev_b32_e32 v1, 1, v1
	v_lshlrev_b32_e32 v0, 1, v0
	buffer_store_short v10, v1, s[8:11], 0 offen
	buffer_store_short v12, v0, s[8:11], 0 offen
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel gemm_256x224x256
		.amdhsa_group_segment_fixed_size 69632
		.amdhsa_private_segment_fixed_size 148
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
		.amdhsa_enable_private_segment 1
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
	.size	gemm_256x224x256, .Lfunc_end0-gemm_256x224x256

	.set gemm_256x224x256.num_vgpr, 256
	.set gemm_256x224x256.num_agpr, 256
	.set gemm_256x224x256.numbered_sgpr, 62
	.set gemm_256x224x256.num_named_barrier, 0
	.set gemm_256x224x256.private_seg_size, 148
	.set gemm_256x224x256.uses_vcc, 1
	.set gemm_256x224x256.uses_flat_scratch, 0
	.set gemm_256x224x256.has_dyn_sized_stack, 0
	.set gemm_256x224x256.has_recursion, 0
	.set gemm_256x224x256.has_indirect_call, 0
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
    .name:           gemm_256x224x256
    .private_segment_fixed_size: 148
    .reqd_workgroup_size:
      - 64
      - 4
      - 1
    .sgpr_count:     68
    .sgpr_spill_count: 0
    .symbol:         gemm_256x224x256.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     512
    .vgpr_spill_count: 42
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx950
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata
