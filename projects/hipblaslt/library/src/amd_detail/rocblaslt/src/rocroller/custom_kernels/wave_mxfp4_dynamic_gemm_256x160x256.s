; To reproduce the .rocmasm from .optimized.ll, run:
; llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx950 -mattr='-fma-mix-insts' -O3 <.optimized.ll> -o <out.rocmasm>

	.amdgcn_target "amdgcn-amd-amdhsa--gfx950"
	.text
	.globl	wave_mxfp4_dynamic_gemm_256x160x256
	.p2align	8
	.type	wave_mxfp4_dynamic_gemm_256x160x256,@function
wave_mxfp4_dynamic_gemm_256x160x256:
	s_load_dwordx2 s[2:3], s[0:1], 0x0
	s_load_dwordx8 s[4:11], s[0:1], 0x8
	s_load_dwordx4 s[12:15], s[0:1], 0x28
	s_waitcnt lgkmcnt(0)
	s_branch .LBB0_0
	.p2align	8
.LBB0_0:
	s_load_dwordx2 s[36:37], s[0:1], 0x38
	s_mov_b64 s[24:25], s[2:3]
	v_and_b32_e32 v4, 0x3ff, v0
	v_bfe_u32 v0, v0, 10, 10
	s_mov_b32 s12, s17
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s28, s37, 31
	s_mov_b32 s29, s28
	s_xor_b64 s[30:31], s[36:37], s[28:29]
	s_lshr_b32 s2, s31, 31
	s_add_u32 s2, s30, s2
	s_addc_u32 s3, s31, 0
	s_ashr_i64 s[2:3], s[2:3], 1
	s_mov_b32 s17, 0
	v_lshrrev_b32_e32 v5, 6, v4
	v_lshlrev_b32_e32 v2, 5, v0
	s_xor_b64 s[34:35], s[2:3], s[28:29]
	v_lshrrev_b32_e32 v3, 3, v4
	v_lshl_or_b32 v1, v5, 3, v2
	s_lshl_b64 s[14:15], s[16:17], 8
	v_xor_b32_e32 v6, v3, v4
	s_and_b32 s2, s34, 0x3fff
	s_mov_b64 s[20:21], s[6:7]
	v_readfirstlane_b32 s6, v1
	v_or3_b32 v1, v3, v2, s14
	v_lshlrev_b32_e32 v6, 4, v6
	s_bitset1_b32 s2, 14
	v_and_b32_e32 v83, 0x70, v6
	v_mul_lo_u32 v81, s34, v1
	s_lshl_b32 s13, s2, 16
	s_and_b32 s2, s25, 0xffff
	s_lshl_b32 s35, s6, 7
	s_or_b32 s25, s2, s13
	s_mov_b32 s27, 0x27000
	s_mov_b32 s26, 0x7ffffffe
	v_add_u32_e32 v6, v83, v81
	s_mov_b32 m0, s35
	s_or_b32 s33, s35, 0x2000
	buffer_load_dwordx4 v6, s[24:27], 0 offen lds
	v_or_b32_e32 v6, 64, v1
	v_mul_lo_u32 v87, s34, v6
	v_add_u32_e32 v6, v83, v87
	s_mov_b32 m0, s33
	s_or_b32 s54, s35, 0x4000
	buffer_load_dwordx4 v6, s[24:27], 0 offen lds
	v_or_b32_e32 v6, 0x80, v1
	v_mul_lo_u32 v91, s34, v6
	v_or_b32_e32 v1, 0xc0, v1
	v_add_u32_e32 v6, v83, v91
	s_mov_b32 m0, s54
	v_mul_lo_u32 v95, s34, v1
	s_or_b32 s55, s35, 0x6000
	buffer_load_dwordx4 v6, s[24:27], 0 offen lds
	v_add_u32_e32 v1, v83, v95
	s_mov_b32 m0, s55
	v_readfirstlane_b32 s73, v0
	buffer_load_dwordx4 v1, s[24:27], 0 offen lds
	v_lshlrev_b32_e32 v0, 3, v0
	s_add_u32 s18, s34, -1
	v_lshl_or_b32 v0, v5, 1, v0
	s_addc_u32 s7, 0, 0
	s_mov_b32 s6, s17
	s_cmp_lg_u64 s[6:7], 0
	v_readfirstlane_b32 s6, v0
	s_cbranch_scc0 .LBB0_18
	v_cvt_f32_u32_e32 v0, s34
	v_mov_b32_e32 v1, 0x4f800000
	s_sub_u32 s17, 0, s34
	s_subb_u32 s19, 0, 0
	v_fmac_f32_e32 v0, 0, v1
	v_rcp_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x5f7ffffc, v0
	v_mul_f32_e32 v1, 0x2f800000, v0
	v_trunc_f32_e32 v1, v1
	v_fmamk_f32 v0, v1, 0xcf800000, v0
	v_cvt_u32_f32_e32 v1, v1
	v_cvt_u32_f32_e32 v0, v0
	v_readfirstlane_b32 s22, v1
	v_readfirstlane_b32 s23, v0
	s_mul_i32 s38, s17, s22
	s_mul_hi_u32 s40, s17, s23
	s_mul_i32 s39, s19, s23
	s_add_i32 s38, s40, s38
	s_add_i32 s38, s38, s39
	s_mul_i32 s41, s17, s23
	s_mul_i32 s40, s23, s38
	s_mul_hi_u32 s42, s23, s41
	s_mul_hi_u32 s39, s23, s38
	s_add_u32 s40, s42, s40
	s_addc_u32 s39, 0, s39
	s_mul_hi_u32 s43, s22, s41
	s_mul_i32 s41, s22, s41
	s_add_u32 s40, s40, s41
	s_mul_hi_u32 s42, s22, s38
	s_addc_u32 s39, s39, s43
	s_addc_u32 s40, s42, 0
	s_mul_i32 s38, s22, s38
	s_add_u32 s38, s39, s38
	s_addc_u32 s39, 0, s40
	s_add_u32 s23, s23, s38
	s_addc_u32 s22, s22, s39
	s_mul_i32 s38, s17, s22
	s_mul_hi_u32 s39, s17, s23
	s_add_i32 s38, s39, s38
	s_mul_i32 s19, s19, s23
	s_add_i32 s38, s38, s19
	s_mul_i32 s17, s17, s23
	s_mul_hi_u32 s39, s22, s17
	s_mul_i32 s40, s22, s17
	s_mul_i32 s42, s23, s38
	s_mul_hi_u32 s17, s23, s17
	s_mul_hi_u32 s41, s23, s38
	s_add_u32 s17, s17, s42
	s_addc_u32 s41, 0, s41
	s_add_u32 s17, s17, s40
	s_mul_hi_u32 s19, s22, s38
	s_addc_u32 s17, s41, s39
	s_addc_u32 s19, s19, 0
	s_mul_i32 s38, s22, s38
	s_add_u32 s17, s17, s38
	s_addc_u32 s19, 0, s19
	s_add_u32 s17, s23, s17
	s_addc_u32 s19, s22, s19
	s_mul_i32 s23, s18, s19
	s_mul_hi_u32 s38, s18, s17
	s_mul_hi_u32 s22, s18, s19
	s_add_u32 s23, s38, s23
	s_addc_u32 s22, 0, s22
	s_mul_i32 s17, s7, s17
	s_add_u32 s17, s23, s17
	s_addc_u32 s17, s22, 0
	s_addc_u32 s22, 0, 0
	s_mul_i32 s19, s7, s19
	s_add_u32 s17, s17, s19
	s_addc_u32 s19, 0, s22
	s_mul_i32 s19, s34, s19
	s_mul_hi_u32 s38, s34, s17
	s_add_u32 s22, s17, 1
	s_add_u32 s23, s17, 2
	s_add_i32 s38, s38, s19
	s_mul_i32 s19, s34, s17
	s_sub_u32 s19, s18, s19
	s_subb_u32 s7, s7, s38
	s_sub_u32 s38, s19, s34
	s_subb_u32 s39, s7, 0
	s_cmp_ge_u32 s38, s34
	s_cselect_b32 s38, -1, 0
	s_cmp_eq_u32 s39, 0
	s_cselect_b32 s38, s38, -1
	s_cmp_lg_u32 s38, 0
	s_cselect_b32 s22, s23, s22
	s_cmp_ge_u32 s19, s34
	s_cselect_b32 s19, -1, 0
	s_cmp_eq_u32 s7, 0
	s_cselect_b32 s7, s19, -1
	s_cmp_lg_u32 s7, 0
	s_cselect_b32 s38, s22, s17
	s_cbranch_execnz .LBB0_3
.LBB0_2:
	v_cvt_f32_u32_e32 v0, s34
	s_sub_i32 s2, 0, s34
	v_rcp_iflag_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	s_nop 0
	v_readfirstlane_b32 s3, v0
	s_mul_i32 s2, s2, s3
	s_mul_hi_u32 s2, s3, s2
	s_add_i32 s3, s3, s2
	s_mul_hi_u32 s2, s18, s3
	s_mul_i32 s7, s2, s34
	s_sub_i32 s7, s18, s7
	s_add_i32 s3, s2, 1
	s_sub_i32 s17, s7, s34
	s_cmp_ge_u32 s7, s34
	s_cselect_b32 s2, s3, s2
	s_cselect_b32 s7, s17, s7
	s_add_i32 s3, s2, 1
	s_cmp_ge_u32 s7, s34
	s_cselect_b32 s38, s3, s2
.LBB0_3:
	v_lshrrev_b32_e32 v0, 5, v4
	v_lshrrev_b32_e32 v1, 2, v4
	v_bfe_u32 v10, v4, 2, 3
	v_bitop3_b32 v1, v1, v0, 7 bitop3:0x6c
	v_lshlrev_b32_e32 v6, 4, v0
	v_and_b32_e32 v0, 31, v4
	v_lshlrev_b32_e32 v10, 2, v10
	v_sub_u32_e32 v0, v0, v10
	v_lshl_add_u32 v0, v1, 2, v0
	v_lshlrev_b32_e32 v9, 8, v1
	v_ashrrev_i32_e32 v1, 31, v0
	v_xor_b32_e32 v0, v1, v0
	v_ashrrev_i32_e32 v10, 31, v0
	v_lshrrev_b32_e32 v10, 29, v10
	v_add_u32_e32 v0, v0, v10
	v_lshrrev_b32_e32 v0, 3, v0
	v_lshlrev_b32_e32 v82, 2, v4
	v_xor_b32_e32 v0, v0, v1
	s_lshl_b32 s74, s73, 7
	v_and_b32_e32 v7, 0x3f0, v82
	v_and_b32_e32 v8, 0x600, v9
	v_lshlrev_b32_e32 v10, 9, v0
	v_add_u32_e32 v0, s74, v82
	v_add3_u32 v0, v0, v6, v9
	v_add_u32_e32 v1, v7, v8
	v_sub_u32_e32 v0, v0, v1
	v_add_u32_e32 v114, v0, v10
	v_mul_hi_u32 v0, s38, v114
	v_mul_lo_u32 v1, v0, s34
	v_sub_u32_e32 v1, v114, v1
	v_cmp_le_u32_e32 vcc, s34, v1
	s_mul_i32 s18, s12, 0xa0
	s_lshl_b32 s63, s6, 7
	v_subbrev_co_u32_e64 v0, s[2:3], 0, v0, vcc
	v_add_u32_e32 v11, s18, v0
	v_mov_b32_e32 v0, s34
	v_cndmask_b32_e32 v0, 0, v0, vcc
	s_and_b32 s2, s21, 0xffff
	s_or_b32 s21, s2, s13
	v_add_u32_e32 v0, v1, v0
	s_add_i32 s13, s63, 0x10000
	s_or_b32 s17, s63, 0x800
	s_mov_b32 s23, 0x27000
	s_mov_b32 s22, 0x7ffffffe
	v_mad_u64_u32 v[12:13], s[2:3], v11, s34, v[0:1]
	s_mov_b32 m0, s13
	v_add_u32_e32 v1, 16, v11
	s_add_i32 s64, s17, 0x10000
	s_or_b32 s39, s63, 0x1000
	buffer_load_dword v12, s[20:23], 0 offen lds
	v_mad_u64_u32 v[12:13], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s64
	v_add_u32_e32 v1, 32, v11
	s_add_i32 s65, s39, 0x10000
	s_or_b32 s56, s63, 0x1800
	buffer_load_dword v12, s[20:23], 0 offen lds
	v_mad_u64_u32 v[12:13], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s65
	v_add_u32_e32 v1, 48, v11
	s_add_i32 s66, s56, 0x10000
	s_or_b32 s57, s63, 0x2000
	buffer_load_dword v12, s[20:23], 0 offen lds
	v_mad_u64_u32 v[12:13], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s66
	v_add_u32_e32 v1, 64, v11
	s_add_i32 s67, s57, 0x10000
	s_or_b32 s58, s63, 0x2800
	buffer_load_dword v12, s[20:23], 0 offen lds
	v_mad_u64_u32 v[12:13], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s67
	v_add_u32_e32 v1, 0x50, v11
	s_add_i32 s68, s58, 0x10000
	s_or_b32 s59, s63, 0x3000
	buffer_load_dword v12, s[20:23], 0 offen lds
	v_mad_u64_u32 v[12:13], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s68
	v_add_u32_e32 v1, 0x60, v11
	s_add_i32 s69, s59, 0x10000
	s_or_b32 s60, s63, 0x3800
	buffer_load_dword v12, s[20:23], 0 offen lds
	v_mad_u64_u32 v[12:13], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s69
	v_add_u32_e32 v1, 0x70, v11
	s_add_i32 s70, s60, 0x10000
	s_or_b32 s61, s63, 0x4000
	buffer_load_dword v12, s[20:23], 0 offen lds
	v_mad_u64_u32 v[12:13], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s70
	v_add_u32_e32 v1, 0x80, v11
	s_add_i32 s71, s61, 0x10000
	s_or_b32 s62, s63, 0x4800
	buffer_load_dword v12, s[20:23], 0 offen lds
	v_mad_u64_u32 v[12:13], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s71
	v_add_u32_e32 v1, 0x90, v11
	s_add_i32 s72, s62, 0x10000
	buffer_load_dword v12, s[20:23], 0 offen lds
	v_mad_u64_u32 v[0:1], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s72
	s_add_u32 s44, s36, -1
	buffer_load_dword v0, s[20:23], 0 offen lds
	s_mov_b32 s6, 0
	s_addc_u32 s7, 0, 0
	s_cmp_lg_u64 s[6:7], 0
	s_cbranch_scc0 .LBB0_19
	v_cvt_f32_u32_e32 v0, s36
	v_mov_b32_e32 v1, 0x4f800000
	s_sub_u32 s6, 0, s36
	s_subb_u32 s19, 0, 0
	v_fmac_f32_e32 v0, 0, v1
	v_rcp_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x5f7ffffc, v0
	v_mul_f32_e32 v1, 0x2f800000, v0
	v_trunc_f32_e32 v1, v1
	v_fmamk_f32 v0, v1, 0xcf800000, v0
	v_cvt_u32_f32_e32 v1, v1
	v_cvt_u32_f32_e32 v0, v0
	v_readfirstlane_b32 s40, v1
	v_readfirstlane_b32 s41, v0
	s_mul_i32 s42, s6, s40
	s_mul_hi_u32 s45, s6, s41
	s_mul_i32 s43, s19, s41
	s_add_i32 s42, s45, s42
	s_add_i32 s42, s42, s43
	s_mul_i32 s46, s6, s41
	s_mul_i32 s45, s41, s42
	s_mul_hi_u32 s47, s41, s46
	s_mul_hi_u32 s43, s41, s42
	s_add_u32 s45, s47, s45
	s_addc_u32 s43, 0, s43
	s_mul_hi_u32 s48, s40, s46
	s_mul_i32 s46, s40, s46
	s_add_u32 s45, s45, s46
	s_mul_hi_u32 s47, s40, s42
	s_addc_u32 s43, s43, s48
	s_addc_u32 s45, s47, 0
	s_mul_i32 s42, s40, s42
	s_add_u32 s42, s43, s42
	s_addc_u32 s43, 0, s45
	s_add_u32 s41, s41, s42
	s_addc_u32 s40, s40, s43
	s_mul_i32 s42, s6, s40
	s_mul_hi_u32 s43, s6, s41
	s_add_i32 s42, s43, s42
	s_mul_i32 s19, s19, s41
	s_add_i32 s42, s42, s19
	s_mul_i32 s6, s6, s41
	s_mul_hi_u32 s43, s40, s6
	s_mul_i32 s45, s40, s6
	s_mul_i32 s47, s41, s42
	s_mul_hi_u32 s6, s41, s6
	s_mul_hi_u32 s46, s41, s42
	s_add_u32 s6, s6, s47
	s_addc_u32 s46, 0, s46
	s_add_u32 s6, s6, s45
	s_mul_hi_u32 s19, s40, s42
	s_addc_u32 s6, s46, s43
	s_addc_u32 s19, s19, 0
	s_mul_i32 s42, s40, s42
	s_add_u32 s6, s6, s42
	s_addc_u32 s19, 0, s19
	s_add_u32 s6, s41, s6
	s_addc_u32 s19, s40, s19
	s_mul_i32 s41, s44, s19
	s_mul_hi_u32 s42, s44, s6
	s_mul_hi_u32 s40, s44, s19
	s_add_u32 s41, s42, s41
	s_addc_u32 s40, 0, s40
	s_mul_i32 s6, s7, s6
	s_add_u32 s6, s41, s6
	s_addc_u32 s6, s40, 0
	s_addc_u32 s40, 0, 0
	s_mul_i32 s19, s7, s19
	s_add_u32 s6, s6, s19
	s_addc_u32 s19, 0, s40
	s_mul_i32 s19, s36, s19
	s_mul_hi_u32 s42, s36, s6
	s_add_u32 s40, s6, 1
	s_add_u32 s41, s6, 2
	s_add_i32 s42, s42, s19
	s_mul_i32 s19, s36, s6
	s_sub_u32 s19, s44, s19
	s_subb_u32 s7, s7, s42
	s_sub_u32 s42, s19, s36
	s_subb_u32 s43, s7, 0
	s_cmp_ge_u32 s42, s36
	s_cselect_b32 s42, -1, 0
	s_cmp_eq_u32 s43, 0
	s_cselect_b32 s42, s42, -1
	s_cmp_lg_u32 s42, 0
	s_cselect_b32 s40, s41, s40
	s_cmp_ge_u32 s19, s36
	s_cselect_b32 s19, -1, 0
	s_cmp_eq_u32 s7, 0
	s_cselect_b32 s7, s19, -1
	s_cmp_lg_u32 s7, 0
	s_cselect_b32 s42, s40, s6
	s_load_dwordx2 s[40:41], s[0:1], 0x48
	s_mul_hi_u32 s19, s12, 0xa0
	s_cbranch_execnz .LBB0_6
.LBB0_5:
	v_cvt_f32_u32_e32 v0, s36
	s_sub_i32 s2, 0, s36
	v_rcp_iflag_f32_e32 v0, v0
	s_nop 0
	v_mul_f32_e32 v0, 0x4f7ffffe, v0
	v_cvt_u32_f32_e32 v0, v0
	s_nop 0
	v_readfirstlane_b32 s3, v0
	s_mul_i32 s2, s2, s3
	s_mul_hi_u32 s2, s3, s2
	s_add_i32 s3, s3, s2
	s_mul_hi_u32 s2, s44, s3
	s_mul_i32 s6, s2, s36
	s_sub_i32 s6, s44, s6
	s_add_i32 s3, s2, 1
	s_sub_i32 s7, s6, s36
	s_cmp_ge_u32 s6, s36
	s_cselect_b32 s2, s3, s2
	s_cselect_b32 s6, s7, s6
	s_add_i32 s3, s2, 1
	s_cmp_ge_u32 s6, s36
	s_cselect_b32 s42, s3, s2
.LBB0_6:
	v_lshrrev_b32_e32 v13, 4, v4
	s_movk_i32 s2, 0xf800
	v_bfe_u32 v130, v4, 4, 2
	v_lshlrev_b32_e32 v11, 7, v4
	v_lshlrev_b32_e32 v12, 11, v130
	v_mad_i32_i24 v14, v13, s2, v11
	v_add_u32_e32 v80, v14, v12
	v_mul_hi_u32 v0, s42, v80
	v_mul_lo_u32 v1, s36, v0
	v_sub_u32_e32 v1, v80, v1
	v_cmp_le_u32_e32 vcc, s36, v1
	v_mov_b32_e32 v15, s36
	v_and_b32_e32 v250, 0xc0, v4
	v_subbrev_co_u32_e64 v0, s[2:3], 0, v0, vcc
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s2, s40, s15
	s_mul_hi_u32 s3, s40, s14
	s_add_i32 s2, s3, s2
	s_mul_i32 s3, s41, s14
	s_add_i32 s2, s2, s3
	s_mul_i32 s3, s40, s14
	s_add_u32 s4, s4, s3
	s_addc_u32 s2, s5, s2
	s_and_b32 s3, s40, 0x3fff
	s_bitset1_b32 s3, 14
	s_and_b32 s2, s2, 0xffff
	s_lshl_b32 s3, s3, 16
	s_or_b32 s5, s2, s3
	s_ashr_i32 s2, s31, 31
	s_lshl_b32 s43, s40, 5
	s_lshr_b32 s2, s2, 27
	s_add_u32 s2, s30, s2
	s_addc_u32 s3, s31, 0
	v_cndmask_b32_e32 v15, 0, v15, vcc
	s_ashr_i64 s[2:3], s[2:3], 5
	v_add_u32_e32 v1, v15, v1
	s_xor_b64 s[2:3], s[2:3], s[28:29]
	v_ashrrev_i32_e32 v15, 31, v1
	s_add_u32 s28, s2, 7
	v_xor_b32_e32 v1, v15, v1
	s_addc_u32 s29, s3, 0
	v_ashrrev_i32_e32 v16, 31, v1
	s_sub_u32 s30, -8, s2
	v_lshrrev_b32_e32 v16, 27, v16
	s_subb_u32 s31, -1, s3
	v_cmp_lt_i64_e64 s[2:3], s[2:3], -7
	v_add_u32_e32 v1, v1, v16
	v_add_u32_e32 v0, v250, v0
	v_cndmask_b32_e64 v16, 0, -1, s[2:3]
	s_and_b64 s[2:3], s[2:3], exec
	s_cselect_b32 s3, s31, s29
	s_cselect_b32 s2, s30, s28
	s_ashr_i32 s28, s3, 31
	s_lshr_b32 s28, s28, 29
	s_add_u32 s2, s2, s28
	s_addc_u32 s3, s3, 0
	v_readfirstlane_b32 s28, v16
	s_ashr_i64 s[2:3], s[2:3], 3
	s_mov_b32 s29, s28
	s_xor_b64 s[2:3], s[2:3], s[28:29]
	s_lshl_b32 s41, s2, 3
	s_add_u32 s30, s41, -1
	s_mov_b32 s44, 0
	v_ashrrev_i32_e32 v1, 5, v1
	v_mul_lo_u32 v0, v0, s40
	s_addc_u32 s45, 0, 0
	s_mov_b32 s7, 0x27000
	s_mov_b32 s6, 0x7ffffffe
	s_cmp_lg_u64 s[44:45], 0
	v_xad_u32 v0, v1, v15, v0
	s_cbranch_scc0 .LBB0_20
	v_cvt_f32_u32_e32 v1, s41
	v_mov_b32_e32 v15, 0x4f800000
	s_sub_u32 s31, 0, s41
	s_subb_u32 s44, 0, 0
	v_fmac_f32_e32 v1, 0, v15
	v_rcp_f32_e32 v1, v1
	s_nop 0
	v_mul_f32_e32 v1, 0x5f7ffffc, v1
	v_mul_f32_e32 v15, 0x2f800000, v1
	v_trunc_f32_e32 v15, v15
	v_fmamk_f32 v1, v15, 0xcf800000, v1
	v_cvt_u32_f32_e32 v15, v15
	v_cvt_u32_f32_e32 v1, v1
	v_readfirstlane_b32 s46, v15
	v_readfirstlane_b32 s47, v1
	s_mul_i32 s48, s31, s46
	s_mul_hi_u32 s50, s31, s47
	s_mul_i32 s49, s44, s47
	s_add_i32 s48, s50, s48
	s_add_i32 s48, s48, s49
	s_mul_i32 s51, s31, s47
	s_mul_i32 s50, s47, s48
	s_mul_hi_u32 s52, s47, s51
	s_mul_hi_u32 s49, s47, s48
	s_add_u32 s50, s52, s50
	s_addc_u32 s49, 0, s49
	s_mul_hi_u32 s53, s46, s51
	s_mul_i32 s51, s46, s51
	s_add_u32 s50, s50, s51
	s_mul_hi_u32 s52, s46, s48
	s_addc_u32 s49, s49, s53
	s_addc_u32 s50, s52, 0
	s_mul_i32 s48, s46, s48
	s_add_u32 s48, s49, s48
	s_addc_u32 s49, 0, s50
	s_add_u32 s47, s47, s48
	s_addc_u32 s46, s46, s49
	s_mul_i32 s48, s31, s46
	s_mul_hi_u32 s49, s31, s47
	s_add_i32 s48, s49, s48
	s_mul_i32 s44, s44, s47
	s_add_i32 s48, s48, s44
	s_mul_i32 s31, s31, s47
	s_mul_hi_u32 s49, s46, s31
	s_mul_i32 s50, s46, s31
	s_mul_i32 s52, s47, s48
	s_mul_hi_u32 s31, s47, s31
	s_mul_hi_u32 s51, s47, s48
	s_add_u32 s31, s31, s52
	s_addc_u32 s51, 0, s51
	s_add_u32 s31, s31, s50
	s_mul_hi_u32 s44, s46, s48
	s_addc_u32 s31, s51, s49
	s_addc_u32 s44, s44, 0
	s_mul_i32 s48, s46, s48
	s_add_u32 s31, s31, s48
	s_addc_u32 s44, 0, s44
	s_add_u32 s31, s47, s31
	s_addc_u32 s44, s46, s44
	s_mul_i32 s47, s30, s44
	s_mul_hi_u32 s48, s30, s31
	s_mul_hi_u32 s46, s30, s44
	s_add_u32 s47, s48, s47
	s_addc_u32 s46, 0, s46
	s_mul_i32 s31, s45, s31
	s_add_u32 s31, s47, s31
	s_addc_u32 s31, s46, 0
	s_addc_u32 s46, 0, 0
	s_mul_i32 s44, s45, s44
	s_add_u32 s31, s31, s44
	s_addc_u32 s44, 0, s46
	s_mul_i32 s44, s41, s44
	s_mul_hi_u32 s48, s41, s31
	s_add_u32 s46, s31, 1
	s_add_u32 s47, s31, 2
	s_add_i32 s48, s48, s44
	s_mul_i32 s44, s41, s31
	s_sub_u32 s44, s30, s44
	s_subb_u32 s45, s45, s48
	s_sub_u32 s48, s44, s41
	s_subb_u32 s49, s45, 0
	s_cmp_ge_u32 s48, s41
	s_cselect_b32 s48, -1, 0
	s_cmp_eq_u32 s49, 0
	s_cselect_b32 s48, s48, -1
	s_cmp_lg_u32 s48, 0
	s_cselect_b32 s46, s47, s46
	s_cmp_ge_u32 s44, s41
	s_cselect_b32 s44, -1, 0
	s_cmp_eq_u32 s45, 0
	s_cselect_b32 s44, s44, -1
	s_cmp_lg_u32 s44, 0
	s_cselect_b32 s46, s46, s31
	s_load_dwordx2 s[44:45], s[0:1], 0x58
	v_add_u32_e32 v1, s43, v0
	s_cbranch_execnz .LBB0_9
.LBB0_8:
	v_cvt_f32_u32_e32 v15, s41
	s_sub_i32 s28, 0, s41
	v_rcp_iflag_f32_e32 v15, v15
	s_nop 0
	v_mul_f32_e32 v15, 0x4f7ffffe, v15
	v_cvt_u32_f32_e32 v15, v15
	s_nop 0
	v_readfirstlane_b32 s29, v15
	s_mul_i32 s28, s28, s29
	s_mul_hi_u32 s28, s29, s28
	s_add_i32 s29, s29, s28
	s_mul_hi_u32 s28, s30, s29
	s_mul_i32 s31, s28, s41
	s_sub_i32 s30, s30, s31
	s_add_i32 s29, s28, 1
	s_sub_i32 s31, s30, s41
	s_cmp_ge_u32 s30, s41
	s_cselect_b32 s28, s29, s28
	s_cselect_b32 s30, s31, s30
	s_add_i32 s29, s28, 1
	s_cmp_ge_u32 s30, s41
	s_cselect_b32 s46, s29, s28
.LBB0_9:
	v_lshlrev_b32_e32 v15, 6, v13
	buffer_load_dword v128, v0, s[4:7], 0 offen
	buffer_load_dword v127, v1, s[4:7], 0 offen
	v_lshlrev_b32_e32 v16, 6, v130
	v_sub_u32_e32 v0, v82, v15
	s_mul_i32 s28, s73, 0x50
	v_add_u32_e32 v20, v0, v16
	v_add_u32_e32 v0, s28, v4
	v_and_b32_e32 v1, 0xf0, v4
	v_sub_u32_e32 v143, v0, v1
	v_ashrrev_i16_e32 v0, 15, v143
	v_lshrrev_b16_e32 v0, 11, v0
	v_add_u16_e32 v0, v143, v0
	v_and_b32_e32 v0, 0xffffffe0, v0
	v_sub_u16_e32 v0, v143, v0
	v_bfe_i32 v1, v0, 0, 16
	v_ashrrev_i32_e32 v17, 31, v1
	v_add_u16_e32 v18, 32, v0
	v_cmp_gt_i16_e32 vcc, 0, v0
	v_mov_b32_e32 v85, 0
	v_mov_b32_e32 v21, s41
	v_cndmask_b32_e32 v0, v1, v18, vcc
	v_cndmask_b32_e64 v1, v17, 0, vcc
	v_xor_b32_e32 v0, v1, v0
	v_lshrrev_b32_e32 v17, 28, v0
	v_add_u32_e32 v0, v0, v17
	v_ashrrev_i32_e32 v0, 4, v0
	v_xor_b32_e32 v17, v0, v1
	v_ashrrev_i32_e32 v0, 31, v143
	v_xor_b32_e32 v1, v0, v143
	v_ashrrev_i32_e32 v18, 31, v1
	v_lshrrev_b32_e32 v18, 27, v18
	v_add_u32_e32 v1, v1, v18
	v_ashrrev_i32_e32 v1, 5, v1
	v_xor_b32_e32 v0, v1, v0
	v_ashrrev_i32_e32 v1, 31, v0
	v_add_u32_e32 v84, v17, v20
	v_lshlrev_b64 v[22:23], 8, v[0:1]
	v_mad_u64_u32 v[92:93], s[28:29], v22, s2, v[84:85]
	v_mul_hi_u32 v18, s46, v92
	v_mul_lo_u32 v19, s41, v18
	v_sub_u32_e32 v19, v92, v19
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s28, s44, s19
	s_mul_hi_u32 s29, s44, s18
	v_cmp_le_u32_e32 vcc, s41, v19
	v_mul_hi_u32 v19, s46, v84
	s_add_i32 s28, s29, s28
	s_mul_i32 s29, s45, s18
	v_mul_lo_u32 v19, s41, v19
	s_add_i32 s29, s28, s29
	s_mul_i32 s28, s44, s18
	v_subbrev_co_u32_e32 v18, vcc, 0, v18, vcc
	v_sub_u32_e32 v19, v84, v19
	s_add_u32 s28, s8, s28
	v_cmp_le_u32_e32 vcc, s41, v19
	s_addc_u32 s8, s9, s29
	s_and_b32 s9, s44, 0x3fff
	v_cndmask_b32_e32 v24, 0, v21, vcc
	s_bitset1_b32 s9, 14
	v_add_u32_e32 v24, v24, v19
	s_and_b32 s8, s8, 0xffff
	s_lshl_b32 s9, s9, 16
	s_or_b32 s29, s8, s9
	v_mad_u64_u32 v[26:27], s[8:9], s44, v18, v[24:25]
	v_add_u32_e32 v18, 2, v92
	v_mul_hi_u32 v19, s46, v18
	v_mul_lo_u32 v25, s41, v19
	v_sub_u32_e32 v18, v18, v25
	v_cmp_le_u32_e32 vcc, s41, v18
	s_mul_i32 s47, s73, 5
	v_mov_b32_e32 v97, v85
	v_subbrev_co_u32_e32 v18, vcc, 0, v19, vcc
	v_add_u32_e32 v19, 2, v84
	v_mul_hi_u32 v25, s46, v19
	v_mul_lo_u32 v25, s41, v25
	v_sub_u32_e32 v19, v19, v25
	v_cmp_le_u32_e32 vcc, s41, v19
	v_sub_u32_e32 v25, v84, v25
	s_mov_b32 s31, 0x27000
	v_cndmask_b32_e32 v19, 0, v21, vcc
	v_add_u32_e32 v28, v19, v25
	v_mad_u64_u32 v[30:31], s[8:9], s44, v18, v[28:29]
	v_add_u32_e32 v18, 16, v143
	v_sub_u32_e32 v19, 0xffef, v143
	v_cmp_gt_i32_e32 vcc, -16, v143
	s_mov_b32 s30, 0x7ffffffe
	v_alignbit_b32 v1, v1, v0, 24
	v_cndmask_b32_e32 v18, v18, v19, vcc
	v_ashrrev_i16_e32 v19, 15, v18
	v_lshrrev_b16_e32 v19, 11, v19
	v_add_u16_e32 v18, v18, v19
	v_ashrrev_i16_e32 v18, 5, v18
	v_cndmask_b32_e64 v19, 0, -1, vcc
	v_xor_b32_e32 v19, v18, v19
	v_bfe_i32 v18, v19, 0, 16
	v_lshlrev_b16_e32 v19, 1, v19
	v_sub_u16_e32 v19, 0, v19
	v_bfe_i32 v19, v19, 0, 16
	v_add3_u32 v96, s47, v19, v20
	v_lshlrev_b32_e32 v31, 8, v18
	v_mad_u64_u32 v[102:103], s[8:9], v31, s2, v[96:97]
	v_add_u32_e32 v20, 1, v102
	v_mul_hi_u32 v25, s46, v20
	v_mul_lo_u32 v27, s41, v25
	v_sub_u32_e32 v20, v20, v27
	v_cmp_le_u32_e32 vcc, s41, v20
	v_mul_lo_u32 v1, v1, s2
	s_cmp_eq_u32 s73, 0
	v_subbrev_co_u32_e32 v20, vcc, 0, v25, vcc
	v_add_u32_e32 v25, 1, v96
	v_mul_hi_u32 v27, s46, v25
	v_mul_lo_u32 v27, s41, v27
	v_sub_u32_e32 v25, v25, v27
	v_cmp_le_u32_e32 vcc, s41, v25
	v_sub_u32_e32 v27, v96, v27
	s_nop 0
	v_cndmask_b32_e32 v25, 0, v21, vcc
	v_add_u32_e32 v32, v25, v27
	v_mad_u64_u32 v[34:35], s[8:9], s44, v20, v[32:33]
	v_add_u32_e32 v20, 3, v102
	v_mul_hi_u32 v25, s46, v20
	v_mul_lo_u32 v27, s41, v25
	v_sub_u32_e32 v20, v20, v27
	v_cmp_le_u32_e32 vcc, s41, v20
	s_nop 1
	v_subbrev_co_u32_e32 v20, vcc, 0, v25, vcc
	v_add_u32_e32 v25, 3, v96
	v_mul_hi_u32 v27, s46, v25
	v_mul_lo_u32 v27, s41, v27
	v_sub_u32_e32 v25, v25, v27
	v_cmp_le_u32_e32 vcc, s41, v25
	v_sub_u32_e32 v25, v96, v27
	s_nop 0
	v_cndmask_b32_e32 v21, 0, v21, vcc
	v_add_u32_e32 v36, v21, v25
	v_mad_u64_u32 v[38:39], s[8:9], s44, v20, v[36:37]
	s_mov_b64 s[8:9], 0x100
	s_nop 0
	v_lshl_add_u64 v[40:41], v[22:23], 0, s[8:9]
	v_mad_u64_u32 v[106:107], s[8:9], v40, s2, v[84:85]
	v_mul_hi_u32 v20, s46, v106
	v_mul_lo_u32 v21, s41, v20
	v_sub_u32_e32 v21, v106, v21
	v_cmp_le_u32_e32 vcc, s41, v21
	s_nop 1
	v_subbrev_co_u32_e32 v20, vcc, 0, v20, vcc
	v_mad_u64_u32 v[42:43], s[8:9], s44, v20, v[24:25]
	v_add_u32_e32 v20, 2, v106
	v_mul_hi_u32 v21, s46, v20
	v_mul_lo_u32 v25, s41, v21
	v_sub_u32_e32 v20, v20, v25
	v_cmp_le_u32_e32 vcc, s41, v20
	s_nop 1
	v_subbrev_co_u32_e32 v20, vcc, 0, v21, vcc
	v_mad_u64_u32 v[44:45], s[8:9], s44, v20, v[28:29]
	s_movk_i32 s8, 0xffd0
	v_add_u32_e32 v20, 48, v143
	v_sub_u32_e32 v21, 0xffcf, v143
	v_cmp_gt_i32_e32 vcc, s8, v143
	s_nop 1
	v_cndmask_b32_e32 v20, v20, v21, vcc
	v_ashrrev_i16_e32 v21, 15, v20
	v_lshrrev_b16_e32 v21, 11, v21
	v_add_u16_e32 v20, v20, v21
	v_ashrrev_i16_e32 v20, 5, v20
	v_cndmask_b32_e64 v21, 0, -1, vcc
	v_xor_b32_e32 v20, v20, v21
	v_bfe_i32 v20, v20, 0, 16
	v_lshlrev_b32_e32 v21, 8, v20
	v_mad_u64_u32 v[122:123], s[8:9], v21, s2, v[96:97]
	v_add_u32_e32 v25, 1, v122
	v_mul_hi_u32 v27, s46, v25
	v_mul_lo_u32 v29, s41, v27
	v_sub_u32_e32 v25, v25, v29
	v_cmp_le_u32_e32 vcc, s41, v25
	s_nop 1
	v_subbrev_co_u32_e32 v25, vcc, 0, v27, vcc
	v_mad_u64_u32 v[32:33], s[8:9], s44, v25, v[32:33]
	v_add_u32_e32 v25, 3, v122
	v_mul_hi_u32 v27, s46, v25
	v_mul_lo_u32 v29, s41, v27
	v_sub_u32_e32 v25, v25, v29
	v_cmp_le_u32_e32 vcc, s41, v25
	s_nop 1
	v_subbrev_co_u32_e32 v25, vcc, 0, v27, vcc
	v_mad_u64_u32 v[36:37], s[8:9], s44, v25, v[36:37]
	s_mov_b64 s[8:9], 0x200
	buffer_load_ubyte v216, v26, s[28:31], 0 offen
	buffer_load_ubyte v215, v30, s[28:31], 0 offen offset:2
	buffer_load_ubyte v133, v34, s[28:31], 0 offen offset:1
	buffer_load_ubyte v131, v38, s[28:31], 0 offen offset:3
	buffer_load_ubyte v132, v42, s[28:31], 0 offen
	buffer_load_ubyte v142, v44, s[28:31], 0 offen offset:2
	buffer_load_ubyte v197, v32, s[28:31], 0 offen offset:1
	buffer_load_ubyte v214, v36, s[28:31], 0 offen offset:3
	v_lshl_add_u64 v[26:27], v[22:23], 0, s[8:9]
	v_mad_u64_u32 v[118:119], s[8:9], v26, s2, v[84:85]
	v_mul_hi_u32 v23, s46, v118
	v_mul_lo_u32 v25, s41, v23
	v_sub_u32_e32 v25, v118, v25
	v_cmp_le_u32_e32 vcc, s41, v25
	v_mad_u64_u32 v[98:99], s[8:9], v22, s2, 0
	s_nop 0
	v_subbrev_co_u32_e32 v23, vcc, 0, v23, vcc
	v_mad_u64_u32 v[24:25], s[8:9], s44, v23, v[24:25]
	v_add_u32_e32 v23, 2, v118
	v_mul_hi_u32 v25, s46, v23
	v_mul_lo_u32 v29, s41, v25
	v_sub_u32_e32 v23, v23, v29
	v_cmp_le_u32_e32 vcc, s41, v23
	v_mad_u64_u32 v[100:101], s[8:9], v31, s2, 0
	s_nop 0
	v_subbrev_co_u32_e32 v23, vcc, 0, v25, vcc
	v_mad_u64_u32 v[28:29], s[8:9], s44, v23, v[28:29]
	buffer_load_ubyte v225, v24, s[28:31], 0 offen
	buffer_load_ubyte v89, v28, s[28:31], 0 offen offset:2
	v_mul_lo_u32 v23, v22, s3
	v_add3_u32 v99, v99, v23, v1
	v_ashrrev_i32_e32 v1, 31, v18
	v_alignbit_b32 v1, v1, v18, 24
	v_mul_lo_u32 v1, v1, s2
	v_mul_lo_u32 v22, v31, s3
	v_add3_u32 v101, v101, v22, v1
	v_mul_lo_u32 v1, v40, s3
	v_mad_u64_u32 v[108:109], s[8:9], v40, s2, 0
	v_mul_lo_u32 v22, v41, s2
	v_add3_u32 v109, v109, v1, v22
	v_ashrrev_i32_e32 v1, 31, v20
	v_alignbit_b32 v1, v1, v20, 24
	v_mul_lo_u32 v1, v1, s2
	v_mul_lo_u32 v22, v21, s3
	v_mad_u64_u32 v[110:111], s[8:9], v21, s2, 0
	v_mad_u64_u32 v[116:117], s[8:9], v26, s2, 0
	v_add3_u32 v111, v111, v22, v1
	v_mul_lo_u32 v1, v26, s3
	v_mul_lo_u32 v21, v27, s2
	s_cselect_b64 s[8:9], -1, 0
	v_add3_u32 v117, v117, v1, v21
	s_and_b64 vcc, exec, s[8:9]
	s_waitcnt vmcnt(0)
	s_barrier
	s_cbranch_vccnz .LBB0_11
	s_barrier
.LBB0_11:
	s_sub_u32 s3, 0, s36
	s_subb_u32 s45, 0, s37
	s_add_u32 s50, s36, -1
	s_addc_u32 s51, s37, -1
	v_cmp_lt_i64_e64 s[48:49], s[36:37], 1
	v_and_b32_e32 v1, 7, v4
	v_bitop3_b32 v4, v130, v4, 7 bitop3:0x78
	v_cndmask_b32_e64 v21, 0, -1, s[48:49]
	s_and_b64 s[48:49], s[48:49], exec
	s_cselect_b32 s37, s45, s51
	s_cselect_b32 s3, s3, s50
	s_ashr_i32 s45, s37, 31
	s_lshr_b32 s45, s45, 24
	s_add_u32 s48, s3, s45
	s_addc_u32 s49, s37, 0
	v_readfirstlane_b32 s50, v21
	s_ashr_i64 s[48:49], s[48:49], 8
	s_mov_b32 s51, s50
	s_xor_b64 s[50:51], s[48:49], s[50:51]
	s_lshr_b32 s3, s51, 31
	s_add_u32 s3, s50, s3
	s_addc_u32 s49, s51, 0
	s_and_b32 s48, s3, -2
	s_mulk_i32 s73, 0x2800
	v_bitop3_b32 v1, v130, v1, 4 bitop3:0x36
	s_sub_u32 s50, s50, s48
	v_lshl_add_u32 v5, v5, 13, v14
	v_lshlrev_b32_e32 v4, 4, v4
	v_add_u32_e32 v14, s73, v14
	v_lshlrev_b32_e32 v1, 4, v1
	v_cmp_lt_i64_e64 s[76:77], s[48:49], 1
	s_mov_b64 s[52:53], 0
	s_subb_u32 s51, s51, s49
	v_or_b32_e32 v251, v5, v4
	v_or_b32_e32 v21, v14, v4
	v_or_b32_e32 v252, v1, v5
	v_or_b32_e32 v14, v1, v14
	s_and_b64 vcc, exec, s[76:77]
	scratch_store_dword off, v21, off offset:176
	scratch_store_dword off, v14, off offset:180
	s_cbranch_vccnz .LBB0_21
	v_mov_b32_e32 v4, v84
	scratch_store_dwordx2 off, v[4:5], off offset:212
	v_add_u32_e32 v84, 0x100, v84
	v_mov_b32_e32 v85, 0
	v_mov_b32_e32 v4, v98
	scratch_store_dwordx2 off, v[4:5], off offset:236
	v_lshl_add_u64 v[4:5], v[98:99], 0, v[84:85]
	scratch_store_dwordx2 off, v[4:5], off offset:52
	v_add_u32_e32 v4, 0x100, v96
	v_mov_b32_e32 v5, v85
	v_mov_b32_e32 v22, v100
	scratch_store_dwordx2 off, v[22:23], off offset:244
	v_lshl_add_u64 v[22:23], v[100:101], 0, v[4:5]
	v_lshl_add_u64 v[4:5], v[110:111], 0, v[4:5]
	scratch_store_dwordx2 off, v[4:5], off offset:76
	v_mov_b32_e32 v4, v116
	scratch_store_dwordx2 off, v[4:5], off offset:220
	v_lshl_add_u64 v[4:5], v[116:117], 0, v[84:85]
	v_add_u32_e32 v1, 0x800, v114
	scratch_store_dwordx2 off, v[4:5], off offset:84
	scratch_store_dword off, v1, off offset:92
	v_mul_lo_u32 v1, v18, s2
	v_add3_u32 v5, v16, s47, v19
	scratch_store_dwordx2 off, v[22:23], off offset:60
	v_mov_b32_e32 v22, v108
	v_lshl_add_u32 v1, v1, 8, v5
	scratch_store_dwordx2 off, v[22:23], off offset:228
	v_lshl_add_u64 v[22:23], v[108:109], 0, v[84:85]
	v_sub_u32_e32 v109, v1, v15
	v_mul_lo_u32 v1, v0, s2
	v_add_u32_e32 v4, v17, v16
	v_lshl_add_u32 v1, v1, 8, v4
	v_sub_u32_e32 v16, v1, v15
	v_add_u32_e32 v1, v10, v9
	v_add3_u32 v1, v1, s74, v6
	v_sub_u32_e32 v1, v1, v7
	s_lshl_b32 s3, s16, 8
	v_sub_u32_e32 v157, v1, v8
	v_or_b32_e32 v1, s3, v2
	v_add_u32_e32 v1, v1, v3
	v_add_u32_e32 v2, 64, v1
	v_mul_lo_u32 v86, v2, s34
	v_or_b32_e32 v2, 0x80, v1
	scratch_store_dword off, v114, off offset:208
	v_mul_lo_u32 v114, v2, s34
	v_add_u32_e32 v2, 0xc0, v1
	v_mul_lo_u32 v88, v2, s34
	v_lshlrev_b32_e32 v2, 8, v0
	v_add_u32_e32 v0, 0x200, v2
	v_mul_lo_u32 v101, v1, s34
	v_mad_u64_u32 v[0:1], s[74:75], v0, s2, v[4:5]
	v_sub_u32_e32 v115, v0, v15
	v_mul_lo_u32 v0, v20, s2
	v_lshl_add_u32 v0, v0, 8, v5
	v_sub_u32_e32 v98, v0, v15
	v_add_u32_e32 v0, 0x100, v2
	v_mul_i32_i24_e32 v13, 0xfffff800, v13
	v_mad_u64_u32 v[0:1], s[2:3], v0, s2, v[4:5]
	v_sub_u32_e32 v17, v0, v15
	v_add_u32_e32 v0, v13, v12
	s_movk_i32 s2, 0x4000
	v_add3_u32 v141, v0, v11, s2
	v_mov_b32_e32 v0, s36
	s_mul_i32 s47, s12, 0xa0
	scratch_store_dword off, v0, off offset:96
	v_mov_b32_e32 v0, s34
	s_or_b32 s83, s47, 16
	scratch_store_dword off, v0, off offset:100
	v_mov_b32_e32 v0, s47
	s_add_i32 s82, s47, 32
	scratch_store_dword off, v0, off offset:112
	v_mov_b32_e32 v0, s83
	s_add_i32 s81, s47, 48
	scratch_store_dword off, v0, off offset:116
	v_mov_b32_e32 v0, s82
	s_add_i32 s80, s47, 64
	scratch_store_dword off, v0, off offset:120
	v_mov_b32_e32 v0, s81
	s_add_i32 s79, s47, 0x50
	scratch_store_dword off, v0, off offset:124
	v_mov_b32_e32 v0, s80
	s_add_i32 s78, s47, 0x60
	scratch_store_dword off, v0, off offset:128
	v_mov_b32_e32 v0, s79
	s_add_i32 s77, s47, 0x70
	scratch_store_dword off, v0, off offset:132
	v_mov_b32_e32 v0, s78
	s_add_i32 s76, s47, 0x80
	scratch_store_dword off, v0, off offset:136
	v_mov_b32_e32 v0, s77
	s_add_i32 s73, s47, 0x90
	scratch_store_dword off, v0, off offset:140
	v_mov_b32_e32 v0, s76
	scratch_store_dword off, v0, off offset:144
	v_mov_b32_e32 v0, s73
	scratch_store_dword off, v0, off offset:148
	scratch_store_dword off, v95, off offset:204
	scratch_store_dword off, v91, off offset:200
	scratch_store_dword off, v87, off offset:196
	scratch_store_dword off, v81, off offset:192
	scratch_store_dword off, v143, off offset:188
	scratch_store_dword off, v130, off offset:184
	scratch_load_dword v158, off, off offset:96
	scratch_load_dword v117, off, off offset:92
	scratch_load_dword v126, off, off offset:116
	scratch_load_dword v129, off, off offset:120
	scratch_load_dword v116, off, off offset:132
	scratch_load_dword v156, off, off offset:136
	scratch_load_dword v130, off, off offset:140
	scratch_load_dword v138, off, off offset:144
	scratch_load_dword v139, off, off offset:148
	v_add_u32_e32 v0, 0x10000, v21
	scratch_store_dword off, v0, off offset:152
	v_add_u32_e32 v0, 0x10000, v14
	scratch_store_dword off, v0, off offset:156
	v_add_u32_e32 v0, 0x15000, v21
	scratch_store_dword off, v0, off offset:160
	v_add_u32_e32 v0, 0x15000, v14
	scratch_store_dwordx2 off, v[22:23], off offset:68
	v_mov_b32_e32 v22, v110
	scratch_store_dword off, v0, off offset:164
	v_mov_b64_e32 v[0:1], s[48:49]
	s_movk_i32 s37, 0x100
	scratch_store_dwordx2 off, v[22:23], off offset:252
	s_movk_i32 s45, 0x800
	v_sub_u32_e32 v140, v5, v15
	v_sub_u32_e32 v18, v4, v15
	v_mov_b32_e32 v143, s41
	s_movk_i32 s12, 0xff00
	s_add_i32 s16, s35, 0x8000
	s_movk_i32 s47, 0x1000
	scratch_store_dwordx2 off, v[0:1], off offset:168
	s_add_i32 s49, s33, 0x8000
	s_add_i32 s73, s54, 0x8000
	s_add_i32 s74, s55, 0x8000
	s_add_i32 s75, s63, 0x15000
	s_add_i32 s76, s17, 0x15000
	s_add_i32 s77, s39, 0x15000
	s_add_i32 s78, s56, 0x15000
	s_add_i32 s79, s57, 0x15000
	s_add_i32 s80, s58, 0x15000
	s_add_i32 s81, s59, 0x15000
	s_add_i32 s82, s60, 0x15000
	s_add_i32 s83, s61, 0x15000
	s_add_i32 s84, s62, 0x15000
	v_mov_b32_e32 v76, v85
	v_mov_b32_e32 v77, v85
	v_mov_b32_e32 v78, v85
	v_mov_b32_e32 v79, v85
	v_mov_b32_e32 v72, v85
	v_mov_b32_e32 v73, v85
	v_mov_b32_e32 v74, v85
	v_mov_b32_e32 v75, v85
	v_mov_b32_e32 v68, v85
	v_mov_b32_e32 v69, v85
	v_mov_b32_e32 v70, v85
	v_mov_b32_e32 v71, v85
	v_mov_b32_e32 v64, v85
	v_mov_b32_e32 v65, v85
	v_mov_b32_e32 v66, v85
	v_mov_b32_e32 v67, v85
	v_mov_b32_e32 v60, v85
	v_mov_b32_e32 v61, v85
	v_mov_b32_e32 v62, v85
	v_mov_b32_e32 v63, v85
	v_mov_b32_e32 v56, v85
	v_mov_b32_e32 v57, v85
	v_mov_b32_e32 v58, v85
	v_mov_b32_e32 v59, v85
	v_mov_b32_e32 v52, v85
	v_mov_b32_e32 v53, v85
	v_mov_b32_e32 v54, v85
	v_mov_b32_e32 v55, v85
	v_mov_b32_e32 v48, v85
	v_mov_b32_e32 v49, v85
	v_mov_b32_e32 v50, v85
	v_mov_b32_e32 v51, v85
	v_mov_b32_e32 v44, v85
	v_mov_b32_e32 v45, v85
	v_mov_b32_e32 v46, v85
	v_mov_b32_e32 v47, v85
	v_mov_b32_e32 v40, v85
	v_mov_b32_e32 v41, v85
	v_mov_b32_e32 v42, v85
	v_mov_b32_e32 v43, v85
	v_mov_b32_e32 v134, v85
	v_mov_b32_e32 v135, v85
	v_mov_b32_e32 v136, v85
	v_mov_b32_e32 v137, v85
	v_mov_b32_e32 v32, v85
	v_mov_b32_e32 v33, v85
	v_mov_b32_e32 v34, v85
	v_mov_b32_e32 v35, v85
	v_mov_b32_e32 v28, v85
	v_mov_b32_e32 v29, v85
	v_mov_b32_e32 v30, v85
	v_mov_b32_e32 v31, v85
	v_mov_b32_e32 v12, v85
	v_mov_b32_e32 v13, v85
	v_mov_b32_e32 v14, v85
	v_mov_b32_e32 v15, v85
	v_mov_b32_e32 v4, v85
	v_mov_b32_e32 v5, v85
	v_mov_b32_e32 v6, v85
	v_mov_b32_e32 v7, v85
	v_mov_b32_e32 v202, v85
	v_mov_b32_e32 v203, v85
	v_mov_b32_e32 v204, v85
	v_mov_b32_e32 v205, v85
	v_mov_b32_e32 v8, v85
	v_mov_b32_e32 v9, v85
	v_mov_b32_e32 v10, v85
	v_mov_b32_e32 v11, v85
	v_mov_b32_e32 v20, v85
	v_mov_b32_e32 v21, v85
	v_mov_b32_e32 v22, v85
	v_mov_b32_e32 v23, v85
	v_mov_b32_e32 v24, v85
	v_mov_b32_e32 v25, v85
	v_mov_b32_e32 v26, v85
	v_mov_b32_e32 v27, v85
	v_mov_b32_e32 v0, v85
	v_mov_b32_e32 v1, v85
	v_mov_b32_e32 v2, v85
	v_mov_b32_e32 v3, v85
	v_mov_b32_e32 v105, v157
	scratch_store_dwordx2 off, v[84:85], off offset:104
.LBB0_13:
	scratch_store_dword off, v18, off offset:48
	scratch_store_dword off, v17, off offset:44
	scratch_store_dwordx2 off, v[118:119], off offset:36
	scratch_store_dwordx2 off, v[106:107], off offset:28
	scratch_store_dwordx2 off, v[102:103], off offset:20
	scratch_store_dwordx2 off, v[92:93], off offset:12
	scratch_store_dwordx2 off, v[122:123], off offset:4
	scratch_store_dword off, v16, off
	scratch_load_dwordx2 v[84:85], off, off offset:104
	s_lshl_b32 s85, s52, 8
	scratch_load_dwordx2 v[110:111], off, off offset:52
	scratch_load_dwordx2 v[112:113], off, off offset:60
	v_add_u32_e32 v159, 0x2000, v80
	v_lshl_add_u32 v161, s52, 13, v159
	v_add_u32_e32 v159, 0xffffe000, v141
	v_mul_hi_u32 v159, s42, v159
	v_mul_lo_u32 v160, s36, v159
	v_sub_u32_e32 v160, v161, v160
	v_cmp_le_u32_e32 vcc, s36, v160
	v_add_u32_e32 v199, v82, v16
	v_add_u32_e32 v201, v82, v18
	s_waitcnt vmcnt(27)
	v_cndmask_b32_e32 v162, 0, v158, vcc
	v_add_u32_e32 v160, v162, v160
	v_ashrrev_i32_e32 v162, 31, v160
	v_xor_b32_e32 v160, v162, v160
	v_ashrrev_i32_e32 v163, 31, v160
	v_subbrev_co_u32_e64 v159, s[2:3], 0, v159, vcc
	v_lshrrev_b32_e32 v163, 27, v163
	v_add_u32_e32 v160, v160, v163
	v_add_u32_e32 v159, v250, v159
	v_ashrrev_i32_e32 v160, 5, v160
	v_mul_lo_u32 v159, v159, s40
	v_xad_u32 v159, v160, v162, v159
	v_add_u32_e32 v162, s43, v159
	buffer_load_dword v160, v159, s[4:7], 0 offen
	s_nop 0
	buffer_load_dword v159, v162, s[4:7], 0 offen
	v_add_u32_e32 v162, s85, v92
	v_add_u32_e32 v198, 0x100, v162
	v_add_u32_e32 v162, 0x100, v199
	v_mul_hi_u32 v162, s46, v162
	v_mul_lo_u32 v163, s41, v162
	v_sub_u32_e32 v163, v198, v163
	v_cmp_le_u32_e32 vcc, s41, v163
	v_mov_b64_e32 v[38:39], v[26:27]
	v_mov_b64_e32 v[36:37], v[24:25]
	v_subbrev_co_u32_e32 v163, vcc, 0, v162, vcc
	v_add_u32_e32 v162, 0x100, v201
	v_mul_hi_u32 v162, s46, v162
	v_mul_lo_u32 v162, s41, v162
	v_mov_b32_e32 v26, v216
	v_mov_b64_e32 v[24:25], v[22:23]
	v_mov_b64_e32 v[22:23], v[20:21]
	v_mov_b64_e32 v[20:21], v[10:11]
	v_mov_b64_e32 v[18:19], v[8:9]
	v_mov_b64_e32 v[8:9], v[202:203]
	v_mov_b64_e32 v[10:11], v[204:205]
	v_add_u32_e32 v205, v82, v109
	v_add_u32_e32 v204, s85, v102
	v_add_u32_e32 v207, v82, v140
	v_add_u32_e32 v212, v82, v17
	v_mov_b32_e32 v17, v215
	v_add_u32_e32 v215, v82, v98
	v_add_u32_e32 v104, s85, v122
	v_add_u32_e32 v226, v82, v115
	v_mov_b32_e32 v27, v225
	v_add_u32_e32 v230, v101, v83
	s_mov_b32 m0, s16
	v_add_u32_e32 v231, v86, v83
	v_add_u32_e32 v232, v114, v83
	v_add_u32_e32 v234, v82, v157
	v_add_u32_e32 v233, v88, v83
	v_add_u32_e32 v235, v105, v82
	s_waitcnt vmcnt(4)
	v_add_u32_e32 v200, s85, v84
	scratch_load_dwordx2 v[84:85], off, off offset:68
	v_sub_u32_e32 v162, v200, v162
	v_cmp_le_u32_e32 vcc, s41, v162
	v_add_u32_e32 v202, 2, v200
	v_add_u32_e32 v203, 0xffffff02, v200
	v_cndmask_b32_e32 v164, 0, v143, vcc
	v_add3_u32 v162, v162, v164, s12
	v_mad_u64_u32 v[164:165], s[2:3], s44, v163, v[162:163]
	v_add_u32_e32 v165, 0x102, v199
	v_mul_hi_u32 v165, s46, v165
	s_waitcnt vmcnt(4)
	v_add_u32_e32 v163, s85, v110
	v_mul_lo_u32 v166, s41, v165
	v_sub_u32_e32 v163, v163, v166
	v_add_u32_e32 v163, 2, v163
	v_cmp_le_u32_e32 vcc, s41, v163
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v213, s85, v84
	scratch_load_dwordx2 v[84:85], off, off offset:76
	v_subbrev_co_u32_e32 v163, vcc, 0, v165, vcc
	v_add_u32_e32 v165, 0x102, v201
	v_mul_hi_u32 v165, s46, v165
	v_mul_lo_u32 v165, s41, v165
	v_sub_u32_e32 v166, v202, v165
	v_cmp_le_u32_e32 vcc, s41, v166
	v_sub_u32_e32 v165, v203, v165
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v216, s85, v84
	scratch_load_dwordx2 v[84:85], off, off offset:84
	v_cndmask_b32_e32 v166, 0, v143, vcc
	v_add_u32_e32 v166, v166, v165
	v_mad_u64_u32 v[168:169], s[2:3], s44, v163, v[166:167]
	v_add_u32_e32 v163, 0x101, v205
	v_mul_hi_u32 v163, s46, v163
	v_mul_lo_u32 v165, s41, v163
	v_sub_u32_e32 v165, v204, v165
	v_add_u32_e32 v165, 0x101, v165
	v_cmp_le_u32_e32 vcc, s41, v165
	v_add_u32_e32 v165, 0x101, v96
	v_add_u32_e32 v206, s85, v165
	v_add_u32_e32 v165, 0x101, v207
	v_mul_hi_u32 v165, s46, v165
	v_mul_lo_u32 v165, s41, v165
	v_subbrev_co_u32_e32 v163, vcc, 0, v163, vcc
	v_sub_u32_e32 v167, v206, v165
	v_cmp_le_u32_e32 vcc, s41, v167
	v_add_u32_e32 v208, 0xfffffeff, v206
	v_sub_u32_e32 v165, v208, v165
	v_cndmask_b32_e32 v167, 0, v143, vcc
	v_add_u32_e32 v170, v167, v165
	v_add_u32_e32 v165, 0x103, v205
	v_mul_hi_u32 v165, s46, v165
	v_mad_u64_u32 v[172:173], s[2:3], s44, v163, v[170:171]
	v_add_u32_e32 v163, s85, v112
	v_mul_lo_u32 v167, s41, v165
	v_sub_u32_e32 v163, v163, v167
	v_add_u32_e32 v163, 3, v163
	v_cmp_le_u32_e32 vcc, s41, v163
	v_add_u32_e32 v209, 2, v206
	v_add_u32_e32 v210, 0xffffff02, v206
	v_subbrev_co_u32_e32 v163, vcc, 0, v165, vcc
	v_add_u32_e32 v165, 0x103, v207
	v_mul_hi_u32 v165, s46, v165
	v_mul_lo_u32 v165, s41, v165
	v_sub_u32_e32 v167, v209, v165
	v_cmp_le_u32_e32 vcc, s41, v167
	v_sub_u32_e32 v165, v210, v165
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v227, s85, v84
	v_cndmask_b32_e32 v167, 0, v143, vcc
	v_add_u32_e32 v174, v167, v165
	v_mad_u64_u32 v[176:177], s[2:3], s44, v163, v[174:175]
	v_add_u32_e32 v163, s85, v106
	v_add_u32_e32 v211, 0x100, v163
	v_add_u32_e32 v163, 0x100, v212
	v_mul_hi_u32 v163, s46, v163
	v_mul_lo_u32 v165, s41, v163
	v_sub_u32_e32 v165, v211, v165
	v_cmp_le_u32_e32 vcc, s41, v165
	s_nop 1
	v_subbrev_co_u32_e32 v163, vcc, 0, v163, vcc
	v_mad_u64_u32 v[178:179], s[2:3], s44, v163, v[162:163]
	v_add_u32_e32 v163, 0x102, v212
	v_mul_hi_u32 v163, s46, v163
	v_mul_lo_u32 v165, s41, v163
	v_sub_u32_e32 v165, v213, v165
	v_add_u32_e32 v165, 2, v165
	v_cmp_le_u32_e32 vcc, s41, v165
	s_nop 1
	v_subbrev_co_u32_e32 v163, vcc, 0, v163, vcc
	v_mad_u64_u32 v[180:181], s[2:3], s44, v163, v[166:167]
	v_add_u32_e32 v163, 0x101, v215
	v_mul_hi_u32 v163, s46, v163
	v_mul_lo_u32 v165, s41, v163
	v_sub_u32_e32 v165, v104, v165
	v_add_u32_e32 v165, 0x101, v165
	v_cmp_le_u32_e32 vcc, s41, v165
	s_nop 1
	v_subbrev_co_u32_e32 v163, vcc, 0, v163, vcc
	v_mad_u64_u32 v[170:171], s[2:3], s44, v163, v[170:171]
	v_add_u32_e32 v163, 0x103, v215
	v_mul_hi_u32 v163, s46, v163
	v_mul_lo_u32 v165, s41, v163
	v_sub_u32_e32 v165, v216, v165
	v_add_u32_e32 v165, 3, v165
	v_cmp_le_u32_e32 vcc, s41, v165
	s_nop 1
	v_subbrev_co_u32_e32 v163, vcc, 0, v163, vcc
	v_mad_u64_u32 v[174:175], s[2:3], s44, v163, v[174:175]
	v_add_u32_e32 v163, s85, v118
	v_add_u32_e32 v225, 0x100, v163
	v_add_u32_e32 v163, 0x100, v226
	v_mul_hi_u32 v163, s46, v163
	buffer_load_ubyte v217, v164, s[28:31], 0 offen offset:256
	buffer_load_ubyte v218, v168, s[28:31], 0 offen offset:256
	buffer_load_ubyte v219, v172, s[28:31], 0 offen offset:257
	buffer_load_ubyte v220, v176, s[28:31], 0 offen offset:256
	buffer_load_ubyte v221, v178, s[28:31], 0 offen offset:256
	buffer_load_ubyte v222, v180, s[28:31], 0 offen offset:256
	buffer_load_ubyte v223, v170, s[28:31], 0 offen offset:257
	buffer_load_ubyte v224, v174, s[28:31], 0 offen offset:256
	v_mul_lo_u32 v164, s41, v163
	v_sub_u32_e32 v164, v225, v164
	v_cmp_le_u32_e32 vcc, s41, v164
	s_nop 1
	v_subbrev_co_u32_e32 v163, vcc, 0, v163, vcc
	v_mad_u64_u32 v[162:163], s[2:3], s44, v163, v[162:163]
	v_add_u32_e32 v163, 0x102, v226
	v_mul_hi_u32 v163, s46, v163
	v_mul_lo_u32 v164, s41, v163
	v_sub_u32_e32 v164, v227, v164
	v_add_u32_e32 v164, 2, v164
	v_cmp_le_u32_e32 vcc, s41, v164
	s_nop 1
	v_subbrev_co_u32_e32 v163, vcc, 0, v163, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s44, v163, v[166:167]
	buffer_load_ubyte v228, v162, s[28:31], 0 offen offset:256
	buffer_load_ubyte v229, v164, s[28:31], 0 offen offset:256
	s_waitcnt vmcnt(12)
	s_barrier
	scratch_load_dword v113, off, off offset:100
	scratch_load_dword v107, off, off offset:112
	scratch_load_dword v103, off, off offset:124
	scratch_load_dword v106, off, off offset:128
	v_add_u32_e32 v162, 0x80, v230
	buffer_load_dwordx4 v162, s[24:27], 0 offen lds
	v_add_u32_e32 v162, 0x80, v231
	s_mov_b32 m0, s49
	v_add_u32_e32 v163, 0x800, v234
	buffer_load_dwordx4 v162, s[24:27], 0 offen lds
	v_add_u32_e32 v162, 0x80, v232
	s_mov_b32 m0, s73
	v_mul_hi_u32 v163, s38, v163
	buffer_load_dwordx4 v162, s[24:27], 0 offen lds
	v_add_u32_e32 v162, 0x80, v233
	s_mov_b32 m0, s74
	v_mul_lo_u32 v163, v163, s34
	buffer_load_dwordx4 v162, s[24:27], 0 offen lds
	v_lshl_add_u32 v162, s52, 11, v117
	v_sub_u32_e32 v162, v162, v163
	v_cmp_le_u32_e32 vcc, s34, v162
	s_mov_b32 m0, s75
	s_waitcnt vmcnt(7)
	v_cndmask_b32_e32 v162, 0, v113, vcc
	s_waitcnt vmcnt(6)
	v_subbrev_co_u32_e64 v163, s[2:3], 0, v107, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v163, v[162:163]
	v_add3_u32 v163, v235, v164, s45
	buffer_load_dword v163, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v163, s[2:3], 0, v126, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v163, v[162:163]
	v_add3_u32 v163, v235, v164, s45
	s_mov_b32 m0, s76
	s_nop 0
	buffer_load_dword v163, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v163, s[2:3], 0, v129, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v163, v[162:163]
	v_add3_u32 v163, v235, v164, s45
	s_mov_b32 m0, s77
	s_nop 0
	buffer_load_dword v163, s[20:23], 0 offen lds
	s_waitcnt vmcnt(8)
	v_subbrev_co_u32_e64 v163, s[2:3], 0, v103, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v163, v[162:163]
	v_add3_u32 v163, v235, v164, s45
	s_mov_b32 m0, s78
	s_nop 0
	buffer_load_dword v163, s[20:23], 0 offen lds
	s_waitcnt vmcnt(8)
	v_subbrev_co_u32_e64 v163, s[2:3], 0, v106, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v163, v[162:163]
	v_add3_u32 v163, v235, v164, s45
	s_mov_b32 m0, s79
	s_nop 0
	buffer_load_dword v163, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v163, s[2:3], 0, v116, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v163, v[162:163]
	v_add3_u32 v163, v235, v164, s45
	s_mov_b32 m0, s80
	s_nop 0
	buffer_load_dword v163, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v163, s[2:3], 0, v156, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v163, v[162:163]
	v_add3_u32 v163, v235, v164, s45
	s_mov_b32 m0, s81
	s_nop 0
	buffer_load_dword v163, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v163, s[2:3], 0, v130, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v163, v[162:163]
	v_add3_u32 v163, v235, v164, s45
	s_mov_b32 m0, s82
	s_nop 0
	buffer_load_dword v163, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v163, s[2:3], 0, v138, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v163, v[162:163]
	v_add3_u32 v163, v235, v164, s45
	s_mov_b32 m0, s83
	s_nop 0
	buffer_load_dword v163, s[20:23], 0 offen lds
	v_subbrev_co_u32_e32 v163, vcc, 0, v139, vcc
	v_mad_u64_u32 v[162:163], s[2:3], s34, v163, v[162:163]
	v_add3_u32 v162, v235, v162, s45
	s_mov_b32 m0, s84
	s_nop 0
	buffer_load_dword v162, s[20:23], 0 offen lds
	scratch_load_dword v92, off, off offset:152
	scratch_load_dword v97, off, off offset:156
	v_mov_b32_e32 v16, v89
	v_mov_b32_e32 v89, v252
	ds_read_b128 v[162:165], v251
	ds_read_b128 v[166:169], v251 offset:2048
	ds_read_b128 v[174:177], v251 offset:4096
	ds_read_b128 v[236:239], v251 offset:6144
	v_mov_b32_e32 v111, v88
	v_mov_b32_e32 v88, v86
	v_mov_b32_e32 v195, v250
	v_mov_b32_e32 v196, v251
	v_mov_b32_e32 v102, v83
	v_mov_b32_e32 v100, v80
	v_mov_b32_e32 v99, v82
	ds_read_b128 v[252:255], v252
	v_mov_b32_e32 v108, v96
	ds_read_b128 v[84:87], v89 offset:2048
	ds_read_b128 v[118:121], v89 offset:4096
	ds_read_b128 v[122:125], v89 offset:6144
	s_waitcnt vmcnt(1)
	ds_read_b128 v[144:147], v92 offset:8192
	ds_read_b128 v[188:191], v92
	ds_read_b128 v[240:243], v92 offset:2048
	ds_read_b128 v[244:247], v92 offset:4096
	ds_read_b128 v[248:251], v92 offset:6144
	s_waitcnt vmcnt(0)
	ds_read_b128 v[80:83], v97 offset:6144
	ds_read_b128 v[148:151], v97
	ds_read_b128 v[152:155], v97 offset:2048
	ds_read_b128 v[90:93], v97 offset:4096
	ds_read_b128 v[94:97], v97 offset:8192
	s_barrier
	s_setprio 1
	v_and_b32_e32 v178, 0xff, v26
	v_and_b32_e32 v182, 0xff, v133
	v_and_b32_e32 v186, 0xff, v132
	v_and_b32_e32 v133, 0xff, v197
	v_and_b32_e32 v194, 0xff, v27
	s_waitcnt lgkmcnt(8)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[162:165], v[188:191], v[76:79], v128, v178 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(7)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[162:165], v[240:243], v[72:75], v128, v182 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(6)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[162:165], v[244:247], v[68:71], v128, v186 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[162:165], v[248:251], v[64:67], v128, v133 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[162:165], v[144:147], v[60:63], v128, v194 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[166:169], v[188:191], v[56:59], v128, v178 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[166:169], v[240:243], v[52:55], v128, v182 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[166:169], v[244:247], v[48:51], v128, v186 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[166:169], v[248:251], v[44:47], v128, v133 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[166:169], v[144:147], v[40:43], v128, v194 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[134:137], v[174:177], v[188:191], v[134:137], v127, v178 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[162:165], v[174:177], v[240:243], v[32:35], v127, v182 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[166:169], v[174:177], v[244:247], v[28:31], v127, v186 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[170:173], v[174:177], v[248:251], v[12:15], v127, v133 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[174:177], v[174:177], v[144:147], v[4:7], v127, v194 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[178:181], v[236:239], v[188:191], v[8:11], v127, v178 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[190:193], v[236:239], v[248:251], v[36:39], v127, v133 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mov_b32_e32 v251, v196
	v_mov_b32_e32 v250, v195
	v_mfma_scale_f32_16x16x128_f8f6f4 v[194:197], v[236:239], v[144:147], v[0:3], v127, v194 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[182:185], v[236:239], v[240:243], v[18:21], v127, v182 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[186:189], v[236:239], v[244:247], v[22:25], v127, v186 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_barrier
	s_waitcnt vmcnt(17)
	s_barrier
	s_setprio 1
	v_and_b32_e32 v132, 0xff, v17
	s_waitcnt lgkmcnt(3)
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[252:255], v[148:151], v[76:79], v128, v132 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	v_and_b32_e32 v76, 0xff, v131
	v_and_b32_e32 v77, 0xff, v16
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[84:87], v[148:151], v[56:59], v128, v132 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[252:255], v[152:155], v[72:75], v128, v76 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	v_and_b32_e32 v72, 0xff, v142
	v_and_b32_e32 v73, 0xff, v214
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[252:255], v[94:97], v[60:63], v128, v77 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[252:255], v[90:93], v[68:71], v128, v72 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[252:255], v[80:83], v[64:67], v128, v73 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mov_b32_e32 v252, v89
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[84:87], v[152:155], v[52:55], v128, v76 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[84:87], v[90:93], v[48:51], v128, v72 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[84:87], v[80:83], v[44:47], v128, v73 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[84:87], v[94:97], v[40:43], v128, v77 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[118:121], v[148:151], v[134:137], v127, v132 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[118:121], v[152:155], v[162:165], v127, v76 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[118:121], v[90:93], v[166:169], v127, v72 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[118:121], v[80:83], v[170:173], v127, v73 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[118:121], v[94:97], v[174:177], v127, v77 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[122:125], v[148:151], v[178:181], v127, v132 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[122:125], v[152:155], v[182:185], v127, v76 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[122:125], v[90:93], v[186:189], v127, v72 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[122:125], v[80:83], v[190:193], v127, v73 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[122:125], v[94:97], v[194:197], v127, v77 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_or_b32 s85, s52, 1
	v_mul_hi_u32 v89, s42, v141
	v_mul_lo_u32 v91, s36, v89
	v_sub_u32_e32 v91, v161, v91
	v_add_u32_e32 v91, 0x2000, v91
	v_cmp_le_u32_e32 vcc, s36, v91
	s_lshl_b32 s86, s85, 8
	s_mov_b32 m0, s35
	v_cndmask_b32_e32 v95, 0, v158, vcc
	v_add_u32_e32 v91, v95, v91
	v_ashrrev_i32_e32 v95, 31, v91
	v_xor_b32_e32 v91, v95, v91
	v_ashrrev_i32_e32 v127, 31, v91
	v_subbrev_co_u32_e64 v89, s[2:3], 0, v89, vcc
	v_lshrrev_b32_e32 v127, 27, v127
	v_add_u32_e32 v91, v91, v127
	v_add_u32_e32 v89, v250, v89
	v_ashrrev_i32_e32 v91, 5, v91
	v_mul_lo_u32 v89, v89, s40
	v_xad_u32 v89, v91, v95, v89
	v_add_u32_e32 v91, s43, v89
	buffer_load_dword v128, v89, s[4:7], 0 offen
	buffer_load_dword v127, v91, s[4:7], 0 offen
	v_add_u32_e32 v89, 0x200, v199
	v_mul_hi_u32 v89, s46, v89
	v_mul_lo_u32 v91, s41, v89
	v_sub_u32_e32 v91, v198, v91
	v_add_u32_e32 v91, 0x100, v91
	v_cmp_le_u32_e32 vcc, s41, v91
	v_add_u32_e32 v91, 0x200, v201
	v_mul_hi_u32 v91, s46, v91
	v_mul_lo_u32 v91, s41, v91
	v_sub_u32_e32 v91, v200, v91
	v_subbrev_co_u32_e32 v89, vcc, 0, v89, vcc
	v_add_u32_e32 v95, 0x100, v91
	v_cmp_le_u32_e32 vcc, s41, v95
	v_add_u32_e32 v161, 0x100, v230
	s_nop 0
	v_cndmask_b32_e32 v95, 0, v143, vcc
	v_add_u32_e32 v162, v95, v91
	v_add_u32_e32 v91, 0x202, v199
	v_mul_hi_u32 v91, s46, v91
	v_mad_u64_u32 v[132:133], s[2:3], s44, v89, v[162:163]
	v_add_u32_e32 v89, s86, v110
	v_mul_lo_u32 v95, s41, v91
	v_sub_u32_e32 v89, v89, v95
	v_add_u32_e32 v89, 2, v89
	v_cmp_le_u32_e32 vcc, s41, v89
	s_nop 1
	v_subbrev_co_u32_e32 v89, vcc, 0, v91, vcc
	v_add_u32_e32 v91, 0x202, v201
	v_mul_hi_u32 v91, s46, v91
	v_mul_lo_u32 v91, s41, v91
	v_sub_u32_e32 v95, v202, v91
	v_add_u32_e32 v95, 0x100, v95
	v_cmp_le_u32_e32 vcc, s41, v95
	v_sub_u32_e32 v91, v203, v91
	s_nop 0
	v_cndmask_b32_e32 v95, 0, v143, vcc
	v_add3_u32 v164, v91, v95, s37
	v_mad_u64_u32 v[134:135], s[2:3], s44, v89, v[164:165]
	v_add_u32_e32 v89, 0x201, v205
	v_mul_hi_u32 v89, s46, v89
	v_mul_lo_u32 v91, s41, v89
	v_sub_u32_e32 v91, v204, v91
	v_add_u32_e32 v91, 0x201, v91
	v_cmp_le_u32_e32 vcc, s41, v91
	v_add_u32_e32 v91, 0x201, v207
	v_mul_hi_u32 v91, s46, v91
	v_mul_lo_u32 v91, s41, v91
	v_sub_u32_e32 v95, v206, v91
	v_subbrev_co_u32_e32 v89, vcc, 0, v89, vcc
	v_add_u32_e32 v95, 0x100, v95
	v_cmp_le_u32_e32 vcc, s41, v95
	v_sub_u32_e32 v91, v208, v91
	s_nop 0
	v_cndmask_b32_e32 v95, 0, v143, vcc
	v_add3_u32 v136, v91, v95, s37
	v_add_u32_e32 v91, 0x203, v205
	v_mul_hi_u32 v91, s46, v91
	v_mad_u64_u32 v[166:167], s[2:3], s44, v89, v[136:137]
	v_add_u32_e32 v89, s86, v112
	v_mul_lo_u32 v95, s41, v91
	v_sub_u32_e32 v89, v89, v95
	v_add_u32_e32 v89, 3, v89
	v_cmp_le_u32_e32 vcc, s41, v89
	s_nop 1
	v_subbrev_co_u32_e32 v89, vcc, 0, v91, vcc
	v_add_u32_e32 v91, 0x203, v207
	v_mul_hi_u32 v91, s46, v91
	v_mul_lo_u32 v91, s41, v91
	v_sub_u32_e32 v95, v209, v91
	v_add_u32_e32 v95, 0x100, v95
	v_cmp_le_u32_e32 vcc, s41, v95
	v_sub_u32_e32 v91, v210, v91
	s_nop 0
	v_cndmask_b32_e32 v95, 0, v143, vcc
	v_add3_u32 v168, v91, v95, s37
	v_mad_u64_u32 v[170:171], s[2:3], s44, v89, v[168:169]
	v_add_u32_e32 v89, 0x200, v212
	v_mul_hi_u32 v89, s46, v89
	v_mul_lo_u32 v91, s41, v89
	v_sub_u32_e32 v91, v211, v91
	v_add_u32_e32 v91, 0x100, v91
	v_cmp_le_u32_e32 vcc, s41, v91
	s_nop 1
	v_subbrev_co_u32_e32 v89, vcc, 0, v89, vcc
	v_mad_u64_u32 v[172:173], s[2:3], s44, v89, v[162:163]
	v_add_u32_e32 v89, 0x202, v212
	v_mul_hi_u32 v89, s46, v89
	v_mul_lo_u32 v91, s41, v89
	v_sub_u32_e32 v91, v213, v91
	v_add_u32_e32 v91, 0x102, v91
	v_cmp_le_u32_e32 vcc, s41, v91
	s_nop 1
	v_subbrev_co_u32_e32 v89, vcc, 0, v89, vcc
	v_mad_u64_u32 v[174:175], s[2:3], s44, v89, v[164:165]
	v_add_u32_e32 v89, 0x201, v215
	v_mul_hi_u32 v89, s46, v89
	v_mul_lo_u32 v91, s41, v89
	v_sub_u32_e32 v91, v104, v91
	v_add_u32_e32 v91, 0x201, v91
	v_cmp_le_u32_e32 vcc, s41, v91
	s_nop 1
	v_subbrev_co_u32_e32 v89, vcc, 0, v89, vcc
	v_mad_u64_u32 v[176:177], s[2:3], s44, v89, v[136:137]
	v_add_u32_e32 v89, 0x203, v215
	v_mul_hi_u32 v89, s46, v89
	v_mul_lo_u32 v91, s41, v89
	v_sub_u32_e32 v91, v216, v91
	v_add_u32_e32 v91, 0x103, v91
	v_cmp_le_u32_e32 vcc, s41, v91
	s_nop 1
	v_subbrev_co_u32_e32 v89, vcc, 0, v89, vcc
	v_mad_u64_u32 v[168:169], s[2:3], s44, v89, v[168:169]
	v_add_u32_e32 v89, 0x200, v226
	v_mul_hi_u32 v89, s46, v89
	v_mul_lo_u32 v137, s41, v89
	v_sub_u32_e32 v137, v225, v137
	v_add_u32_e32 v137, 0x100, v137
	v_cmp_le_u32_e32 vcc, s41, v137
	buffer_load_ubyte v216, v132, s[28:31], 0 offen offset:256
	buffer_load_ubyte v215, v134, s[28:31], 0 offen offset:256
	buffer_load_ubyte v133, v166, s[28:31], 0 offen offset:257
	buffer_load_ubyte v131, v170, s[28:31], 0 offen offset:256
	s_nop 0
	buffer_load_ubyte v132, v172, s[28:31], 0 offen offset:256
	buffer_load_ubyte v142, v174, s[28:31], 0 offen offset:256
	buffer_load_ubyte v104, v176, s[28:31], 0 offen offset:257
	buffer_load_ubyte v214, v168, s[28:31], 0 offen offset:256
	v_subbrev_co_u32_e32 v89, vcc, 0, v89, vcc
	v_mad_u64_u32 v[162:163], s[2:3], s44, v89, v[162:163]
	v_add_u32_e32 v89, 0x202, v226
	v_mul_hi_u32 v89, s46, v89
	v_mul_lo_u32 v137, s41, v89
	v_sub_u32_e32 v137, v227, v137
	v_add_u32_e32 v137, 0x102, v137
	v_cmp_le_u32_e32 vcc, s41, v137
	s_nop 1
	v_subbrev_co_u32_e32 v89, vcc, 0, v89, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s44, v89, v[164:165]
	buffer_load_ubyte v225, v162, s[28:31], 0 offen offset:256
	buffer_load_ubyte v89, v164, s[28:31], 0 offen offset:256
	s_waitcnt vmcnt(12)
	s_barrier
	buffer_load_dwordx4 v161, s[24:27], 0 offen lds
	v_add_u32_e32 v161, 0x100, v231
	s_mov_b32 m0, s33
	v_add_u32_e32 v162, 0x1000, v234
	buffer_load_dwordx4 v161, s[24:27], 0 offen lds
	v_add_u32_e32 v161, 0x100, v232
	s_mov_b32 m0, s54
	v_mul_hi_u32 v162, s38, v162
	buffer_load_dwordx4 v161, s[24:27], 0 offen lds
	v_add_u32_e32 v161, 0x100, v233
	s_mov_b32 m0, s55
	v_mul_lo_u32 v162, v162, s34
	buffer_load_dwordx4 v161, s[24:27], 0 offen lds
	v_lshl_add_u32 v161, s85, 11, v117
	v_sub_u32_e32 v161, v161, v162
	v_cmp_le_u32_e32 vcc, s34, v161
	s_mov_b32 m0, s13
	s_nop 0
	v_cndmask_b32_e32 v162, 0, v113, vcc
	v_subbrev_co_u32_e64 v161, s[2:3], 0, v107, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v161, v[162:163]
	v_add3_u32 v161, v235, v164, s47
	buffer_load_dword v161, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v161, s[2:3], 0, v126, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v161, v[162:163]
	v_add3_u32 v161, v235, v164, s47
	s_mov_b32 m0, s64
	s_nop 0
	buffer_load_dword v161, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v161, s[2:3], 0, v129, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v161, v[162:163]
	v_add3_u32 v161, v235, v164, s47
	s_mov_b32 m0, s65
	s_nop 0
	buffer_load_dword v161, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v161, s[2:3], 0, v103, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v161, v[162:163]
	v_add3_u32 v161, v235, v164, s47
	s_mov_b32 m0, s66
	s_nop 0
	buffer_load_dword v161, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v161, s[2:3], 0, v106, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v161, v[162:163]
	v_add3_u32 v161, v235, v164, s47
	s_mov_b32 m0, s67
	s_nop 0
	buffer_load_dword v161, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v161, s[2:3], 0, v116, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v161, v[162:163]
	v_add3_u32 v161, v235, v164, s47
	s_mov_b32 m0, s68
	s_nop 0
	buffer_load_dword v161, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v161, s[2:3], 0, v156, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v161, v[162:163]
	v_add3_u32 v161, v235, v164, s47
	s_mov_b32 m0, s69
	s_nop 0
	buffer_load_dword v161, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v161, s[2:3], 0, v130, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v161, v[162:163]
	v_add3_u32 v161, v235, v164, s47
	s_mov_b32 m0, s70
	s_nop 0
	buffer_load_dword v161, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v161, s[2:3], 0, v138, vcc
	v_mad_u64_u32 v[164:165], s[2:3], s34, v161, v[162:163]
	v_add3_u32 v161, v235, v164, s47
	s_mov_b32 m0, s71
	s_nop 0
	buffer_load_dword v161, s[20:23], 0 offen lds
	v_subbrev_co_u32_e32 v161, vcc, 0, v139, vcc
	v_mad_u64_u32 v[162:163], s[2:3], s34, v161, v[162:163]
	v_add3_u32 v161, v235, v162, s47
	s_mov_b32 m0, s72
	s_nop 0
	buffer_load_dword v161, s[20:23], 0 offen lds
	scratch_load_dword v103, off, off offset:160
	ds_read_b128 v[80:83], v251 offset:32768
	ds_read_b128 v[84:87], v251 offset:34816
	ds_read_b128 v[90:93], v251 offset:36864
	ds_read_b128 v[94:97], v251 offset:38912
	s_waitcnt vmcnt(0)
	ds_read_b128 v[118:121], v103
	ds_read_b128 v[122:125], v103 offset:2048
	ds_read_b128 v[144:147], v103 offset:4096
	ds_read_b128 v[148:151], v103 offset:6144
	ds_read_b128 v[152:155], v252 offset:32768
	ds_read_b128 v[202:205], v252 offset:34816
	ds_read_b128 v[206:209], v252 offset:36864
	ds_read_b128 v[210:213], v252 offset:38912
	ds_read_b128 v[198:201], v103 offset:8192
	scratch_load_dword v103, off, off offset:164
	s_waitcnt vmcnt(0)
	ds_read_b128 v[230:233], v103
	ds_read_b128 v[234:237], v103 offset:2048
	ds_read_b128 v[238:241], v103 offset:4096
	ds_read_b128 v[242:245], v103 offset:6144
	ds_read_b128 v[246:249], v103 offset:8192
	s_barrier
	s_setprio 1
	s_waitcnt lgkmcnt(13)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[80:83], v[118:121], v[0:3], v160, v217 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(12)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[80:83], v[122:125], v[4:7], v160, v219 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(11)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[80:83], v[144:147], v[8:11], v160, v221 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(10)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[80:83], v[148:151], v[12:15], v160, v223 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[80:83], v[198:201], v[16:19], v160, v228 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mov_b32_e32 v83, v102
	v_mov_b32_e32 v82, v99
	v_mov_b32_e32 v80, v100
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[84:87], v[118:121], v[20:23], v160, v217 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[162:165], v[90:93], v[118:121], v[40:43], v159, v217 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[166:169], v[90:93], v[122:125], v[44:47], v159, v219 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[170:173], v[90:93], v[144:147], v[48:51], v159, v221 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[174:177], v[90:93], v[148:151], v[52:55], v159, v223 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[178:181], v[90:93], v[198:201], v[56:59], v159, v228 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[182:185], v[94:97], v[118:121], v[60:63], v159, v217 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	scratch_load_dwordx2 v[118:119], off, off offset:36
	scratch_load_dwordx2 v[106:107], off, off offset:28
	scratch_load_dwordx2 v[102:103], off, off offset:20
	scratch_load_dwordx2 v[92:93], off, off offset:12
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[84:87], v[122:125], v[24:27], v160, v219 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[186:189], v[94:97], v[122:125], v[64:67], v159, v219 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	scratch_load_dwordx2 v[122:123], off, off offset:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[84:87], v[144:147], v[28:31], v160, v221 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[84:87], v[148:151], v[32:35], v160, v223 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[194:197], v[94:97], v[148:151], v[72:75], v159, v223 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[84:87], v[198:201], v[36:39], v160, v228 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mov_b32_e32 v86, v88
	v_mov_b32_e32 v88, v111
	v_mfma_scale_f32_16x16x128_f8f6f4 v[190:193], v[94:97], v[144:147], v[68:71], v159, v221 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[198:201], v[94:97], v[198:201], v[76:79], v159, v228 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mov_b32_e32 v96, v108
	s_setprio 0
	s_barrier
	s_waitcnt vmcnt(17)
	s_barrier
	s_setprio 1
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[152:155], v[246:249], v[16:19], v160, v229 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	scratch_load_dword v18, off, off offset:48
	scratch_load_dword v17, off, off offset:44
	scratch_load_dword v16, off, off
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[152:155], v[230:233], v[0:3], v160, v218 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[152:155], v[234:237], v[4:7], v160, v220 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[152:155], v[238:241], v[8:11], v160, v222 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[152:155], v[242:245], v[12:15], v160, v224 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[202:205], v[230:233], v[20:23], v160, v218 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[202:205], v[234:237], v[24:27], v160, v220 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[202:205], v[238:241], v[28:31], v160, v222 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[202:205], v[242:245], v[32:35], v160, v224 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[202:205], v[246:249], v[36:39], v160, v229 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[134:137], v[206:209], v[230:233], v[162:165], v159, v218 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[206:209], v[234:237], v[166:169], v159, v220 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[206:209], v[238:241], v[170:173], v159, v222 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[206:209], v[242:245], v[174:177], v159, v224 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[206:209], v[246:249], v[178:181], v159, v229 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[202:205], v[210:213], v[230:233], v[182:185], v159, v218 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[210:213], v[234:237], v[186:189], v159, v220 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[210:213], v[238:241], v[190:193], v159, v222 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[210:213], v[242:245], v[194:197], v159, v224 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[210:213], v[246:249], v[198:201], v159, v229 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 1
	v_mov_b32_e32 v197, v104
	s_setprio 0
	scratch_load_dwordx2 v[36:37], off, off offset:168
	s_add_u32 s52, s52, 2
	s_addc_u32 s53, s53, 0
	v_add_u32_e32 v109, 0x200, v109
	s_waitcnt vmcnt(1)
	v_add_u32_e32 v16, 0x200, v16
	v_add_u32_e32 v105, 0x1000, v105
	v_add_u32_e32 v157, 0x1000, v157
	v_add_u32_e32 v86, 0x100, v86
	v_add_u32_e32 v114, 0x100, v114
	v_add_u32_e32 v88, 0x100, v88
	v_add_u32_e32 v101, 0x100, v101
	v_add_u32_e32 v115, 0x200, v115
	v_add_u32_e32 v98, 0x200, v98
	v_add_u32_e32 v17, 0x200, v17
	v_add_u32_e32 v140, 0x200, v140
	v_add_u32_e32 v18, 0x200, v18
	v_add_u32_e32 v141, 0x4000, v141
	s_waitcnt vmcnt(0)
	v_cmp_ge_i64_e32 vcc, s[52:53], v[36:37]
	s_cbranch_vccz .LBB0_13
	scratch_load_dword v130, off, off offset:184
	scratch_load_dword v143, off, off offset:188
	scratch_load_dword v81, off, off offset:192
	scratch_load_dword v87, off, off offset:196
	scratch_load_dword v91, off, off offset:200
	scratch_load_dword v95, off, off offset:204
	scratch_load_dword v114, off, off offset:208
	scratch_load_dwordx2 v[84:85], off, off offset:212
	scratch_load_dwordx2 v[116:117], off, off offset:220
	scratch_load_dwordx2 v[108:109], off, off offset:228
	scratch_load_dwordx2 v[98:99], off, off offset:236
	scratch_load_dwordx2 v[100:101], off, off offset:244
	scratch_load_dwordx2 v[110:111], off, off offset:252
	s_load_dwordx2 s[12:13], s[0:1], 0x60
	v_cmp_gt_i64_e64 s[0:1], s[50:51], 0
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccz .LBB0_22
.LBB0_15:
	s_lshl_b32 s2, s48, 8
	v_add_u32_e32 v93, 0x100, v96
	s_waitcnt vmcnt(5)
	v_add_u32_e32 v82, s2, v84
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v110, v110, v93
	v_add_u32_e32 v93, v100, v93
	v_add_u32_e32 v94, s2, v96
	v_lshl_add_u32 v97, s48, 13, v80
	v_add_u32_e32 v97, 0x2000, v97
	v_mul_hi_u32 v99, s42, v97
	v_mul_lo_u32 v100, s36, v99
	v_sub_u32_e32 v97, v97, v100
	v_cmp_le_u32_e32 vcc, s36, v97
	v_mov_b32_e32 v100, s36
	v_add_u32_e32 v80, s2, v92
	v_cndmask_b32_e32 v100, 0, v100, vcc
	v_add_u32_e32 v97, v100, v97
	v_ashrrev_i32_e32 v100, 31, v97
	v_xor_b32_e32 v97, v100, v97
	v_ashrrev_i32_e32 v101, 31, v97
	v_subbrev_co_u32_e64 v99, s[0:1], 0, v99, vcc
	v_lshrrev_b32_e32 v101, 27, v101
	v_add_u32_e32 v97, v97, v101
	v_add_u32_e32 v99, v250, v99
	v_ashrrev_i32_e32 v97, 5, v97
	v_mul_lo_u32 v99, v99, s40
	v_xad_u32 v97, v97, v100, v99
	v_add_u32_e32 v99, s43, v97
	buffer_load_dword v85, v97, s[4:7], 0 offen
	buffer_load_dword v112, v99, s[4:7], 0 offen
	v_add_u32_e32 v80, 0x100, v80
	v_mul_hi_u32 v97, s46, v80
	v_mul_lo_u32 v99, s41, v97
	v_sub_u32_e32 v80, v80, v99
	v_add_u32_e32 v99, 0x100, v82
	v_cmp_le_u32_e32 vcc, s41, v80
	v_mul_hi_u32 v80, s46, v99
	v_mul_lo_u32 v80, s41, v80
	v_subbrev_co_u32_e32 v97, vcc, 0, v97, vcc
	v_sub_u32_e32 v80, v99, v80
	v_mov_b32_e32 v104, s41
	v_cmp_le_u32_e32 vcc, s41, v80
	s_movk_i32 s0, 0xff00
	s_movk_i32 s3, 0xff02
	v_cndmask_b32_e32 v100, 0, v104, vcc
	v_add3_u32 v80, v80, v100, s0
	v_mad_u64_u32 v[100:101], s[0:1], s44, v97, v[80:81]
	v_add_u32_e32 v101, 0x102, v82
	v_add_u32_e32 v82, v101, v98
	v_mul_hi_u32 v97, s46, v82
	v_mul_lo_u32 v98, s41, v97
	v_sub_u32_e32 v82, v82, v98
	v_cmp_le_u32_e32 vcc, s41, v82
	v_mul_hi_u32 v82, s46, v101
	v_mul_lo_u32 v82, s41, v82
	v_subbrev_co_u32_e32 v97, vcc, 0, v97, vcc
	v_sub_u32_e32 v98, v101, v82
	v_cmp_le_u32_e32 vcc, s41, v98
	v_sub_u32_e32 v82, v99, v82
	v_add_u32_e32 v84, s2, v102
	v_cndmask_b32_e32 v98, 0, v104, vcc
	v_add3_u32 v82, v82, v98, s3
	v_add_u32_e32 v84, 0x101, v84
	v_mad_u64_u32 v[98:99], s[0:1], s44, v97, v[82:83]
	v_mul_hi_u32 v97, s46, v84
	v_mul_lo_u32 v99, s41, v97
	v_sub_u32_e32 v84, v84, v99
	v_add_u32_e32 v99, 0x101, v94
	v_cmp_le_u32_e32 vcc, s41, v84
	v_mul_hi_u32 v84, s46, v99
	v_mul_lo_u32 v84, s41, v84
	v_subbrev_co_u32_e32 v97, vcc, 0, v97, vcc
	v_sub_u32_e32 v84, v99, v84
	v_cmp_le_u32_e32 vcc, s41, v84
	s_movk_i32 s0, 0xfeff
	v_add3_u32 v93, v93, s2, 3
	v_cndmask_b32_e32 v102, 0, v104, vcc
	v_add3_u32 v84, v84, v102, s0
	v_add_u32_e32 v94, 0x103, v94
	v_add_u32_e32 v86, s2, v106
	v_add_u32_e32 v86, 0x100, v86
	v_add_u32_e32 v88, s2, v118
	v_add_u32_e32 v88, 0x100, v88
	s_add_i32 m0, s35, 0x8000
	s_waitcnt vmcnt(1)
	v_mad_u64_u32 v[102:103], s[0:1], s44, v97, v[84:85]
	v_mul_hi_u32 v97, s46, v93
	v_mul_lo_u32 v103, s41, v97
	v_sub_u32_e32 v93, v93, v103
	v_cmp_le_u32_e32 vcc, s41, v93
	s_nop 1
	v_subbrev_co_u32_e32 v93, vcc, 0, v97, vcc
	v_mul_hi_u32 v97, s46, v94
	v_mul_lo_u32 v97, s41, v97
	v_sub_u32_e32 v94, v94, v97
	v_cmp_le_u32_e32 vcc, s41, v94
	v_sub_u32_e32 v97, v99, v97
	s_nop 0
	v_cndmask_b32_e32 v94, 0, v104, vcc
	v_add3_u32 v94, v97, v94, s3
	v_mad_u64_u32 v[104:105], s[0:1], s44, v93, v[94:95]
	v_mul_hi_u32 v93, s46, v86
	v_mul_lo_u32 v97, s41, v93
	v_sub_u32_e32 v86, v86, v97
	v_cmp_le_u32_e32 vcc, s41, v86
	s_nop 1
	v_subbrev_co_u32_e32 v86, vcc, 0, v93, vcc
	v_mad_u64_u32 v[92:93], s[0:1], s44, v86, v[80:81]
	v_add_u32_e32 v86, v101, v108
	v_mul_hi_u32 v93, s46, v86
	v_mul_lo_u32 v96, s41, v93
	v_sub_u32_e32 v86, v86, v96
	v_cmp_le_u32_e32 vcc, s41, v86
	s_nop 1
	v_subbrev_co_u32_e32 v86, vcc, 0, v93, vcc
	v_mad_u64_u32 v[96:97], s[0:1], s44, v86, v[82:83]
	v_add_u32_e32 v86, s2, v122
	v_add_u32_e32 v86, 0x101, v86
	v_mul_hi_u32 v90, s46, v86
	v_mul_lo_u32 v93, s41, v90
	v_sub_u32_e32 v86, v86, v93
	v_cmp_le_u32_e32 vcc, s41, v86
	v_mul_hi_u32 v93, s46, v88
	s_nop 0
	v_subbrev_co_u32_e32 v86, vcc, 0, v90, vcc
	v_mad_u64_u32 v[108:109], s[0:1], s44, v86, v[84:85]
	v_add3_u32 v84, v110, s2, 3
	v_mul_hi_u32 v86, s46, v84
	v_mul_lo_u32 v90, s41, v86
	v_sub_u32_e32 v84, v84, v90
	v_cmp_le_u32_e32 vcc, s41, v84
	s_movk_i32 s2, 0x800
	s_nop 0
	v_subbrev_co_u32_e32 v84, vcc, 0, v86, vcc
	v_mad_u64_u32 v[110:111], s[0:1], s44, v84, v[94:95]
	buffer_load_ubyte v84, v100, s[28:31], 0 offen offset:256
	buffer_load_ubyte v86, v98, s[28:31], 0 offen offset:256
	buffer_load_ubyte v90, v102, s[28:31], 0 offen offset:257
	buffer_load_ubyte v94, v104, s[28:31], 0 offen offset:256
	buffer_load_ubyte v99, v92, s[28:31], 0 offen offset:256
	buffer_load_ubyte v103, v96, s[28:31], 0 offen offset:256
	buffer_load_ubyte v105, v108, s[28:31], 0 offen offset:257
	buffer_load_ubyte v106, v110, s[28:31], 0 offen offset:256
	v_mul_lo_u32 v96, s41, v93
	v_sub_u32_e32 v88, v88, v96
	v_cmp_le_u32_e32 vcc, s41, v88
	s_nop 1
	v_subbrev_co_u32_e32 v88, vcc, 0, v93, vcc
	v_mad_u64_u32 v[96:97], s[0:1], s44, v88, v[80:81]
	v_add_u32_e32 v80, v101, v116
	v_mul_hi_u32 v88, s46, v80
	v_mul_lo_u32 v92, s41, v88
	v_sub_u32_e32 v80, v80, v92
	v_cmp_le_u32_e32 vcc, s41, v80
	s_nop 1
	v_subbrev_co_u32_e32 v80, vcc, 0, v88, vcc
	v_mad_u64_u32 v[92:93], s[0:1], s44, v80, v[82:83]
	v_lshl_or_b32 v88, s48, 7, v83
	s_movk_i32 s0, 0x80
	buffer_load_ubyte v80, v96, s[28:31], 0 offen offset:256
	buffer_load_ubyte v82, v92, s[28:31], 0 offen offset:256
	v_add3_u32 v92, v88, v81, s0
	s_waitcnt vmcnt(12)
	s_barrier
	buffer_load_dwordx4 v92, s[24:27], 0 offen lds
	v_add3_u32 v92, v88, v87, s0
	s_add_i32 m0, s33, 0x8000
	s_nop 0
	buffer_load_dwordx4 v92, s[24:27], 0 offen lds
	v_add3_u32 v92, v88, v91, s0
	s_add_i32 m0, s54, 0x8000
	v_add3_u32 v88, v88, v95, s0
	buffer_load_dwordx4 v92, s[24:27], 0 offen lds
	s_add_i32 m0, s55, 0x8000
	s_nop 0
	buffer_load_dwordx4 v88, s[24:27], 0 offen lds
	v_lshl_add_u32 v88, s48, 11, v114
	v_add_u32_e32 v92, 0x800, v88
	v_mul_hi_u32 v93, s38, v92
	v_mul_lo_u32 v96, v93, s34
	v_sub_u32_e32 v92, v92, v96
	v_cmp_le_u32_e32 vcc, s34, v92
	v_sub_u32_e32 v88, v88, v96
	s_add_i32 m0, s63, 0x15000
	v_subbrev_co_u32_e64 v92, s[0:1], 0, v93, vcc
	v_mov_b32_e32 v93, s34
	v_add_u32_e32 v92, s18, v92
	v_cndmask_b32_e32 v93, 0, v93, vcc
	v_mul_lo_u32 v97, v92, s34
	v_add_u32_e32 v88, v88, v93
	v_add3_u32 v93, v88, v97, s2
	buffer_load_dword v93, s[20:23], 0 offen lds
	v_add_u32_e32 v93, 16, v92
	v_mul_lo_u32 v93, v93, s34
	v_add3_u32 v93, v88, v93, s2
	s_add_i32 m0, s17, 0x15000
	s_mov_b32 s0, 0x8000
	buffer_load_dword v93, s[20:23], 0 offen lds
	v_add_u32_e32 v93, 32, v92
	v_mul_lo_u32 v93, v93, s34
	v_add3_u32 v93, v88, v93, s2
	s_add_i32 m0, s39, 0x15000
	s_mov_b32 s1, 0x15000
	buffer_load_dword v93, s[20:23], 0 offen lds
	v_add_u32_e32 v93, 48, v92
	v_mul_lo_u32 v93, v93, s34
	v_add3_u32 v93, v88, v93, s2
	s_add_i32 m0, s56, 0x15000
	s_nop 0
	buffer_load_dword v93, s[20:23], 0 offen lds
	v_add_u32_e32 v93, 64, v92
	v_mul_lo_u32 v93, v93, s34
	v_add3_u32 v93, v88, v93, s2
	s_add_i32 m0, s57, 0x15000
	s_nop 0
	buffer_load_dword v93, s[20:23], 0 offen lds
	v_add_u32_e32 v93, 0x50, v92
	v_mul_lo_u32 v93, v93, s34
	v_add3_u32 v93, v88, v93, s2
	s_add_i32 m0, s58, 0x15000
	s_nop 0
	buffer_load_dword v93, s[20:23], 0 offen lds
	v_add_u32_e32 v93, 0x60, v92
	v_mul_lo_u32 v93, v93, s34
	v_add3_u32 v93, v88, v93, s2
	s_add_i32 m0, s59, 0x15000
	s_nop 0
	buffer_load_dword v93, s[20:23], 0 offen lds
	v_add_u32_e32 v93, 0x70, v92
	v_mul_lo_u32 v93, v93, s34
	v_add3_u32 v93, v88, v93, s2
	s_add_i32 m0, s60, 0x15000
	s_nop 0
	buffer_load_dword v93, s[20:23], 0 offen lds
	v_add_u32_e32 v93, 0x80, v92
	v_mul_lo_u32 v93, v93, s34
	v_add_u32_e32 v92, 0x90, v92
	v_add3_u32 v93, v88, v93, s2
	s_add_i32 m0, s61, 0x15000
	v_mul_lo_u32 v92, v92, s34
	buffer_load_dword v93, s[20:23], 0 offen lds
	v_add3_u32 v88, v88, v92, s2
	s_add_i32 m0, s62, 0x15000
	s_nop 0
	buffer_load_dword v88, s[20:23], 0 offen lds
	scratch_load_dword v81, off, off offset:176
	scratch_load_dword v83, off, off offset:180
	ds_read_b128 v[108:111], v251
	ds_read_b128 v[114:117], v251 offset:2048
	ds_read_b128 v[118:121], v251 offset:4096
	ds_read_b128 v[122:125], v251 offset:6144
	s_waitcnt vmcnt(1)
	v_add_u32_e32 v88, 0x10000, v81
	ds_read_b128 v[138:141], v88
	ds_read_b128 v[144:147], v88 offset:2048
	ds_read_b128 v[148:151], v88 offset:4096
	ds_read_b128 v[152:155], v88 offset:6144
	ds_read_b128 v[156:159], v252
	ds_read_b128 v[160:163], v252 offset:2048
	ds_read_b128 v[164:167], v252 offset:4096
	ds_read_b128 v[168:171], v252 offset:6144
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v92, 0x10000, v83
	ds_read_b128 v[172:175], v88 offset:8192
	ds_read_b128 v[176:179], v92
	ds_read_b128 v[180:183], v92 offset:2048
	ds_read_b128 v[184:187], v92 offset:4096
	ds_read_b128 v[188:191], v92 offset:6144
	ds_read_b128 v[192:195], v92 offset:8192
	s_barrier
	s_setprio 1
	v_and_b32_e32 v88, 0xff, v216
	v_and_b32_e32 v92, 0xff, v133
	v_and_b32_e32 v93, 0xff, v132
	v_and_b32_e32 v96, 0xff, v197
	v_and_b32_e32 v97, 0xff, v225
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[108:111], v[138:141], v[76:79], v128, v88 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[108:111], v[144:147], v[72:75], v128, v92 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[108:111], v[148:151], v[68:71], v128, v93 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[108:111], v[152:155], v[64:67], v128, v96 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[108:111], v[172:175], v[60:63], v128, v97 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[114:117], v[138:141], v[56:59], v128, v88 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[114:117], v[144:147], v[52:55], v128, v92 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[114:117], v[148:151], v[48:51], v128, v93 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[114:117], v[152:155], v[44:47], v128, v96 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[114:117], v[172:175], v[40:43], v128, v97 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[118:121], v[144:147], v[32:35], v127, v92 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[118:121], v[148:151], v[28:31], v127, v93 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[118:121], v[152:155], v[12:15], v127, v96 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[118:121], v[172:175], v[4:7], v127, v97 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[122:125], v[148:151], v[20:23], v127, v93 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[122:125], v[152:155], v[24:27], v127, v96 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[122:125], v[172:175], v[0:3], v127, v97 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[118:121], v[138:141], v[134:137], v127, v88 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], v[122:125], v[138:141], v[202:205], v127, v88 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[122:125], v[144:147], v[8:11], v127, v92 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_barrier
	s_waitcnt vmcnt(17)
	s_barrier
	s_setprio 1
	v_and_b32_e32 v88, 0xff, v215
	v_and_b32_e32 v92, 0xff, v131
	v_and_b32_e32 v93, 0xff, v142
	v_and_b32_e32 v91, 0xff, v214
	v_and_b32_e32 v89, 0xff, v89
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[156:159], v[176:179], v[76:79], v128, v88 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[156:159], v[180:183], v[72:75], v128, v92 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[156:159], v[184:187], v[68:71], v128, v93 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[156:159], v[188:191], v[64:67], v128, v91 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[156:159], v[192:195], v[60:63], v128, v89 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[160:163], v[176:179], v[56:59], v128, v88 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[160:163], v[180:183], v[52:55], v128, v92 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[160:163], v[184:187], v[48:51], v128, v93 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[160:163], v[188:191], v[44:47], v128, v91 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[160:163], v[192:195], v[40:43], v128, v89 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[134:137], v[164:167], v[176:179], v[36:39], v127, v88 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[164:167], v[180:183], v[32:35], v127, v92 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[164:167], v[184:187], v[28:31], v127, v93 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[164:167], v[188:191], v[12:15], v127, v91 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[164:167], v[192:195], v[4:7], v127, v89 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[202:205], v[168:171], v[176:179], v[108:111], v127, v88 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[168:171], v[180:183], v[16:19], v127, v92 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[168:171], v[184:187], v[20:23], v127, v93 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[168:171], v[188:191], v[24:27], v127, v91 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[168:171], v[192:195], v[0:3], v127, v89 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_setprio 0
	v_mov_b32_e32 v128, v85
	v_mov_b32_e32 v127, v112
	v_mov_b32_e32 v216, v84
	v_mov_b32_e32 v215, v86
	v_mov_b32_e32 v133, v90
	v_mov_b32_e32 v131, v94
	v_mov_b32_e32 v132, v99
	v_mov_b32_e32 v142, v103
	v_mov_b32_e32 v197, v105
	v_mov_b32_e32 v214, v106
	v_mov_b32_e32 v225, v80
	v_mov_b32_e32 v89, v82
	s_andn2_b64 vcc, exec, s[8:9]
	s_cbranch_vccnz .LBB0_17
.LBB0_16:
	s_barrier
.LBB0_17:
	s_waitcnt vmcnt(1)
	v_add_u32_e32 v80, s1, v81
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v82, s1, v83
	s_waitcnt lgkmcnt(0)
	s_barrier
	ds_read_b128 v[108:111], v80
	ds_read_b128 v[114:117], v80 offset:2048
	ds_read_b128 v[118:121], v82
	ds_read_b128 v[122:125], v80 offset:8192
	ds_read_b128 v[138:141], v82 offset:2048
	ds_read_b128 v[144:147], v82 offset:4096
	ds_read_b128 v[148:151], v80 offset:4096
	ds_read_b128 v[152:155], v80 offset:6144
	ds_read_b128 v[156:159], v82 offset:6144
	ds_read_b128 v[160:163], v82 offset:8192
	v_add_u32_e32 v80, s0, v251
	ds_read_b128 v[90:93], v80
	ds_read_b128 v[164:167], v80 offset:2048
	v_and_b32_e32 v96, 0xff, v216
	v_add_u32_e32 v81, s0, v252
	v_and_b32_e32 v97, 0xff, v215
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[90:93], v[108:111], v[76:79], v128, v96 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 v[168:171], v81
	ds_read_b128 v[172:175], v81 offset:2048
	ds_read_b128 v[176:179], v80 offset:4096
	ds_read_b128 v[180:183], v80 offset:6144
	ds_read_b128 v[184:187], v81 offset:4096
	ds_read_b128 v[188:191], v81 offset:6144
	v_and_b32_e32 v98, 0xff, v133
	v_and_b32_e32 v102, 0xff, v197
	s_waitcnt lgkmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[168:171], v[118:121], v[76:79], v128, v97 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_and_b32_e32 v99, 0xff, v131
	v_and_b32_e32 v100, 0xff, v132
	s_movk_i32 s0, 0x7fff
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[90:93], v[114:117], v[72:75], v128, v98 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_and_b32_e32 v103, 0xff, v214
	s_nop 2
	v_bfe_u32 v80, v79, 16, 1
	v_bfe_u32 v81, v78, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[90:93], v[152:155], v[64:67], v128, v102 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_bfe_u32 v82, v77, 16, 1
	v_bfe_u32 v83, v76, 16, 1
	v_add3_u32 v82, v77, v82, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[168:171], v[138:141], v[72:75], v128, v99 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add3_u32 v81, v78, v81, s0
	v_add3_u32 v80, v79, v80, s0
	v_and_b32_e32 v105, 0xff, v89
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[90:93], v[148:151], v[68:71], v128, v100 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add3_u32 v84, v76, v83, s0
	v_lshrrev_b32_e32 v85, 16, v80
	v_lshrrev_b32_e32 v88, 16, v81
	v_lshrrev_b32_e32 v89, 16, v82
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[168:171], v[156:159], v[64:67], v128, v103 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v79, v79
	v_and_b32_e32 v104, 0xff, v225
	v_and_b32_e32 v101, 0xff, v142
	v_mov_b32_e32 v66, 0x7fc0
	v_cndmask_b32_e32 v64, v66, v85, vcc
	v_cmp_o_f32_e32 vcc, v78, v78
	v_lshrrev_b32_e32 v65, 16, v84
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[90:93], v[122:125], v[60:63], v128, v104 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_bfe_u32 v67, v73, 16, 1
	v_add3_u32 v67, v73, v67, s0
	s_mul_hi_u32 s1, s12, s14
	v_cndmask_b32_e32 v60, v66, v88, vcc
	v_cmp_o_f32_e32 vcc, v77, v77
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[164:167], v[114:117], v[52:55], v128, v98 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_bfe_u32 v63, v75, 16, 1
	v_cndmask_b32_e32 v61, v66, v89, vcc
	v_cmp_o_f32_e32 vcc, v76, v76
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[168:171], v[144:147], v[68:71], v128, v101 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add3_u32 v63, v75, v63, s0
	v_cndmask_b32_e32 v62, v66, v65, vcc
	v_bfe_u32 v65, v74, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[164:167], v[148:151], v[48:51], v128, v100 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_bfe_u32 v76, v72, 16, 1
	v_add3_u32 v65, v74, v65, s0
	v_lshrrev_b32_e32 v63, 16, v63
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[164:167], v[152:155], v[44:47], v128, v102 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v75, v75
	v_add3_u32 v88, v72, v76, s0
	v_lshrrev_b32_e32 v65, 16, v65
	s_waitcnt lgkmcnt(4)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[172:175], v[138:141], v[52:55], v128, v99 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	v_cndmask_b32_e32 v52, v66, v63, vcc
	v_cmp_o_f32_e32 vcc, v74, v74
	v_lshrrev_b32_e32 v53, 16, v67
	v_lshrrev_b32_e32 v54, 16, v88
	v_cndmask_b32_e32 v55, v66, v65, vcc
	v_cmp_o_f32_e32 vcc, v73, v73
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[172:175], v[144:147], v[48:51], v128, v101 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 0
	v_cndmask_b32_e32 v53, v66, v53, vcc
	v_cmp_o_f32_e32 vcc, v72, v72
	v_bfe_u32 v48, v71, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[164:167], v[122:125], v[40:43], v128, v104 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_bfe_u32 v49, v70, 16, 1
	v_cndmask_b32_e32 v54, v66, v54, vcc
	v_bfe_u32 v50, v69, 16, 1
	s_waitcnt lgkmcnt(3)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[176:179], v[108:111], v[134:137], v127, v96 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v71, v71
	v_bfe_u32 v51, v68, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[172:175], v[156:159], v[44:47], v128, v103 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	v_add3_u32 v47, v71, v48, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[176:179], v[114:117], v[32:35], v127, v98 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add3_u32 v46, v70, v49, s0
	v_lshrrev_b32_e32 v47, 16, v47
	v_add3_u32 v45, v69, v50, s0
	v_lshrrev_b32_e32 v46, 16, v46
	v_cndmask_b32_e32 v63, v66, v47, vcc
	v_cmp_o_f32_e32 vcc, v70, v70
	v_add3_u32 v44, v68, v51, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[172:175], v[160:163], v[40:43], v128, v105 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v65, v66, v46, vcc
	v_cmp_o_f32_e32 vcc, v69, v69
	s_nop 0
	v_lshrrev_b32_e32 v40, 16, v45
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[184:187], v[118:121], v[36:39], v127, v97 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v41, 16, v44
	v_cndmask_b32_e32 v67, v66, v40, vcc
	v_cmp_o_f32_e32 vcc, v68, v68
	v_bfe_u32 v36, v83, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[176:179], v[122:125], v[4:7], v127, v104 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_bfe_u32 v37, v82, 16, 1
	v_cndmask_b32_e32 v68, v66, v41, vcc
	v_bfe_u32 v38, v81, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[184:187], v[138:141], v[32:35], v127, v99 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_bfe_u32 v39, v80, 16, 1
	v_cmp_o_f32_e32 vcc, v83, v83
	s_nop 0
	v_add3_u32 v35, v83, v36, s0
	v_add3_u32 v34, v82, v37, s0
	v_lshrrev_b32_e32 v35, 16, v35
	v_add3_u32 v32, v80, v39, s0
	v_add3_u32 v33, v81, v38, s0
	v_lshrrev_b32_e32 v34, 16, v34
	v_cndmask_b32_e32 v71, v66, v35, vcc
	v_cmp_o_f32_e32 vcc, v82, v82
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[176:179], v[148:151], v[28:31], v127, v100 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v69, 16, v33
	v_lshrrev_b32_e32 v70, 16, v32
	v_cndmask_b32_e32 v82, v66, v34, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[184:187], v[160:163], v[4:7], v127, v105 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v81, v81
	v_bfe_u32 v81, v50, 16, 1
	v_bfe_u32 v83, v49, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[180:183], v[108:111], v[202:205], v127, v96 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v16, v66, v69, vcc
	v_cmp_o_f32_e32 vcc, v80, v80
	v_bfe_u32 v69, v89, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[168:171], v[160:163], v[84:87], v128, v105 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v17, v66, v70, vcc
	v_bfe_u32 v70, v88, 16, 1
	v_add3_u32 v69, v89, v69, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[164:167], v[108:111], v[56:59], v128, v96 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add3_u32 v70, v88, v70, s0
	s_nop 2
	v_bfe_u32 v18, v87, 16, 1
	v_bfe_u32 v19, v86, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[184:187], v[144:147], v[28:31], v127, v101 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add3_u32 v18, v87, v18, s0
	v_add3_u32 v19, v86, v19, s0
	v_lshrrev_b32_e32 v18, 16, v18
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[176:179], v[152:155], v[12:15], v127, v102 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v87, v87
	v_lshrrev_b32_e32 v19, 16, v19
	v_lshrrev_b32_e32 v69, 16, v69
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[188:191], v[118:121], v[4:7], v127, v97 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v18, v66, v18, vcc
	v_cmp_o_f32_e32 vcc, v86, v86
	v_lshrrev_b32_e32 v70, 16, v70
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[180:183], v[114:117], v[8:11], v127, v98 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v19, v66, v19, vcc
	v_cmp_o_f32_e32 vcc, v85, v85
	v_bfe_u32 v80, v51, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[172:175], v[118:121], v[56:59], v128, v97 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add3_u32 v80, v51, v80, s0
	v_add3_u32 v81, v50, v81, s0
	v_lshrrev_b32_e32 v80, 16, v80
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[184:187], v[156:159], v[12:15], v127, v103 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add3_u32 v83, v49, v83, s0
	v_lshrrev_b32_e32 v81, 16, v81
	v_lshrrev_b32_e32 v83, 16, v83
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[188:191], v[138:141], v[4:7], v127, v99 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[180:183], v[148:151], v[20:23], v127, v100 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_bfe_u32 v20, v85, 16, 1
	v_bfe_u32 v21, v84, 16, 1
	v_add3_u32 v20, v85, v20, s0
	v_add3_u32 v21, v84, v21, s0
	v_lshrrev_b32_e32 v20, 16, v20
	v_bfe_u32 v22, v59, 16, 1
	v_lshrrev_b32_e32 v21, 16, v21
	v_cndmask_b32_e32 v20, v66, v20, vcc
	v_cmp_o_f32_e32 vcc, v84, v84
	v_bfe_u32 v23, v58, 16, 1
	v_add3_u32 v22, v59, v22, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[188:191], v[144:147], v[4:7], v127, v101 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v21, v66, v21, vcc
	v_add3_u32 v23, v58, v23, s0
	v_lshrrev_b32_e32 v22, 16, v22
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[180:183], v[152:155], v[24:27], v127, v102 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v59, v59
	v_lshrrev_b32_e32 v23, 16, v23
	v_bfe_u32 v59, v90, 16, 1
	v_bfe_u32 v24, v57, 16, 1
	v_bfe_u32 v25, v56, 16, 1
	v_add3_u32 v24, v57, v24, s0
	v_cndmask_b32_e32 v22, v66, v22, vcc
	v_cmp_o_f32_e32 vcc, v58, v58
	v_add3_u32 v25, v56, v25, s0
	v_lshrrev_b32_e32 v24, 16, v24
	v_cndmask_b32_e32 v23, v66, v23, vcc
	v_cmp_o_f32_e32 vcc, v57, v57
	v_bfe_u32 v26, v79, 16, 1
	v_lshrrev_b32_e32 v25, 16, v25
	v_cndmask_b32_e32 v24, v66, v24, vcc
	v_cmp_o_f32_e32 vcc, v56, v56
	v_bfe_u32 v27, v78, 16, 1
	v_add3_u32 v26, v79, v26, s0
	v_cndmask_b32_e32 v25, v66, v25, vcc
	v_bfe_u32 v56, v77, 16, 1
	v_add3_u32 v27, v78, v27, s0
	v_lshrrev_b32_e32 v26, 16, v26
	v_cmp_o_f32_e32 vcc, v79, v79
	v_bfe_u32 v57, v76, 16, 1
	v_add3_u32 v56, v77, v56, s0
	v_lshrrev_b32_e32 v27, 16, v27
	v_cndmask_b32_e32 v26, v66, v26, vcc
	v_cmp_o_f32_e32 vcc, v78, v78
	v_add3_u32 v57, v76, v57, s0
	v_lshrrev_b32_e32 v56, 16, v56
	v_cndmask_b32_e32 v27, v66, v27, vcc
	v_cmp_o_f32_e32 vcc, v77, v77
	v_bfe_u32 v58, v91, 16, 1
	v_lshrrev_b32_e32 v57, 16, v57
	v_cndmask_b32_e32 v56, v66, v56, vcc
	v_cmp_o_f32_e32 vcc, v76, v76
	v_add3_u32 v58, v91, v58, s0
	v_add3_u32 v59, v90, v59, s0
	v_cndmask_b32_e32 v57, v66, v57, vcc
	v_lshrrev_b32_e32 v58, 16, v58
	v_cmp_o_f32_e32 vcc, v91, v91
	v_lshrrev_b32_e32 v59, 16, v59
	v_bfe_u32 v76, v75, 16, 1
	v_cndmask_b32_e32 v58, v66, v58, vcc
	v_cmp_o_f32_e32 vcc, v90, v90
	v_bfe_u32 v77, v74, 16, 1
	v_add3_u32 v76, v75, v76, s0
	v_cndmask_b32_e32 v59, v66, v59, vcc
	v_cmp_o_f32_e32 vcc, v89, v89
	v_bfe_u32 v78, v73, 16, 1
	v_add3_u32 v77, v74, v77, s0
	v_cndmask_b32_e32 v69, v66, v69, vcc
	v_cmp_o_f32_e32 vcc, v88, v88
	v_lshrrev_b32_e32 v76, 16, v76
	v_bfe_u32 v79, v72, 16, 1
	v_cndmask_b32_e32 v70, v66, v70, vcc
	v_cmp_o_f32_e32 vcc, v75, v75
	v_add3_u32 v78, v73, v78, s0
	v_lshrrev_b32_e32 v77, 16, v77
	v_cndmask_b32_e32 v75, v66, v76, vcc
	v_cmp_o_f32_e32 vcc, v74, v74
	v_add3_u32 v79, v72, v79, s0
	v_lshrrev_b32_e32 v78, 16, v78
	v_cndmask_b32_e32 v74, v66, v77, vcc
	v_cmp_o_f32_e32 vcc, v73, v73
	v_bfe_u32 v76, v95, 16, 1
	v_lshrrev_b32_e32 v79, 16, v79
	v_cndmask_b32_e32 v73, v66, v78, vcc
	v_cmp_o_f32_e32 vcc, v72, v72
	v_bfe_u32 v77, v94, 16, 1
	v_add3_u32 v76, v95, v76, s0
	v_cndmask_b32_e32 v72, v66, v79, vcc
	v_bfe_u32 v78, v93, 16, 1
	v_add3_u32 v77, v94, v77, s0
	v_lshrrev_b32_e32 v76, 16, v76
	v_cmp_o_f32_e32 vcc, v95, v95
	v_bfe_u32 v79, v92, 16, 1
	v_add3_u32 v78, v93, v78, s0
	v_lshrrev_b32_e32 v77, 16, v77
	v_cndmask_b32_e32 v76, v66, v76, vcc
	v_cmp_o_f32_e32 vcc, v94, v94
	v_add3_u32 v79, v92, v79, s0
	v_lshrrev_b32_e32 v78, 16, v78
	v_cndmask_b32_e32 v77, v66, v77, vcc
	v_cmp_o_f32_e32 vcc, v93, v93
	v_lshrrev_b32_e32 v79, 16, v79
	v_bfe_u32 v84, v48, 16, 1
	v_cndmask_b32_e32 v78, v66, v78, vcc
	v_cmp_o_f32_e32 vcc, v92, v92
	v_add3_u32 v84, v48, v84, s0
	v_lshrrev_b32_e32 v84, 16, v84
	v_cndmask_b32_e32 v79, v66, v79, vcc
	v_cmp_o_f32_e32 vcc, v51, v51
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[188:191], v[156:159], v[4:7], v127, v103 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 0
	v_cndmask_b32_e32 v51, v66, v80, vcc
	v_cmp_o_f32_e32 vcc, v50, v50
	v_bfe_u32 v80, v47, 16, 1
	v_add3_u32 v80, v47, v80, s0
	v_cndmask_b32_e32 v50, v66, v81, vcc
	v_cmp_o_f32_e32 vcc, v49, v49
	v_bfe_u32 v81, v46, 16, 1
	v_add3_u32 v81, v46, v81, s0
	v_cndmask_b32_e32 v49, v66, v83, vcc
	v_cmp_o_f32_e32 vcc, v48, v48
	v_bfe_u32 v83, v45, 16, 1
	v_lshrrev_b32_e32 v80, 16, v80
	v_cndmask_b32_e32 v48, v66, v84, vcc
	v_cmp_o_f32_e32 vcc, v47, v47
	v_bfe_u32 v84, v44, 16, 1
	v_add3_u32 v83, v45, v83, s0
	v_lshrrev_b32_e32 v81, 16, v81
	v_cndmask_b32_e32 v47, v66, v80, vcc
	v_cmp_o_f32_e32 vcc, v46, v46
	v_add3_u32 v84, v44, v84, s0
	v_lshrrev_b32_e32 v83, 16, v83
	v_cndmask_b32_e32 v46, v66, v81, vcc
	v_cmp_o_f32_e32 vcc, v45, v45
	v_bfe_u32 v80, v43, 16, 1
	v_lshrrev_b32_e32 v84, 16, v84
	v_cndmask_b32_e32 v45, v66, v83, vcc
	v_cmp_o_f32_e32 vcc, v44, v44
	v_bfe_u32 v81, v42, 16, 1
	v_add3_u32 v80, v43, v80, s0
	v_cndmask_b32_e32 v44, v66, v84, vcc
	v_bfe_u32 v83, v41, 16, 1
	v_add3_u32 v81, v42, v81, s0
	v_lshrrev_b32_e32 v80, 16, v80
	v_cmp_o_f32_e32 vcc, v43, v43
	v_bfe_u32 v84, v40, 16, 1
	v_add3_u32 v83, v41, v83, s0
	v_lshrrev_b32_e32 v81, 16, v81
	v_cndmask_b32_e32 v43, v66, v80, vcc
	v_cmp_o_f32_e32 vcc, v42, v42
	v_add3_u32 v84, v40, v84, s0
	v_lshrrev_b32_e32 v83, 16, v83
	v_cndmask_b32_e32 v42, v66, v81, vcc
	v_cmp_o_f32_e32 vcc, v41, v41
	v_bfe_u32 v80, v39, 16, 1
	v_lshrrev_b32_e32 v84, 16, v84
	v_cndmask_b32_e32 v41, v66, v83, vcc
	v_cmp_o_f32_e32 vcc, v40, v40
	v_bfe_u32 v81, v38, 16, 1
	v_add3_u32 v80, v39, v80, s0
	v_cndmask_b32_e32 v40, v66, v84, vcc
	v_bfe_u32 v83, v37, 16, 1
	v_add3_u32 v81, v38, v81, s0
	v_lshrrev_b32_e32 v80, 16, v80
	v_cmp_o_f32_e32 vcc, v39, v39
	v_bfe_u32 v84, v36, 16, 1
	v_add3_u32 v83, v37, v83, s0
	v_lshrrev_b32_e32 v81, 16, v81
	v_cndmask_b32_e32 v39, v66, v80, vcc
	v_cmp_o_f32_e32 vcc, v38, v38
	v_add3_u32 v84, v36, v84, s0
	v_lshrrev_b32_e32 v83, 16, v83
	v_cndmask_b32_e32 v38, v66, v81, vcc
	v_cmp_o_f32_e32 vcc, v37, v37
	v_bfe_u32 v80, v35, 16, 1
	v_lshrrev_b32_e32 v84, 16, v84
	v_cndmask_b32_e32 v37, v66, v83, vcc
	v_cmp_o_f32_e32 vcc, v36, v36
	v_bfe_u32 v81, v34, 16, 1
	v_add3_u32 v80, v35, v80, s0
	v_cndmask_b32_e32 v36, v66, v84, vcc
	v_bfe_u32 v83, v33, 16, 1
	v_add3_u32 v81, v34, v81, s0
	v_lshrrev_b32_e32 v80, 16, v80
	v_cmp_o_f32_e32 vcc, v35, v35
	v_bfe_u32 v84, v32, 16, 1
	v_add3_u32 v83, v33, v83, s0
	v_lshrrev_b32_e32 v81, 16, v81
	v_cndmask_b32_e32 v35, v66, v80, vcc
	v_cmp_o_f32_e32 vcc, v34, v34
	v_add3_u32 v84, v32, v84, s0
	v_lshrrev_b32_e32 v83, 16, v83
	v_cndmask_b32_e32 v34, v66, v81, vcc
	v_cmp_o_f32_e32 vcc, v33, v33
	v_bfe_u32 v80, v31, 16, 1
	v_lshrrev_b32_e32 v84, 16, v84
	v_cndmask_b32_e32 v33, v66, v83, vcc
	v_cmp_o_f32_e32 vcc, v32, v32
	v_bfe_u32 v81, v30, 16, 1
	v_add3_u32 v80, v31, v80, s0
	v_cndmask_b32_e32 v32, v66, v84, vcc
	v_bfe_u32 v83, v29, 16, 1
	v_add3_u32 v81, v30, v81, s0
	v_lshrrev_b32_e32 v80, 16, v80
	v_cmp_o_f32_e32 vcc, v31, v31
	v_bfe_u32 v84, v28, 16, 1
	v_add3_u32 v83, v29, v83, s0
	v_lshrrev_b32_e32 v81, 16, v81
	v_cndmask_b32_e32 v31, v66, v80, vcc
	v_cmp_o_f32_e32 vcc, v30, v30
	v_add3_u32 v84, v28, v84, s0
	v_lshrrev_b32_e32 v83, 16, v83
	v_cndmask_b32_e32 v30, v66, v81, vcc
	v_cmp_o_f32_e32 vcc, v29, v29
	v_bfe_u32 v80, v15, 16, 1
	v_lshrrev_b32_e32 v84, 16, v84
	v_cndmask_b32_e32 v29, v66, v83, vcc
	v_cmp_o_f32_e32 vcc, v28, v28
	v_bfe_u32 v81, v14, 16, 1
	v_add3_u32 v80, v15, v80, s0
	v_cndmask_b32_e32 v28, v66, v84, vcc
	v_bfe_u32 v83, v13, 16, 1
	v_add3_u32 v81, v14, v81, s0
	v_lshrrev_b32_e32 v80, 16, v80
	v_cmp_o_f32_e32 vcc, v15, v15
	v_bfe_u32 v84, v12, 16, 1
	v_add3_u32 v83, v13, v83, s0
	v_lshrrev_b32_e32 v81, 16, v81
	v_cndmask_b32_e32 v15, v66, v80, vcc
	v_cmp_o_f32_e32 vcc, v14, v14
	v_add3_u32 v84, v12, v84, s0
	v_lshrrev_b32_e32 v83, 16, v83
	v_cndmask_b32_e32 v14, v66, v81, vcc
	v_cmp_o_f32_e32 vcc, v13, v13
	v_bfe_u32 v80, v11, 16, 1
	v_lshrrev_b32_e32 v84, 16, v84
	v_cndmask_b32_e32 v13, v66, v83, vcc
	v_cmp_o_f32_e32 vcc, v12, v12
	v_bfe_u32 v81, v10, 16, 1
	v_add3_u32 v80, v11, v80, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[180:183], v[122:125], v[0:3], v127, v104 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v12, v66, v84, vcc
	v_bfe_u32 v83, v9, 16, 1
	v_add3_u32 v81, v10, v81, s0
	v_lshrrev_b32_e32 v80, 16, v80
	v_cmp_o_f32_e32 vcc, v11, v11
	v_bfe_u32 v84, v8, 16, 1
	v_add3_u32 v83, v9, v83, s0
	v_lshrrev_b32_e32 v81, 16, v81
	v_cndmask_b32_e32 v11, v66, v80, vcc
	v_cmp_o_f32_e32 vcc, v10, v10
	v_add3_u32 v84, v8, v84, s0
	v_lshrrev_b32_e32 v83, 16, v83
	v_cndmask_b32_e32 v10, v66, v81, vcc
	v_cmp_o_f32_e32 vcc, v9, v9
	v_bfe_u32 v80, v7, 16, 1
	v_lshrrev_b32_e32 v84, 16, v84
	v_cndmask_b32_e32 v9, v66, v83, vcc
	v_cmp_o_f32_e32 vcc, v8, v8
	v_bfe_u32 v81, v6, 16, 1
	v_add3_u32 v80, v7, v80, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[188:191], v[160:163], v[0:3], v127, v105 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v8, v66, v84, vcc
	v_bfe_u32 v83, v5, 16, 1
	v_add3_u32 v81, v6, v81, s0
	v_lshrrev_b32_e32 v80, 16, v80
	v_cmp_o_f32_e32 vcc, v7, v7
	v_bfe_u32 v84, v4, 16, 1
	v_add3_u32 v83, v5, v83, s0
	v_lshrrev_b32_e32 v81, 16, v81
	v_cndmask_b32_e32 v7, v66, v80, vcc
	v_cmp_o_f32_e32 vcc, v6, v6
	v_add3_u32 v84, v4, v84, s0
	v_lshrrev_b32_e32 v83, 16, v83
	v_cndmask_b32_e32 v6, v66, v81, vcc
	v_cmp_o_f32_e32 vcc, v5, v5
	v_lshrrev_b32_e32 v84, 16, v84
	v_bfe_u32 v80, v3, 16, 1
	v_cndmask_b32_e32 v5, v66, v83, vcc
	v_cmp_o_f32_e32 vcc, v4, v4
	v_bfe_u32 v81, v2, 16, 1
	v_bfe_u32 v83, v1, 16, 1
	v_cndmask_b32_e32 v4, v66, v84, vcc
	v_bfe_u32 v84, v0, 16, 1
	v_add3_u32 v84, v0, v84, s0
	v_add3_u32 v83, v1, v83, s0
	v_add3_u32 v81, v2, v81, s0
	v_add3_u32 v80, v3, v80, s0
	s_mul_i32 s0, s12, s15
	s_add_i32 s0, s1, s0
	s_mul_i32 s1, s13, s14
	s_add_i32 s1, s0, s1
	s_mul_i32 s0, s12, s14
	s_lshl_b64 s[0:1], s[0:1], 1
	v_lshrrev_b32_e32 v80, 16, v80
	v_cmp_o_f32_e32 vcc, v3, v3
	s_add_u32 s2, s10, s0
	v_lshrrev_b32_e32 v81, 16, v81
	v_cndmask_b32_e32 v3, v66, v80, vcc
	v_cmp_o_f32_e32 vcc, v2, v2
	s_addc_u32 s3, s11, s1
	s_lshl_b64 s[0:1], s[18:19], 1
	v_lshrrev_b32_e32 v83, 16, v83
	v_cndmask_b32_e32 v2, v66, v81, vcc
	v_cmp_o_f32_e32 vcc, v1, v1
	s_add_u32 s0, s2, s0
	v_lshrrev_b32_e32 v84, 16, v84
	v_cndmask_b32_e32 v1, v66, v83, vcc
	v_cmp_o_f32_e32 vcc, v0, v0
	s_addc_u32 s1, s3, s1
	s_and_b32 s2, s12, 0x3fff
	v_cndmask_b32_e32 v0, v66, v84, vcc
	v_lshl_or_b32 v66, v130, 2, v250
	s_lshl_b32 s2, s2, 16
	s_and_b32 s1, s1, 0xffff
	v_mul_lo_u32 v66, s12, v66
	s_or_b32 s1, s2, s1
	v_lshlrev_b32_e32 v80, 1, v143
	s_or_b32 s1, s1, 2.0
	s_mov_b32 s3, 0x27000
	s_mov_b32 s2, 0x7ffffffd
	v_lshl_add_u32 v81, v66, 1, v80
	s_lshl_b32 s4, s12, 1
	buffer_store_short v62, v81, s[0:3], 0 offen
	v_add_u32_e32 v62, s4, v81
	buffer_store_short v61, v62, s[0:3], 0 offen
	v_add_u32_e32 v61, s4, v62
	buffer_store_short v60, v61, s[0:3], 0 offen
	v_add_u32_e32 v60, s4, v61
	s_lshl_b32 s5, s12, 4
	buffer_store_short v64, v60, s[0:3], 0 offen
	buffer_store_short v54, v81, s[0:3], 0 offen offset:32
	buffer_store_short v53, v62, s[0:3], 0 offen offset:32
	buffer_store_short v55, v61, s[0:3], 0 offen offset:32
	buffer_store_short v52, v60, s[0:3], 0 offen offset:32
	buffer_store_short v68, v81, s[0:3], 0 offen offset:64
	buffer_store_short v67, v62, s[0:3], 0 offen offset:64
	buffer_store_short v65, v61, s[0:3], 0 offen offset:64
	buffer_store_short v63, v60, s[0:3], 0 offen offset:64
	buffer_store_short v17, v81, s[0:3], 0 offen offset:96
	buffer_store_short v16, v62, s[0:3], 0 offen offset:96
	buffer_store_short v82, v61, s[0:3], 0 offen offset:96
	buffer_store_short v71, v60, s[0:3], 0 offen offset:96
	buffer_store_short v21, v81, s[0:3], 0 offen offset:128
	buffer_store_short v20, v62, s[0:3], 0 offen offset:128
	buffer_store_short v19, v61, s[0:3], 0 offen offset:128
	buffer_store_short v18, v60, s[0:3], 0 offen offset:128
	v_add_u32_e32 v16, s5, v66
	v_lshl_add_u32 v17, v16, 1, v80
	v_add_u32_e32 v18, s4, v17
	v_add_u32_e32 v19, s4, v18
	v_add_u32_e32 v20, s4, v19
	v_add_u32_e32 v16, s5, v16
	buffer_store_short v25, v17, s[0:3], 0 offen
	buffer_store_short v24, v18, s[0:3], 0 offen
	buffer_store_short v23, v19, s[0:3], 0 offen
	buffer_store_short v22, v20, s[0:3], 0 offen
	buffer_store_short v57, v17, s[0:3], 0 offen offset:32
	buffer_store_short v56, v18, s[0:3], 0 offen offset:32
	buffer_store_short v27, v19, s[0:3], 0 offen offset:32
	buffer_store_short v26, v20, s[0:3], 0 offen offset:32
	buffer_store_short v70, v17, s[0:3], 0 offen offset:64
	buffer_store_short v69, v18, s[0:3], 0 offen offset:64
	buffer_store_short v59, v19, s[0:3], 0 offen offset:64
	buffer_store_short v58, v20, s[0:3], 0 offen offset:64
	buffer_store_short v72, v17, s[0:3], 0 offen offset:96
	buffer_store_short v73, v18, s[0:3], 0 offen offset:96
	buffer_store_short v74, v19, s[0:3], 0 offen offset:96
	buffer_store_short v75, v20, s[0:3], 0 offen offset:96
	buffer_store_short v79, v17, s[0:3], 0 offen offset:128
	buffer_store_short v78, v18, s[0:3], 0 offen offset:128
	buffer_store_short v77, v19, s[0:3], 0 offen offset:128
	buffer_store_short v76, v20, s[0:3], 0 offen offset:128
	v_lshl_add_u32 v17, v16, 1, v80
	v_add_u32_e32 v18, s4, v17
	v_add_u32_e32 v19, s4, v18
	v_add_u32_e32 v16, s5, v16
	v_add_u32_e32 v20, s4, v19
	v_lshl_add_u32 v16, v16, 1, v80
	buffer_store_short v48, v17, s[0:3], 0 offen
	buffer_store_short v49, v18, s[0:3], 0 offen
	buffer_store_short v50, v19, s[0:3], 0 offen
	buffer_store_short v51, v20, s[0:3], 0 offen
	buffer_store_short v44, v17, s[0:3], 0 offen offset:32
	buffer_store_short v45, v18, s[0:3], 0 offen offset:32
	buffer_store_short v46, v19, s[0:3], 0 offen offset:32
	buffer_store_short v47, v20, s[0:3], 0 offen offset:32
	buffer_store_short v40, v17, s[0:3], 0 offen offset:64
	buffer_store_short v41, v18, s[0:3], 0 offen offset:64
	buffer_store_short v42, v19, s[0:3], 0 offen offset:64
	buffer_store_short v43, v20, s[0:3], 0 offen offset:64
	buffer_store_short v36, v17, s[0:3], 0 offen offset:96
	buffer_store_short v37, v18, s[0:3], 0 offen offset:96
	buffer_store_short v38, v19, s[0:3], 0 offen offset:96
	buffer_store_short v39, v20, s[0:3], 0 offen offset:96
	buffer_store_short v32, v17, s[0:3], 0 offen offset:128
	buffer_store_short v33, v18, s[0:3], 0 offen offset:128
	buffer_store_short v34, v19, s[0:3], 0 offen offset:128
	buffer_store_short v35, v20, s[0:3], 0 offen offset:128
	v_add_u32_e32 v17, s4, v16
	v_add_u32_e32 v18, s4, v17
	v_add_u32_e32 v19, s4, v18
	buffer_store_short v28, v16, s[0:3], 0 offen
	buffer_store_short v29, v17, s[0:3], 0 offen
	buffer_store_short v30, v18, s[0:3], 0 offen
	buffer_store_short v31, v19, s[0:3], 0 offen
	buffer_store_short v12, v16, s[0:3], 0 offen offset:32
	buffer_store_short v13, v17, s[0:3], 0 offen offset:32
	buffer_store_short v14, v18, s[0:3], 0 offen offset:32
	buffer_store_short v15, v19, s[0:3], 0 offen offset:32
	buffer_store_short v8, v16, s[0:3], 0 offen offset:64
	buffer_store_short v9, v17, s[0:3], 0 offen offset:64
	buffer_store_short v10, v18, s[0:3], 0 offen offset:64
	buffer_store_short v11, v19, s[0:3], 0 offen offset:64
	buffer_store_short v4, v16, s[0:3], 0 offen offset:96
	buffer_store_short v5, v17, s[0:3], 0 offen offset:96
	buffer_store_short v6, v18, s[0:3], 0 offen offset:96
	buffer_store_short v7, v19, s[0:3], 0 offen offset:96
	buffer_store_short v0, v16, s[0:3], 0 offen offset:128
	buffer_store_short v1, v17, s[0:3], 0 offen offset:128
	buffer_store_short v2, v18, s[0:3], 0 offen offset:128
	buffer_store_short v3, v19, s[0:3], 0 offen offset:128
	s_endpgm
.LBB0_18:
	s_branch .LBB0_2
.LBB0_19:
	s_load_dwordx2 s[40:41], s[0:1], 0x48
	s_mul_hi_u32 s19, s12, 0xa0
	s_branch .LBB0_5
.LBB0_20:
	s_load_dwordx2 s[44:45], s[0:1], 0x58
	v_add_u32_e32 v1, s43, v0
	s_branch .LBB0_8
.LBB0_21:
	s_load_dwordx2 s[12:13], s[0:1], 0x60
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v2, v0
	v_mov_b32_e32 v3, v0
	v_mov_b32_e32 v1, v0
	v_mov_b64_e32 v[26:27], v[2:3]
	v_mov_b64_e32 v[22:23], v[2:3]
	v_mov_b64_e32 v[10:11], v[2:3]
	v_mov_b64_e32 v[204:205], v[2:3]
	v_mov_b64_e32 v[6:7], v[2:3]
	v_mov_b64_e32 v[14:15], v[2:3]
	v_mov_b64_e32 v[30:31], v[2:3]
	v_mov_b64_e32 v[34:35], v[2:3]
	v_mov_b64_e32 v[136:137], v[2:3]
	v_mov_b64_e32 v[42:43], v[2:3]
	v_mov_b64_e32 v[46:47], v[2:3]
	v_mov_b64_e32 v[50:51], v[2:3]
	v_mov_b64_e32 v[54:55], v[2:3]
	v_mov_b64_e32 v[58:59], v[2:3]
	v_mov_b64_e32 v[62:63], v[2:3]
	v_mov_b64_e32 v[66:67], v[2:3]
	v_mov_b64_e32 v[70:71], v[2:3]
	v_mov_b64_e32 v[74:75], v[2:3]
	v_mov_b64_e32 v[78:79], v[2:3]
	v_mov_b64_e32 v[24:25], v[0:1]
	v_mov_b64_e32 v[20:21], v[0:1]
	v_mov_b64_e32 v[8:9], v[0:1]
	v_mov_b64_e32 v[202:203], v[0:1]
	v_mov_b64_e32 v[4:5], v[0:1]
	v_mov_b64_e32 v[12:13], v[0:1]
	v_mov_b64_e32 v[28:29], v[0:1]
	v_mov_b64_e32 v[32:33], v[0:1]
	v_mov_b64_e32 v[134:135], v[0:1]
	v_mov_b64_e32 v[40:41], v[0:1]
	v_mov_b64_e32 v[44:45], v[0:1]
	v_mov_b64_e32 v[48:49], v[0:1]
	v_mov_b64_e32 v[52:53], v[0:1]
	v_mov_b64_e32 v[56:57], v[0:1]
	v_mov_b64_e32 v[60:61], v[0:1]
	v_mov_b64_e32 v[64:65], v[0:1]
	v_mov_b64_e32 v[68:69], v[0:1]
	v_mov_b64_e32 v[72:73], v[0:1]
	v_mov_b64_e32 v[76:77], v[0:1]
	v_cmp_gt_i64_e64 s[0:1], s[50:51], 0
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccnz .LBB0_15
.LBB0_22:
	scratch_load_dword v81, off, off offset:176
	scratch_load_dword v83, off, off offset:180
	s_mov_b32 s1, 0x10000
	s_mov_b32 s0, 0
	s_andn2_b64 vcc, exec, s[8:9]
	s_cbranch_vccnz .LBB0_17
	s_branch .LBB0_16
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel wave_mxfp4_dynamic_gemm_256x160x256
		.amdhsa_group_segment_fixed_size 106496
		.amdhsa_private_segment_fixed_size 264
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
		.amdhsa_enable_private_segment 1
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 1
		.amdhsa_next_free_vgpr 256
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
	.size	wave_mxfp4_dynamic_gemm_256x160x256, .Lfunc_end0-wave_mxfp4_dynamic_gemm_256x160x256

	.set wave_mxfp4_dynamic_gemm_256x160x256.num_vgpr, 256
	.set wave_mxfp4_dynamic_gemm_256x160x256.num_agpr, 0
	.set wave_mxfp4_dynamic_gemm_256x160x256.numbered_sgpr, 87
	.set wave_mxfp4_dynamic_gemm_256x160x256.num_named_barrier, 0
	.set wave_mxfp4_dynamic_gemm_256x160x256.private_seg_size, 264
	.set wave_mxfp4_dynamic_gemm_256x160x256.uses_vcc, 1
	.set wave_mxfp4_dynamic_gemm_256x160x256.uses_flat_scratch, 0
	.set wave_mxfp4_dynamic_gemm_256x160x256.has_dyn_sized_stack, 0
	.set wave_mxfp4_dynamic_gemm_256x160x256.has_recursion, 0
	.set wave_mxfp4_dynamic_gemm_256x160x256.has_indirect_call, 0
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
    .group_segment_fixed_size: 106496
    .kernarg_segment_align: 8
    .kernarg_segment_size: 104
    .max_flat_workgroup_size: 512
    .name:           wave_mxfp4_dynamic_gemm_256x160x256
    .private_segment_fixed_size: 264
    .reqd_workgroup_size:
      - 256
      - 2
      - 1
    .sgpr_count:     93
    .sgpr_spill_count: 0
    .symbol:         wave_mxfp4_dynamic_gemm_256x160x256.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     256
    .vgpr_spill_count: 65
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx950
amdhsa.version:
  - 1
  - 0
...

	.end_amdgpu_metadata
