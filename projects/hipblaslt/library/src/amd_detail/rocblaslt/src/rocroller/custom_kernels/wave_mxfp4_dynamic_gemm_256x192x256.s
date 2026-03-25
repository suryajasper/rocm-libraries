; To reproduce the .rocmasm from .optimized.ll, run:
; llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx950 -mattr='-fma-mix-insts' -O3 <.optimized.ll> -o <out.rocmasm>

	.amdgcn_target "amdgcn-amd-amdhsa--gfx950"
	.text
	.globl	wave_mxfp4_dynamic_gemm_256x192x256
	.p2align	8
	.type	wave_mxfp4_dynamic_gemm_256x192x256,@function
wave_mxfp4_dynamic_gemm_256x192x256:
	s_load_dwordx2 s[2:3], s[0:1], 0x0
	s_load_dwordx8 s[4:11], s[0:1], 0x8
	s_load_dwordx4 s[12:15], s[0:1], 0x28
	s_waitcnt lgkmcnt(0)
	s_branch .LBB0_0
	.p2align	8
.LBB0_0:
	s_load_dwordx2 s[18:19], s[0:1], 0x38
	s_mov_b64 s[24:25], s[2:3]
	s_mov_b64 s[20:21], s[6:7]
	v_and_b32_e32 v97, 0x3ff, v0
	v_bfe_u32 v3, v0, 10, 10
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s2, s19, 31
	s_mov_b32 s3, s2
	s_xor_b64 s[6:7], s[18:19], s[2:3]
	s_lshr_b32 s14, s7, 31
	s_add_u32 s6, s6, s14
	s_addc_u32 s7, s7, 0
	v_lshrrev_b32_e32 v4, 6, v97
	v_lshlrev_b32_e32 v105, 5, v3
	s_ashr_i64 s[6:7], s[6:7], 1
	s_mov_b32 s12, s17
	s_mov_b32 s17, 0
	v_lshl_or_b32 v0, v4, 3, v105
	s_xor_b64 s[34:35], s[6:7], s[2:3]
	v_lshrrev_b32_e32 v2, 3, v97
	v_readfirstlane_b32 s13, v0
	v_or_b32_e32 v0, v2, v105
	s_lshl_b64 s[6:7], s[16:17], 8
	s_and_b32 s2, s34, 0x3fff
	v_or_b32_e32 v5, s6, v0
	v_bitop3_b32 v1, v2, 7, v97 bitop3:0x48
	s_bitset1_b32 s2, 14
	v_lshlrev_b32_e32 v107, 4, v1
	v_mul_lo_u32 v106, s34, v5
	s_lshl_b32 s28, s2, 16
	s_and_b32 s2, s25, 0xffff
	s_lshl_b32 s35, s13, 7
	s_or_b32 s25, s2, s28
	s_mov_b32 s27, 0x27000
	s_mov_b32 s26, 0x7ffffffe
	v_add_u32_e32 v6, v107, v106
	s_mov_b32 m0, s35
	s_or_b32 s13, s35, 0x2000
	buffer_load_dwordx4 v6, s[24:27], 0 offen lds
	v_or_b32_e32 v6, 64, v5
	v_mul_lo_u32 v108, s34, v6
	v_add_u32_e32 v6, v107, v108
	s_mov_b32 m0, s13
	s_or_b32 s33, s35, 0x4000
	buffer_load_dwordx4 v6, s[24:27], 0 offen lds
	v_or_b32_e32 v6, 0x80, v5
	v_mul_lo_u32 v109, s34, v6
	v_or_b32_e32 v5, 0xc0, v5
	v_add_u32_e32 v6, v107, v109
	s_mov_b32 m0, s33
	v_mul_lo_u32 v110, s34, v5
	s_or_b32 s48, s35, 0x6000
	buffer_load_dwordx4 v6, s[24:27], 0 offen lds
	v_add_u32_e32 v5, v107, v110
	s_mov_b32 m0, s48
	s_add_u32 s22, s34, -1
	buffer_load_dwordx4 v5, s[24:27], 0 offen lds
	s_addc_u32 s15, 0, 0
	s_mov_b32 s14, s17
	s_cmp_lg_u64 s[14:15], 0
	s_cbranch_scc0 .LBB0_15
	v_cvt_f32_u32_e32 v5, s34
	v_mov_b32_e32 v6, 0x4f800000
	s_sub_u32 s14, 0, s34
	s_subb_u32 s17, 0, 0
	v_fmac_f32_e32 v5, 0, v6
	v_rcp_f32_e32 v5, v5
	s_nop 0
	v_mul_f32_e32 v5, 0x5f7ffffc, v5
	v_mul_f32_e32 v6, 0x2f800000, v5
	v_trunc_f32_e32 v6, v6
	v_fmamk_f32 v5, v6, 0xcf800000, v5
	v_cvt_u32_f32_e32 v6, v6
	v_cvt_u32_f32_e32 v5, v5
	v_readfirstlane_b32 s23, v6
	v_readfirstlane_b32 s29, v5
	s_mul_i32 s30, s14, s23
	s_mul_hi_u32 s36, s14, s29
	s_mul_i32 s31, s17, s29
	s_add_i32 s30, s36, s30
	s_add_i32 s30, s30, s31
	s_mul_i32 s37, s14, s29
	s_mul_i32 s36, s29, s30
	s_mul_hi_u32 s38, s29, s37
	s_mul_hi_u32 s31, s29, s30
	s_add_u32 s36, s38, s36
	s_addc_u32 s31, 0, s31
	s_mul_hi_u32 s39, s23, s37
	s_mul_i32 s37, s23, s37
	s_add_u32 s36, s36, s37
	s_mul_hi_u32 s38, s23, s30
	s_addc_u32 s31, s31, s39
	s_addc_u32 s36, s38, 0
	s_mul_i32 s30, s23, s30
	s_add_u32 s30, s31, s30
	s_addc_u32 s31, 0, s36
	s_add_u32 s29, s29, s30
	s_addc_u32 s23, s23, s31
	s_mul_i32 s30, s14, s23
	s_mul_hi_u32 s31, s14, s29
	s_add_i32 s30, s31, s30
	s_mul_i32 s17, s17, s29
	s_add_i32 s30, s30, s17
	s_mul_i32 s14, s14, s29
	s_mul_hi_u32 s31, s23, s14
	s_mul_i32 s36, s23, s14
	s_mul_i32 s38, s29, s30
	s_mul_hi_u32 s14, s29, s14
	s_mul_hi_u32 s37, s29, s30
	s_add_u32 s14, s14, s38
	s_addc_u32 s37, 0, s37
	s_add_u32 s14, s14, s36
	s_mul_hi_u32 s17, s23, s30
	s_addc_u32 s14, s37, s31
	s_addc_u32 s17, s17, 0
	s_mul_i32 s30, s23, s30
	s_add_u32 s14, s14, s30
	s_addc_u32 s17, 0, s17
	s_add_u32 s14, s29, s14
	s_addc_u32 s17, s23, s17
	s_mul_i32 s29, s22, s17
	s_mul_hi_u32 s30, s22, s14
	s_mul_hi_u32 s23, s22, s17
	s_add_u32 s29, s30, s29
	s_addc_u32 s23, 0, s23
	s_mul_i32 s14, s15, s14
	s_add_u32 s14, s29, s14
	s_addc_u32 s14, s23, 0
	s_addc_u32 s23, 0, 0
	s_mul_i32 s17, s15, s17
	s_add_u32 s14, s14, s17
	s_addc_u32 s17, 0, s23
	s_mul_i32 s17, s34, s17
	s_mul_hi_u32 s30, s34, s14
	s_add_u32 s23, s14, 1
	s_add_u32 s29, s14, 2
	s_add_i32 s30, s30, s17
	s_mul_i32 s17, s34, s14
	s_sub_u32 s17, s22, s17
	s_subb_u32 s15, s15, s30
	s_sub_u32 s30, s17, s34
	s_subb_u32 s31, s15, 0
	s_cmp_ge_u32 s30, s34
	s_cselect_b32 s30, -1, 0
	s_cmp_eq_u32 s31, 0
	s_cselect_b32 s30, s30, -1
	s_cmp_lg_u32 s30, 0
	s_cselect_b32 s23, s29, s23
	s_cmp_ge_u32 s17, s34
	s_cselect_b32 s17, -1, 0
	s_cmp_eq_u32 s15, 0
	s_cselect_b32 s15, s17, -1
	s_cmp_lg_u32 s15, 0
	s_cselect_b32 s40, s23, s14
	s_cbranch_execnz .LBB0_3
.LBB0_2:
	v_cvt_f32_u32_e32 v5, s34
	s_sub_i32 s2, 0, s34
	v_rcp_iflag_f32_e32 v5, v5
	s_nop 0
	v_mul_f32_e32 v5, 0x4f7ffffe, v5
	v_cvt_u32_f32_e32 v5, v5
	s_nop 0
	v_readfirstlane_b32 s3, v5
	s_mul_i32 s2, s2, s3
	s_mul_hi_u32 s2, s3, s2
	s_add_i32 s3, s3, s2
	s_mul_hi_u32 s2, s22, s3
	s_mul_i32 s14, s2, s34
	s_sub_i32 s14, s22, s14
	s_add_i32 s3, s2, 1
	s_sub_i32 s15, s14, s34
	s_cmp_ge_u32 s14, s34
	s_cselect_b32 s2, s3, s2
	s_cselect_b32 s14, s15, s14
	s_add_i32 s3, s2, 1
	s_cmp_ge_u32 s14, s34
	s_cselect_b32 s40, s3, s2
.LBB0_3:
	v_lshrrev_b32_e32 v5, 7, v97
	v_sub_u32_e32 v1, v1, v5
	v_lshlrev_b32_e32 v122, 8, v1
	v_lshlrev_b32_e32 v123, 4, v2
	v_add_u32_e32 v118, v122, v123
	v_mul_hi_u32 v1, s40, v118
	v_mul_lo_u32 v6, v1, s34
	v_sub_u32_e32 v6, v118, v6
	v_cmp_le_u32_e32 vcc, s34, v6
	s_mul_i32 s14, s12, 0xc0
	v_and_b32_e32 v96, 48, v0
	v_subbrev_co_u32_e64 v1, s[2:3], 0, v1, vcc
	v_mov_b32_e32 v0, s34
	v_add_u32_e32 v1, s14, v1
	v_cndmask_b32_e32 v0, 0, v0, vcc
	v_lshlrev_b32_e32 v121, 4, v5
	v_add_u32_e32 v7, v1, v96
	s_and_b32 s2, s21, 0xffff
	v_add_u32_e32 v0, v6, v0
	v_or_b32_e32 v5, v121, v105
	s_or_b32 s21, s2, s28
	v_mad_u64_u32 v[6:7], s[2:3], v7, s34, v[0:1]
	s_add_i32 s49, s35, 0x10000
	v_add_u32_e32 v1, v5, v1
	s_mov_b32 s23, 0x27000
	s_mov_b32 s22, 0x7ffffffe
	s_mov_b32 m0, s49
	v_add_u32_e32 v5, 64, v1
	s_add_i32 s50, s13, 0x10000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_mad_u64_u32 v[6:7], s[2:3], v5, s34, v[0:1]
	s_mov_b32 m0, s50
	v_add_u32_e32 v1, 0x80, v1
	s_add_i32 s51, s33, 0x10000
	buffer_load_dwordx4 v6, s[20:23], 0 offen lds
	v_mad_u64_u32 v[0:1], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s51
	s_add_u32 s17, s18, -1
	buffer_load_dwordx4 v0, s[20:23], 0 offen lds
	s_mov_b32 s28, 0
	s_addc_u32 s29, 0, 0
	s_cmp_lg_u64 s[28:29], 0
	s_mul_hi_u32 s15, s12, 0xc0
	s_cbranch_scc0 .LBB0_16
	v_cvt_f32_u32_e32 v0, s18
	v_mov_b32_e32 v1, 0x4f800000
	s_sub_u32 s28, 0, s18
	s_subb_u32 s30, 0, 0
	v_fmac_f32_e32 v0, 0, v1
	v_rcp_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x5f7ffffc, v0
	v_mul_f32_e32 v1, 0x2f800000, v0
	v_trunc_f32_e32 v1, v1
	v_fmamk_f32 v0, v1, 0xcf800000, v0
	v_cvt_u32_f32_e32 v1, v1
	v_cvt_u32_f32_e32 v0, v0
	v_readfirstlane_b32 s31, v1
	v_readfirstlane_b32 s36, v0
	s_mul_i32 s37, s28, s31
	s_mul_hi_u32 s39, s28, s36
	s_mul_i32 s38, s30, s36
	s_add_i32 s37, s39, s37
	s_add_i32 s37, s37, s38
	s_mul_i32 s41, s28, s36
	s_mul_i32 s39, s36, s37
	s_mul_hi_u32 s42, s36, s41
	s_mul_hi_u32 s38, s36, s37
	s_add_u32 s39, s42, s39
	s_addc_u32 s38, 0, s38
	s_mul_hi_u32 s43, s31, s41
	s_mul_i32 s41, s31, s41
	s_add_u32 s39, s39, s41
	s_mul_hi_u32 s42, s31, s37
	s_addc_u32 s38, s38, s43
	s_addc_u32 s39, s42, 0
	s_mul_i32 s37, s31, s37
	s_add_u32 s37, s38, s37
	s_addc_u32 s38, 0, s39
	s_add_u32 s36, s36, s37
	s_addc_u32 s31, s31, s38
	s_mul_i32 s37, s28, s31
	s_mul_hi_u32 s38, s28, s36
	s_add_i32 s37, s38, s37
	s_mul_i32 s30, s30, s36
	s_add_i32 s37, s37, s30
	s_mul_i32 s28, s28, s36
	s_mul_hi_u32 s38, s31, s28
	s_mul_i32 s39, s31, s28
	s_mul_i32 s42, s36, s37
	s_mul_hi_u32 s28, s36, s28
	s_mul_hi_u32 s41, s36, s37
	s_add_u32 s28, s28, s42
	s_addc_u32 s41, 0, s41
	s_add_u32 s28, s28, s39
	s_mul_hi_u32 s30, s31, s37
	s_addc_u32 s28, s41, s38
	s_addc_u32 s30, s30, 0
	s_mul_i32 s37, s31, s37
	s_add_u32 s28, s28, s37
	s_addc_u32 s30, 0, s30
	s_add_u32 s28, s36, s28
	s_addc_u32 s30, s31, s30
	s_mul_i32 s36, s17, s30
	s_mul_hi_u32 s37, s17, s28
	s_mul_hi_u32 s31, s17, s30
	s_add_u32 s36, s37, s36
	s_addc_u32 s31, 0, s31
	s_mul_i32 s28, s29, s28
	s_add_u32 s28, s36, s28
	s_addc_u32 s28, s31, 0
	s_addc_u32 s31, 0, 0
	s_mul_i32 s30, s29, s30
	s_add_u32 s28, s28, s30
	s_addc_u32 s30, 0, s31
	s_mul_i32 s30, s18, s30
	s_mul_hi_u32 s37, s18, s28
	s_add_u32 s31, s28, 1
	s_add_u32 s36, s28, 2
	s_add_i32 s37, s37, s30
	s_mul_i32 s30, s18, s28
	s_sub_u32 s30, s17, s30
	s_subb_u32 s29, s29, s37
	s_sub_u32 s37, s30, s18
	s_subb_u32 s38, s29, 0
	s_cmp_ge_u32 s37, s18
	s_cselect_b32 s37, -1, 0
	s_cmp_eq_u32 s38, 0
	s_cselect_b32 s37, s37, -1
	s_cmp_lg_u32 s37, 0
	s_cselect_b32 s31, s36, s31
	s_cmp_ge_u32 s30, s18
	s_cselect_b32 s30, -1, 0
	s_cmp_eq_u32 s29, 0
	s_cselect_b32 s29, s30, -1
	s_cmp_lg_u32 s29, 0
	s_cselect_b32 s46, s31, s28
	s_load_dwordx2 s[44:45], s[0:1], 0x48
	s_load_dwordx2 s[42:43], s[0:1], 0x58
	s_cbranch_execnz .LBB0_6
.LBB0_5:
	v_cvt_f32_u32_e32 v0, s18
	s_sub_i32 s2, 0, s18
	v_rcp_iflag_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	s_nop 0
	v_readfirstlane_b32 s3, v0
	s_mul_i32 s2, s2, s3
	s_mul_hi_u32 s2, s3, s2
	s_add_i32 s3, s3, s2
	s_mul_hi_u32 s2, s17, s3
	s_mul_i32 s28, s2, s18
	s_sub_i32 s17, s17, s28
	s_add_i32 s3, s2, 1
	s_sub_i32 s28, s17, s18
	s_cmp_ge_u32 s17, s18
	s_cselect_b32 s2, s3, s2
	s_cselect_b32 s17, s28, s17
	s_add_i32 s3, s2, 1
	s_cmp_ge_u32 s17, s18
	s_cselect_b32 s46, s3, s2
.LBB0_6:
	v_lshrrev_b32_e32 v7, 4, v97
	s_movk_i32 s2, 0xf800
	v_bfe_u32 v102, v97, 4, 2
	v_lshlrev_b32_e32 v5, 7, v97
	v_lshlrev_b32_e32 v6, 11, v102
	v_mad_i32_i24 v8, v7, s2, v5
	v_add_u32_e32 v124, v8, v6
	v_mul_hi_u32 v0, s46, v124
	v_mul_lo_u32 v1, s18, v0
	v_sub_u32_e32 v1, v124, v1
	v_cmp_le_u32_e32 vcc, s18, v1
	v_and_b32_e32 v103, 0xc0, v97
	s_mov_b32 s31, 0x27000
	v_subbrev_co_u32_e64 v9, s[2:3], 0, v0, vcc
	v_mov_b32_e32 v0, s18
	v_cndmask_b32_e32 v0, 0, v0, vcc
	v_add_u32_e32 v0, v0, v1
	v_ashrrev_i32_e32 v1, 31, v0
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s2, s44, s7
	s_mul_hi_u32 s3, s44, s6
	v_xor_b32_e32 v0, v1, v0
	s_add_i32 s2, s3, s2
	s_mul_i32 s3, s45, s6
	v_ashrrev_i32_e32 v10, 31, v0
	s_add_i32 s2, s2, s3
	s_mul_i32 s3, s44, s6
	v_lshrrev_b32_e32 v10, 27, v10
	s_add_u32 s28, s4, s3
	v_add_u32_e32 v0, v0, v10
	s_addc_u32 s2, s5, s2
	s_and_b32 s3, s44, 0x3fff
	v_ashrrev_i32_e32 v0, 5, v0
	s_bitset1_b32 s3, 14
	v_xor_b32_e32 v0, v0, v1
	s_and_b32 s2, s2, 0xffff
	s_lshl_b32 s3, s3, 16
	v_add_u32_e32 v1, v103, v9
	s_or_b32 s29, s2, s3
	v_mad_u64_u32 v[10:11], s[2:3], v1, s44, v[0:1]
	s_movk_i32 s2, 0x60
	s_nop 0
	v_mul_lo_u32 v104, v3, s2
	s_mul_i32 s2, s42, s15
	s_mul_hi_u32 s3, s42, s14
	s_add_i32 s2, s3, s2
	s_mul_i32 s3, s43, s14
	s_lshl_b32 s17, s44, 5
	s_add_i32 s2, s2, s3
	s_mul_i32 s3, s42, s14
	s_add_u32 s36, s8, s3
	s_addc_u32 s2, s9, s2
	s_and_b32 s3, s42, 0x3fff
	s_mov_b32 s30, 0x7ffffffe
	v_add_u32_e32 v1, s17, v10
	s_bitset1_b32 s3, 14
	buffer_load_dword v115, v10, s[28:31], 0 offen
	buffer_load_dword v111, v1, s[28:31], 0 offen
	s_and_b32 s2, s2, 0xffff
	s_lshl_b32 s3, s3, 16
	v_add_u32_e32 v1, v104, v9
	s_or_b32 s37, s2, s3
	v_mad_u64_u32 v[0:1], s[2:3], v1, s42, v[0:1]
	s_lshl_b32 s41, s42, 5
	s_mov_b32 s38, s30
	s_mov_b32 s39, s31
	v_add_u32_e32 v1, s41, v0
	v_add_u32_e32 v9, s41, v1
	buffer_load_dword v114, v0, s[36:39], 0 offen
	buffer_load_dword v113, v1, s[36:39], 0 offen
	buffer_load_dword v112, v9, s[36:39], 0 offen
	v_cmp_eq_u32_e64 s[2:3], 0, v3
	v_mov_b32_e32 v1, 0
	s_and_b64 vcc, exec, s[2:3]
	s_waitcnt vmcnt(5)
	s_barrier
	s_cbranch_vccnz .LBB0_8
	s_barrier
.LBB0_8:
	s_sub_u32 s38, 0, s18
	s_subb_u32 s39, 0, s19
	s_add_u32 s43, s18, -1
	s_addc_u32 s45, s19, -1
	v_cmp_lt_i64_e64 s[4:5], s[18:19], 1
	v_and_b32_e32 v9, 7, v97
	s_mov_b64 s[8:9], 0
	v_cndmask_b32_e64 v0, 0, -1, s[4:5]
	s_and_b64 s[4:5], s[4:5], exec
	s_cselect_b32 s5, s39, s45
	s_cselect_b32 s4, s38, s43
	s_ashr_i32 s19, s5, 31
	s_lshr_b32 s19, s19, 24
	s_add_u32 s4, s4, s19
	s_addc_u32 s5, s5, 0
	s_ashr_i64 s[4:5], s[4:5], 8
	v_xor_b32_e32 v11, s5, v0
	v_xor_b32_e32 v10, s4, v0
	v_lshrrev_b32_e32 v0, 31, v11
	v_lshl_add_u64 v[98:99], v[10:11], 0, v[0:1]
	s_movk_i32 s4, 0x3000
	v_and_b32_e32 v98, -2, v98
	v_bitop3_b32 v0, v102, v97, 7 bitop3:0x78
	v_mul_lo_u32 v3, v3, s4
	v_sub_co_u32_e32 v100, vcc, v10, v98
	v_lshl_add_u32 v1, v4, 13, v8
	v_lshlrev_b32_e32 v0, 4, v0
	v_add_u32_e32 v3, v8, v3
	v_subb_co_u32_e32 v101, vcc, v11, v99, vcc
	v_or_b32_e32 v116, v1, v0
	v_or_b32_e32 v119, v3, v0
	v_bitop3_b32 v0, v102, v9, 4 bitop3:0x36
	v_lshlrev_b32_e32 v0, 4, v0
	v_cmp_gt_i64_e32 vcc, 1, v[98:99]
	v_or_b32_e32 v117, v0, v1
	v_or_b32_e32 v120, v0, v3
	s_cbranch_vccnz .LBB0_17
	v_mul_i32_i24_e32 v0, 0xfffff800, v7
	v_add_u32_e32 v0, v0, v6
	s_movk_i32 s4, 0x4000
	v_add3_u32 v127, v0, v5, s4
	s_mul_i32 s4, s12, 0xc0
	v_or_b32_e32 v0, s4, v105
	v_and_b32_e32 v1, 16, v2
	v_add_u32_e32 v0, v0, v1
	v_add_u32_e32 v128, 0x80, v0
	v_add_u32_e32 v129, 64, v0
	v_add_u32_e32 v0, v2, v105
	v_and_b32_e32 v1, 0x70, v0
	v_lshl_or_b32 v0, s16, 8, v0
	v_add_u32_e32 v130, s4, v1
	v_add_u32_e32 v1, 64, v0
	v_mul_lo_u32 v131, v1, s34
	v_or_b32_e32 v1, 0x80, v0
	v_mul_lo_u32 v132, v1, s34
	v_add_u32_e32 v1, 0xc0, v0
	v_mov_b32_e32 v64, 0
	s_movk_i32 s19, 0x800
	v_add_u32_e32 v125, 0x800, v118
	v_add_u32_e32 v126, 0x2000, v124
	v_mul_lo_u32 v133, v1, s34
	v_mul_lo_u32 v134, v0, s34
	s_add_i32 s12, s35, 0x8000
	s_add_i32 s16, s13, 0x8000
	s_add_i32 s43, s33, 0x8000
	s_add_i32 s45, s48, 0x8000
	v_mov_b32_e32 v135, s34
	s_add_i32 s47, s35, 0x16000
	s_add_i32 s52, s13, 0x16000
	s_add_i32 s53, s33, 0x16000
	v_add_u32_e32 v136, 0x10000, v119
	v_mov_b32_e32 v137, s18
	s_mov_b32 s38, s30
	s_mov_b32 s39, s31
	v_add_u32_e32 v138, 0x10000, v120
	s_movk_i32 s54, 0x1000
	v_add_u32_e32 v139, 0x16000, v119
	v_add_u32_e32 v140, 0x16000, v120
	v_mov_b32_e32 v65, v64
	v_mov_b32_e32 v66, v64
	v_mov_b32_e32 v67, v64
	v_mov_b32_e32 v92, v64
	v_mov_b32_e32 v93, v64
	v_mov_b32_e32 v94, v64
	v_mov_b32_e32 v95, v64
	v_mov_b32_e32 v88, v64
	v_mov_b32_e32 v89, v64
	v_mov_b32_e32 v90, v64
	v_mov_b32_e32 v91, v64
	v_mov_b32_e32 v76, v64
	v_mov_b32_e32 v77, v64
	v_mov_b32_e32 v78, v64
	v_mov_b32_e32 v79, v64
	v_mov_b32_e32 v68, v64
	v_mov_b32_e32 v69, v64
	v_mov_b32_e32 v70, v64
	v_mov_b32_e32 v71, v64
	v_mov_b32_e32 v72, v64
	v_mov_b32_e32 v73, v64
	v_mov_b32_e32 v74, v64
	v_mov_b32_e32 v75, v64
	v_mov_b32_e32 v80, v64
	v_mov_b32_e32 v81, v64
	v_mov_b32_e32 v82, v64
	v_mov_b32_e32 v83, v64
	v_mov_b32_e32 v84, v64
	v_mov_b32_e32 v85, v64
	v_mov_b32_e32 v86, v64
	v_mov_b32_e32 v87, v64
	v_mov_b32_e32 v60, v64
	v_mov_b32_e32 v61, v64
	v_mov_b32_e32 v62, v64
	v_mov_b32_e32 v63, v64
	v_mov_b32_e32 v56, v64
	v_mov_b32_e32 v57, v64
	v_mov_b32_e32 v58, v64
	v_mov_b32_e32 v59, v64
	v_mov_b32_e32 v52, v64
	v_mov_b32_e32 v53, v64
	v_mov_b32_e32 v54, v64
	v_mov_b32_e32 v55, v64
	v_mov_b32_e32 v48, v64
	v_mov_b32_e32 v49, v64
	v_mov_b32_e32 v50, v64
	v_mov_b32_e32 v51, v64
	v_mov_b32_e32 v44, v64
	v_mov_b32_e32 v45, v64
	v_mov_b32_e32 v46, v64
	v_mov_b32_e32 v47, v64
	v_mov_b32_e32 v40, v64
	v_mov_b32_e32 v41, v64
	v_mov_b32_e32 v42, v64
	v_mov_b32_e32 v43, v64
	v_mov_b32_e32 v36, v64
	v_mov_b32_e32 v37, v64
	v_mov_b32_e32 v38, v64
	v_mov_b32_e32 v39, v64
	v_mov_b32_e32 v32, v64
	v_mov_b32_e32 v33, v64
	v_mov_b32_e32 v34, v64
	v_mov_b32_e32 v35, v64
	v_mov_b32_e32 v28, v64
	v_mov_b32_e32 v29, v64
	v_mov_b32_e32 v30, v64
	v_mov_b32_e32 v31, v64
	v_mov_b32_e32 v24, v64
	v_mov_b32_e32 v25, v64
	v_mov_b32_e32 v26, v64
	v_mov_b32_e32 v27, v64
	v_mov_b32_e32 v20, v64
	v_mov_b32_e32 v21, v64
	v_mov_b32_e32 v22, v64
	v_mov_b32_e32 v23, v64
	v_mov_b32_e32 v16, v64
	v_mov_b32_e32 v17, v64
	v_mov_b32_e32 v18, v64
	v_mov_b32_e32 v19, v64
	v_mov_b32_e32 v12, v64
	v_mov_b32_e32 v13, v64
	v_mov_b32_e32 v14, v64
	v_mov_b32_e32 v15, v64
	v_mov_b32_e32 v8, v64
	v_mov_b32_e32 v9, v64
	v_mov_b32_e32 v10, v64
	v_mov_b32_e32 v11, v64
	v_mov_b32_e32 v4, v64
	v_mov_b32_e32 v5, v64
	v_mov_b32_e32 v6, v64
	v_mov_b32_e32 v7, v64
	v_mov_b32_e32 v0, v64
	v_mov_b32_e32 v1, v64
	v_mov_b32_e32 v2, v64
	v_mov_b32_e32 v3, v64
	v_mov_b32_e32 v141, v122
.LBB0_10:
	v_add_u32_e32 v146, v134, v107
	s_mov_b32 m0, s12
	v_add_u32_e32 v142, 0x80, v146
	v_add_u32_e32 v147, v131, v107
	s_waitcnt vmcnt(5)
	s_barrier
	buffer_load_dwordx4 v142, s[24:27], 0 offen lds
	v_add_u32_e32 v142, 0x80, v147
	s_mov_b32 m0, s16
	v_add_u32_e32 v148, v132, v107
	buffer_load_dwordx4 v142, s[24:27], 0 offen lds
	v_add_u32_e32 v142, 0x80, v148
	s_mov_b32 m0, s43
	v_add_u32_e32 v149, v133, v107
	buffer_load_dwordx4 v142, s[24:27], 0 offen lds
	v_add_u32_e32 v142, 0x80, v149
	s_mov_b32 m0, s45
	v_add_u32_e32 v151, v123, v122
	buffer_load_dwordx4 v142, s[24:27], 0 offen lds
	v_add_u32_e32 v142, 0x800, v151
	v_mul_hi_u32 v142, s40, v142
	v_lshl_add_u32 v150, s8, 11, v125
	v_mul_lo_u32 v142, v142, s34
	v_sub_u32_e32 v142, v150, v142
	v_cmp_le_u32_e32 vcc, s34, v142
	v_add_u32_e32 v152, v141, v123
	s_mov_b32 m0, s47
	v_cndmask_b32_e32 v142, 0, v135, vcc
	v_subbrev_co_u32_e64 v143, s[4:5], 0, v130, vcc
	v_mad_u64_u32 v[144:145], s[4:5], s34, v143, v[142:143]
	v_add3_u32 v143, v152, v144, s19
	buffer_load_dwordx4 v143, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v143, s[4:5], 0, v129, vcc
	v_mad_u64_u32 v[144:145], s[4:5], s34, v143, v[142:143]
	v_add3_u32 v143, v152, v144, s19
	s_mov_b32 m0, s52
	s_nop 0
	buffer_load_dwordx4 v143, s[20:23], 0 offen lds
	v_subbrev_co_u32_e32 v143, vcc, 0, v128, vcc
	v_mad_u64_u32 v[142:143], s[4:5], s34, v143, v[142:143]
	v_add3_u32 v142, v152, v142, s19
	s_mov_b32 m0, s53
	s_nop 0
	buffer_load_dwordx4 v142, s[20:23], 0 offen lds
	ds_read_b128 v[142:145], v116
	ds_read_b128 v[154:157], v116 offset:2048
	ds_read_b128 v[158:161], v116 offset:4096
	ds_read_b128 v[162:165], v116 offset:6144
	ds_read_b128 v[166:169], v136
	ds_read_b128 v[170:173], v136 offset:2048
	ds_read_b128 v[174:177], v136 offset:4096
	ds_read_b128 v[178:181], v136 offset:6144
	ds_read_b128 v[182:185], v136 offset:8192
	ds_read_b128 v[186:189], v136 offset:10240
	s_barrier
	s_setprio 1
	s_waitcnt vmcnt(9) lgkmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[142:145], v[166:169], v[64:67], v115, v114 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(4)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[142:145], v[170:173], v[92:95], v115, v114 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(8) lgkmcnt(3)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[142:145], v[174:177], v[88:91], v115, v113 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[142:145], v[178:181], v[76:79], v115, v113 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(7) lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[142:145], v[182:185], v[68:71], v115, v112 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[142:145], v[186:189], v[72:75], v115, v112 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[154:157], v[166:169], v[80:83], v115, v114 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[154:157], v[170:173], v[84:87], v115, v114 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[154:157], v[174:177], v[60:63], v115, v113 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[154:157], v[178:181], v[56:59], v115, v113 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[154:157], v[182:185], v[52:55], v115, v112 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[154:157], v[186:189], v[48:51], v115, v112 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[158:161], v[166:169], v[44:47], v111, v114 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[158:161], v[170:173], v[40:43], v111, v114 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[158:161], v[174:177], v[36:39], v111, v113 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[158:161], v[178:181], v[32:35], v111, v113 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[158:161], v[182:185], v[28:31], v111, v112 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[158:161], v[186:189], v[24:27], v111, v112 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[162:165], v[166:169], v[20:23], v111, v114 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[162:165], v[170:173], v[16:19], v111, v114 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[162:165], v[174:177], v[12:15], v111, v113 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[162:165], v[178:181], v[8:11], v111, v113 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[162:165], v[182:185], v[4:7], v111, v112 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[162:165], v[186:189], v[0:3], v111, v112 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_barrier
	v_add_u32_e32 v142, 0xffffe000, v127
	v_mul_hi_u32 v142, s46, v142
	v_lshl_add_u32 v153, s8, 13, v126
	v_mul_lo_u32 v143, s18, v142
	v_sub_u32_e32 v143, v153, v143
	v_cmp_le_u32_e32 vcc, s18, v143
	ds_read_b128 v[156:159], v117
	ds_read_b128 v[160:163], v117 offset:2048
	ds_read_b128 v[164:167], v117 offset:4096
	ds_read_b128 v[168:171], v117 offset:6144
	ds_read_b128 v[172:175], v138
	ds_read_b128 v[176:179], v138 offset:2048
	ds_read_b128 v[180:183], v138 offset:4096
	ds_read_b128 v[184:187], v138 offset:6144
	ds_read_b128 v[188:191], v138 offset:8192
	ds_read_b128 v[192:195], v138 offset:10240
	v_subbrev_co_u32_e64 v154, s[4:5], 0, v142, vcc
	v_cndmask_b32_e32 v142, 0, v137, vcc
	v_add_u32_e32 v142, v142, v143
	v_ashrrev_i32_e32 v143, 31, v142
	v_xor_b32_e32 v142, v143, v142
	v_ashrrev_i32_e32 v144, 31, v142
	v_lshrrev_b32_e32 v144, 27, v144
	v_add_u32_e32 v142, v142, v144
	v_ashrrev_i32_e32 v142, 5, v142
	v_xor_b32_e32 v142, v142, v143
	v_add_u32_e32 v143, v103, v154
	v_mad_u64_u32 v[144:145], s[4:5], v143, s44, v[142:143]
	v_add_u32_e32 v143, s17, v144
	buffer_load_dword v144, v144, s[28:31], 0 offen
	s_nop 0
	buffer_load_dword v145, v143, s[28:31], 0 offen
	v_add_u32_e32 v143, v104, v154
	v_mad_u64_u32 v[142:143], s[4:5], v143, s42, v[142:143]
	v_add_u32_e32 v143, s41, v142
	v_add_u32_e32 v154, s41, v143
	buffer_load_dword v142, v142, s[36:39], 0 offen
	s_nop 0
	buffer_load_dword v143, v143, s[36:39], 0 offen
	s_nop 0
	buffer_load_dword v154, v154, s[36:39], 0 offen
	s_waitcnt vmcnt(7)
	s_barrier
	s_setprio 1
	s_waitcnt lgkmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[156:159], v[172:175], v[64:67], v115, v114 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(4)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[156:159], v[176:179], v[92:95], v115, v114 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[156:159], v[180:183], v[88:91], v115, v113 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[156:159], v[184:187], v[76:79], v115, v113 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[156:159], v[188:191], v[68:71], v115, v112 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[156:159], v[192:195], v[72:75], v115, v112 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[160:163], v[172:175], v[80:83], v115, v114 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[160:163], v[176:179], v[84:87], v115, v114 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[160:163], v[180:183], v[60:63], v115, v113 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[160:163], v[184:187], v[56:59], v115, v113 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[160:163], v[188:191], v[52:55], v115, v112 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[160:163], v[192:195], v[48:51], v115, v112 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[164:167], v[172:175], v[44:47], v111, v114 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[164:167], v[176:179], v[40:43], v111, v114 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[164:167], v[180:183], v[36:39], v111, v113 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[164:167], v[184:187], v[32:35], v111, v113 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[164:167], v[188:191], v[28:31], v111, v112 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[164:167], v[192:195], v[24:27], v111, v112 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[168:171], v[172:175], v[20:23], v111, v114 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[168:171], v[176:179], v[16:19], v111, v114 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[168:171], v[180:183], v[12:15], v111, v113 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[168:171], v[184:187], v[8:11], v111, v113 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[168:171], v[188:191], v[4:7], v111, v112 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[168:171], v[192:195], v[0:3], v111, v112 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_setprio 0
	s_mov_b32 m0, s35
	v_add_u32_e32 v111, 0x100, v146
	s_waitcnt vmcnt(5)
	s_barrier
	buffer_load_dwordx4 v111, s[24:27], 0 offen lds
	v_add_u32_e32 v111, 0x100, v147
	s_mov_b32 m0, s13
	s_nop 0
	buffer_load_dwordx4 v111, s[24:27], 0 offen lds
	v_add_u32_e32 v111, 0x100, v148
	s_mov_b32 m0, s33
	s_nop 0
	buffer_load_dwordx4 v111, s[24:27], 0 offen lds
	v_add_u32_e32 v111, 0x100, v149
	s_mov_b32 m0, s48
	s_nop 0
	buffer_load_dwordx4 v111, s[24:27], 0 offen lds
	v_add_u32_e32 v111, 0x1000, v151
	v_mul_hi_u32 v111, s40, v111
	v_mul_lo_u32 v111, v111, s34
	v_sub_u32_e32 v111, v150, v111
	v_add_u32_e32 v111, 0x800, v111
	v_cmp_le_u32_e32 vcc, s34, v111
	s_mov_b32 m0, s49
	s_nop 0
	v_cndmask_b32_e32 v112, 0, v135, vcc
	v_subbrev_co_u32_e64 v111, s[4:5], 0, v130, vcc
	v_mad_u64_u32 v[114:115], s[4:5], s34, v111, v[112:113]
	v_add3_u32 v111, v152, v114, s54
	buffer_load_dwordx4 v111, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v111, s[4:5], 0, v129, vcc
	v_mad_u64_u32 v[114:115], s[4:5], s34, v111, v[112:113]
	v_add3_u32 v111, v152, v114, s54
	s_mov_b32 m0, s50
	s_nop 0
	buffer_load_dwordx4 v111, s[20:23], 0 offen lds
	v_subbrev_co_u32_e32 v111, vcc, 0, v128, vcc
	v_mad_u64_u32 v[112:113], s[4:5], s34, v111, v[112:113]
	v_add3_u32 v111, v152, v112, s54
	s_mov_b32 m0, s51
	s_nop 0
	buffer_load_dwordx4 v111, s[20:23], 0 offen lds
	ds_read_b128 v[112:115], v116 offset:32768
	ds_read_b128 v[146:149], v116 offset:34816
	ds_read_b128 v[156:159], v116 offset:36864
	ds_read_b128 v[160:163], v116 offset:38912
	ds_read_b128 v[164:167], v139
	ds_read_b128 v[168:171], v139 offset:2048
	ds_read_b128 v[172:175], v139 offset:4096
	ds_read_b128 v[176:179], v139 offset:6144
	ds_read_b128 v[180:183], v139 offset:8192
	ds_read_b128 v[184:187], v139 offset:10240
	s_barrier
	s_setprio 1
	s_waitcnt vmcnt(9) lgkmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[112:115], v[164:167], v[64:67], v144, v142 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(4)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[112:115], v[168:171], v[92:95], v144, v142 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(8) lgkmcnt(3)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[112:115], v[172:175], v[88:91], v144, v143 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[112:115], v[176:179], v[76:79], v144, v143 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(7) lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[112:115], v[180:183], v[68:71], v144, v154 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[112:115], v[184:187], v[72:75], v144, v154 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[146:149], v[164:167], v[80:83], v144, v142 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[146:149], v[168:171], v[84:87], v144, v142 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[146:149], v[172:175], v[60:63], v144, v143 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[146:149], v[176:179], v[56:59], v144, v143 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[146:149], v[180:183], v[52:55], v144, v154 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[146:149], v[184:187], v[48:51], v144, v154 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[156:159], v[164:167], v[44:47], v145, v142 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[156:159], v[168:171], v[40:43], v145, v142 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[156:159], v[172:175], v[36:39], v145, v143 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[156:159], v[176:179], v[32:35], v145, v143 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[156:159], v[180:183], v[28:31], v145, v154 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[156:159], v[184:187], v[24:27], v145, v154 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[160:163], v[164:167], v[20:23], v145, v142 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[160:163], v[168:171], v[16:19], v145, v142 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[160:163], v[172:175], v[12:15], v145, v143 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[160:163], v[176:179], v[8:11], v145, v143 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[160:163], v[180:183], v[4:7], v145, v154 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[160:163], v[184:187], v[0:3], v145, v154 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_barrier
	v_mul_hi_u32 v111, s46, v127
	v_mul_lo_u32 v112, s18, v111
	v_sub_u32_e32 v112, v153, v112
	v_add_u32_e32 v112, 0x2000, v112
	v_cmp_le_u32_e32 vcc, s18, v112
	s_nop 1
	v_subbrev_co_u32_e64 v113, s[4:5], 0, v111, vcc
	v_cndmask_b32_e32 v111, 0, v137, vcc
	v_add_u32_e32 v111, v111, v112
	v_ashrrev_i32_e32 v112, 31, v111
	v_xor_b32_e32 v111, v112, v111
	v_ashrrev_i32_e32 v114, 31, v111
	v_lshrrev_b32_e32 v114, 27, v114
	v_add_u32_e32 v111, v111, v114
	v_ashrrev_i32_e32 v111, 5, v111
	v_xor_b32_e32 v112, v111, v112
	v_add_u32_e32 v111, v103, v113
	v_mad_u64_u32 v[114:115], s[4:5], v111, s44, v[112:113]
	v_add_u32_e32 v113, v104, v113
	v_mad_u64_u32 v[112:113], s[4:5], v113, s42, v[112:113]
	v_add_u32_e32 v111, s17, v114
	v_add_u32_e32 v113, s41, v112
	buffer_load_dword v115, v114, s[28:31], 0 offen
	s_nop 0
	buffer_load_dword v111, v111, s[28:31], 0 offen
	v_add_u32_e32 v146, s41, v113
	buffer_load_dword v114, v112, s[36:39], 0 offen
	s_nop 0
	buffer_load_dword v113, v113, s[36:39], 0 offen
	s_nop 0
	buffer_load_dword v112, v146, s[36:39], 0 offen
	ds_read_b128 v[146:149], v117 offset:32768
	ds_read_b128 v[150:153], v117 offset:34816
	ds_read_b128 v[156:159], v117 offset:36864
	ds_read_b128 v[160:163], v117 offset:38912
	ds_read_b128 v[164:167], v140
	ds_read_b128 v[168:171], v140 offset:2048
	ds_read_b128 v[172:175], v140 offset:4096
	ds_read_b128 v[176:179], v140 offset:6144
	ds_read_b128 v[180:183], v140 offset:8192
	ds_read_b128 v[184:187], v140 offset:10240
	s_waitcnt vmcnt(7)
	s_barrier
	s_setprio 1
	s_waitcnt lgkmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[146:149], v[164:167], v[64:67], v144, v142 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(4)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[146:149], v[168:171], v[92:95], v144, v142 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[146:149], v[172:175], v[88:91], v144, v143 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[146:149], v[176:179], v[76:79], v144, v143 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[146:149], v[180:183], v[68:71], v144, v154 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[146:149], v[184:187], v[72:75], v144, v154 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[150:153], v[164:167], v[80:83], v144, v142 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[150:153], v[168:171], v[84:87], v144, v142 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[150:153], v[172:175], v[60:63], v144, v143 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[150:153], v[176:179], v[56:59], v144, v143 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[150:153], v[180:183], v[52:55], v144, v154 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[150:153], v[184:187], v[48:51], v144, v154 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[156:159], v[164:167], v[44:47], v145, v142 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[156:159], v[168:171], v[40:43], v145, v142 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[156:159], v[172:175], v[36:39], v145, v143 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[156:159], v[176:179], v[32:35], v145, v143 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[156:159], v[180:183], v[28:31], v145, v154 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[156:159], v[184:187], v[24:27], v145, v154 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[160:163], v[164:167], v[20:23], v145, v142 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[160:163], v[168:171], v[16:19], v145, v142 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[160:163], v[172:175], v[12:15], v145, v143 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[160:163], v[176:179], v[8:11], v145, v143 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[160:163], v[180:183], v[4:7], v145, v154 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[160:163], v[184:187], v[0:3], v145, v154 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_setprio 0
	s_add_u32 s8, s8, 2
	s_addc_u32 s9, s9, 0
	v_cmp_ge_i64_e32 vcc, s[8:9], v[98:99]
	v_add_u32_e32 v127, 0x4000, v127
	v_add_u32_e32 v141, 0x1000, v141
	v_add_u32_e32 v122, 0x1000, v122
	v_add_u32_e32 v131, 0x100, v131
	v_add_u32_e32 v132, 0x100, v132
	v_add_u32_e32 v133, 0x100, v133
	v_add_u32_e32 v134, 0x100, v134
	s_cbranch_vccz .LBB0_10
	s_load_dwordx2 s[4:5], s[0:1], 0x60
	v_cmp_lt_i64_e32 vcc, 0, v[100:101]
	s_cbranch_vccz .LBB0_18
.LBB0_12:
	v_or_b32_e32 v100, s14, v105
	v_lshl_add_u32 v99, v98, 13, v124
	v_or_b32_e32 v100, v100, v121
	v_or_b32_e32 v96, s14, v96
	v_lshl_add_u32 v101, v98, 11, v118
	v_lshl_or_b32 v98, v98, 7, v107
	s_movk_i32 s0, 0x80
	v_add3_u32 v105, v98, v106, s0
	s_add_i32 m0, s35, 0x8000
	s_waitcnt vmcnt(5)
	s_barrier
	buffer_load_dwordx4 v105, s[24:27], 0 offen lds
	v_add3_u32 v105, v98, v108, s0
	s_add_i32 m0, s13, 0x8000
	s_movk_i32 s8, 0x800
	buffer_load_dwordx4 v105, s[24:27], 0 offen lds
	v_add3_u32 v105, v98, v109, s0
	s_add_i32 m0, s33, 0x8000
	v_add3_u32 v98, v98, v110, s0
	buffer_load_dwordx4 v105, s[24:27], 0 offen lds
	s_add_i32 m0, s48, 0x8000
	s_mov_b32 s9, 0x16000
	buffer_load_dwordx4 v98, s[24:27], 0 offen lds
	v_add_u32_e32 v98, 0x800, v101
	v_mul_hi_u32 v101, s40, v98
	v_mul_lo_u32 v105, v101, s34
	v_sub_u32_e32 v98, v98, v105
	v_cmp_le_u32_e32 vcc, s34, v98
	v_mov_b32_e32 v105, s34
	s_add_i32 m0, s35, 0x16000
	v_subbrev_co_u32_e64 v101, s[0:1], 0, v101, vcc
	v_add_u32_e32 v96, v96, v101
	v_cndmask_b32_e32 v105, 0, v105, vcc
	s_movk_i32 s0, 0xf800
	v_mul_lo_u32 v96, v96, s34
	v_add3_u32 v98, v98, v105, s0
	v_add3_u32 v96, v98, v96, s8
	buffer_load_dwordx4 v96, s[20:23], 0 offen lds
	v_add_u32_e32 v96, v101, v100
	v_add_u32_e32 v100, 64, v96
	v_mul_lo_u32 v100, v100, s34
	v_add_u32_e32 v96, 0x80, v96
	v_add3_u32 v100, v98, v100, s8
	s_add_i32 m0, s13, 0x16000
	v_mul_lo_u32 v96, v96, s34
	buffer_load_dwordx4 v100, s[20:23], 0 offen lds
	v_add3_u32 v96, v98, v96, s8
	s_add_i32 m0, s33, 0x16000
	s_mov_b32 s8, 0x8000
	buffer_load_dwordx4 v96, s[20:23], 0 offen lds
	v_add_u32_e32 v96, 0x10000, v119
	ds_read_b128 v[134:137], v96
	ds_read_b128 v[138:141], v96 offset:2048
	ds_read_b128 v[142:145], v96 offset:4096
	ds_read_b128 v[146:149], v96 offset:6144
	ds_read_b128 v[150:153], v96 offset:8192
	ds_read_b128 v[154:157], v96 offset:10240
	ds_read_b128 v[106:109], v116
	ds_read_b128 v[122:125], v116 offset:2048
	ds_read_b128 v[126:129], v116 offset:4096
	ds_read_b128 v[130:133], v116 offset:6144
	s_barrier
	s_setprio 1
	s_waitcnt vmcnt(9) lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[106:109], v[134:137], v[64:67], v115, v114 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[106:109], v[138:141], v[92:95], v115, v114 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(8)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[106:109], v[142:145], v[88:91], v115, v113 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[106:109], v[146:149], v[76:79], v115, v113 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(7)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[106:109], v[150:153], v[68:71], v115, v112 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[106:109], v[154:157], v[72:75], v115, v112 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[122:125], v[134:137], v[80:83], v115, v114 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[122:125], v[138:141], v[84:87], v115, v114 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[122:125], v[142:145], v[60:63], v115, v113 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[122:125], v[146:149], v[56:59], v115, v113 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[122:125], v[150:153], v[52:55], v115, v112 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[122:125], v[154:157], v[48:51], v115, v112 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[126:129], v[134:137], v[44:47], v111, v114 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[126:129], v[138:141], v[40:43], v111, v114 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[126:129], v[142:145], v[36:39], v111, v113 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[126:129], v[146:149], v[32:35], v111, v113 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[126:129], v[150:153], v[28:31], v111, v112 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[126:129], v[154:157], v[24:27], v111, v112 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[130:133], v[134:137], v[20:23], v111, v114 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[130:133], v[138:141], v[16:19], v111, v114 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[130:133], v[142:145], v[12:15], v111, v113 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[130:133], v[146:149], v[8:11], v111, v113 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[130:133], v[150:153], v[4:7], v111, v112 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[130:133], v[154:157], v[0:3], v111, v112 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_barrier
	v_add_u32_e32 v96, 0x2000, v99
	v_mul_hi_u32 v98, s46, v96
	v_mul_lo_u32 v99, s18, v98
	v_sub_u32_e32 v96, v96, v99
	v_cmp_le_u32_e32 vcc, s18, v96
	s_mov_b32 s38, s30
	s_mov_b32 s39, s31
	v_subbrev_co_u32_e64 v100, s[0:1], 0, v98, vcc
	v_mov_b32_e32 v98, s18
	v_cndmask_b32_e32 v98, 0, v98, vcc
	v_add_u32_e32 v96, v98, v96
	v_ashrrev_i32_e32 v98, 31, v96
	v_xor_b32_e32 v96, v98, v96
	v_ashrrev_i32_e32 v99, 31, v96
	v_lshrrev_b32_e32 v99, 27, v99
	v_add_u32_e32 v96, v96, v99
	v_ashrrev_i32_e32 v96, 5, v96
	v_xor_b32_e32 v96, v96, v98
	v_add_u32_e32 v98, v103, v100
	v_mad_u64_u32 v[98:99], s[0:1], v98, s44, v[96:97]
	v_add_u32_e32 v99, s17, v98
	buffer_load_dword v101, v98, s[28:31], 0 offen
	buffer_load_dword v105, v99, s[28:31], 0 offen
	v_add_u32_e32 v98, v104, v100
	v_mad_u64_u32 v[98:99], s[0:1], v98, s42, v[96:97]
	v_add_u32_e32 v96, s41, v98
	v_add_u32_e32 v99, s41, v96
	buffer_load_dword v100, v98, s[36:39], 0 offen
	buffer_load_dword v106, v96, s[36:39], 0 offen
	buffer_load_dword v107, v99, s[36:39], 0 offen
	v_add_u32_e32 v96, 0x10000, v120
	ds_read_b128 v[138:141], v96
	ds_read_b128 v[142:145], v96 offset:2048
	ds_read_b128 v[146:149], v96 offset:4096
	ds_read_b128 v[150:153], v96 offset:6144
	ds_read_b128 v[154:157], v96 offset:8192
	ds_read_b128 v[158:161], v96 offset:10240
	ds_read_b128 v[122:125], v117
	ds_read_b128 v[126:129], v117 offset:2048
	ds_read_b128 v[130:133], v117 offset:4096
	ds_read_b128 v[134:137], v117 offset:6144
	s_waitcnt vmcnt(7)
	s_barrier
	s_setprio 1
	s_waitcnt lgkmcnt(3)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[122:125], v[138:141], v[64:67], v115, v114 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[122:125], v[142:145], v[92:95], v115, v114 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[122:125], v[146:149], v[88:91], v115, v113 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[122:125], v[150:153], v[76:79], v115, v113 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[122:125], v[154:157], v[68:71], v115, v112 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[122:125], v[158:161], v[72:75], v115, v112 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[126:129], v[138:141], v[80:83], v115, v114 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[126:129], v[142:145], v[84:87], v115, v114 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[126:129], v[146:149], v[60:63], v115, v113 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[126:129], v[150:153], v[56:59], v115, v113 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[126:129], v[154:157], v[52:55], v115, v112 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[126:129], v[158:161], v[48:51], v115, v112 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[130:133], v[138:141], v[44:47], v111, v114 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[130:133], v[142:145], v[40:43], v111, v114 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[130:133], v[146:149], v[36:39], v111, v113 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[130:133], v[150:153], v[32:35], v111, v113 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[130:133], v[154:157], v[28:31], v111, v112 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[130:133], v[158:161], v[24:27], v111, v112 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[134:137], v[138:141], v[20:23], v111, v114 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[134:137], v[142:145], v[16:19], v111, v114 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[134:137], v[146:149], v[12:15], v111, v113 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[134:137], v[150:153], v[8:11], v111, v113 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[134:137], v[154:157], v[4:7], v111, v112 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[134:137], v[158:161], v[0:3], v111, v112 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_setprio 0
	s_waitcnt vmcnt(4)
	v_mov_b32_e32 v115, v101
	s_waitcnt vmcnt(3)
	v_mov_b32_e32 v111, v105
	s_waitcnt vmcnt(2)
	v_mov_b32_e32 v114, v100
	s_waitcnt vmcnt(1)
	v_mov_b32_e32 v113, v106
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v112, v107
	s_andn2_b64 vcc, exec, s[2:3]
	s_cbranch_vccnz .LBB0_14
.LBB0_13:
	s_barrier
.LBB0_14:
	v_add_u32_e32 v96, s9, v119
	v_add_u32_e32 v98, s9, v120
	s_waitcnt vmcnt(5) lgkmcnt(0)
	s_barrier
	ds_read_b128 v[122:125], v96
	ds_read_b128 v[126:129], v96 offset:2048
	ds_read_b128 v[118:121], v98
	ds_read_b128 v[130:133], v98 offset:2048
	ds_read_b128 v[134:137], v96 offset:4096
	ds_read_b128 v[138:141], v96 offset:6144
	ds_read_b128 v[142:145], v98 offset:4096
	ds_read_b128 v[146:149], v98 offset:6144
	ds_read_b128 v[150:153], v96 offset:8192
	ds_read_b128 v[154:157], v96 offset:10240
	ds_read_b128 v[158:161], v98 offset:8192
	ds_read_b128 v[162:165], v98 offset:10240
	v_add_u32_e32 v96, s8, v116
	ds_read_b128 v[106:109], v96
	ds_read_b128 v[166:169], v96 offset:2048
	s_waitcnt vmcnt(2) lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[106:109], v[122:125], v[64:67], v115, v114 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add_u32_e32 v98, s8, v117
	ds_read_b128 v[170:173], v98
	ds_read_b128 v[174:177], v98 offset:2048
	ds_read_b128 v[178:181], v96 offset:4096
	ds_read_b128 v[182:185], v96 offset:6144
	ds_read_b128 v[186:189], v98 offset:4096
	ds_read_b128 v[190:193], v98 offset:6144
	s_mul_i32 s0, s4, s7
	s_waitcnt lgkmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[170:173], v[118:121], v[64:67], v115, v114 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_mul_hi_u32 s1, s4, s6
	v_and_b32_e32 v96, 1, v97
	s_add_i32 s0, s1, s0
	s_mul_i32 s1, s5, s6
	s_add_i32 s1, s0, s1
	s_mul_i32 s0, s4, s6
	v_lshl_or_b32 v98, v102, 2, v103
	v_cmp_eq_u32_e32 vcc, 0, v96
	v_and_or_b32 v97, v97, 15, v104
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[106:109], v[126:129], v[92:95], v115, v114 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_lshl_b64 s[0:1], s[0:1], 1
	v_lshl_or_b32 v99, v96, 1, v98
	v_cndmask_b32_e64 v100, 3, 1, vcc
	s_waitcnt vmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[106:109], v[134:137], v[88:91], v115, v113 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e64 v101, 18, 16, vcc
	v_cndmask_b32_e64 v102, 19, 17, vcc
	v_cndmask_b32_e64 v103, 34, 32, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[106:109], v[138:141], v[76:79], v115, v113 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e64 v105, 35, 33, vcc
	v_sub_u32_e32 v96, v97, v96
	ds_swizzle_b32 v97, v66 offset:swizzle(SWAP,1)
	s_waitcnt vmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[106:109], v[150:153], v[68:71], v115, v112 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_swizzle_b32 v104, v64 offset:swizzle(SWAP,1)
	s_add_u32 s2, s10, s0
	v_or_b32_e32 v100, v98, v100
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[106:109], v[154:157], v[72:75], v115, v112 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e64 v106, 50, 48, vcc
	v_cndmask_b32_e64 v107, 51, 49, vcc
	v_or_b32_e32 v101, v98, v101
	v_or_b32_e32 v102, v98, v102
	v_or_b32_e32 v103, v98, v103
	v_or_b32_e32 v105, v98, v105
	v_or_b32_e32 v106, v98, v106
	v_or_b32_e32 v98, v98, v107
	ds_swizzle_b32 v107, v67 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v108, v65 offset:swizzle(SWAP,1)
	s_addc_u32 s3, s11, s1
	s_lshl_b64 s[0:1], s[14:15], 1
	s_add_u32 s0, s2, s0
	s_addc_u32 s1, s3, s1
	s_and_b32 s2, s4, 0x3fff
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[170:173], v[130:133], v[92:95], v115, v114 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_bitset1_b32 s2, 14
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v64, v97, v64, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v66, v66, v104, vcc
	s_and_b32 s1, s1, 0xffff
	s_lshl_b32 s2, s2, 16
	v_mul_lo_u32 v99, s4, v99
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v65, v107, v65, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v67, v67, v108, vcc
	v_cvt_pk_bf16_f32 v64, v64, v66
	v_lshlrev_b32_e32 v66, 1, v96
	s_or_b32 s1, s1, s2
	s_mov_b32 s3, 0x27000
	s_mov_b32 s2, 0x7ffffffd
	v_mul_lo_u32 v100, s4, v100
	v_cvt_pk_bf16_f32 v65, v65, v67
	v_lshl_add_u32 v67, v99, 1, v66
	buffer_store_dword v64, v67, s[0:3], 0 offen
	v_lshl_add_u32 v64, v100, 1, v66
	buffer_store_dword v65, v64, s[0:3], 0 offen
	ds_swizzle_b32 v65, v94 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v96, v92 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v97, v95 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v99, v93 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[170:173], v[142:145], v[88:91], v115, v113 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v65, v65, v92, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v92, v94, v96, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v93, v97, v93, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v94, v95, v99, vcc
	v_cvt_pk_bf16_f32 v65, v65, v92
	v_cvt_pk_bf16_f32 v92, v93, v94
	buffer_store_dword v65, v67, s[0:3], 0 offen offset:32
	buffer_store_dword v92, v64, s[0:3], 0 offen offset:32
	ds_swizzle_b32 v65, v90 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v92, v88 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v93, v91 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v94, v89 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[170:173], v[146:149], v[76:79], v115, v113 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v65, v65, v88, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v88, v90, v92, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v89, v93, v89, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v90, v91, v94, vcc
	v_cvt_pk_bf16_f32 v65, v65, v88
	v_cvt_pk_bf16_f32 v88, v89, v90
	buffer_store_dword v65, v67, s[0:3], 0 offen offset:64
	buffer_store_dword v88, v64, s[0:3], 0 offen offset:64
	ds_swizzle_b32 v65, v78 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v88, v76 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v89, v79 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v90, v77 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[170:173], v[158:161], v[68:71], v115, v112 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v65, v65, v76, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v76, v78, v88, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v77, v89, v77, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v78, v79, v90, vcc
	v_cvt_pk_bf16_f32 v65, v65, v76
	v_cvt_pk_bf16_f32 v76, v77, v78
	buffer_store_dword v65, v67, s[0:3], 0 offen offset:96
	buffer_store_dword v76, v64, s[0:3], 0 offen offset:96
	ds_swizzle_b32 v65, v70 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v76, v68 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v77, v71 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v78, v69 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[170:173], v[162:165], v[72:75], v115, v112 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v65, v65, v68, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v68, v70, v76, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v69, v77, v69, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v70, v71, v78, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[166:169], v[122:125], v[80:83], v115, v114 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cvt_pk_bf16_f32 v65, v65, v68
	v_cvt_pk_bf16_f32 v68, v69, v70
	buffer_store_dword v65, v67, s[0:3], 0 offen offset:128
	buffer_store_dword v68, v64, s[0:3], 0 offen offset:128
	ds_swizzle_b32 v65, v74 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v68, v72 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v69, v75 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v70, v73 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[174:177], v[118:121], v[80:83], v115, v114 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v65, v65, v72, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v68, v74, v68, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v69, v69, v73, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[166:169], v[126:129], v[84:87], v115, v114 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v70, v75, v70, vcc
	v_cvt_pk_bf16_f32 v65, v65, v68
	v_cvt_pk_bf16_f32 v68, v69, v70
	buffer_store_dword v65, v67, s[0:3], 0 offen offset:160
	ds_swizzle_b32 v65, v82 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v67, v80 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v69, v83 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v70, v81 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[174:177], v[130:133], v[84:87], v115, v114 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	buffer_store_dword v68, v64, s[0:3], 0 offen offset:160
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v64, v65, v80, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v65, v82, v67, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[166:169], v[134:137], v[60:63], v115, v113 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v67, v69, v81, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v68, v83, v70, vcc
	v_cvt_pk_bf16_f32 v64, v64, v65
	v_cvt_pk_bf16_f32 v65, v67, v68
	ds_swizzle_b32 v68, v86 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v69, v84 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v70, v87 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v71, v85 offset:swizzle(SWAP,1)
	v_mul_lo_u32 v101, s4, v101
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[174:177], v[142:145], v[60:63], v115, v113 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mul_lo_u32 v102, s4, v102
	v_lshl_add_u32 v67, v101, 1, v66
	buffer_store_dword v64, v67, s[0:3], 0 offen
	v_lshl_add_u32 v64, v102, 1, v66
	buffer_store_dword v65, v64, s[0:3], 0 offen
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v65, v68, v84, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v68, v86, v69, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[166:169], v[138:141], v[56:59], v115, v113 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v69, v70, v85, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v70, v87, v71, vcc
	v_cvt_pk_bf16_f32 v65, v65, v68
	v_cvt_pk_bf16_f32 v68, v69, v70
	buffer_store_dword v65, v67, s[0:3], 0 offen offset:32
	ds_swizzle_b32 v65, v62 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v69, v60 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[174:177], v[146:149], v[56:59], v115, v113 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_swizzle_b32 v70, v63 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v71, v61 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v60, v65, v60, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v62, v62, v69, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[166:169], v[150:153], v[52:55], v115, v112 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cvt_pk_bf16_f32 v60, v60, v62
	buffer_store_dword v68, v64, s[0:3], 0 offen offset:32
	buffer_store_dword v60, v67, s[0:3], 0 offen offset:64
	ds_swizzle_b32 v60, v58 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v62, v56 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v61, v70, v61, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v63, v63, v71, vcc
	v_cvt_pk_bf16_f32 v61, v61, v63
	ds_swizzle_b32 v63, v59 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v65, v57 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[174:177], v[158:161], v[52:55], v115, v112 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v56, v60, v56, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v58, v58, v62, vcc
	v_cvt_pk_bf16_f32 v56, v56, v58
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[166:169], v[154:157], v[48:51], v115, v112 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_store_dword v61, v64, s[0:3], 0 offen offset:64
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v57, v63, v57, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v59, v59, v65, vcc
	buffer_store_dword v56, v67, s[0:3], 0 offen offset:96
	ds_swizzle_b32 v56, v54 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v58, v52 offset:swizzle(SWAP,1)
	v_cvt_pk_bf16_f32 v57, v57, v59
	ds_swizzle_b32 v59, v55 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v60, v53 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[174:177], v[162:165], v[48:51], v115, v112 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v52, v56, v52, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v54, v54, v58, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v53, v59, v53, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[178:181], v[122:125], v[44:47], v111, v114 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v55, v55, v60, vcc
	v_cvt_pk_bf16_f32 v52, v52, v54
	buffer_store_dword v57, v64, s[0:3], 0 offen offset:96
	v_cvt_pk_bf16_f32 v53, v53, v55
	buffer_store_dword v52, v67, s[0:3], 0 offen offset:128
	ds_swizzle_b32 v52, v50 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v54, v48 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v55, v51 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v56, v49 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[186:189], v[118:121], v[44:47], v111, v114 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v48, v52, v48, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v50, v50, v54, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v49, v55, v49, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[178:181], v[126:129], v[40:43], v111, v114 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v51, v51, v56, vcc
	v_cvt_pk_bf16_f32 v48, v48, v50
	v_cvt_pk_bf16_f32 v49, v49, v51
	ds_swizzle_b32 v51, v47 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v52, v45 offset:swizzle(SWAP,1)
	buffer_store_dword v53, v64, s[0:3], 0 offen offset:128
	buffer_store_dword v48, v67, s[0:3], 0 offen offset:160
	ds_swizzle_b32 v48, v46 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[186:189], v[130:133], v[40:43], v111, v114 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_swizzle_b32 v50, v44 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v45, v51, v45, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v47, v47, v52, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[178:181], v[134:137], v[36:39], v111, v113 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v44, v48, v44, vcc
	v_cvt_pk_bf16_f32 v45, v45, v47
	ds_swizzle_b32 v47, v42 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v48, v40 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[186:189], v[142:145], v[36:39], v111, v113 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mul_lo_u32 v103, s4, v103
	buffer_store_dword v49, v64, s[0:3], 0 offen offset:160
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v46, v46, v50, vcc
	ds_swizzle_b32 v49, v43 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v50, v41 offset:swizzle(SWAP,1)
	v_mul_lo_u32 v105, s4, v105
	v_cvt_pk_bf16_f32 v44, v44, v46
	v_lshl_add_u32 v46, v103, 1, v66
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v40, v47, v40, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v42, v42, v48, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[178:181], v[138:141], v[32:35], v111, v113 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_store_dword v44, v46, s[0:3], 0 offen
	v_lshl_add_u32 v44, v105, 1, v66
	v_cvt_pk_bf16_f32 v40, v40, v42
	buffer_store_dword v45, v44, s[0:3], 0 offen
	buffer_store_dword v40, v46, s[0:3], 0 offen offset:32
	ds_swizzle_b32 v40, v38 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v42, v36 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v41, v49, v41, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v43, v43, v50, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[186:189], v[146:149], v[32:35], v111, v113 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_cvt_pk_bf16_f32 v41, v41, v43
	ds_swizzle_b32 v43, v39 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v45, v37 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v36, v40, v36, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v38, v38, v42, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[178:181], v[150:153], v[28:31], v111, v112 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cvt_pk_bf16_f32 v36, v36, v38
	buffer_store_dword v41, v44, s[0:3], 0 offen offset:32
	buffer_store_dword v36, v46, s[0:3], 0 offen offset:64
	ds_swizzle_b32 v36, v34 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v38, v32 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v37, v43, v37, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v39, v39, v45, vcc
	v_cvt_pk_bf16_f32 v37, v37, v39
	ds_swizzle_b32 v39, v35 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v40, v33 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[186:189], v[158:161], v[28:31], v111, v112 op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v32, v36, v32, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v34, v34, v38, vcc
	v_cvt_pk_bf16_f32 v32, v32, v34
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[178:181], v[154:157], v[24:27], v111, v112 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_store_dword v37, v44, s[0:3], 0 offen offset:64
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v33, v39, v33, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v35, v35, v40, vcc
	buffer_store_dword v32, v46, s[0:3], 0 offen offset:96
	ds_swizzle_b32 v32, v30 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v34, v28 offset:swizzle(SWAP,1)
	v_cvt_pk_bf16_f32 v33, v33, v35
	ds_swizzle_b32 v35, v31 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v36, v29 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[186:189], v[162:165], v[24:27], v111, v112 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v28, v32, v28, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v30, v30, v34, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v29, v35, v29, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[182:185], v[122:125], v[20:23], v111, v114 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v31, v31, v36, vcc
	v_cvt_pk_bf16_f32 v28, v28, v30
	buffer_store_dword v33, v44, s[0:3], 0 offen offset:96
	v_cvt_pk_bf16_f32 v29, v29, v31
	buffer_store_dword v28, v46, s[0:3], 0 offen offset:128
	ds_swizzle_b32 v28, v26 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v30, v24 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v31, v27 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v32, v25 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[190:193], v[118:121], v[20:23], v111, v114 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v24, v28, v24, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v26, v26, v30, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v25, v31, v25, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[182:185], v[126:129], v[16:19], v111, v114 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v27, v27, v32, vcc
	v_cvt_pk_bf16_f32 v24, v24, v26
	v_cvt_pk_bf16_f32 v25, v25, v27
	ds_swizzle_b32 v27, v23 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v28, v21 offset:swizzle(SWAP,1)
	buffer_store_dword v29, v44, s[0:3], 0 offen offset:128
	buffer_store_dword v24, v46, s[0:3], 0 offen offset:160
	ds_swizzle_b32 v24, v22 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[190:193], v[130:133], v[16:19], v111, v114 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	ds_swizzle_b32 v26, v20 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v21, v27, v21, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v23, v23, v28, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[182:185], v[134:137], v[12:15], v111, v113 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v20, v24, v20, vcc
	v_cvt_pk_bf16_f32 v21, v21, v23
	ds_swizzle_b32 v23, v18 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v24, v16 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[190:193], v[142:145], v[12:15], v111, v113 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_mul_lo_u32 v106, s4, v106
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v22, v22, v26, vcc
	v_mul_lo_u32 v98, s4, v98
	buffer_store_dword v25, v44, s[0:3], 0 offen offset:160
	v_cvt_pk_bf16_f32 v20, v20, v22
	v_lshl_add_u32 v22, v106, 1, v66
	ds_swizzle_b32 v25, v19 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v26, v17 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v16, v23, v16, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v18, v18, v24, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[182:185], v[138:141], v[8:11], v111, v113 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	buffer_store_dword v20, v22, s[0:3], 0 offen
	v_lshl_add_u32 v20, v98, 1, v66
	v_cvt_pk_bf16_f32 v16, v16, v18
	buffer_store_dword v21, v20, s[0:3], 0 offen
	buffer_store_dword v16, v22, s[0:3], 0 offen offset:32
	ds_swizzle_b32 v16, v14 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v18, v12 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[190:193], v[146:149], v[8:11], v111, v113 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v17, v25, v17, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v19, v19, v26, vcc
	v_cvt_pk_bf16_f32 v17, v17, v19
	ds_swizzle_b32 v19, v15 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v21, v13 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v12, v16, v12, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v14, v14, v18, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[182:185], v[150:153], v[4:7], v111, v112 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cvt_pk_bf16_f32 v12, v12, v14
	buffer_store_dword v17, v20, s[0:3], 0 offen offset:32
	buffer_store_dword v12, v22, s[0:3], 0 offen offset:64
	ds_swizzle_b32 v12, v10 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v14, v8 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v13, v19, v13, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v15, v15, v21, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[190:193], v[158:161], v[4:7], v111, v112 op_sel:[1,0,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	v_cvt_pk_bf16_f32 v13, v13, v15
	ds_swizzle_b32 v15, v11 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v16, v9 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v8, v12, v8, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v10, v10, v14, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[182:185], v[154:157], v[0:3], v111, v112 op_sel:[1,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cvt_pk_bf16_f32 v8, v8, v10
	buffer_store_dword v13, v20, s[0:3], 0 offen offset:64
	buffer_store_dword v8, v22, s[0:3], 0 offen offset:96
	ds_swizzle_b32 v8, v6 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v10, v4 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v9, v15, v9, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v11, v11, v16, vcc
	v_cvt_pk_bf16_f32 v9, v9, v11
	ds_swizzle_b32 v11, v7 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v12, v5 offset:swizzle(SWAP,1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[190:193], v[162:165], v[0:3], v111, v112 op_sel:[1,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v4, v8, v4, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v6, v6, v10, vcc
	v_cvt_pk_bf16_f32 v4, v4, v6
	buffer_store_dword v9, v20, s[0:3], 0 offen offset:96
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v5, v11, v5, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v7, v7, v12, vcc
	buffer_store_dword v4, v22, s[0:3], 0 offen offset:128
	ds_swizzle_b32 v4, v2 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v6, v0 offset:swizzle(SWAP,1)
	v_cvt_pk_bf16_f32 v5, v5, v7
	ds_swizzle_b32 v7, v3 offset:swizzle(SWAP,1)
	ds_swizzle_b32 v8, v1 offset:swizzle(SWAP,1)
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v0, v4, v0, vcc
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v2, v2, v6, vcc
	v_cvt_pk_bf16_f32 v0, v0, v2
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v1, v7, v1, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v3, v3, v8, vcc
	buffer_store_dword v5, v20, s[0:3], 0 offen offset:128
	v_cvt_pk_bf16_f32 v1, v1, v3
	buffer_store_dword v0, v22, s[0:3], 0 offen offset:160
	buffer_store_dword v1, v20, s[0:3], 0 offen offset:160
	s_endpgm
.LBB0_15:
	s_branch .LBB0_2
.LBB0_16:
	s_load_dwordx2 s[44:45], s[0:1], 0x48
	s_load_dwordx2 s[42:43], s[0:1], 0x58
	s_branch .LBB0_5
.LBB0_17:
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v2, v0
	v_mov_b32_e32 v3, v0
	v_mov_b32_e32 v1, v0
	v_mov_b64_e32 v[6:7], v[2:3]
	v_mov_b64_e32 v[10:11], v[2:3]
	v_mov_b64_e32 v[14:15], v[2:3]
	v_mov_b64_e32 v[18:19], v[2:3]
	v_mov_b64_e32 v[22:23], v[2:3]
	v_mov_b64_e32 v[26:27], v[2:3]
	v_mov_b64_e32 v[30:31], v[2:3]
	v_mov_b64_e32 v[34:35], v[2:3]
	v_mov_b64_e32 v[38:39], v[2:3]
	v_mov_b64_e32 v[42:43], v[2:3]
	v_mov_b64_e32 v[46:47], v[2:3]
	v_mov_b64_e32 v[50:51], v[2:3]
	v_mov_b64_e32 v[54:55], v[2:3]
	v_mov_b64_e32 v[58:59], v[2:3]
	v_mov_b64_e32 v[62:63], v[2:3]
	v_mov_b64_e32 v[86:87], v[2:3]
	v_mov_b64_e32 v[82:83], v[2:3]
	v_mov_b64_e32 v[74:75], v[2:3]
	v_mov_b64_e32 v[70:71], v[2:3]
	v_mov_b64_e32 v[78:79], v[2:3]
	v_mov_b64_e32 v[90:91], v[2:3]
	v_mov_b64_e32 v[94:95], v[2:3]
	v_mov_b64_e32 v[66:67], v[2:3]
	v_mov_b64_e32 v[4:5], v[0:1]
	v_mov_b64_e32 v[8:9], v[0:1]
	v_mov_b64_e32 v[12:13], v[0:1]
	v_mov_b64_e32 v[16:17], v[0:1]
	v_mov_b64_e32 v[20:21], v[0:1]
	v_mov_b64_e32 v[24:25], v[0:1]
	v_mov_b64_e32 v[28:29], v[0:1]
	v_mov_b64_e32 v[32:33], v[0:1]
	v_mov_b64_e32 v[36:37], v[0:1]
	v_mov_b64_e32 v[40:41], v[0:1]
	v_mov_b64_e32 v[44:45], v[0:1]
	v_mov_b64_e32 v[48:49], v[0:1]
	v_mov_b64_e32 v[52:53], v[0:1]
	v_mov_b64_e32 v[56:57], v[0:1]
	v_mov_b64_e32 v[60:61], v[0:1]
	v_mov_b64_e32 v[84:85], v[0:1]
	v_mov_b64_e32 v[80:81], v[0:1]
	v_mov_b64_e32 v[72:73], v[0:1]
	v_mov_b64_e32 v[68:69], v[0:1]
	v_mov_b64_e32 v[76:77], v[0:1]
	v_mov_b64_e32 v[88:89], v[0:1]
	v_mov_b64_e32 v[92:93], v[0:1]
	v_mov_b64_e32 v[64:65], v[0:1]
	s_load_dwordx2 s[4:5], s[0:1], 0x60
	v_cmp_lt_i64_e32 vcc, 0, v[100:101]
	s_cbranch_vccnz .LBB0_12
.LBB0_18:
	s_mov_b32 s9, 0x10000
	s_mov_b32 s8, 0
	s_andn2_b64 vcc, exec, s[2:3]
	s_cbranch_vccnz .LBB0_14
	s_branch .LBB0_13
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel wave_mxfp4_dynamic_gemm_256x192x256
		.amdhsa_group_segment_fixed_size 114688
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 104
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
		.amdhsa_next_free_vgpr 196
		.amdhsa_next_free_sgpr 96
		.amdhsa_accum_offset 196
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
	.size	wave_mxfp4_dynamic_gemm_256x192x256, .Lfunc_end0-wave_mxfp4_dynamic_gemm_256x192x256

	.set wave_mxfp4_dynamic_gemm_256x192x256.num_vgpr, 196
	.set wave_mxfp4_dynamic_gemm_256x192x256.num_agpr, 0
	.set wave_mxfp4_dynamic_gemm_256x192x256.numbered_sgpr, 55
	.set wave_mxfp4_dynamic_gemm_256x192x256.num_named_barrier, 0
	.set wave_mxfp4_dynamic_gemm_256x192x256.private_seg_size, 0
	.set wave_mxfp4_dynamic_gemm_256x192x256.uses_vcc, 1
	.set wave_mxfp4_dynamic_gemm_256x192x256.uses_flat_scratch, 0
	.set wave_mxfp4_dynamic_gemm_256x192x256.has_dyn_sized_stack, 0
	.set wave_mxfp4_dynamic_gemm_256x192x256.has_recursion, 0
	.set wave_mxfp4_dynamic_gemm_256x192x256.has_indirect_call, 0
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
  - .agpr_count:     0
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
    .group_segment_fixed_size: 114688
    .kernarg_segment_align: 8
    .kernarg_segment_size: 104
    .max_flat_workgroup_size: 512
    .name:           wave_mxfp4_dynamic_gemm_256x192x256
    .private_segment_fixed_size: 0
    .reqd_workgroup_size:
      - 256
      - 2
      - 1
    .sgpr_count:     61
    .sgpr_spill_count: 0
    .symbol:         wave_mxfp4_dynamic_gemm_256x192x256.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     196
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx950
amdhsa.version:
  - 1
  - 0
...

	.end_amdgpu_metadata
