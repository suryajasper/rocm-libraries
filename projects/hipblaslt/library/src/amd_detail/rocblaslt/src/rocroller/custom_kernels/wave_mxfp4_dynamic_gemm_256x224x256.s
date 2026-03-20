; To reproduce the .rocmasm from .optimized.ll, run:
; llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx950 -mattr='-fma-mix-insts' -O3 <.optimized.ll> -o <out.rocmasm>

	.amdgcn_target "amdgcn-amd-amdhsa--gfx950"
	.text
	.globl	wave_mxfp4_dynamic_gemm_256x224x256
	.p2align	8
	.type	wave_mxfp4_dynamic_gemm_256x224x256,@function
wave_mxfp4_dynamic_gemm_256x224x256:
	s_load_dwordx2 s[2:3], s[0:1], 0x0
	s_load_dwordx8 s[4:11], s[0:1], 0x8
	s_load_dwordx4 s[12:15], s[0:1], 0x28
	s_waitcnt lgkmcnt(0)
	s_branch .LBB0_0
	.p2align	8
.LBB0_0:
	s_load_dwordx2 s[36:37], s[0:1], 0x38
	s_mov_b64 s[24:25], s[2:3]
	v_and_b32_e32 v6, 0x3ff, v0
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
	v_lshrrev_b32_e32 v7, 6, v6
	v_lshlrev_b32_e32 v4, 5, v0
	s_xor_b64 s[34:35], s[2:3], s[28:29]
	v_lshrrev_b32_e32 v5, 3, v6
	v_lshl_or_b32 v1, v7, 3, v4
	s_lshl_b64 s[14:15], s[16:17], 8
	v_xor_b32_e32 v2, v5, v6
	s_and_b32 s2, s34, 0x3fff
	s_mov_b64 s[20:21], s[6:7]
	v_readfirstlane_b32 s6, v1
	v_or3_b32 v1, v5, v4, s14
	v_lshlrev_b32_e32 v2, 4, v2
	s_bitset1_b32 s2, 14
	v_and_b32_e32 v114, 0x70, v2
	v_mul_lo_u32 v112, s34, v1
	s_lshl_b32 s13, s2, 16
	s_and_b32 s2, s25, 0xffff
	s_lshl_b32 s35, s6, 7
	s_or_b32 s25, s2, s13
	s_mov_b32 s27, 0x27000
	s_mov_b32 s26, 0x7ffffffe
	v_add_u32_e32 v2, v114, v112
	s_mov_b32 m0, s35
	s_or_b32 s33, s35, 0x2000
	buffer_load_dwordx4 v2, s[24:27], 0 offen lds
	v_or_b32_e32 v2, 64, v1
	v_mul_lo_u32 v115, s34, v2
	v_add_u32_e32 v2, v114, v115
	s_mov_b32 m0, s33
	s_or_b32 s54, s35, 0x4000
	buffer_load_dwordx4 v2, s[24:27], 0 offen lds
	v_or_b32_e32 v2, 0x80, v1
	v_mul_lo_u32 v118, s34, v2
	v_or_b32_e32 v1, 0xc0, v1
	v_add_u32_e32 v2, v114, v118
	s_mov_b32 m0, s54
	v_mul_lo_u32 v119, s34, v1
	s_or_b32 s55, s35, 0x6000
	buffer_load_dwordx4 v2, s[24:27], 0 offen lds
	v_add_u32_e32 v1, v114, v119
	s_mov_b32 m0, s55
	v_readfirstlane_b32 s81, v0
	buffer_load_dwordx4 v1, s[24:27], 0 offen lds
	v_lshlrev_b32_e32 v0, 3, v0
	s_add_u32 s18, s34, -1
	v_lshl_or_b32 v0, v7, 1, v0
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
	v_lshrrev_b32_e32 v0, 5, v6
	v_lshrrev_b32_e32 v1, 2, v6
	v_bfe_u32 v2, v6, 2, 3
	v_bitop3_b32 v1, v1, v0, 7 bitop3:0x6c
	v_lshlrev_b32_e32 v8, 4, v0
	v_and_b32_e32 v0, 31, v6
	v_lshlrev_b32_e32 v2, 2, v2
	v_sub_u32_e32 v0, v0, v2
	v_lshl_add_u32 v0, v1, 2, v0
	v_lshlrev_b32_e32 v11, 8, v1
	v_ashrrev_i32_e32 v1, 31, v0
	v_xor_b32_e32 v0, v1, v0
	v_ashrrev_i32_e32 v2, 31, v0
	v_lshrrev_b32_e32 v2, 29, v2
	v_add_u32_e32 v0, v0, v2
	v_lshrrev_b32_e32 v0, 3, v0
	v_lshlrev_b32_e32 v168, 2, v6
	v_xor_b32_e32 v0, v0, v1
	s_lshl_b32 s82, s81, 7
	v_and_b32_e32 v9, 0x3f0, v168
	v_and_b32_e32 v10, 0x600, v11
	v_lshlrev_b32_e32 v12, 9, v0
	v_add_u32_e32 v0, s82, v168
	v_add3_u32 v0, v0, v8, v11
	v_add_u32_e32 v1, v9, v10
	v_sub_u32_e32 v0, v0, v1
	v_add_u32_e32 v120, v0, v12
	v_mul_hi_u32 v0, s38, v120
	v_mul_lo_u32 v1, v0, s34
	v_sub_u32_e32 v1, v120, v1
	v_cmp_le_u32_e32 vcc, s34, v1
	s_mul_i32 s18, s12, 0xe0
	s_lshl_b32 s67, s6, 7
	v_subbrev_co_u32_e64 v0, s[2:3], 0, v0, vcc
	v_add_u32_e32 v13, s18, v0
	v_mov_b32_e32 v0, s34
	v_cndmask_b32_e32 v0, 0, v0, vcc
	s_and_b32 s2, s21, 0xffff
	s_or_b32 s21, s2, s13
	v_add_u32_e32 v0, v1, v0
	s_add_i32 s13, s67, 0x10000
	s_or_b32 s17, s67, 0x800
	s_mov_b32 s23, 0x27000
	s_mov_b32 s22, 0x7ffffffe
	v_mad_u64_u32 v[2:3], s[2:3], v13, s34, v[0:1]
	s_mov_b32 m0, s13
	v_add_u32_e32 v1, 16, v13
	s_add_i32 s68, s17, 0x10000
	s_or_b32 s39, s67, 0x1000
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s68
	v_add_u32_e32 v1, 32, v13
	s_add_i32 s69, s39, 0x10000
	s_or_b32 s56, s67, 0x1800
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s69
	v_add_u32_e32 v1, 48, v13
	s_add_i32 s70, s56, 0x10000
	s_or_b32 s57, s67, 0x2000
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s70
	v_add_u32_e32 v1, 64, v13
	s_add_i32 s71, s57, 0x10000
	s_or_b32 s58, s67, 0x2800
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s71
	v_add_u32_e32 v1, 0x50, v13
	s_add_i32 s72, s58, 0x10000
	s_or_b32 s59, s67, 0x3000
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s72
	v_add_u32_e32 v1, 0x60, v13
	s_add_i32 s73, s59, 0x10000
	s_or_b32 s60, s67, 0x3800
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s73
	v_add_u32_e32 v1, 0x70, v13
	s_add_i32 s74, s60, 0x10000
	s_or_b32 s61, s67, 0x4000
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s74
	v_add_u32_e32 v1, 0x80, v13
	s_add_i32 s75, s61, 0x10000
	s_or_b32 s62, s67, 0x4800
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s75
	v_add_u32_e32 v1, 0x90, v13
	s_add_i32 s76, s62, 0x10000
	s_or_b32 s63, s67, 0x5000
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s76
	v_add_u32_e32 v1, 0xa0, v13
	s_add_i32 s77, s63, 0x10000
	s_or_b32 s64, s67, 0x5800
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s77
	v_add_u32_e32 v1, 0xb0, v13
	s_add_i32 s78, s64, 0x10000
	s_or_b32 s65, s67, 0x6000
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s78
	v_add_u32_e32 v1, 0xc0, v13
	s_add_i32 s79, s65, 0x10000
	s_or_b32 s66, s67, 0x6800
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[2:3], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s79
	v_add_u32_e32 v1, 0xd0, v13
	s_add_i32 s80, s66, 0x10000
	buffer_load_dword v2, s[20:23], 0 offen lds
	v_mad_u64_u32 v[0:1], s[2:3], v1, s34, v[0:1]
	s_mov_b32 m0, s80
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
	s_mul_hi_u32 s19, s12, 0xe0
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
	v_lshrrev_b32_e32 v15, 4, v6
	s_movk_i32 s2, 0xf800
	v_bfe_u32 v239, v6, 4, 2
	v_lshlrev_b32_e32 v13, 7, v6
	v_lshlrev_b32_e32 v14, 11, v239
	v_mad_i32_i24 v16, v15, s2, v13
	v_add_u32_e32 v124, v16, v14
	v_mul_hi_u32 v0, s42, v124
	v_mul_lo_u32 v1, s36, v0
	v_sub_u32_e32 v1, v124, v1
	v_cmp_le_u32_e32 vcc, s36, v1
	v_mov_b32_e32 v2, s36
	v_and_b32_e32 v171, 0xc0, v6
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
	v_cndmask_b32_e32 v2, 0, v2, vcc
	s_ashr_i64 s[2:3], s[2:3], 5
	v_add_u32_e32 v1, v2, v1
	s_xor_b64 s[2:3], s[2:3], s[28:29]
	v_ashrrev_i32_e32 v2, 31, v1
	s_add_u32 s28, s2, 7
	v_xor_b32_e32 v1, v2, v1
	s_addc_u32 s29, s3, 0
	v_ashrrev_i32_e32 v3, 31, v1
	s_sub_u32 s30, -8, s2
	v_lshrrev_b32_e32 v3, 27, v3
	s_subb_u32 s31, -1, s3
	v_cmp_lt_i64_e64 s[2:3], s[2:3], -7
	v_add_u32_e32 v1, v1, v3
	v_add_u32_e32 v0, v171, v0
	v_cndmask_b32_e64 v3, 0, -1, s[2:3]
	s_and_b64 s[2:3], s[2:3], exec
	s_cselect_b32 s3, s31, s29
	s_cselect_b32 s2, s30, s28
	s_ashr_i32 s28, s3, 31
	s_lshr_b32 s28, s28, 29
	s_add_u32 s2, s2, s28
	s_addc_u32 s3, s3, 0
	v_readfirstlane_b32 s28, v3
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
	v_xad_u32 v0, v1, v2, v0
	s_cbranch_scc0 .LBB0_20
	v_cvt_f32_u32_e32 v1, s41
	v_mov_b32_e32 v2, 0x4f800000
	s_sub_u32 s31, 0, s41
	s_subb_u32 s44, 0, 0
	v_fmac_f32_e32 v1, 0, v2
	v_rcp_f32_e32 v1, v1
	s_nop 0
	v_mul_f32_e32 v1, 0x5f7ffffc, v1
	v_mul_f32_e32 v2, 0x2f800000, v1
	v_trunc_f32_e32 v2, v2
	v_fmamk_f32 v1, v2, 0xcf800000, v1
	v_cvt_u32_f32_e32 v2, v2
	v_cvt_u32_f32_e32 v1, v1
	v_readfirstlane_b32 s46, v2
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
	v_cvt_f32_u32_e32 v2, s41
	s_sub_i32 s28, 0, s41
	v_rcp_iflag_f32_e32 v2, v2
	s_nop 0
	v_mul_f32_e32 v2, 0x4f7ffffe, v2
	v_cvt_u32_f32_e32 v2, v2
	s_nop 0
	v_readfirstlane_b32 s29, v2
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
	v_lshlrev_b32_e32 v17, 6, v15
	buffer_load_dword v172, v0, s[4:7], 0 offen
	buffer_load_dword v165, v1, s[4:7], 0 offen
	v_lshlrev_b32_e32 v18, 6, v239
	v_sub_u32_e32 v0, v168, v17
	s_mul_i32 s28, s81, 0x70
	v_add_u32_e32 v22, v0, v18
	v_add_u32_e32 v0, s28, v6
	v_and_b32_e32 v1, 0xf0, v6
	v_sub_u32_e32 v238, v0, v1
	v_ashrrev_i16_e32 v0, 15, v238
	v_lshrrev_b16_e32 v0, 11, v0
	v_add_u16_e32 v0, v238, v0
	v_and_b32_e32 v0, 0xffffffe0, v0
	v_sub_u16_e32 v0, v238, v0
	v_bfe_i32 v1, v0, 0, 16
	v_ashrrev_i32_e32 v2, 31, v1
	v_add_u16_e32 v3, 32, v0
	v_cmp_gt_i16_e32 vcc, 0, v0
	v_mov_b32_e32 v117, 0
	v_mov_b32_e32 v23, s41
	v_cndmask_b32_e32 v0, v1, v3, vcc
	v_cndmask_b32_e64 v1, v2, 0, vcc
	v_xor_b32_e32 v0, v1, v0
	v_lshrrev_b32_e32 v2, 28, v0
	v_add_u32_e32 v0, v0, v2
	v_ashrrev_i32_e32 v0, 4, v0
	v_xor_b32_e32 v19, v0, v1
	v_ashrrev_i32_e32 v0, 31, v238
	v_xor_b32_e32 v1, v0, v238
	v_ashrrev_i32_e32 v2, 31, v1
	v_lshrrev_b32_e32 v2, 27, v2
	v_add_u32_e32 v1, v1, v2
	v_ashrrev_i32_e32 v1, 5, v1
	v_xor_b32_e32 v0, v1, v0
	v_ashrrev_i32_e32 v1, 31, v0
	v_add_u32_e32 v116, v19, v22
	v_lshlrev_b64 v[2:3], 8, v[0:1]
	v_mad_u64_u32 v[126:127], s[28:29], v2, s2, v[116:117]
	v_mul_hi_u32 v20, s46, v126
	v_mul_lo_u32 v21, s41, v20
	v_sub_u32_e32 v21, v126, v21
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s28, s44, s19
	s_mul_hi_u32 s29, s44, s18
	v_cmp_le_u32_e32 vcc, s41, v21
	v_mul_hi_u32 v21, s46, v116
	s_add_i32 s28, s29, s28
	s_mul_i32 s29, s45, s18
	v_mul_lo_u32 v21, s41, v21
	s_add_i32 s29, s28, s29
	s_mul_i32 s28, s44, s18
	v_subbrev_co_u32_e32 v20, vcc, 0, v20, vcc
	v_sub_u32_e32 v21, v116, v21
	s_add_u32 s28, s8, s28
	v_cmp_le_u32_e32 vcc, s41, v21
	s_addc_u32 s8, s9, s29
	s_and_b32 s9, s44, 0x3fff
	v_cndmask_b32_e32 v24, 0, v23, vcc
	s_bitset1_b32 s9, 14
	v_add_u32_e32 v24, v24, v21
	s_and_b32 s8, s8, 0xffff
	s_lshl_b32 s9, s9, 16
	s_or_b32 s29, s8, s9
	v_mad_u64_u32 v[26:27], s[8:9], s44, v20, v[24:25]
	v_add_u32_e32 v20, 2, v126
	v_mul_hi_u32 v21, s46, v20
	v_mul_lo_u32 v25, s41, v21
	v_sub_u32_e32 v20, v20, v25
	v_cmp_le_u32_e32 vcc, s41, v20
	s_mul_i32 s47, s81, 7
	v_mov_b32_e32 v157, v117
	v_subbrev_co_u32_e32 v20, vcc, 0, v21, vcc
	v_add_u32_e32 v21, 2, v116
	v_mul_hi_u32 v25, s46, v21
	v_mul_lo_u32 v25, s41, v25
	v_sub_u32_e32 v21, v21, v25
	v_cmp_le_u32_e32 vcc, s41, v21
	v_sub_u32_e32 v25, v116, v25
	s_mov_b32 s31, 0x27000
	v_cndmask_b32_e32 v21, 0, v23, vcc
	v_add_u32_e32 v28, v21, v25
	v_mad_u64_u32 v[30:31], s[8:9], s44, v20, v[28:29]
	v_add_u32_e32 v20, 16, v238
	v_sub_u32_e32 v21, 0xffef, v238
	v_cmp_gt_i32_e32 vcc, -16, v238
	s_mov_b32 s30, 0x7ffffffe
	v_alignbit_b32 v1, v1, v0, 24
	v_cndmask_b32_e32 v20, v20, v21, vcc
	v_ashrrev_i16_e32 v21, 15, v20
	v_lshrrev_b16_e32 v21, 11, v21
	v_add_u16_e32 v20, v20, v21
	v_ashrrev_i16_e32 v20, 5, v20
	v_cndmask_b32_e64 v21, 0, -1, vcc
	v_xor_b32_e32 v21, v20, v21
	v_bfe_i32 v20, v21, 0, 16
	v_lshlrev_b16_e32 v21, 1, v21
	v_sub_u16_e32 v21, 0, v21
	v_bfe_i32 v21, v21, 0, 16
	v_add3_u32 v156, s47, v21, v22
	v_lshlrev_b32_e32 v50, 8, v20
	v_mad_u64_u32 v[136:137], s[8:9], v50, s2, v[156:157]
	v_add_u32_e32 v22, 1, v136
	v_mul_hi_u32 v25, s46, v22
	v_mul_lo_u32 v27, s41, v25
	v_sub_u32_e32 v22, v22, v27
	v_cmp_le_u32_e32 vcc, s41, v22
	v_mul_lo_u32 v1, v1, s2
	s_cmp_eq_u32 s81, 0
	v_subbrev_co_u32_e32 v22, vcc, 0, v25, vcc
	v_add_u32_e32 v25, 1, v156
	v_mul_hi_u32 v27, s46, v25
	v_mul_lo_u32 v27, s41, v27
	v_sub_u32_e32 v25, v25, v27
	v_cmp_le_u32_e32 vcc, s41, v25
	v_sub_u32_e32 v27, v156, v27
	s_nop 0
	v_cndmask_b32_e32 v25, 0, v23, vcc
	v_add_u32_e32 v32, v25, v27
	v_mad_u64_u32 v[34:35], s[8:9], s44, v22, v[32:33]
	v_add_u32_e32 v22, 3, v136
	v_mul_hi_u32 v25, s46, v22
	v_mul_lo_u32 v27, s41, v25
	v_sub_u32_e32 v22, v22, v27
	v_cmp_le_u32_e32 vcc, s41, v22
	s_nop 1
	v_subbrev_co_u32_e32 v22, vcc, 0, v25, vcc
	v_add_u32_e32 v25, 3, v156
	v_mul_hi_u32 v27, s46, v25
	v_mul_lo_u32 v27, s41, v27
	v_sub_u32_e32 v25, v25, v27
	v_cmp_le_u32_e32 vcc, s41, v25
	v_sub_u32_e32 v25, v156, v27
	s_nop 0
	v_cndmask_b32_e32 v23, 0, v23, vcc
	v_add_u32_e32 v36, v23, v25
	v_mad_u64_u32 v[38:39], s[8:9], s44, v22, v[36:37]
	s_mov_b64 s[8:9], 0x100
	s_nop 0
	v_lshl_add_u64 v[40:41], v[2:3], 0, s[8:9]
	v_mad_u64_u32 v[138:139], s[8:9], v40, s2, v[116:117]
	v_mul_hi_u32 v22, s46, v138
	v_mul_lo_u32 v23, s41, v22
	v_sub_u32_e32 v23, v138, v23
	v_cmp_le_u32_e32 vcc, s41, v23
	s_nop 1
	v_subbrev_co_u32_e32 v22, vcc, 0, v22, vcc
	v_mad_u64_u32 v[42:43], s[8:9], s44, v22, v[24:25]
	v_add_u32_e32 v22, 2, v138
	v_mul_hi_u32 v23, s46, v22
	v_mul_lo_u32 v25, s41, v23
	v_sub_u32_e32 v22, v22, v25
	v_cmp_le_u32_e32 vcc, s41, v22
	s_nop 1
	v_subbrev_co_u32_e32 v22, vcc, 0, v23, vcc
	v_mad_u64_u32 v[44:45], s[8:9], s44, v22, v[28:29]
	s_movk_i32 s8, 0xffd0
	v_add_u32_e32 v22, 48, v238
	v_sub_u32_e32 v23, 0xffcf, v238
	v_cmp_gt_i32_e32 vcc, s8, v238
	s_nop 1
	v_cndmask_b32_e32 v22, v22, v23, vcc
	v_ashrrev_i16_e32 v23, 15, v22
	v_lshrrev_b16_e32 v23, 11, v23
	v_add_u16_e32 v22, v22, v23
	v_ashrrev_i16_e32 v22, 5, v22
	v_cndmask_b32_e64 v23, 0, -1, vcc
	v_xor_b32_e32 v22, v22, v23
	v_bfe_i32 v22, v22, 0, 16
	v_lshlrev_b32_e32 v43, 8, v22
	v_mad_u64_u32 v[142:143], s[8:9], v43, s2, v[156:157]
	v_add_u32_e32 v23, 1, v142
	v_mul_hi_u32 v25, s46, v23
	v_mul_lo_u32 v27, s41, v25
	v_sub_u32_e32 v23, v23, v27
	v_cmp_le_u32_e32 vcc, s41, v23
	s_nop 1
	v_subbrev_co_u32_e32 v23, vcc, 0, v25, vcc
	v_mad_u64_u32 v[46:47], s[8:9], s44, v23, v[32:33]
	v_add_u32_e32 v23, 3, v142
	v_mul_hi_u32 v25, s46, v23
	v_mul_lo_u32 v27, s41, v25
	v_sub_u32_e32 v23, v23, v27
	v_cmp_le_u32_e32 vcc, s41, v23
	s_nop 1
	v_subbrev_co_u32_e32 v23, vcc, 0, v25, vcc
	v_mad_u64_u32 v[48:49], s[8:9], s44, v23, v[36:37]
	s_mov_b64 s[8:9], 0x200
	buffer_load_ubyte v158, v26, s[28:31], 0 offen
	buffer_load_ubyte v145, v30, s[28:31], 0 offen offset:2
	buffer_load_ubyte v167, v34, s[28:31], 0 offen offset:1
	buffer_load_ubyte v240, v38, s[28:31], 0 offen offset:3
	buffer_load_ubyte v141, v42, s[28:31], 0 offen
	buffer_load_ubyte v241, v44, s[28:31], 0 offen offset:2
	buffer_load_ubyte v140, v46, s[28:31], 0 offen offset:1
	buffer_load_ubyte v242, v48, s[28:31], 0 offen offset:3
	v_lshl_add_u64 v[26:27], v[2:3], 0, s[8:9]
	v_mad_u64_u32 v[146:147], s[8:9], v26, s2, v[116:117]
	v_mul_hi_u32 v23, s46, v146
	v_mul_lo_u32 v25, s41, v23
	v_sub_u32_e32 v25, v146, v25
	v_cmp_le_u32_e32 vcc, s41, v25
	s_nop 1
	v_subbrev_co_u32_e32 v23, vcc, 0, v23, vcc
	v_mad_u64_u32 v[30:31], s[8:9], s44, v23, v[24:25]
	v_add_u32_e32 v23, 2, v146
	v_mul_hi_u32 v25, s46, v23
	v_mul_lo_u32 v29, s41, v25
	v_sub_u32_e32 v23, v23, v29
	v_cmp_le_u32_e32 vcc, s41, v23
	s_nop 1
	v_subbrev_co_u32_e32 v23, vcc, 0, v25, vcc
	v_mad_u64_u32 v[34:35], s[8:9], s44, v23, v[28:29]
	s_movk_i32 s8, 0xffb0
	v_add_u32_e32 v23, 0x50, v238
	v_sub_u32_e32 v25, 0xffaf, v238
	v_cmp_gt_i32_e32 vcc, s8, v238
	s_nop 1
	v_cndmask_b32_e32 v23, v23, v25, vcc
	v_ashrrev_i16_e32 v25, 15, v23
	v_lshrrev_b16_e32 v25, 11, v25
	v_add_u16_e32 v23, v23, v25
	v_ashrrev_i16_e32 v23, 5, v23
	v_cndmask_b32_e64 v25, 0, -1, vcc
	v_xor_b32_e32 v23, v23, v25
	v_bfe_i32 v23, v23, 0, 16
	v_lshlrev_b32_e32 v31, 8, v23
	v_mad_u64_u32 v[148:149], s[8:9], v31, s2, v[156:157]
	v_add_u32_e32 v25, 1, v148
	v_mul_hi_u32 v29, s46, v25
	v_mul_lo_u32 v33, s41, v29
	v_sub_u32_e32 v25, v25, v33
	v_cmp_le_u32_e32 vcc, s41, v25
	s_nop 1
	v_subbrev_co_u32_e32 v25, vcc, 0, v29, vcc
	v_mad_u64_u32 v[32:33], s[8:9], s44, v25, v[32:33]
	v_add_u32_e32 v25, 3, v148
	v_mul_hi_u32 v29, s46, v25
	v_mul_lo_u32 v33, s41, v29
	v_sub_u32_e32 v25, v25, v33
	v_cmp_le_u32_e32 vcc, s41, v25
	s_nop 1
	v_subbrev_co_u32_e32 v25, vcc, 0, v29, vcc
	v_mad_u64_u32 v[36:37], s[8:9], s44, v25, v[36:37]
	s_mov_b64 s[8:9], 0x300
	s_nop 0
	v_lshl_add_u64 v[38:39], v[2:3], 0, s[8:9]
	v_mad_u64_u32 v[154:155], s[8:9], v38, s2, v[116:117]
	v_mul_hi_u32 v3, s46, v154
	v_mul_lo_u32 v25, s41, v3
	v_sub_u32_e32 v25, v154, v25
	v_cmp_le_u32_e32 vcc, s41, v25
	v_mad_u64_u32 v[130:131], s[8:9], v2, s2, 0
	s_nop 0
	v_subbrev_co_u32_e32 v3, vcc, 0, v3, vcc
	v_mad_u64_u32 v[24:25], s[8:9], s44, v3, v[24:25]
	v_add_u32_e32 v3, 2, v154
	v_mul_hi_u32 v25, s46, v3
	v_mul_lo_u32 v29, s41, v25
	v_sub_u32_e32 v3, v3, v29
	v_cmp_le_u32_e32 vcc, s41, v3
	v_mad_u64_u32 v[152:153], s[8:9], v50, s2, 0
	s_nop 0
	v_subbrev_co_u32_e32 v3, vcc, 0, v25, vcc
	v_mad_u64_u32 v[28:29], s[8:9], s44, v3, v[28:29]
	buffer_load_ubyte v169, v30, s[28:31], 0 offen
	buffer_load_ubyte v243, v34, s[28:31], 0 offen offset:2
	buffer_load_ubyte v135, v32, s[28:31], 0 offen offset:1
	buffer_load_ubyte v244, v36, s[28:31], 0 offen offset:3
	buffer_load_ubyte v134, v24, s[28:31], 0 offen
	buffer_load_ubyte v166, v28, s[28:31], 0 offen offset:2
	v_mul_lo_u32 v3, v2, s3
	v_add3_u32 v131, v131, v3, v1
	v_ashrrev_i32_e32 v1, 31, v20
	v_alignbit_b32 v1, v1, v20, 24
	v_mul_lo_u32 v1, v1, s2
	v_mul_lo_u32 v2, v50, s3
	v_add3_u32 v153, v153, v2, v1
	v_mul_lo_u32 v1, v40, s3
	v_mad_u64_u32 v[122:123], s[8:9], v40, s2, 0
	v_mul_lo_u32 v2, v41, s2
	v_add3_u32 v123, v123, v1, v2
	v_ashrrev_i32_e32 v1, 31, v22
	v_alignbit_b32 v1, v1, v22, 24
	v_mul_lo_u32 v1, v1, s2
	v_mul_lo_u32 v2, v43, s3
	v_mad_u64_u32 v[160:161], s[8:9], v43, s2, 0
	v_add3_u32 v161, v161, v2, v1
	v_mul_lo_u32 v1, v26, s3
	v_mad_u64_u32 v[150:151], s[8:9], v26, s2, 0
	v_mul_lo_u32 v2, v27, s2
	v_add3_u32 v151, v151, v1, v2
	v_ashrrev_i32_e32 v1, 31, v23
	v_alignbit_b32 v1, v1, v23, 24
	v_mul_lo_u32 v1, v1, s2
	v_mul_lo_u32 v2, v31, s3
	v_mad_u64_u32 v[162:163], s[8:9], v31, s2, 0
	v_mad_u64_u32 v[132:133], s[8:9], v38, s2, 0
	v_add3_u32 v163, v163, v2, v1
	v_mul_lo_u32 v1, v38, s3
	v_mul_lo_u32 v2, v39, s2
	s_cselect_b64 s[8:9], -1, 0
	v_add3_u32 v133, v133, v1, v2
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
	v_and_b32_e32 v1, 7, v6
	s_mulk_i32 s81, 0x3800
	v_cndmask_b32_e64 v2, 0, -1, s[48:49]
	s_and_b64 s[48:49], s[48:49], exec
	s_cselect_b32 s37, s45, s51
	s_cselect_b32 s3, s3, s50
	s_ashr_i32 s45, s37, 31
	s_lshr_b32 s45, s45, 24
	s_add_u32 s48, s3, s45
	s_addc_u32 s49, s37, 0
	v_readfirstlane_b32 s50, v2
	s_ashr_i64 s[48:49], s[48:49], 8
	s_mov_b32 s51, s50
	s_xor_b64 s[50:51], s[48:49], s[50:51]
	s_lshr_b32 s3, s51, 31
	s_add_u32 s3, s50, s3
	s_addc_u32 s49, s51, 0
	s_and_b32 s48, s3, -2
	v_bitop3_b32 v2, v239, v6, 7 bitop3:0x78
	v_bitop3_b32 v1, v239, v1, 4 bitop3:0x36
	s_sub_u32 s50, s50, s48
	v_lshl_add_u32 v3, v7, 13, v16
	v_lshlrev_b32_e32 v2, 4, v2
	v_add_u32_e32 v6, s81, v16
	v_lshlrev_b32_e32 v1, 4, v1
	v_cmp_lt_i64_e64 s[84:85], s[48:49], 1
	s_mov_b64 s[52:53], 0
	s_subb_u32 s51, s51, s49
	v_or_b32_e32 v170, v3, v2
	v_or_b32_e32 v127, v6, v2
	v_or_b32_e32 v144, v1, v3
	v_or_b32_e32 v129, v1, v6
	s_and_b64 vcc, exec, s[84:85]
	s_cbranch_vccnz .LBB0_21
	v_mov_b32_e32 v2, v116
	scratch_store_dword off, v119, off offset:440
	scratch_store_dword off, v118, off offset:436
	scratch_store_dword off, v115, off offset:432
	scratch_store_dword off, v112, off offset:428
	scratch_store_dword off, v238, off offset:424
	scratch_store_dword off, v239, off offset:420
	scratch_store_dwordx2 off, v[2:3], off offset:464
	v_add_u32_e32 v112, 0x100, v116
	v_mov_b32_e32 v113, 0
	v_mov_b32_e32 v2, v130
	scratch_store_dwordx2 off, v[2:3], off offset:488
	v_lshl_add_u64 v[2:3], v[130:131], 0, v[112:113]
	scratch_store_dwordx2 off, v[2:3], off offset:276
	v_add_u32_e32 v2, 0x100, v156
	v_mov_b32_e32 v3, v113
	v_lshl_add_u64 v[24:25], v[152:153], 0, v[2:3]
	scratch_store_dwordx2 off, v[24:25], off offset:284
	v_lshl_add_u64 v[24:25], v[122:123], 0, v[112:113]
	scratch_store_dwordx2 off, v[24:25], off offset:292
	v_lshl_add_u64 v[24:25], v[160:161], 0, v[2:3]
	v_lshl_add_u64 v[2:3], v[162:163], 0, v[2:3]
	scratch_store_dwordx2 off, v[2:3], off offset:316
	v_mov_b32_e32 v2, v132
	v_add_u32_e32 v1, 0x800, v120
	scratch_store_dwordx2 off, v[2:3], off offset:456
	v_lshl_add_u64 v[2:3], v[132:133], 0, v[112:113]
	scratch_store_dword off, v1, off offset:264
	scratch_store_dwordx2 off, v[2:3], off offset:324
	v_mul_lo_u32 v1, v20, s2
	v_add3_u32 v3, v18, s47, v21
	v_lshl_add_u32 v1, v1, 8, v3
	v_sub_u32_e32 v125, v1, v17
	v_mul_lo_u32 v1, v0, s2
	v_add_u32_e32 v2, v19, v18
	v_lshl_add_u32 v1, v1, 8, v2
	v_sub_u32_e32 v128, v1, v17
	v_add_u32_e32 v1, v12, v11
	v_add3_u32 v1, v1, s82, v8
	v_lshlrev_b32_e32 v7, 8, v0
	v_sub_u32_e32 v1, v1, v9
	v_add_u32_e32 v0, 0x300, v7
	v_sub_u32_e32 v8, v1, v10
	v_mad_u64_u32 v[0:1], s[82:83], v0, s2, v[2:3]
	v_sub_u32_e32 v139, v0, v17
	v_mul_lo_u32 v0, v23, s2
	v_lshl_add_u32 v0, v0, 8, v3
	v_sub_u32_e32 v147, v0, v17
	v_add_u32_e32 v0, 0x200, v7
	v_mad_u64_u32 v[0:1], s[82:83], v0, s2, v[2:3]
	v_sub_u32_e32 v149, v0, v17
	v_mul_lo_u32 v0, v22, s2
	v_lshl_add_u32 v0, v0, 8, v3
	v_sub_u32_e32 v155, v0, v17
	v_add_u32_e32 v0, 0x100, v7
	v_mul_i32_i24_e32 v6, 0xfffff800, v15
	v_mad_u64_u32 v[0:1], s[2:3], v0, s2, v[2:3]
	v_sub_u32_e32 v157, v0, v17
	v_add_u32_e32 v0, v6, v14
	s_movk_i32 s2, 0x4000
	v_add3_u32 v115, v0, v13, s2
	s_lshl_b32 s2, s16, 8
	v_or_b32_e32 v0, s2, v4
	v_add_u32_e32 v0, v0, v5
	v_add_u32_e32 v1, 64, v0
	v_mul_lo_u32 v5, v1, s34
	v_or_b32_e32 v1, 0x80, v0
	s_mul_i32 s84, s12, 0xe0
	v_mul_lo_u32 v6, v1, s34
	v_add_u32_e32 v1, 0xc0, v0
	v_mul_lo_u32 v4, v0, s34
	v_mov_b32_e32 v0, s34
	s_or_b32 s97, s84, 16
	scratch_store_dword off, v0, off offset:332
	v_mov_b32_e32 v0, s84
	s_add_i32 s96, s84, 32
	scratch_store_dword off, v0, off offset:336
	v_mov_b32_e32 v0, s97
	s_add_i32 s95, s84, 48
	scratch_store_dword off, v0, off offset:340
	v_mov_b32_e32 v0, s96
	s_add_i32 s94, s84, 64
	scratch_store_dword off, v0, off offset:344
	v_mov_b32_e32 v0, s95
	s_add_i32 s93, s84, 0x50
	scratch_store_dword off, v0, off offset:348
	v_mov_b32_e32 v0, s94
	s_add_i32 s92, s84, 0x60
	scratch_store_dword off, v0, off offset:352
	v_mov_b32_e32 v0, s93
	s_add_i32 s91, s84, 0x70
	scratch_store_dword off, v0, off offset:356
	v_mov_b32_e32 v0, s92
	scratch_store_dword off, v0, off offset:360
	v_mov_b32_e32 v0, s91
	scratch_store_dword off, v171, off offset:248
	scratch_store_dword off, v170, off offset:252
	scratch_store_dword off, v0, off offset:364
	v_mov_b32_e32 v16, v152
	scratch_load_dword v152, off, off offset:340
	scratch_load_dword v171, off, off offset:344
	scratch_load_dword v205, off, off offset:348
	scratch_load_dword v206, off, off offset:352
	scratch_load_dword v159, off, off offset:356
	scratch_load_dword v173, off, off offset:364
	scratch_load_dword v164, off, off offset:252
	scratch_load_dword v202, off, off offset:248
	s_add_i32 s90, s84, 0x80
	s_add_i32 s89, s84, 0x90
	v_mov_b32_e32 v0, s90
	s_add_i32 s88, s84, 0xa0
	scratch_store_dword off, v0, off offset:368
	v_mov_b32_e32 v0, s89
	s_add_i32 s87, s84, 0xb0
	scratch_store_dword off, v0, off offset:372
	v_mov_b32_e32 v0, s88
	s_add_i32 s86, s84, 0xc0
	scratch_store_dword off, v0, off offset:376
	v_mov_b32_e32 v0, s87
	s_add_i32 s85, s84, 0xd0
	scratch_store_dword off, v0, off offset:380
	v_mov_b32_e32 v0, s86
	scratch_store_dword off, v0, off offset:384
	v_mov_b32_e32 v0, s85
	scratch_store_dword off, v0, off offset:388
	v_add_u32_e32 v0, 0x10000, v127
	scratch_store_dword off, v0, off offset:392
	v_mov_b32_e32 v0, s36
	scratch_store_dword off, v0, off offset:396
	v_add_u32_e32 v0, 0x10000, v129
	scratch_store_dwordx2 off, v[16:17], off offset:496
	v_mov_b32_e32 v16, v122
	scratch_store_dword off, v0, off offset:400
	scratch_store_dword off, v127, off offset:448
	v_add_u32_e32 v0, 0x17000, v127
	scratch_store_dwordx2 off, v[16:17], off offset:480
	v_mov_b32_e32 v16, v160
	scratch_store_dword off, v0, off offset:404
	scratch_store_dword off, v129, off offset:452
	v_add_u32_e32 v0, 0x17000, v129
	scratch_store_dwordx2 off, v[16:17], off offset:504
	v_mov_b32_e32 v16, v150
	v_mul_lo_u32 v7, v1, s34
	scratch_store_dword off, v0, off offset:408
	v_mov_b64_e32 v[0:1], s[48:49]
	scratch_store_dwordx2 off, v[24:25], off offset:300
	scratch_store_dwordx2 off, v[16:17], off offset:472
	v_lshl_add_u64 v[24:25], v[150:151], 0, v[112:113]
	v_mov_b32_e32 v16, v162
	v_sub_u32_e32 v132, v3, v17
	v_sub_u32_e32 v130, v2, v17
	scratch_store_dwordx2 off, v[0:1], off offset:412
	v_mov_b32_e32 v0, v113
	v_mov_b32_e32 v1, v113
	v_mov_b32_e32 v2, v113
	v_mov_b32_e32 v3, v113
	s_movk_i32 s37, 0x800
	s_movk_i32 s45, 0x100
	scratch_store_dwordx2 off, v[24:25], off offset:308
	scratch_store_dwordx2 off, v[16:17], off offset:512
	s_add_i32 s12, s35, 0x8000
	s_add_i32 s16, s33, 0x8000
	s_add_i32 s47, s54, 0x8000
	s_add_i32 s81, s55, 0x8000
	s_add_i32 s82, s67, 0x17000
	s_add_i32 s83, s17, 0x17000
	v_mov_b32_e32 v203, s41
	s_movk_i32 s84, 0xff00
	s_movk_i32 s85, 0x1000
	s_add_i32 s86, s39, 0x17000
	s_add_i32 s87, s56, 0x17000
	s_add_i32 s88, s57, 0x17000
	s_add_i32 s89, s58, 0x17000
	s_add_i32 s90, s59, 0x17000
	s_add_i32 s91, s60, 0x17000
	s_add_i32 s92, s61, 0x17000
	v_mov_b32_e32 v108, v113
	v_mov_b32_e32 v109, v113
	v_mov_b32_e32 v110, v113
	v_mov_b32_e32 v111, v113
	v_mov_b32_e32 v104, v113
	v_mov_b32_e32 v105, v113
	v_mov_b32_e32 v106, v113
	v_mov_b32_e32 v107, v113
	v_mov_b32_e32 v100, v113
	v_mov_b32_e32 v101, v113
	v_mov_b32_e32 v102, v113
	v_mov_b32_e32 v103, v113
	v_mov_b32_e32 v96, v113
	v_mov_b32_e32 v97, v113
	v_mov_b32_e32 v98, v113
	v_mov_b32_e32 v99, v113
	v_mov_b32_e32 v92, v113
	v_mov_b32_e32 v93, v113
	v_mov_b32_e32 v94, v113
	v_mov_b32_e32 v95, v113
	v_mov_b32_e32 v88, v113
	v_mov_b32_e32 v89, v113
	v_mov_b32_e32 v90, v113
	v_mov_b32_e32 v91, v113
	v_mov_b32_e32 v84, v113
	v_mov_b32_e32 v85, v113
	v_mov_b32_e32 v86, v113
	v_mov_b32_e32 v87, v113
	v_mov_b32_e32 v80, v113
	v_mov_b32_e32 v81, v113
	v_mov_b32_e32 v82, v113
	v_mov_b32_e32 v83, v113
	v_mov_b32_e32 v76, v113
	v_mov_b32_e32 v77, v113
	v_mov_b32_e32 v78, v113
	v_mov_b32_e32 v79, v113
	v_mov_b32_e32 v72, v113
	v_mov_b32_e32 v73, v113
	v_mov_b32_e32 v74, v113
	v_mov_b32_e32 v75, v113
	v_mov_b32_e32 v68, v113
	v_mov_b32_e32 v69, v113
	v_mov_b32_e32 v70, v113
	v_mov_b32_e32 v71, v113
	v_mov_b32_e32 v64, v113
	v_mov_b32_e32 v65, v113
	v_mov_b32_e32 v66, v113
	v_mov_b32_e32 v67, v113
	v_mov_b32_e32 v60, v113
	v_mov_b32_e32 v61, v113
	v_mov_b32_e32 v62, v113
	v_mov_b32_e32 v63, v113
	v_mov_b32_e32 v56, v113
	v_mov_b32_e32 v57, v113
	v_mov_b32_e32 v58, v113
	v_mov_b32_e32 v59, v113
	scratch_store_dwordx4 off, v[0:3], off offset:4
	v_mov_b32_e32 v222, v113
	v_mov_b32_e32 v223, v113
	v_mov_b32_e32 v0, v113
	v_mov_b32_e32 v224, v113
	v_mov_b32_e32 v225, v113
	v_mov_b32_e32 v44, v113
	v_mov_b32_e32 v45, v113
	v_mov_b32_e32 v46, v113
	v_mov_b32_e32 v47, v113
	v_mov_b32_e32 v40, v113
	v_mov_b32_e32 v41, v113
	v_mov_b32_e32 v42, v113
	v_mov_b32_e32 v43, v113
	v_mov_b32_e32 v52, v113
	v_mov_b32_e32 v53, v113
	v_mov_b32_e32 v54, v113
	v_mov_b32_e32 v55, v113
	v_mov_b32_e32 v16, v113
	v_mov_b32_e32 v17, v113
	v_mov_b32_e32 v18, v113
	v_mov_b32_e32 v19, v113
	v_mov_b32_e32 v12, v113
	v_mov_b32_e32 v13, v113
	v_mov_b32_e32 v14, v113
	v_mov_b32_e32 v15, v113
	v_mov_b32_e32 v24, v113
	v_mov_b32_e32 v25, v113
	v_mov_b32_e32 v26, v113
	v_mov_b32_e32 v27, v113
	v_mov_b32_e32 v20, v113
	v_mov_b32_e32 v21, v113
	v_mov_b32_e32 v22, v113
	v_mov_b32_e32 v23, v113
	v_mov_b32_e32 v32, v113
	v_mov_b32_e32 v33, v113
	v_mov_b32_e32 v34, v113
	v_mov_b32_e32 v35, v113
	v_mov_b32_e32 v36, v113
	v_mov_b32_e32 v37, v113
	v_mov_b32_e32 v38, v113
	v_mov_b32_e32 v39, v113
	v_mov_b32_e32 v133, v145
	v_mov_b32_e32 v145, v8
	v_mov_b32_e32 v143, v240
	v_mov_b32_e32 v49, v241
	v_mov_b32_e32 v50, v242
	v_mov_b32_e32 v153, v244
	scratch_store_dword off, v120, off offset:444
	scratch_store_dwordx4 off, v[0:3], off offset:20
	scratch_store_dwordx4 off, v[0:3], off offset:36
	scratch_store_dwordx2 off, v[112:113], off offset:268
	scratch_store_dword off, v243, off offset:52
	scratch_store_dword off, v114, off offset:256
	scratch_store_dword off, v124, off offset:260
.LBB0_13:
	scratch_store_dwordx4 off, v[0:3], off offset:184
	scratch_store_dword off, v115, off
	scratch_store_dword off, v132, off offset:164
	scratch_store_dword off, v4, off offset:160
	scratch_store_dword off, v7, off offset:156
	scratch_store_dword off, v6, off offset:152
	scratch_store_dword off, v5, off offset:148
	scratch_store_dword off, v130, off offset:144
	scratch_store_dword off, v8, off offset:140
	scratch_store_dword off, v149, off offset:136
	scratch_store_dword off, v147, off offset:132
	scratch_store_dword off, v139, off offset:128
	scratch_store_dword off, v128, off offset:124
	scratch_store_dword off, v125, off offset:120
	scratch_store_dwordx2 off, v[156:157], off offset:112
	scratch_store_dwordx2 off, v[154:155], off offset:104
	scratch_store_dwordx2 off, v[148:149], off offset:96
	scratch_store_dwordx2 off, v[146:147], off offset:88
	scratch_store_dwordx2 off, v[142:143], off offset:80
	scratch_store_dwordx2 off, v[138:139], off offset:72
	scratch_store_dwordx2 off, v[136:137], off offset:64
	scratch_store_dwordx2 off, v[126:127], off offset:56
	s_barrier
	v_mov_b32_e32 v127, v167
	scratch_load_dword v167, off, off offset:264
	scratch_load_dword v151, off, off offset:336
	scratch_load_dword v28, off, off offset:368
	scratch_load_dword v29, off, off offset:372
	scratch_load_dword v226, off, off offset:376
	scratch_load_dword v227, off, off offset:380
	v_mov_b32_e32 v30, v133
	scratch_load_dword v133, off, off offset:332
	v_mov_b32_e32 v48, v143
	scratch_load_dword v143, off, off offset:360
	scratch_load_dword v228, off, off offset:384
	scratch_load_dword v229, off, off offset:388
	v_add_u32_e32 v4, v4, v114
	s_mov_b32 m0, s12
	scratch_store_dword off, v4, off offset:168
	v_add_u32_e32 v4, 0x80, v4
	buffer_load_dwordx4 v4, s[24:27], 0 offen lds
	v_add_u32_e32 v4, v5, v114
	v_mov_b64_e32 v[0:1], v[36:37]
	scratch_store_dword off, v4, off offset:172
	v_add_u32_e32 v4, 0x80, v4
	s_mov_b32 m0, s16
	v_mov_b64_e32 v[2:3], v[38:39]
	v_mov_b64_e32 v[38:39], v[34:35]
	buffer_load_dwordx4 v4, s[24:27], 0 offen lds
	v_add_u32_e32 v4, v6, v114
	v_mov_b64_e32 v[36:37], v[32:33]
	v_mov_b64_e32 v[34:35], v[22:23]
	scratch_store_dword off, v4, off offset:176
	v_add_u32_e32 v4, 0x80, v4
	s_mov_b32 m0, s47
	v_add_u32_e32 v31, v168, v8
	v_mov_b64_e32 v[32:33], v[20:21]
	v_mov_b64_e32 v[20:21], v[24:25]
	buffer_load_dwordx4 v4, s[24:27], 0 offen lds
	v_add_u32_e32 v4, v7, v114
	v_add_u32_e32 v5, 0x800, v31
	v_mov_b64_e32 v[22:23], v[26:27]
	v_mov_b64_e32 v[26:27], v[14:15]
	scratch_store_dword off, v4, off offset:180
	v_add_u32_e32 v4, 0x80, v4
	s_mov_b32 m0, s81
	v_mul_hi_u32 v5, s38, v5
	v_mov_b64_e32 v[24:25], v[12:13]
	v_mov_b64_e32 v[12:13], v[16:17]
	buffer_load_dwordx4 v4, s[24:27], 0 offen lds
	v_mul_lo_u32 v5, v5, s34
	v_mov_b64_e32 v[14:15], v[18:19]
	v_mov_b64_e32 v[16:17], v[52:53]
	v_mov_b64_e32 v[18:19], v[54:55]
	v_mov_b64_e32 v[54:55], v[42:43]
	v_mov_b64_e32 v[52:53], v[40:41]
	v_mov_b64_e32 v[40:41], v[44:45]
	v_mov_b64_e32 v[42:43], v[46:47]
	v_mov_b64_e32 v[44:45], v[222:223]
	v_mov_b64_e32 v[46:47], v[224:225]
	v_add_u32_e32 v222, v145, v168
	s_mov_b32 m0, s82
	s_waitcnt vmcnt(17)
	v_lshl_add_u32 v4, s52, 11, v167
	v_sub_u32_e32 v4, v4, v5
	v_cmp_le_u32_e32 vcc, s34, v4
	s_waitcnt vmcnt(16)
	s_nop 0
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v151, vcc
	s_waitcnt vmcnt(11)
	v_cndmask_b32_e32 v4, 0, v133, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	buffer_load_dword v5, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v152, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_mov_b32 m0, s83
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v171, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_mov_b32 m0, s86
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v205, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_mov_b32 m0, s87
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v206, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_mov_b32 m0, s88
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v159, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_mov_b32 m0, s89
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	s_waitcnt vmcnt(16)
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v143, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_mov_b32 m0, s90
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v173, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_mov_b32 m0, s91
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v28, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_mov_b32 m0, s92
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v29, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_add_i32 m0, s62, 0x17000
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v226, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_add_i32 m0, s63, 0x17000
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v227, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_add_i32 m0, s64, 0x17000
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	s_waitcnt vmcnt(21)
	v_subbrev_co_u32_e64 v5, s[2:3], 0, v228, vcc
	v_mad_u64_u32 v[6:7], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v5, v222, v6, s37
	s_add_i32 m0, s65, 0x17000
	s_nop 0
	buffer_load_dword v5, s[20:23], 0 offen lds
	s_waitcnt vmcnt(21)
	v_subbrev_co_u32_e32 v5, vcc, 0, v229, vcc
	v_mad_u64_u32 v[4:5], s[2:3], s34, v5, v[4:5]
	v_add3_u32 v4, v222, v4, s37
	s_add_i32 m0, s66, 0x17000
	s_nop 0
	buffer_load_dword v4, s[20:23], 0 offen lds
	scratch_load_dword v112, off, off offset:392
	v_mov_b32_e32 v51, v153
	scratch_load_dword v153, off, off offset:396
	v_add_u32_e32 v224, v168, v128
	v_add_u32_e32 v225, v168, v130
	v_add_u32_e32 v231, v168, v125
	v_add_u32_e32 v232, v168, v132
	v_add_u32_e32 v237, v168, v157
	v_add_u32_e32 v239, v168, v155
	v_add_u32_e32 v243, v168, v149
	v_add_u32_e32 v246, v168, v147
	v_add_u32_e32 v251, v168, v139
	v_mov_b32_e32 v230, v168
	ds_read_b128 v[8:11], v164
	ds_read_b128 v[4:7], v164 offset:2048
	ds_read_b128 v[160:163], v164 offset:4096
	ds_read_b128 v[116:119], v164 offset:6144
	s_waitcnt vmcnt(1)
	ds_read_b128 v[186:189], v112
	ds_read_b128 v[190:193], v112 offset:2048
	ds_read_b128 v[194:197], v112 offset:4096
	ds_read_b128 v[174:177], v112 offset:6144
	ds_read_b128 v[178:181], v112 offset:8192
	ds_read_b128 v[120:123], v112 offset:10240
	ds_read_b128 v[198:201], v112 offset:12288
	v_add_u32_e32 v112, 0x2000, v124
	v_lshl_add_u32 v233, s52, 13, v112
	v_add_u32_e32 v112, 0xffffe000, v115
	v_mul_hi_u32 v112, s42, v112
	v_mul_lo_u32 v113, s36, v112
	v_sub_u32_e32 v113, v233, v113
	v_cmp_le_u32_e32 vcc, s36, v113
	s_waitcnt vmcnt(0)
	s_nop 0
	v_cndmask_b32_e32 v114, 0, v153, vcc
	v_add_u32_e32 v113, v114, v113
	v_ashrrev_i32_e32 v114, 31, v113
	v_xor_b32_e32 v113, v114, v113
	v_ashrrev_i32_e32 v115, 31, v113
	v_subbrev_co_u32_e64 v112, s[2:3], 0, v112, vcc
	v_lshrrev_b32_e32 v115, 27, v115
	v_add_u32_e32 v113, v113, v115
	v_add_u32_e32 v112, v202, v112
	v_ashrrev_i32_e32 v113, 5, v113
	v_mul_lo_u32 v112, v112, s40
	v_xad_u32 v112, v113, v114, v112
	scratch_load_dwordx2 v[114:115], off, off offset:268
	buffer_load_dword v208, v112, s[4:7], 0 offen
	v_add_u32_e32 v112, s43, v112
	s_lshl_b32 s2, s52, 8
	buffer_load_dword v207, v112, s[4:7], 0 offen
	v_add_u32_e32 v112, s2, v126
	v_add_u32_e32 v234, 0x100, v112
	v_add_u32_e32 v112, 0x100, v224
	v_mul_hi_u32 v112, s46, v112
	v_mul_lo_u32 v113, s41, v112
	v_sub_u32_e32 v113, v234, v113
	v_cmp_le_u32_e32 vcc, s41, v113
	v_add_u32_e32 v238, s2, v136
	v_add_u32_e32 v249, s2, v142
	v_subbrev_co_u32_e32 v113, vcc, 0, v112, vcc
	v_add_u32_e32 v112, 0x100, v225
	v_mul_hi_u32 v112, s46, v112
	v_mul_lo_u32 v112, s41, v112
	v_add_u32_e32 v254, s2, v148
	s_waitcnt vmcnt(2)
	v_add_u32_e32 v235, s2, v114
	v_sub_u32_e32 v112, v235, v112
	v_cmp_le_u32_e32 vcc, s41, v112
	v_add_u32_e32 v236, 2, v235
	v_add_u32_e32 v240, 0xffffff02, v235
	v_cndmask_b32_e32 v114, 0, v203, vcc
	v_add3_u32 v112, v112, v114, s84
	v_mad_u64_u32 v[114:115], s[94:95], s44, v113, v[112:113]
	buffer_load_ubyte v210, v114, s[28:31], 0 offen offset:256
	s_nop 0
	scratch_load_dwordx2 v[114:115], off, off offset:276
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v150, v114
	v_add_u32_e32 v114, 0x102, v224
	v_mul_hi_u32 v114, s46, v114
	v_add_u32_e32 v113, s2, v150
	v_mul_lo_u32 v115, s41, v114
	v_sub_u32_e32 v113, v113, v115
	v_add_u32_e32 v113, 2, v113
	v_cmp_le_u32_e32 vcc, s41, v113
	s_nop 1
	v_subbrev_co_u32_e32 v113, vcc, 0, v114, vcc
	v_add_u32_e32 v114, 0x102, v225
	v_mul_hi_u32 v114, s46, v114
	v_mul_lo_u32 v114, s41, v114
	v_sub_u32_e32 v115, v236, v114
	v_cmp_le_u32_e32 vcc, s41, v115
	v_sub_u32_e32 v114, v240, v114
	s_nop 0
	v_cndmask_b32_e32 v115, 0, v203, vcc
	v_add_u32_e32 v114, v115, v114
	v_mad_u64_u32 v[130:131], s[94:95], s44, v113, v[114:115]
	v_add_u32_e32 v113, 0x101, v231
	v_mul_hi_u32 v113, s46, v113
	v_mul_lo_u32 v115, s41, v113
	v_sub_u32_e32 v115, v238, v115
	v_add_u32_e32 v115, 0x101, v115
	v_cmp_le_u32_e32 vcc, s41, v115
	v_add_u32_e32 v115, 0x101, v156
	v_add_u32_e32 v241, s2, v115
	v_add_u32_e32 v115, 0x101, v232
	v_mul_hi_u32 v115, s46, v115
	v_mul_lo_u32 v115, s41, v115
	v_subbrev_co_u32_e32 v113, vcc, 0, v113, vcc
	v_sub_u32_e32 v125, v241, v115
	v_cmp_le_u32_e32 vcc, s41, v125
	v_add_u32_e32 v244, 0xfffffeff, v241
	v_sub_u32_e32 v115, v244, v115
	v_cndmask_b32_e32 v125, 0, v203, vcc
	v_add_u32_e32 v128, v125, v115
	scratch_load_dwordx2 v[124:125], off, off offset:284
	v_add_u32_e32 v115, 0x103, v231
	v_mul_hi_u32 v115, s46, v115
	buffer_load_ubyte v209, v130, s[28:31], 0 offen offset:256
	v_mad_u64_u32 v[130:131], s[94:95], s44, v113, v[128:129]
	s_waitcnt vmcnt(1)
	v_mul_lo_u32 v125, s41, v115
	v_add_u32_e32 v242, 2, v241
	v_add_u32_e32 v247, 0xffffff02, v241
	buffer_load_ubyte v212, v130, s[28:31], 0 offen offset:257
	v_mov_b32_e32 v132, v124
	v_add_u32_e32 v113, s2, v132
	v_sub_u32_e32 v113, v113, v125
	v_add_u32_e32 v113, 3, v113
	v_cmp_le_u32_e32 vcc, s41, v113
	s_nop 1
	v_subbrev_co_u32_e32 v113, vcc, 0, v115, vcc
	v_add_u32_e32 v115, 0x103, v232
	v_mul_hi_u32 v115, s46, v115
	v_mul_lo_u32 v115, s41, v115
	v_sub_u32_e32 v125, v242, v115
	v_cmp_le_u32_e32 vcc, s41, v125
	v_sub_u32_e32 v115, v247, v115
	s_nop 0
	v_cndmask_b32_e32 v125, 0, v203, vcc
	v_add_u32_e32 v130, v125, v115
	scratch_load_dwordx2 v[124:125], off, off offset:292
	v_mad_u64_u32 v[136:137], s[94:95], s44, v113, v[130:131]
	v_add_u32_e32 v113, s2, v138
	v_add_u32_e32 v245, 0x100, v113
	v_add_u32_e32 v113, 0x100, v237
	v_mul_hi_u32 v113, s46, v113
	v_mul_lo_u32 v115, s41, v113
	v_sub_u32_e32 v115, v245, v115
	v_cmp_le_u32_e32 vcc, s41, v115
	buffer_load_ubyte v211, v136, s[28:31], 0 offen offset:256
	s_waitcnt vmcnt(1)
	v_add_u32_e32 v248, s2, v124
	scratch_load_dwordx2 v[124:125], off, off offset:300
	v_subbrev_co_u32_e32 v113, vcc, 0, v113, vcc
	v_mad_u64_u32 v[136:137], s[94:95], s44, v113, v[112:113]
	v_add_u32_e32 v113, 0x102, v237
	v_mul_hi_u32 v113, s46, v113
	v_mul_lo_u32 v115, s41, v113
	v_sub_u32_e32 v115, v248, v115
	v_add_u32_e32 v115, 2, v115
	v_cmp_le_u32_e32 vcc, s41, v115
	buffer_load_ubyte v214, v136, s[28:31], 0 offen offset:256
	s_waitcnt vmcnt(1)
	v_add_u32_e32 v250, s2, v124
	scratch_load_dwordx2 v[124:125], off, off offset:308
	v_subbrev_co_u32_e32 v113, vcc, 0, v113, vcc
	v_mad_u64_u32 v[136:137], s[94:95], s44, v113, v[114:115]
	v_add_u32_e32 v113, 0x101, v239
	v_mul_hi_u32 v113, s46, v113
	v_mul_lo_u32 v115, s41, v113
	v_sub_u32_e32 v115, v249, v115
	v_add_u32_e32 v115, 0x101, v115
	v_cmp_le_u32_e32 vcc, s41, v115
	buffer_load_ubyte v213, v136, s[28:31], 0 offen offset:256
	s_waitcnt vmcnt(1)
	v_add_u32_e32 v253, s2, v124
	scratch_load_dwordx2 v[124:125], off, off offset:316
	v_subbrev_co_u32_e32 v113, vcc, 0, v113, vcc
	v_mad_u64_u32 v[136:137], s[94:95], s44, v113, v[128:129]
	v_add_u32_e32 v113, 0x103, v239
	v_mul_hi_u32 v113, s46, v113
	v_mul_lo_u32 v115, s41, v113
	v_sub_u32_e32 v115, v250, v115
	v_add_u32_e32 v115, 3, v115
	v_cmp_le_u32_e32 vcc, s41, v115
	buffer_load_ubyte v216, v136, s[28:31], 0 offen offset:257
	s_waitcnt vmcnt(1)
	v_add_u32_e32 v255, s2, v124
	v_subbrev_co_u32_e32 v113, vcc, 0, v113, vcc
	v_mad_u64_u32 v[136:137], s[94:95], s44, v113, v[130:131]
	v_add_u32_e32 v113, s2, v146
	v_add_u32_e32 v252, 0x100, v113
	v_add_u32_e32 v113, 0x100, v243
	v_mul_hi_u32 v113, s46, v113
	v_mul_lo_u32 v115, s41, v113
	v_sub_u32_e32 v115, v252, v115
	v_cmp_le_u32_e32 vcc, s41, v115
	buffer_load_ubyte v215, v136, s[28:31], 0 offen offset:256
	s_nop 0
	v_subbrev_co_u32_e32 v113, vcc, 0, v113, vcc
	v_mad_u64_u32 v[136:137], s[94:95], s44, v113, v[112:113]
	v_add_u32_e32 v113, 0x102, v243
	v_mul_hi_u32 v113, s46, v113
	v_mul_lo_u32 v115, s41, v113
	v_sub_u32_e32 v115, v253, v115
	v_add_u32_e32 v115, 2, v115
	v_cmp_le_u32_e32 vcc, s41, v115
	buffer_load_ubyte v219, v136, s[28:31], 0 offen offset:256
	s_nop 0
	v_subbrev_co_u32_e32 v113, vcc, 0, v113, vcc
	v_mad_u64_u32 v[136:137], s[94:95], s44, v113, v[114:115]
	v_add_u32_e32 v113, 0x101, v246
	v_mul_hi_u32 v113, s46, v113
	v_mul_lo_u32 v115, s41, v113
	v_sub_u32_e32 v115, v254, v115
	v_add_u32_e32 v115, 0x101, v115
	v_cmp_le_u32_e32 vcc, s41, v115
	buffer_load_ubyte v217, v136, s[28:31], 0 offen offset:256
	s_nop 0
	v_subbrev_co_u32_e32 v113, vcc, 0, v113, vcc
	v_mad_u64_u32 v[136:137], s[94:95], s44, v113, v[128:129]
	v_add_u32_e32 v113, 0x103, v246
	v_mul_hi_u32 v113, s38, v113
	v_mul_lo_u32 v115, v113, s34
	v_sub_u32_e32 v115, v255, v115
	v_add_u32_e32 v115, 3, v115
	v_cmp_le_u32_e32 vcc, s34, v115
	buffer_load_ubyte v220, v136, s[28:31], 0 offen offset:257
	s_nop 0
	v_subbrev_co_u32_e32 v113, vcc, 0, v113, vcc
	v_mad_u64_u32 v[130:131], s[94:95], s44, v113, v[130:131]
	v_add_u32_e32 v113, s2, v154
	v_add_u32_e32 v204, 0x100, v113
	v_add_u32_e32 v113, 0x100, v251
	v_mul_hi_u32 v113, s46, v113
	v_mul_lo_u32 v115, s41, v113
	v_sub_u32_e32 v115, v204, v115
	v_cmp_le_u32_e32 vcc, s41, v115
	buffer_load_ubyte v218, v130, s[28:31], 0 offen offset:256
	s_nop 0
	v_subbrev_co_u32_e32 v113, vcc, 0, v113, vcc
	v_mad_u64_u32 v[112:113], s[94:95], s44, v113, v[112:113]
	buffer_load_ubyte v223, v112, s[28:31], 0 offen offset:256
	s_nop 0
	scratch_load_dwordx2 v[112:113], off, off offset:324
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v168, s2, v112
	v_add_u32_e32 v112, 0x102, v251
	v_mul_hi_u32 v112, s46, v112
	v_mul_lo_u32 v113, s41, v112
	v_sub_u32_e32 v113, v168, v113
	v_add_u32_e32 v113, 2, v113
	v_cmp_le_u32_e32 vcc, s41, v113
	s_nop 1
	v_subbrev_co_u32_e32 v112, vcc, 0, v112, vcc
	v_mad_u64_u32 v[112:113], s[2:3], s44, v112, v[114:115]
	buffer_load_ubyte v221, v112, s[28:31], 0 offen offset:256
	s_barrier
	s_setprio 1
	v_and_b32_e32 v154, 0xff, v158
	v_and_b32_e32 v182, 0xff, v127
	v_and_b32_e32 v158, 0xff, v141
	v_and_b32_e32 v170, 0xff, v140
	v_and_b32_e32 v142, 0xff, v169
	v_and_b32_e32 v183, 0xff, v135
	v_and_b32_e32 v169, 0xff, v134
	s_waitcnt lgkmcnt(6)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[4:7], v[186:189], v[80:83], v172, v154 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[4:7], v[190:193], v[76:79], v172, v182 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(4)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[4:7], v[194:197], v[72:75], v172, v158 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(3)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[4:7], v[174:177], v[68:71], v172, v170 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[4:7], v[178:181], v[64:67], v172, v142 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[4:7], v[120:123], v[60:63], v172, v183 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[4:7], v[198:201], v[56:59], v172, v169 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	scratch_load_dwordx4 v[4:7], off, off offset:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[8:11], v[120:123], v[88:91], v172, v183 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[146:149], v[160:163], v[120:123], v[52:55], v165, v183 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], v[116:119], v[120:123], v[0:3], v165, v183 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	scratch_load_dwordx4 v[0:3], off, off offset:184
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], v[8:11], v[186:189], v[108:111], v172, v154 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], v[8:11], v[190:193], v[104:107], v172, v182 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], v[8:11], v[194:197], v[100:103], v172, v158 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], v[8:11], v[174:177], v[96:99], v172, v170 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[8:11], v[178:181], v[92:95], v172, v142 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[8:11], v[198:201], v[84:87], v172, v169 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[134:137], v[160:163], v[174:177], v[44:47], v165, v170 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[138:141], v[160:163], v[178:181], v[40:43], v165, v142 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[174:177], v[116:119], v[174:177], v[32:35], v165, v170 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], v[160:163], v[186:189], v[4:7], v165, v154 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	scratch_load_dwordx4 v[4:7], off, off offset:20
	v_mfma_scale_f32_16x16x128_f8f6f4 v[186:189], v[116:119], v[186:189], v[12:15], v165, v154 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[178:181], v[116:119], v[178:181], v[36:39], v165, v142 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], v[160:163], v[190:193], v[4:7], v165, v182 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	scratch_load_dwordx4 v[4:7], off, off offset:36
	v_mfma_scale_f32_16x16x128_f8f6f4 v[190:193], v[116:119], v[190:193], v[24:27], v165, v182 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[128:131], v[160:163], v[194:197], v[4:7], v165, v158 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], v[160:163], v[198:201], v[16:19], v165, v169 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[194:197], v[116:119], v[194:197], v[20:23], v165, v158 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], v[116:119], v[198:201], v[0:3], v165, v169 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_barrier
	scratch_load_dword v20, off, off offset:400
	ds_read_b128 v[24:27], v144
	ds_read_b128 v[52:55], v144 offset:2048
	ds_read_b128 v[198:201], v144 offset:4096
	v_mov_b32_e32 v158, v155
	v_mov_b32_e32 v170, v157
	ds_read_b128 v[154:157], v144 offset:6144
	s_waitcnt vmcnt(0)
	ds_read_b128 v[182:185], v20
	ds_read_b128 v[0:3], v20 offset:2048
	ds_read_b128 v[4:7], v20 offset:4096
	ds_read_b128 v[8:11], v20 offset:6144
	ds_read_b128 v[12:15], v20 offset:8192
	ds_read_b128 v[16:19], v20 offset:10240
	ds_read_b128 v[20:23], v20 offset:12288
	s_waitcnt vmcnt(16)
	s_barrier
	s_setprio 1
	v_and_b32_e32 v142, 0xff, v30
	scratch_load_dword v30, off, off offset:52
	s_waitcnt lgkmcnt(6)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[24:27], v[182:185], v[108:111], v172, v142 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	v_and_b32_e32 v108, 0xff, v48
	v_and_b32_e32 v109, 0xff, v166
	s_nop 2
	scratch_store_dwordx4 off, v[32:35], off offset:4
	s_waitcnt lgkmcnt(5)
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[24:27], v[0:3], v[104:107], v172, v108 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	v_and_b32_e32 v104, 0xff, v49
	v_and_b32_e32 v105, 0xff, v51
	s_nop 2
	scratch_store_dwordx4 off, v[32:35], off offset:20
	s_waitcnt lgkmcnt(4)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[52:55], v[4:7], v[72:75], v172, v104 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[24:27], v[4:7], v[100:103], v172, v104 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	v_and_b32_e32 v100, 0xff, v50
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[52:55], v[16:19], v[60:63], v172, v105 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 1
	scratch_store_dwordx4 off, v[32:35], off offset:36
	s_waitcnt vmcnt(3)
	v_and_b32_e32 v101, 0xff, v30
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[24:27], v[8:11], v[96:99], v172, v100 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[52:55], v[8:11], v[68:71], v172, v100 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[52:55], v[12:15], v[64:67], v172, v101 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 5
	scratch_store_dwordx4 off, v[32:35], off offset:184
	s_nop 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[24:27], v[12:15], v[92:95], v172, v101 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[198:201], v[0:3], v[124:127], v165, v108 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[198:201], v[4:7], v[128:131], v165, v104 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 5
	scratch_store_dwordx4 off, v[32:35], off offset:200
	s_nop 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[24:27], v[16:19], v[88:91], v172, v105 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[24:27], v[20:23], v[84:87], v172, v109 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[198:201], v[8:11], v[134:137], v165, v100 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 4
	scratch_store_dwordx4 off, v[32:35], off offset:216
	s_nop 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[52:55], v[182:185], v[80:83], v172, v142 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[198:201], v[12:15], v[138:141], v165, v101 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[198:201], v[20:23], v[160:163], v165, v109 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 5
	scratch_store_dwordx4 off, v[32:35], off offset:232
	s_nop 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[52:55], v[0:3], v[76:79], v172, v108 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[52:55], v[20:23], v[56:59], v172, v109 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[198:201], v[182:185], v[112:115], v165, v142 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[198:201], v[16:19], v[146:149], v165, v105 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[154:157], v[182:185], v[186:189], v165, v142 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[154:157], v[0:3], v[190:193], v165, v108 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[154:157], v[4:7], v[194:197], v165, v104 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], v[154:157], v[8:11], v[174:177], v165, v100 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], v[154:157], v[12:15], v[178:181], v165, v101 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], v[154:157], v[16:19], v[120:123], v165, v105 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], v[154:157], v[20:23], v[116:119], v165, v109 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_or_b32 s49, s52, 1
	s_barrier
	scratch_load_dword v0, off, off offset:168
	s_mov_b32 m0, s35
	v_add_u32_e32 v113, 0x1000, v31
	v_mul_hi_u32 v113, s38, v113
	v_mul_lo_u32 v113, v113, s34
	s_waitcnt vmcnt(0)
	v_add_u32_e32 v112, 0x100, v0
	scratch_load_dword v0, off, off offset:172
	s_nop 0
	buffer_load_dwordx4 v112, s[24:27], 0 offen lds
	s_mov_b32 m0, s33
	s_waitcnt vmcnt(1)
	v_add_u32_e32 v112, 0x100, v0
	scratch_load_dword v0, off, off offset:176
	s_nop 0
	buffer_load_dwordx4 v112, s[24:27], 0 offen lds
	s_mov_b32 m0, s54
	s_waitcnt vmcnt(1)
	v_add_u32_e32 v112, 0x100, v0
	scratch_load_dword v0, off, off offset:180
	s_nop 0
	buffer_load_dwordx4 v112, s[24:27], 0 offen lds
	s_mov_b32 m0, s55
	s_waitcnt vmcnt(1)
	v_add_u32_e32 v112, 0x100, v0
	buffer_load_dwordx4 v112, s[24:27], 0 offen lds
	v_lshl_add_u32 v112, s49, 11, v167
	v_sub_u32_e32 v112, v112, v113
	v_cmp_le_u32_e32 vcc, s34, v112
	s_mov_b32 m0, s13
	s_nop 0
	v_cndmask_b32_e32 v112, 0, v133, vcc
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v151, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v152, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s68
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v171, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s69
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v205, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s70
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v206, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s71
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v159, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s72
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v143, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s73
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v173, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s74
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v28, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s75
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v29, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s76
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v226, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s77
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v227, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s78
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e64 v113, s[2:3], 0, v228, vcc
	v_mad_u64_u32 v[114:115], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v113, v222, v114, s85
	s_mov_b32 m0, s79
	s_nop 0
	buffer_load_dword v113, s[20:23], 0 offen lds
	v_subbrev_co_u32_e32 v113, vcc, 0, v229, vcc
	v_mad_u64_u32 v[112:113], s[2:3], s34, v113, v[112:113]
	v_add3_u32 v112, v222, v112, s85
	s_mov_b32 m0, s80
	s_nop 0
	buffer_load_dword v112, s[20:23], 0 offen lds
	scratch_load_dword v0, off, off offset:404
	s_lshl_b32 s49, s49, 8
	ds_read_b128 v[112:115], v164 offset:32768
	ds_read_b128 v[226:229], v164 offset:34816
	ds_read_b128 v[120:123], v164 offset:36864
	ds_read_b128 v[116:119], v164 offset:38912
	s_waitcnt vmcnt(0)
	ds_read_b128 v[160:163], v0
	ds_read_b128 v[174:177], v0 offset:2048
	ds_read_b128 v[178:181], v0 offset:4096
	ds_read_b128 v[186:189], v0 offset:6144
	ds_read_b128 v[190:193], v0 offset:8192
	ds_read_b128 v[194:197], v0 offset:10240
	ds_read_b128 v[198:201], v0 offset:12288
	scratch_load_dword v0, off, off
	s_waitcnt vmcnt(0)
	v_mul_hi_u32 v124, s42, v0
	v_mul_lo_u32 v125, s36, v124
	v_sub_u32_e32 v125, v233, v125
	v_add_u32_e32 v125, 0x2000, v125
	v_cmp_le_u32_e32 vcc, s36, v125
	s_nop 1
	v_cndmask_b32_e32 v126, 0, v153, vcc
	v_add_u32_e32 v125, v126, v125
	v_ashrrev_i32_e32 v126, 31, v125
	v_xor_b32_e32 v125, v126, v125
	v_ashrrev_i32_e32 v127, 31, v125
	v_subbrev_co_u32_e64 v124, s[2:3], 0, v124, vcc
	v_lshrrev_b32_e32 v127, 27, v127
	v_add_u32_e32 v125, v125, v127
	v_add_u32_e32 v124, v202, v124
	v_ashrrev_i32_e32 v125, 5, v125
	v_mul_lo_u32 v124, v124, s40
	v_xad_u32 v124, v125, v126, v124
	buffer_load_dword v172, v124, s[4:7], 0 offen
	v_add_u32_e32 v124, s43, v124
	buffer_load_dword v165, v124, s[4:7], 0 offen
	v_add_u32_e32 v124, 0x200, v224
	v_mul_hi_u32 v124, s46, v124
	v_mul_lo_u32 v125, s41, v124
	v_sub_u32_e32 v125, v234, v125
	v_add_u32_e32 v125, 0x100, v125
	v_cmp_le_u32_e32 vcc, s41, v125
	v_add_u32_e32 v125, 0x200, v225
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v125, s41, v125
	v_sub_u32_e32 v125, v235, v125
	v_subbrev_co_u32_e32 v124, vcc, 0, v124, vcc
	v_add_u32_e32 v126, 0x100, v125
	v_cmp_le_u32_e32 vcc, s41, v126
	s_nop 1
	v_cndmask_b32_e32 v126, 0, v203, vcc
	v_add_u32_e32 v128, v126, v125
	v_mad_u64_u32 v[124:125], s[2:3], s44, v124, v[128:129]
	v_add_u32_e32 v125, 0x202, v224
	v_mul_hi_u32 v125, s46, v125
	buffer_load_ubyte v142, v124, s[28:31], 0 offen offset:256
	v_add_u32_e32 v124, s49, v150
	v_mul_lo_u32 v127, s41, v125
	v_sub_u32_e32 v124, v124, v127
	v_add_u32_e32 v124, 2, v124
	v_cmp_le_u32_e32 vcc, s41, v124
	s_nop 1
	v_subbrev_co_u32_e32 v124, vcc, 0, v125, vcc
	v_add_u32_e32 v125, 0x202, v225
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v125, s41, v125
	v_sub_u32_e32 v127, v236, v125
	v_add_u32_e32 v127, 0x100, v127
	v_cmp_le_u32_e32 vcc, s41, v127
	v_sub_u32_e32 v125, v240, v125
	s_nop 0
	v_cndmask_b32_e32 v127, 0, v203, vcc
	v_add3_u32 v130, v125, v127, s45
	v_mad_u64_u32 v[124:125], s[2:3], s44, v124, v[130:131]
	buffer_load_ubyte v133, v124, s[28:31], 0 offen offset:256
	v_add_u32_e32 v124, 0x201, v231
	v_mul_hi_u32 v124, s46, v124
	v_mul_lo_u32 v125, s41, v124
	v_sub_u32_e32 v125, v238, v125
	v_add_u32_e32 v125, 0x201, v125
	v_cmp_le_u32_e32 vcc, s41, v125
	v_add_u32_e32 v125, 0x201, v232
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v125, s41, v125
	v_sub_u32_e32 v127, v241, v125
	v_subbrev_co_u32_e32 v124, vcc, 0, v124, vcc
	v_add_u32_e32 v127, 0x100, v127
	v_cmp_le_u32_e32 vcc, s41, v127
	v_sub_u32_e32 v125, v244, v125
	s_nop 0
	v_cndmask_b32_e32 v127, 0, v203, vcc
	v_add3_u32 v134, v125, v127, s45
	v_add_u32_e32 v127, 0x203, v231
	v_mad_u64_u32 v[124:125], s[2:3], s44, v124, v[134:135]
	v_mul_hi_u32 v127, s46, v127
	v_add_u32_e32 v125, s49, v132
	v_mul_lo_u32 v129, s41, v127
	v_sub_u32_e32 v125, v125, v129
	v_add_u32_e32 v125, 3, v125
	v_cmp_le_u32_e32 vcc, s41, v125
	buffer_load_ubyte v167, v124, s[28:31], 0 offen offset:257
	scratch_load_dword v132, off, off offset:164
	v_subbrev_co_u32_e32 v125, vcc, 0, v127, vcc
	v_add_u32_e32 v127, 0x203, v232
	v_mul_hi_u32 v127, s46, v127
	v_mul_lo_u32 v127, s41, v127
	v_sub_u32_e32 v129, v242, v127
	v_add_u32_e32 v129, 0x100, v129
	v_cmp_le_u32_e32 vcc, s41, v129
	v_sub_u32_e32 v127, v247, v127
	s_nop 0
	v_cndmask_b32_e32 v129, 0, v203, vcc
	v_add3_u32 v136, v127, v129, s45
	v_mad_u64_u32 v[138:139], s[2:3], s44, v125, v[136:137]
	v_add_u32_e32 v125, 0x200, v237
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v127, s41, v125
	v_sub_u32_e32 v127, v245, v127
	v_add_u32_e32 v127, 0x100, v127
	v_cmp_le_u32_e32 vcc, s41, v127
	buffer_load_ubyte v143, v138, s[28:31], 0 offen offset:256
	s_nop 0
	v_subbrev_co_u32_e32 v125, vcc, 0, v125, vcc
	v_mad_u64_u32 v[138:139], s[2:3], s44, v125, v[128:129]
	v_add_u32_e32 v125, 0x202, v237
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v129, s41, v125
	v_sub_u32_e32 v129, v248, v129
	v_add_u32_e32 v129, 0x102, v129
	v_cmp_le_u32_e32 vcc, s41, v129
	buffer_load_ubyte v141, v138, s[28:31], 0 offen offset:256
	s_nop 0
	v_subbrev_co_u32_e32 v125, vcc, 0, v125, vcc
	v_mad_u64_u32 v[138:139], s[2:3], s44, v125, v[130:131]
	v_add_u32_e32 v125, 0x201, v239
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v129, s41, v125
	v_sub_u32_e32 v129, v249, v129
	v_add_u32_e32 v129, 0x201, v129
	v_cmp_le_u32_e32 vcc, s41, v129
	buffer_load_ubyte v150, v138, s[28:31], 0 offen offset:256
	s_nop 0
	v_subbrev_co_u32_e32 v125, vcc, 0, v125, vcc
	v_mad_u64_u32 v[138:139], s[2:3], s44, v125, v[134:135]
	v_add_u32_e32 v125, 0x203, v239
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v129, s41, v125
	v_sub_u32_e32 v129, v250, v129
	v_add_u32_e32 v129, 0x103, v129
	v_cmp_le_u32_e32 vcc, s41, v129
	buffer_load_ubyte v140, v138, s[28:31], 0 offen offset:257
	s_nop 0
	v_subbrev_co_u32_e32 v125, vcc, 0, v125, vcc
	v_mad_u64_u32 v[138:139], s[2:3], s44, v125, v[136:137]
	v_add_u32_e32 v125, 0x200, v243
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v129, s41, v125
	v_sub_u32_e32 v129, v252, v129
	v_add_u32_e32 v129, 0x100, v129
	v_cmp_le_u32_e32 vcc, s41, v129
	buffer_load_ubyte v151, v138, s[28:31], 0 offen offset:256
	s_nop 0
	v_subbrev_co_u32_e32 v125, vcc, 0, v125, vcc
	v_mad_u64_u32 v[138:139], s[2:3], s44, v125, v[128:129]
	v_add_u32_e32 v125, 0x202, v243
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v131, s41, v125
	v_sub_u32_e32 v131, v253, v131
	v_add_u32_e32 v131, 0x102, v131
	v_cmp_le_u32_e32 vcc, s41, v131
	buffer_load_ubyte v169, v138, s[28:31], 0 offen offset:256
	s_nop 0
	v_subbrev_co_u32_e32 v125, vcc, 0, v125, vcc
	v_mad_u64_u32 v[138:139], s[2:3], s44, v125, v[130:131]
	v_add_u32_e32 v125, 0x201, v246
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v131, s41, v125
	v_sub_u32_e32 v131, v254, v131
	v_add_u32_e32 v131, 0x201, v131
	v_cmp_le_u32_e32 vcc, s41, v131
	buffer_load_ubyte v0, v138, s[28:31], 0 offen offset:256
	s_nop 0
	v_subbrev_co_u32_e32 v125, vcc, 0, v125, vcc
	v_mad_u64_u32 v[134:135], s[2:3], s44, v125, v[134:135]
	v_add_u32_e32 v125, 0x203, v246
	v_mul_hi_u32 v125, s38, v125
	v_mul_lo_u32 v131, v125, s34
	v_sub_u32_e32 v131, v255, v131
	v_add_u32_e32 v131, 0x103, v131
	v_cmp_le_u32_e32 vcc, s34, v131
	buffer_load_ubyte v135, v134, s[28:31], 0 offen offset:257
	s_nop 0
	v_subbrev_co_u32_e32 v125, vcc, 0, v125, vcc
	v_mad_u64_u32 v[136:137], s[2:3], s44, v125, v[136:137]
	v_add_u32_e32 v125, 0x200, v251
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v131, s41, v125
	v_sub_u32_e32 v131, v204, v131
	v_add_u32_e32 v131, 0x100, v131
	v_cmp_le_u32_e32 vcc, s41, v131
	buffer_load_ubyte v153, v136, s[28:31], 0 offen offset:256
	s_nop 0
	v_subbrev_co_u32_e32 v125, vcc, 0, v125, vcc
	v_mad_u64_u32 v[136:137], s[2:3], s44, v125, v[128:129]
	v_add_u32_e32 v125, 0x202, v251
	v_mul_hi_u32 v125, s46, v125
	v_mul_lo_u32 v128, s41, v125
	v_sub_u32_e32 v128, v168, v128
	v_add_u32_e32 v128, 0x102, v128
	v_cmp_le_u32_e32 vcc, s41, v128
	v_mov_b32_e32 v168, v230
	s_waitcnt vmcnt(2)
	scratch_store_dword off, v0, off offset:52
	v_subbrev_co_u32_e32 v125, vcc, 0, v125, vcc
	v_mad_u64_u32 v[130:131], s[2:3], s44, v125, v[130:131]
	buffer_load_ubyte v166, v130, s[28:31], 0 offen offset:256
	buffer_load_ubyte v134, v136, s[28:31], 0 offen offset:256
	s_barrier
	s_setprio 1
	scratch_load_dwordx4 v[0:3], off, off offset:4
	scratch_load_dwordx4 v[4:7], off, off offset:20
	scratch_load_dwordx4 v[8:11], off, off offset:36
	scratch_load_dwordx4 v[12:15], off, off offset:184
	scratch_load_dwordx4 v[16:19], off, off offset:200
	scratch_load_dwordx4 v[20:23], off, off offset:216
	scratch_load_dwordx4 v[28:31], off, off offset:232
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[112:115], v[198:201], v[24:27], v208, v223 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[226:229], v[174:177], v[32:35], v208, v212 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[226:229], v[178:181], v[36:39], v208, v214 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[226:229], v[186:189], v[40:43], v208, v216 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[226:229], v[190:193], v[44:47], v208, v219 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[226:229], v[194:197], v[48:51], v208, v220 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[226:229], v[198:201], v[52:55], v208, v223 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[136:139], v[120:123], v[174:177], v[60:63], v207, v212 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[146:149], v[120:123], v[178:181], v[64:67], v207, v214 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[232:235], v[120:123], v[194:197], v[76:79], v207, v220 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(6)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[112:115], v[160:163], v[0:3], v208, v210 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[112:115], v[174:177], v[4:7], v208, v212 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(4)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[112:115], v[178:181], v[8:11], v208, v214 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(3)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[112:115], v[186:189], v[12:15], v208, v216 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[112:115], v[190:193], v[16:19], v208, v219 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[112:115], v[194:197], v[20:23], v208, v220 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[226:229], v[160:163], v[28:31], v208, v210 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], v[120:123], v[160:163], v[56:59], v207, v210 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[224:227], v[120:123], v[186:189], v[68:71], v207, v216 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[228:231], v[120:123], v[190:193], v[72:75], v207, v219 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], v[120:123], v[198:201], v[80:83], v207, v223 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[160:163], v[116:119], v[160:163], v[84:87], v207, v210 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[174:177], v[116:119], v[174:177], v[88:91], v207, v212 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[178:181], v[116:119], v[178:181], v[92:95], v207, v214 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[186:189], v[116:119], v[186:189], v[96:99], v207, v216 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[190:193], v[116:119], v[190:193], v[100:103], v207, v219 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[194:197], v[116:119], v[194:197], v[104:107], v207, v220 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], v[116:119], v[198:201], v[108:111], v207, v223 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_barrier
	scratch_load_dword v60, off, off offset:408
	ds_read_b128 v[56:59], v144 offset:32768
	ds_read_b128 v[154:157], v144 offset:34816
	ds_read_b128 v[182:185], v144 offset:36864
	ds_read_b128 v[198:201], v144 offset:38912
	s_waitcnt vmcnt(0)
	ds_read_b128 v[236:239], v60
	ds_read_b128 v[240:243], v60 offset:2048
	ds_read_b128 v[244:247], v60 offset:4096
	ds_read_b128 v[248:251], v60 offset:6144
	ds_read_b128 v[252:255], v60 offset:8192
	ds_read_b128 v[124:127], v60 offset:10240
	ds_read_b128 v[128:131], v60 offset:12288
	s_waitcnt vmcnt(16)
	s_barrier
	s_setprio 1
	s_waitcnt lgkmcnt(6)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], v[56:59], v[236:239], v[0:3], v208, v209 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[182:185], v[236:239], v[112:115], v207, v209 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	scratch_load_dword v115, off, off
	scratch_load_dword v114, off, off offset:256
	s_nop 2
	scratch_store_dwordx4 off, v[0:3], off offset:4
	s_waitcnt lgkmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], v[56:59], v[240:243], v[4:7], v208, v211 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	scratch_load_dword v4, off, off offset:160
	scratch_load_dword v7, off, off offset:156
	scratch_load_dword v6, off, off offset:152
	scratch_load_dword v5, off, off offset:148
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[182:185], v[240:243], v[136:139], v207, v211 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(4)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], v[56:59], v[244:247], v[8:11], v208, v213 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 0
	scratch_load_dwordx2 v[138:139], off, off offset:72
	s_nop 3
	scratch_store_dwordx4 off, v[0:3], off offset:20
	s_waitcnt lgkmcnt(3)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], v[56:59], v[248:251], v[12:15], v208, v215 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	scratch_load_dword v8, off, off offset:140
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[182:185], v[244:247], v[146:149], v207, v213 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[56:59], v[252:255], v[16:19], v208, v217 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 0
	scratch_load_dwordx2 v[148:149], off, off offset:96
	scratch_load_dword v149, off, off offset:136
	scratch_load_dwordx2 v[146:147], off, off offset:88
	scratch_load_dword v139, off, off offset:128
	scratch_load_dwordx2 v[136:137], off, off offset:64
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[56:59], v[124:127], v[20:23], v208, v218 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	scratch_store_dwordx4 off, v[0:3], off offset:36
	scratch_load_dword v147, off, off offset:132
	s_nop 0
	scratch_load_dwordx2 v[0:1], off, off offset:80
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[56:59], v[128:131], v[24:27], v208, v221 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[154:157], v[236:239], v[28:31], v208, v209 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[154:157], v[240:243], v[32:35], v208, v211 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[154:157], v[244:247], v[36:39], v208, v213 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[154:157], v[248:251], v[40:43], v208, v215 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[154:157], v[252:255], v[44:47], v208, v217 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[154:157], v[124:127], v[48:51], v208, v218 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[154:157], v[128:131], v[52:55], v208, v221 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	scratch_load_dwordx2 v[156:157], off, off offset:112
	scratch_load_dwordx2 v[154:155], off, off offset:104
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v155, v158
	v_mov_b32_e32 v158, v142
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[182:185], v[124:127], v[232:235], v207, v218 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mov_b32_e32 v50, v151
	v_mov_b32_e32 v49, v150
	v_mov_b32_e32 v157, v170
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[182:185], v[128:131], v[120:123], v207, v221 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mov_b32_e32 v142, v0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[198:201], v[124:127], v[194:197], v207, v218 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	scratch_load_dword v125, off, off offset:120
	scratch_load_dword v124, off, off offset:260
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[198:201], v[128:131], v[116:119], v207, v221 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	scratch_load_dword v130, off, off offset:144
	scratch_load_dword v128, off, off offset:124
	scratch_load_dwordx2 v[126:127], off, off offset:56
	v_mfma_scale_f32_16x16x128_f8f6f4 v[222:225], v[182:185], v[248:251], v[224:227], v207, v215 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[182:185], v[252:255], v[228:231], v207, v217 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[198:201], v[236:239], v[160:163], v207, v209 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[198:201], v[240:243], v[174:177], v207, v211 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[198:201], v[244:247], v[178:181], v207, v213 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[198:201], v[248:251], v[186:189], v207, v215 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[198:201], v[252:255], v[190:193], v207, v217 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_setprio 0
	scratch_load_dwordx2 v[10:11], off, off offset:412
	s_add_u32 s52, s52, 2
	s_addc_u32 s53, s53, 0
	s_waitcnt vmcnt(5)
	v_add_u32_e32 v125, 0x200, v125
	s_waitcnt vmcnt(2)
	v_add_u32_e32 v128, 0x200, v128
	v_add_u32_e32 v145, 0x1000, v145
	v_add_u32_e32 v8, 0x1000, v8
	v_add_u32_e32 v139, 0x200, v139
	v_add_u32_e32 v147, 0x200, v147
	v_add_u32_e32 v149, 0x200, v149
	v_add_u32_e32 v155, 0x200, v155
	v_add_u32_e32 v157, 0x200, v157
	v_add_u32_e32 v132, 0x200, v132
	v_add_u32_e32 v130, 0x200, v130
	v_add_u32_e32 v115, 0x4000, v115
	v_add_u32_e32 v5, 0x100, v5
	v_add_u32_e32 v6, 0x100, v6
	v_add_u32_e32 v7, 0x100, v7
	v_add_u32_e32 v4, 0x100, v4
	s_waitcnt vmcnt(0)
	v_cmp_ge_i64_e32 vcc, s[52:53], v[10:11]
	s_cbranch_vccz .LBB0_13
	scratch_load_dword v239, off, off offset:420
	scratch_load_dword v171, off, off offset:248
	scratch_load_dword v238, off, off offset:424
	scratch_load_dword v112, off, off offset:428
	scratch_load_dword v115, off, off offset:432
	scratch_load_dword v118, off, off offset:436
	scratch_load_dword v119, off, off offset:440
	scratch_load_dword v120, off, off offset:444
	scratch_load_dword v170, off, off offset:252
	scratch_load_dword v127, off, off offset:448
	scratch_load_dword v129, off, off offset:452
	v_mov_b32_e32 v145, v133
	scratch_load_dwordx2 v[132:133], off, off offset:456
	scratch_load_dwordx2 v[116:117], off, off offset:464
	scratch_load_dwordx2 v[150:151], off, off offset:472
	scratch_load_dwordx2 v[122:123], off, off offset:480
	scratch_load_dword v243, off, off offset:52
	scratch_load_dwordx2 v[130:131], off, off offset:488
	v_mov_b64_e32 v[28:29], v[36:37]
	v_mov_b64_e32 v[248:249], v[54:55]
	v_mov_b64_e32 v[30:31], v[38:39]
	v_mov_b64_e32 v[36:37], v[44:45]
	v_mov_b32_e32 v241, v49
	v_mov_b32_e32 v242, v50
	v_mov_b32_e32 v244, v153
	scratch_load_dwordx2 v[152:153], off, off offset:496
	scratch_load_dwordx2 v[160:161], off, off offset:504
	scratch_load_dwordx2 v[162:163], off, off offset:512
	v_mov_b64_e32 v[246:247], v[52:53]
	v_mov_b64_e32 v[38:39], v[46:47]
	scratch_load_dwordx4 v[44:47], off, off offset:36
	scratch_load_dwordx4 v[48:51], off, off offset:20
	scratch_load_dwordx4 v[52:55], off, off offset:4
	v_mov_b64_e32 v[252:253], v[18:19]
	v_mov_b64_e32 v[250:251], v[16:17]
	v_mov_b64_e32 v[16:17], v[24:25]
	s_load_dwordx2 s[12:13], s[0:1], 0x60
	v_mov_b64_e32 v[18:19], v[26:27]
	v_mov_b64_e32 v[24:25], v[32:33]
	v_mov_b64_e32 v[26:27], v[34:35]
	v_mov_b64_e32 v[32:33], v[40:41]
	v_mov_b64_e32 v[34:35], v[42:43]
	v_mov_b64_e32 v[40:41], v[222:223]
	v_mov_b32_e32 v240, v143
	v_mov_b64_e32 v[42:43], v[224:225]
	v_cmp_gt_i64_e64 s[0:1], s[50:51], 0
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccz .LBB0_22
.LBB0_15:
	s_lshl_b32 s16, s48, 8
	v_add_u32_e32 v4, 0x100, v156
	s_waitcnt vmcnt(10)
	v_add_u32_e32 v5, s16, v116
	s_waitcnt vmcnt(3)
	v_add_u32_e32 v9, v162, v4
	v_add_u32_e32 v113, v160, v4
	v_add_u32_e32 v116, v152, v4
	v_add_u32_e32 v117, s16, v156
	v_lshl_add_u32 v4, s48, 13, v124
	v_lshl_or_b32 v6, s48, 7, v114
	s_movk_i32 s0, 0x80
	v_add3_u32 v7, v6, v112, s0
	s_add_i32 m0, s35, 0x8000
	s_barrier
	buffer_load_dwordx4 v7, s[24:27], 0 offen lds
	v_add3_u32 v7, v6, v115, s0
	s_add_i32 m0, s33, 0x8000
	s_movk_i32 s2, 0x800
	buffer_load_dwordx4 v7, s[24:27], 0 offen lds
	v_add3_u32 v7, v6, v118, s0
	s_add_i32 m0, s54, 0x8000
	v_add3_u32 v6, v6, v119, s0
	buffer_load_dwordx4 v7, s[24:27], 0 offen lds
	s_add_i32 m0, s55, 0x8000
	s_mov_b32 s3, 0x17000
	buffer_load_dwordx4 v6, s[24:27], 0 offen lds
	v_lshl_add_u32 v6, s48, 11, v120
	v_add_u32_e32 v7, 0x800, v6
	v_mul_hi_u32 v8, s38, v7
	v_mul_lo_u32 v10, v8, s34
	v_sub_u32_e32 v7, v7, v10
	v_cmp_le_u32_e32 vcc, s34, v7
	v_sub_u32_e32 v6, v6, v10
	s_add_i32 m0, s67, 0x17000
	v_subbrev_co_u32_e64 v7, s[0:1], 0, v8, vcc
	v_mov_b32_e32 v8, s34
	v_add_u32_e32 v7, s18, v7
	v_cndmask_b32_e32 v8, 0, v8, vcc
	v_mul_lo_u32 v11, v7, s34
	v_add_u32_e32 v6, v6, v8
	v_add3_u32 v8, v6, v11, s2
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 16, v7
	v_mul_lo_u32 v8, v8, s34
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s17, 0x17000
	s_nop 0
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 32, v7
	v_mul_lo_u32 v8, v8, s34
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s39, 0x17000
	s_nop 0
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 48, v7
	v_mul_lo_u32 v8, v8, s34
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s56, 0x17000
	s_nop 0
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 64, v7
	v_mul_lo_u32 v8, v8, s34
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s57, 0x17000
	s_nop 0
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 0x50, v7
	v_mul_lo_u32 v8, v8, s34
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s58, 0x17000
	s_nop 0
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 0x60, v7
	v_mul_lo_u32 v8, v8, s34
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s59, 0x17000
	s_nop 0
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 0x70, v7
	v_mul_lo_u32 v8, v8, s34
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s60, 0x17000
	s_nop 0
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 0x80, v7
	v_mul_lo_u32 v8, v8, s34
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s61, 0x17000
	s_nop 0
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 0x90, v7
	v_mul_lo_u32 v8, v8, s34
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s62, 0x17000
	s_nop 0
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 0xa0, v7
	v_mul_lo_u32 v8, v8, s34
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s63, 0x17000
	s_nop 0
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 0xb0, v7
	v_mul_lo_u32 v8, v8, s34
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s64, 0x17000
	s_nop 0
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add_u32_e32 v8, 0xc0, v7
	v_mul_lo_u32 v8, v8, s34
	v_add_u32_e32 v7, 0xd0, v7
	v_add3_u32 v8, v6, v8, s2
	s_add_i32 m0, s65, 0x17000
	v_mul_lo_u32 v7, v7, s34
	buffer_load_dword v8, s[20:23], 0 offen lds
	v_add3_u32 v6, v6, v7, s2
	s_add_i32 m0, s66, 0x17000
	s_mov_b32 s2, 0x8000
	buffer_load_dword v6, s[20:23], 0 offen lds
	v_add_u32_e32 v4, 0x2000, v4
	v_mul_hi_u32 v6, s42, v4
	v_mul_lo_u32 v7, s36, v6
	v_sub_u32_e32 v4, v4, v7
	v_cmp_le_u32_e32 vcc, s36, v4
	v_mov_b32_e32 v7, s36
	v_mov_b32_e32 v118, s41
	v_cndmask_b32_e32 v7, 0, v7, vcc
	v_add_u32_e32 v4, v7, v4
	v_ashrrev_i32_e32 v7, 31, v4
	v_xor_b32_e32 v4, v7, v4
	v_ashrrev_i32_e32 v8, 31, v4
	v_subbrev_co_u32_e64 v6, s[0:1], 0, v6, vcc
	v_lshrrev_b32_e32 v8, 27, v8
	v_add_u32_e32 v4, v4, v8
	v_add_u32_e32 v6, v171, v6
	v_ashrrev_i32_e32 v4, 5, v4
	v_mul_lo_u32 v6, v6, s40
	v_xad_u32 v4, v4, v7, v6
	v_add_u32_e32 v6, s43, v4
	buffer_load_dword v125, v4, s[4:7], 0 offen
	buffer_load_dword v128, v6, s[4:7], 0 offen
	v_add_u32_e32 v4, s16, v126
	v_add_u32_e32 v4, 0x100, v4
	v_mul_hi_u32 v6, s46, v4
	v_mul_lo_u32 v7, s41, v6
	v_sub_u32_e32 v4, v4, v7
	v_add_u32_e32 v8, 0x100, v5
	v_cmp_le_u32_e32 vcc, s41, v4
	v_mul_hi_u32 v4, s46, v8
	v_mul_lo_u32 v4, s41, v4
	v_subbrev_co_u32_e32 v6, vcc, 0, v6, vcc
	v_sub_u32_e32 v4, v8, v4
	v_cmp_le_u32_e32 vcc, s41, v4
	s_movk_i32 s0, 0xff00
	v_add_u32_e32 v133, 0x102, v5
	v_cndmask_b32_e32 v7, 0, v118, vcc
	v_add3_u32 v4, v4, v7, s0
	v_mad_u64_u32 v[6:7], s[0:1], s44, v6, v[4:5]
	v_add_u32_e32 v5, v133, v130
	v_mul_hi_u32 v7, s46, v5
	v_mul_lo_u32 v10, s41, v7
	v_sub_u32_e32 v5, v5, v10
	v_cmp_le_u32_e32 vcc, s41, v5
	s_movk_i32 s4, 0xff02
	s_nop 0
	v_subbrev_co_u32_e32 v5, vcc, 0, v7, vcc
	v_mul_hi_u32 v7, s46, v133
	v_mul_lo_u32 v7, s41, v7
	v_sub_u32_e32 v10, v133, v7
	v_cmp_le_u32_e32 vcc, s41, v10
	v_sub_u32_e32 v7, v8, v7
	s_nop 0
	v_cndmask_b32_e32 v10, 0, v118, vcc
	v_add3_u32 v8, v7, v10, s4
	v_mad_u64_u32 v[10:11], s[0:1], s44, v5, v[8:9]
	v_add_u32_e32 v5, s16, v136
	v_add_u32_e32 v5, 0x101, v5
	v_mul_hi_u32 v7, s46, v5
	v_mul_lo_u32 v11, s41, v7
	v_sub_u32_e32 v5, v5, v11
	v_cmp_le_u32_e32 vcc, s41, v5
	s_movk_i32 s0, 0xfeff
	s_nop 0
	v_subbrev_co_u32_e32 v5, vcc, 0, v7, vcc
	v_add_u32_e32 v7, 0x101, v117
	v_mul_hi_u32 v11, s46, v7
	v_mul_lo_u32 v11, s41, v11
	v_sub_u32_e32 v11, v7, v11
	v_cmp_le_u32_e32 vcc, s41, v11
	s_nop 1
	v_cndmask_b32_e32 v112, 0, v118, vcc
	v_add3_u32 v112, v11, v112, s0
	v_mad_u64_u32 v[114:115], s[0:1], s44, v5, v[112:113]
	v_add3_u32 v5, v116, s16, 3
	v_mul_hi_u32 v11, s46, v5
	v_mul_lo_u32 v115, s41, v11
	v_sub_u32_e32 v5, v5, v115
	v_cmp_le_u32_e32 vcc, s41, v5
	s_nop 1
	v_subbrev_co_u32_e32 v5, vcc, 0, v11, vcc
	v_add_u32_e32 v11, 0x103, v117
	v_mul_hi_u32 v115, s46, v11
	v_mul_lo_u32 v115, s41, v115
	v_sub_u32_e32 v11, v11, v115
	v_cmp_le_u32_e32 vcc, s41, v11
	v_sub_u32_e32 v7, v7, v115
	s_nop 0
	v_cndmask_b32_e32 v11, 0, v118, vcc
	v_add3_u32 v116, v7, v11, s4
	v_mad_u64_u32 v[118:119], s[0:1], s44, v5, v[116:117]
	v_add_u32_e32 v5, s16, v138
	v_add_u32_e32 v5, 0x100, v5
	v_mul_hi_u32 v7, s46, v5
	v_mul_lo_u32 v11, s41, v7
	v_sub_u32_e32 v5, v5, v11
	v_cmp_le_u32_e32 vcc, s41, v5
	s_nop 1
	v_subbrev_co_u32_e32 v5, vcc, 0, v7, vcc
	v_mad_u64_u32 v[120:121], s[0:1], s44, v5, v[4:5]
	v_add_u32_e32 v5, v133, v122
	v_mul_hi_u32 v7, s46, v5
	v_mul_lo_u32 v11, s41, v7
	v_sub_u32_e32 v5, v5, v11
	v_cmp_le_u32_e32 vcc, s41, v5
	s_nop 1
	v_subbrev_co_u32_e32 v5, vcc, 0, v7, vcc
	v_mad_u64_u32 v[122:123], s[0:1], s44, v5, v[8:9]
	v_add_u32_e32 v5, s16, v142
	v_add_u32_e32 v5, 0x101, v5
	v_mul_hi_u32 v7, s46, v5
	v_mul_lo_u32 v11, s41, v7
	v_sub_u32_e32 v5, v5, v11
	v_cmp_le_u32_e32 vcc, s41, v5
	s_nop 1
	v_subbrev_co_u32_e32 v5, vcc, 0, v7, vcc
	v_mad_u64_u32 v[130:131], s[0:1], s44, v5, v[112:113]
	v_add3_u32 v5, v113, s16, 3
	v_mul_hi_u32 v7, s46, v5
	v_mul_lo_u32 v11, s41, v7
	v_sub_u32_e32 v5, v5, v11
	v_cmp_le_u32_e32 vcc, s41, v5
	s_nop 1
	v_subbrev_co_u32_e32 v5, vcc, 0, v7, vcc
	v_mad_u64_u32 v[136:137], s[0:1], s44, v5, v[116:117]
	v_add_u32_e32 v5, s16, v146
	v_add_u32_e32 v5, 0x100, v5
	buffer_load_ubyte v121, v6, s[28:31], 0 offen offset:256
	buffer_load_ubyte v123, v10, s[28:31], 0 offen offset:256
	buffer_load_ubyte v131, v114, s[28:31], 0 offen offset:257
	buffer_load_ubyte v137, v118, s[28:31], 0 offen offset:256
	s_nop 0
	buffer_load_ubyte v120, v120, s[28:31], 0 offen offset:256
	s_nop 0
	buffer_load_ubyte v122, v122, s[28:31], 0 offen offset:256
	s_nop 0
	buffer_load_ubyte v130, v130, s[28:31], 0 offen offset:257
	s_nop 0
	buffer_load_ubyte v136, v136, s[28:31], 0 offen offset:256
	v_mul_hi_u32 v6, s46, v5
	v_mul_lo_u32 v7, s41, v6
	v_sub_u32_e32 v5, v5, v7
	v_cmp_le_u32_e32 vcc, s41, v5
	s_nop 1
	v_subbrev_co_u32_e32 v5, vcc, 0, v6, vcc
	v_mad_u64_u32 v[6:7], s[0:1], s44, v5, v[4:5]
	v_add_u32_e32 v5, v133, v150
	v_mul_hi_u32 v7, s46, v5
	v_mul_lo_u32 v10, s41, v7
	v_sub_u32_e32 v5, v5, v10
	v_cmp_le_u32_e32 vcc, s41, v5
	s_nop 1
	v_subbrev_co_u32_e32 v5, vcc, 0, v7, vcc
	v_mad_u64_u32 v[10:11], s[0:1], s44, v5, v[8:9]
	v_add_u32_e32 v5, s16, v148
	v_add_u32_e32 v5, 0x101, v5
	v_mul_hi_u32 v7, s46, v5
	v_mul_lo_u32 v11, s41, v7
	v_sub_u32_e32 v5, v5, v11
	v_cmp_le_u32_e32 vcc, s41, v5
	s_nop 1
	v_subbrev_co_u32_e32 v5, vcc, 0, v7, vcc
	v_mad_u64_u32 v[112:113], s[0:1], s44, v5, v[112:113]
	v_add3_u32 v5, v9, s16, 3
	v_mul_hi_u32 v7, s38, v5
	v_mul_lo_u32 v9, v7, s34
	v_sub_u32_e32 v5, v5, v9
	v_cmp_le_u32_e32 vcc, s34, v5
	s_nop 1
	v_subbrev_co_u32_e32 v5, vcc, 0, v7, vcc
	v_mad_u64_u32 v[114:115], s[0:1], s44, v5, v[116:117]
	v_add_u32_e32 v5, s16, v154
	v_add_u32_e32 v5, 0x100, v5
	v_mul_hi_u32 v7, s46, v5
	v_mul_lo_u32 v9, s41, v7
	v_sub_u32_e32 v5, v5, v9
	v_cmp_le_u32_e32 vcc, s41, v5
	s_nop 1
	v_subbrev_co_u32_e32 v5, vcc, 0, v7, vcc
	v_mad_u64_u32 v[4:5], s[0:1], s44, v5, v[4:5]
	v_add_u32_e32 v5, v133, v132
	v_mul_hi_u32 v7, s46, v5
	v_mul_lo_u32 v9, s41, v7
	v_sub_u32_e32 v5, v5, v9
	v_cmp_le_u32_e32 vcc, s41, v5
	s_nop 1
	v_subbrev_co_u32_e32 v5, vcc, 0, v7, vcc
	v_mad_u64_u32 v[8:9], s[0:1], s44, v5, v[8:9]
	buffer_load_ubyte v133, v6, s[28:31], 0 offen offset:256
	buffer_load_ubyte v138, v10, s[28:31], 0 offen offset:256
	buffer_load_ubyte v139, v112, s[28:31], 0 offen offset:257
	buffer_load_ubyte v126, v114, s[28:31], 0 offen offset:256
	buffer_load_ubyte v142, v4, s[28:31], 0 offen offset:256
	buffer_load_ubyte v143, v8, s[28:31], 0 offen offset:256
	v_add_u32_e32 v4, 0x10000, v127
	ds_read_b128 v[160:163], v4
	ds_read_b128 v[174:177], v4 offset:2048
	ds_read_b128 v[178:181], v4 offset:4096
	ds_read_b128 v[182:185], v4 offset:6144
	ds_read_b128 v[186:189], v4 offset:8192
	ds_read_b128 v[190:193], v4 offset:10240
	ds_read_b128 v[194:197], v4 offset:12288
	ds_read_b128 v[112:115], v170
	ds_read_b128 v[146:149], v170 offset:2048
	ds_read_b128 v[150:153], v170 offset:4096
	ds_read_b128 v[154:157], v170 offset:6144
	s_barrier
	s_setprio 1
	v_and_b32_e32 v116, 0xff, v158
	s_waitcnt lgkmcnt(0)
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[112:115], v[160:163], v[108:111], v172, v116 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_and_b32_e32 v108, 0xff, v167
	v_and_b32_e32 v109, 0xff, v134
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[146:149], v[160:163], v[80:83], v172, v116 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[112:115], v[174:177], v[104:107], v172, v108 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_and_b32_e32 v104, 0xff, v141
	v_and_b32_e32 v105, 0xff, v140
	v_and_b32_e32 v106, 0xff, v169
	v_and_b32_e32 v107, 0xff, v135
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], v[112:115], v[178:181], v[100:103], v172, v104 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], v[112:115], v[182:185], v[96:99], v172, v105 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[112:115], v[186:189], v[92:95], v172, v106 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[112:115], v[190:193], v[88:91], v172, v107 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[112:115], v[194:197], v[84:87], v172, v109 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[146:149], v[174:177], v[76:79], v172, v108 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[146:149], v[178:181], v[72:75], v172, v104 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[146:149], v[182:185], v[68:71], v172, v105 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[146:149], v[186:189], v[64:67], v172, v106 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[146:149], v[190:193], v[60:63], v172, v107 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[146:149], v[194:197], v[56:59], v172, v109 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt vmcnt(34)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[150:153], v[160:163], v[52:55], v165, v116 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[150:153], v[174:177], v[48:51], v165, v108 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[150:153], v[178:181], v[44:47], v165, v104 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[150:153], v[182:185], v[40:43], v165, v105 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[150:153], v[186:189], v[36:39], v165, v106 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[150:153], v[190:193], v[32:35], v165, v107 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[154:157], v[174:177], v[12:15], v165, v108 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[154:157], v[178:181], v[16:19], v165, v104 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[154:157], v[182:185], v[20:23], v165, v105 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[154:157], v[186:189], v[24:27], v165, v106 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[154:157], v[190:193], v[28:31], v165, v107 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[154:157], v[194:197], v[0:3], v165, v109 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[112:115], v[150:153], v[194:197], v[246:249], v165, v109 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], v[154:157], v[160:163], v[250:253], v165, v116 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_barrier
	v_add_u32_e32 v104, 0x10000, v129
	v_mov_b32_e32 v132, v166
	ds_read_b128 v[166:169], v104
	ds_read_b128 v[174:177], v104 offset:2048
	ds_read_b128 v[178:181], v104 offset:4096
	ds_read_b128 v[182:185], v104 offset:6144
	ds_read_b128 v[186:189], v104 offset:8192
	ds_read_b128 v[190:193], v104 offset:10240
	ds_read_b128 v[194:197], v104 offset:12288
	ds_read_b128 v[146:149], v144
	ds_read_b128 v[150:153], v144 offset:2048
	ds_read_b128 v[154:157], v144 offset:4096
	ds_read_b128 v[158:161], v144 offset:6144
	s_waitcnt vmcnt(16)
	s_barrier
	s_setprio 1
	v_and_b32_e32 v124, 0xff, v145
	s_waitcnt lgkmcnt(3)
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[108:111], v[146:149], v[166:169], v[4:7], v172, v124 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 2
	v_and_b32_e32 v4, 0xff, v240
	v_and_b32_e32 v5, 0xff, v241
	v_and_b32_e32 v6, 0xff, v242
	v_mfma_scale_f32_16x16x128_f8f6f4 v[104:107], v[146:149], v[174:177], v[8:11], v172, v4 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_and_b32_e32 v7, 0xff, v243
	s_nop 1
	v_and_b32_e32 v8, 0xff, v244
	v_and_b32_e32 v9, 0xff, v132
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], v[146:149], v[178:181], v[100:103], v172, v5 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], v[146:149], v[182:185], v[96:99], v172, v6 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[146:149], v[186:189], v[92:95], v172, v7 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[146:149], v[190:193], v[88:91], v172, v8 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[146:149], v[194:197], v[84:87], v172, v9 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[150:153], v[166:169], v[80:83], v172, v124 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[150:153], v[174:177], v[76:79], v172, v4 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[150:153], v[178:181], v[72:75], v172, v5 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[150:153], v[182:185], v[68:71], v172, v6 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[150:153], v[186:189], v[64:67], v172, v7 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[150:153], v[190:193], v[60:63], v172, v8 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[150:153], v[194:197], v[56:59], v172, v9 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[154:157], v[166:169], v[52:55], v165, v124 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[154:157], v[174:177], v[48:51], v165, v4 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[154:157], v[178:181], v[44:47], v165, v5 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[154:157], v[182:185], v[40:43], v165, v6 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[154:157], v[186:189], v[36:39], v165, v7 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[154:157], v[190:193], v[32:35], v165, v8 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[246:249], v[154:157], v[194:197], v[112:115], v165, v9 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[250:253], v[158:161], v[166:169], v[116:119], v165, v124 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[158:161], v[174:177], v[12:15], v165, v4 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[158:161], v[178:181], v[16:19], v165, v5 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[20:23], v[158:161], v[182:185], v[20:23], v165, v6 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[24:27], v[158:161], v[186:189], v[24:27], v165, v7 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[28:31], v[158:161], v[190:193], v[28:31], v165, v8 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[158:161], v[194:197], v[0:3], v165, v9 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_waitcnt vmcnt(15)
	v_mov_b32_e32 v172, v125
	s_waitcnt vmcnt(14)
	v_mov_b32_e32 v165, v128
	s_waitcnt vmcnt(13)
	v_mov_b32_e32 v158, v121
	s_waitcnt vmcnt(12)
	v_mov_b32_e32 v145, v123
	s_waitcnt vmcnt(11)
	v_mov_b32_e32 v167, v131
	s_waitcnt vmcnt(10)
	v_mov_b32_e32 v240, v137
	s_waitcnt vmcnt(9)
	v_mov_b32_e32 v141, v120
	s_waitcnt vmcnt(8)
	v_mov_b32_e32 v241, v122
	s_waitcnt vmcnt(7)
	v_mov_b32_e32 v140, v130
	s_waitcnt vmcnt(6)
	v_mov_b32_e32 v242, v136
	s_waitcnt vmcnt(5)
	v_mov_b32_e32 v169, v133
	s_waitcnt vmcnt(4)
	v_mov_b32_e32 v243, v138
	s_waitcnt vmcnt(3)
	v_mov_b32_e32 v135, v139
	s_waitcnt vmcnt(2)
	v_mov_b32_e32 v244, v126
	s_waitcnt vmcnt(1)
	v_mov_b32_e32 v134, v142
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v166, v143
	s_andn2_b64 vcc, exec, s[8:9]
	s_cbranch_vccnz .LBB0_17
.LBB0_16:
	s_barrier
.LBB0_17:
	s_waitcnt vmcnt(13)
	v_add_u32_e32 v4, s3, v127
	s_waitcnt vmcnt(12)
	v_add_u32_e32 v5, s3, v129
	s_waitcnt lgkmcnt(0)
	s_barrier
	ds_read_b128 v[154:157], v4
	ds_read_b128 v[174:177], v4 offset:2048
	ds_read_b128 v[178:181], v5
	s_waitcnt vmcnt(3)
	ds_read_b128 v[160:163], v4 offset:12288
	ds_read_b128 v[182:185], v5 offset:2048
	ds_read_b128 v[186:189], v5 offset:4096
	ds_read_b128 v[190:193], v4 offset:4096
	ds_read_b128 v[194:197], v4 offset:6144
	ds_read_b128 v[198:201], v5 offset:6144
	ds_read_b128 v[202:205], v5 offset:8192
	ds_read_b128 v[206:209], v4 offset:8192
	ds_read_b128 v[210:213], v4 offset:10240
	ds_read_b128 v[214:217], v5 offset:10240
	ds_read_b128 v[150:153], v5 offset:12288
	v_add_u32_e32 v4, s2, v170
	ds_read_b128 v[112:115], v4
	ds_read_b128 v[218:221], v4 offset:2048
	v_add_u32_e32 v5, s2, v144
	v_and_b32_e32 v128, 0xff, v158
	ds_read_b128 v[222:225], v5
	ds_read_b128 v[226:229], v5 offset:2048
	ds_read_b128 v[230:233], v4 offset:4096
	ds_read_b128 v[146:149], v4 offset:6144
	ds_read_b128 v[234:237], v5 offset:4096
	ds_read_b128 v[130:133], v5 offset:6144
	s_waitcnt lgkmcnt(7)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[112:115], v[154:157], v[108:111], v172, v128 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_and_b32_e32 v136, 0xff, v145
	v_and_b32_e32 v140, 0xff, v140
	v_and_b32_e32 v139, 0xff, v141
	s_waitcnt lgkmcnt(5)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[222:225], v[178:181], v[4:7], v172, v136 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_and_b32_e32 v137, 0xff, v167
	v_and_b32_e32 v142, 0xff, v242
	s_movk_i32 s0, 0x7fff
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], v[112:115], v[194:197], v[96:99], v172, v140 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_and_b32_e32 v141, 0xff, v241
	v_mov_b32_e32 v110, 0x7fc0
	s_nop 1
	v_cmp_o_f32_e32 vcc, v7, v7
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], v[112:115], v[190:193], v[100:103], v172, v139 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_and_b32_e32 v138, 0xff, v240
	v_and_b32_e32 v135, 0xff, v135
	v_and_b32_e32 v134, 0xff, v134
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[112:115], v[174:177], v[104:107], v172, v137 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_and_b32_e32 v144, 0xff, v244
	v_and_b32_e32 v145, 0xff, v166
	v_and_b32_e32 v129, 0xff, v169
	v_bfe_u32 v104, v7, 16, 1
	v_bfe_u32 v105, v6, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[120:123], v[222:225], v[198:201], v[96:99], v172, v142 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_and_b32_e32 v143, 0xff, v243
	s_mul_hi_u32 s1, s12, s14
	s_nop 0
	v_add3_u32 v96, v7, v104, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[116:119], v[222:225], v[186:189], v[100:103], v172, v141 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v96, 16, v96
	v_cndmask_b32_e32 v104, v110, v96, vcc
	v_cmp_o_f32_e32 vcc, v6, v6
	v_bfe_u32 v100, v5, 16, 1
	v_add3_u32 v102, v6, v105, s0
	v_add3_u32 v100, v5, v100, s0
	v_lshrrev_b32_e32 v97, 16, v102
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[222:225], v[182:185], v[8:11], v172, v138 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_bfe_u32 v101, v4, 16, 1
	v_lshrrev_b32_e32 v98, 16, v100
	v_cndmask_b32_e32 v105, v110, v97, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[112:115], v[210:213], v[88:91], v172, v135 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v5, v5
	v_add3_u32 v101, v4, v101, s0
	v_lshrrev_b32_e32 v99, 16, v101
	v_cndmask_b32_e32 v106, v110, v98, vcc
	v_cmp_o_f32_e32 vcc, v4, v4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[112:115], v[160:163], v[84:87], v172, v134 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 0
	v_cndmask_b32_e32 v107, v110, v99, vcc
	v_cmp_o_f32_e32 vcc, v11, v11
	v_mfma_scale_f32_16x16x128_f8f6f4 v[100:103], v[222:225], v[214:217], v[88:91], v172, v144 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_bfe_u32 v84, v8, 16, 1
	v_add3_u32 v84, v8, v84, s0
	s_nop 0
	v_bfe_u32 v88, v11, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[96:99], v[222:225], v[150:153], v[4:7], v172, v145 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_bfe_u32 v89, v10, 16, 1
	v_bfe_u32 v90, v9, 16, 1
	v_add3_u32 v85, v9, v90, s0
	v_add3_u32 v4, v11, v88, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[112:115], v[206:209], v[92:95], v172, v129 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v87, 16, v4
	v_add3_u32 v86, v10, v89, s0
	v_cndmask_b32_e32 v108, v110, v87, vcc
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[218:221], v[154:157], v[80:83], v172, v128 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v10, v10
	v_bfe_u32 v10, v117, 16, 1
	v_bfe_u32 v11, v116, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[124:127], v[222:225], v[202:205], v[92:95], v172, v143 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v80, 16, v86
	v_lshrrev_b32_e32 v81, 16, v85
	v_cndmask_b32_e32 v109, v110, v80, vcc
	s_waitcnt lgkmcnt(4)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[92:95], v[226:229], v[178:181], v[4:7], v172, v136 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v9, v9
	v_lshrrev_b32_e32 v82, 16, v84
	v_bfe_u32 v9, v118, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[218:221], v[174:177], v[76:79], v172, v137 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v111, v110, v81, vcc
	v_cmp_o_f32_e32 vcc, v8, v8
	v_bfe_u32 v8, v119, 16, 1
	v_mfma_scale_f32_16x16x128_f8f6f4 v[88:91], v[226:229], v[182:185], v[4:7], v172, v138 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v112, v110, v82, vcc
	v_cmp_o_f32_e32 vcc, v119, v119
	v_add3_u32 v9, v118, v9, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[218:221], v[190:193], v[72:75], v172, v139 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add3_u32 v10, v117, v10, s0
	v_lshrrev_b32_e32 v9, 16, v9
	v_add3_u32 v11, v116, v11, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[84:87], v[226:229], v[186:189], v[4:7], v172, v141 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v10, 16, v10
	v_lshrrev_b32_e32 v11, 16, v11
	s_nop 1
	v_add3_u32 v4, v119, v8, s0
	v_lshrrev_b32_e32 v8, 16, v4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[218:221], v[194:197], v[68:71], v172, v140 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v113, v110, v8, vcc
	v_bfe_u32 v8, v123, 16, 1
	v_cmp_o_f32_e32 vcc, v118, v118
	v_mfma_scale_f32_16x16x128_f8f6f4 v[80:83], v[226:229], v[198:201], v[4:7], v172, v142 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	s_nop 0
	v_cndmask_b32_e32 v114, v110, v9, vcc
	v_cmp_o_f32_e32 vcc, v117, v117
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[218:221], v[206:209], v[64:67], v172, v129 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_bfe_u32 v9, v122, 16, 1
	v_cndmask_b32_e32 v115, v110, v10, vcc
	v_cmp_o_f32_e32 vcc, v116, v116
	v_mfma_scale_f32_16x16x128_f8f6f4 v[76:79], v[226:229], v[202:205], v[4:7], v172, v143 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_bfe_u32 v10, v121, 16, 1
	v_cndmask_b32_e32 v116, v110, v11, vcc
	v_cmp_o_f32_e32 vcc, v123, v123
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[218:221], v[210:213], v[60:63], v172, v135 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add3_u32 v9, v122, v9, s0
	v_bfe_u32 v11, v120, 16, 1
	v_add3_u32 v10, v121, v10, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[72:75], v[226:229], v[214:217], v[4:7], v172, v144 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v9, 16, v9
	v_add3_u32 v11, v120, v11, s0
	v_lshrrev_b32_e32 v10, 16, v10
	s_nop 0
	v_add3_u32 v4, v123, v8, s0
	v_lshrrev_b32_e32 v8, 16, v4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[218:221], v[160:163], v[56:59], v172, v134 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v117, v110, v8, vcc
	v_bfe_u32 v8, v127, 16, 1
	v_cmp_o_f32_e32 vcc, v122, v122
	v_mfma_scale_f32_16x16x128_f8f6f4 v[68:71], v[226:229], v[150:153], v[4:7], v172, v145 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v11, 16, v11
	v_cndmask_b32_e32 v118, v110, v9, vcc
	v_cmp_o_f32_e32 vcc, v121, v121
	s_waitcnt vmcnt(0) lgkmcnt(3)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[230:233], v[154:157], v[52:55], v165, v128 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_bfe_u32 v9, v126, 16, 1
	v_cndmask_b32_e32 v119, v110, v10, vcc
	v_cmp_o_f32_e32 vcc, v120, v120
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[64:67], v[234:237], v[178:181], v[4:7], v165, v136 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_bfe_u32 v10, v125, 16, 1
	v_cndmask_b32_e32 v120, v110, v11, vcc
	v_cmp_o_f32_e32 vcc, v127, v127
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[230:233], v[174:177], v[48:51], v165, v137 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_add3_u32 v9, v126, v9, s0
	v_bfe_u32 v11, v124, 16, 1
	v_add3_u32 v10, v125, v10, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[60:63], v[234:237], v[182:185], v[4:7], v165, v138 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v9, 16, v9
	v_add3_u32 v11, v124, v11, s0
	v_lshrrev_b32_e32 v10, 16, v10
	s_nop 0
	v_add3_u32 v4, v127, v8, s0
	v_lshrrev_b32_e32 v8, 16, v4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[230:233], v[190:193], v[44:47], v165, v139 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v121, v110, v8, vcc
	v_bfe_u32 v8, v103, 16, 1
	v_cmp_o_f32_e32 vcc, v126, v126
	v_mfma_scale_f32_16x16x128_f8f6f4 v[56:59], v[234:237], v[186:189], v[4:7], v165, v141 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v11, 16, v11
	v_cndmask_b32_e32 v122, v110, v9, vcc
	v_cmp_o_f32_e32 vcc, v125, v125
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[230:233], v[194:197], v[40:43], v165, v140 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_bfe_u32 v9, v102, 16, 1
	v_cndmask_b32_e32 v123, v110, v10, vcc
	v_cmp_o_f32_e32 vcc, v124, v124
	v_mfma_scale_f32_16x16x128_f8f6f4 v[52:55], v[234:237], v[198:201], v[4:7], v165, v142 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_bfe_u32 v10, v101, 16, 1
	v_cndmask_b32_e32 v124, v110, v11, vcc
	v_add3_u32 v9, v102, v9, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[230:233], v[206:209], v[36:39], v165, v129 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v103, v103
	v_bfe_u32 v11, v100, 16, 1
	v_add3_u32 v10, v101, v10, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[48:51], v[234:237], v[202:205], v[4:7], v165, v143 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_lshrrev_b32_e32 v9, 16, v9
	v_add3_u32 v11, v100, v11, s0
	v_lshrrev_b32_e32 v125, 16, v10
	s_nop 0
	v_add3_u32 v4, v103, v8, s0
	v_lshrrev_b32_e32 v8, 16, v4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[230:233], v[210:213], v[32:35], v165, v135 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v103, v110, v8, vcc
	v_cmp_o_f32_e32 vcc, v102, v102
	v_lshrrev_b32_e32 v126, 16, v11
	v_mfma_scale_f32_16x16x128_f8f6f4 v[44:47], v[234:237], v[214:217], v[4:7], v165, v144 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v102, v110, v9, vcc
	v_cmp_o_f32_e32 vcc, v101, v101
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[230:233], v[160:163], v[246:249], v165, v134 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[40:43], v[234:237], v[150:153], v[4:7], v165, v145 op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[146:149], v[154:157], v[250:253], v165, v128 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[36:39], v[130:133], v[178:181], v[4:7], v165, v136 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[146:149], v[174:177], v[12:15], v165, v137 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[32:35], v[130:133], v[182:185], v[4:7], v165, v138 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[146:149], v[190:193], v[16:19], v165, v139 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[16:19], v[130:133], v[186:189], v[4:7], v165, v141 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[146:149], v[194:197], v[20:23], v165, v140 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_nop 2
	v_bfe_u32 v22, v99, 16, 1
	v_cndmask_b32_e32 v20, v110, v125, vcc
	v_cmp_o_f32_e32 vcc, v100, v100
	v_bfe_u32 v23, v98, 16, 1
	v_add3_u32 v22, v99, v22, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[12:15], v[130:133], v[198:201], v[4:7], v165, v142 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v21, v110, v126, vcc
	v_add3_u32 v23, v98, v23, s0
	v_lshrrev_b32_e32 v22, 16, v22
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[146:149], v[206:209], v[24:27], v165, v129 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v99, v99
	v_lshrrev_b32_e32 v23, 16, v23
	s_nop 0
	v_bfe_u32 v24, v97, 16, 1
	v_bfe_u32 v25, v96, 16, 1
	v_add3_u32 v24, v97, v24, s0
	v_cndmask_b32_e32 v22, v110, v22, vcc
	v_cmp_o_f32_e32 vcc, v98, v98
	v_add3_u32 v25, v96, v25, s0
	v_lshrrev_b32_e32 v24, 16, v24
	v_cndmask_b32_e32 v23, v110, v23, vcc
	v_cmp_o_f32_e32 vcc, v97, v97
	v_bfe_u32 v26, v95, 16, 1
	v_lshrrev_b32_e32 v25, 16, v25
	v_cndmask_b32_e32 v24, v110, v24, vcc
	v_cmp_o_f32_e32 vcc, v96, v96
	v_bfe_u32 v27, v94, 16, 1
	v_add3_u32 v26, v95, v26, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[8:11], v[130:133], v[202:205], v[4:7], v165, v143 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v25, v110, v25, vcc
	v_add3_u32 v27, v94, v27, s0
	v_lshrrev_b32_e32 v26, 16, v26
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[146:149], v[210:213], v[28:31], v165, v135 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cmp_o_f32_e32 vcc, v95, v95
	v_lshrrev_b32_e32 v27, 16, v27
	s_nop 0
	v_bfe_u32 v28, v93, 16, 1
	v_bfe_u32 v29, v92, 16, 1
	v_add3_u32 v28, v93, v28, s0
	v_cndmask_b32_e32 v26, v110, v26, vcc
	v_cmp_o_f32_e32 vcc, v94, v94
	v_add3_u32 v29, v92, v29, s0
	v_lshrrev_b32_e32 v28, 16, v28
	v_cndmask_b32_e32 v27, v110, v27, vcc
	v_cmp_o_f32_e32 vcc, v93, v93
	v_bfe_u32 v30, v91, 16, 1
	v_lshrrev_b32_e32 v29, 16, v29
	v_cndmask_b32_e32 v28, v110, v28, vcc
	v_cmp_o_f32_e32 vcc, v92, v92
	v_bfe_u32 v31, v90, 16, 1
	v_add3_u32 v30, v91, v30, s0
	v_cndmask_b32_e32 v29, v110, v29, vcc
	v_bfe_u32 v92, v89, 16, 1
	v_add3_u32 v31, v90, v31, s0
	v_lshrrev_b32_e32 v30, 16, v30
	v_cmp_o_f32_e32 vcc, v91, v91
	v_bfe_u32 v93, v88, 16, 1
	v_add3_u32 v92, v89, v92, s0
	v_lshrrev_b32_e32 v31, 16, v31
	v_cndmask_b32_e32 v30, v110, v30, vcc
	v_cmp_o_f32_e32 vcc, v90, v90
	v_add3_u32 v93, v88, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v31, v110, v31, vcc
	v_cmp_o_f32_e32 vcc, v89, v89
	v_bfe_u32 v90, v87, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v89, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v88, v88
	v_bfe_u32 v91, v86, 16, 1
	v_add3_u32 v90, v87, v90, s0
	v_cndmask_b32_e32 v88, v110, v93, vcc
	v_bfe_u32 v92, v85, 16, 1
	v_add3_u32 v91, v86, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v87, v87
	v_bfe_u32 v93, v84, 16, 1
	v_add3_u32 v92, v85, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v87, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v86, v86
	v_add3_u32 v93, v84, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v86, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v85, v85
	v_bfe_u32 v90, v83, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v85, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v84, v84
	v_bfe_u32 v91, v82, 16, 1
	v_add3_u32 v90, v83, v90, s0
	v_cndmask_b32_e32 v84, v110, v93, vcc
	v_bfe_u32 v92, v81, 16, 1
	v_add3_u32 v91, v82, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v83, v83
	v_bfe_u32 v93, v80, 16, 1
	v_add3_u32 v92, v81, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v83, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v82, v82
	v_add3_u32 v93, v80, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v82, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v81, v81
	v_bfe_u32 v90, v79, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v81, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v80, v80
	v_bfe_u32 v91, v78, 16, 1
	v_add3_u32 v90, v79, v90, s0
	v_cndmask_b32_e32 v80, v110, v93, vcc
	v_bfe_u32 v92, v77, 16, 1
	v_add3_u32 v91, v78, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v79, v79
	v_bfe_u32 v93, v76, 16, 1
	v_add3_u32 v92, v77, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v79, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v78, v78
	v_add3_u32 v93, v76, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v78, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v77, v77
	v_bfe_u32 v90, v75, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v77, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v76, v76
	v_bfe_u32 v91, v74, 16, 1
	v_add3_u32 v90, v75, v90, s0
	v_cndmask_b32_e32 v76, v110, v93, vcc
	v_bfe_u32 v92, v73, 16, 1
	v_add3_u32 v91, v74, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v75, v75
	v_bfe_u32 v93, v72, 16, 1
	v_add3_u32 v92, v73, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v75, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v74, v74
	v_add3_u32 v93, v72, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v74, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v73, v73
	v_bfe_u32 v90, v71, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v73, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v72, v72
	v_bfe_u32 v91, v70, 16, 1
	v_add3_u32 v90, v71, v90, s0
	v_cndmask_b32_e32 v72, v110, v93, vcc
	v_bfe_u32 v92, v69, 16, 1
	v_add3_u32 v91, v70, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v71, v71
	v_bfe_u32 v93, v68, 16, 1
	v_add3_u32 v92, v69, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v71, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v70, v70
	v_add3_u32 v93, v68, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v70, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v69, v69
	v_bfe_u32 v90, v67, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v69, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v68, v68
	v_bfe_u32 v91, v66, 16, 1
	v_add3_u32 v90, v67, v90, s0
	v_cndmask_b32_e32 v68, v110, v93, vcc
	v_bfe_u32 v92, v65, 16, 1
	v_add3_u32 v91, v66, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v67, v67
	v_bfe_u32 v93, v64, 16, 1
	v_add3_u32 v92, v65, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v67, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v66, v66
	v_add3_u32 v93, v64, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v66, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v65, v65
	v_bfe_u32 v90, v63, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v65, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v64, v64
	v_bfe_u32 v91, v62, 16, 1
	v_add3_u32 v90, v63, v90, s0
	v_cndmask_b32_e32 v64, v110, v93, vcc
	v_bfe_u32 v92, v61, 16, 1
	v_add3_u32 v91, v62, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v63, v63
	v_bfe_u32 v93, v60, 16, 1
	v_add3_u32 v92, v61, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v63, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v62, v62
	v_add3_u32 v93, v60, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v62, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v61, v61
	v_bfe_u32 v90, v59, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v61, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v60, v60
	v_bfe_u32 v91, v58, 16, 1
	v_add3_u32 v90, v59, v90, s0
	v_cndmask_b32_e32 v60, v110, v93, vcc
	v_bfe_u32 v92, v57, 16, 1
	v_add3_u32 v91, v58, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v59, v59
	v_bfe_u32 v93, v56, 16, 1
	v_add3_u32 v92, v57, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v59, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v58, v58
	v_add3_u32 v93, v56, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v58, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v57, v57
	v_bfe_u32 v90, v55, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v57, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v56, v56
	v_bfe_u32 v91, v54, 16, 1
	v_add3_u32 v90, v55, v90, s0
	v_cndmask_b32_e32 v56, v110, v93, vcc
	v_bfe_u32 v92, v53, 16, 1
	v_add3_u32 v91, v54, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v55, v55
	v_bfe_u32 v93, v52, 16, 1
	v_add3_u32 v92, v53, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v55, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v54, v54
	v_add3_u32 v93, v52, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v54, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v53, v53
	v_bfe_u32 v90, v51, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v53, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v52, v52
	v_bfe_u32 v91, v50, 16, 1
	v_add3_u32 v90, v51, v90, s0
	v_cndmask_b32_e32 v52, v110, v93, vcc
	v_bfe_u32 v92, v49, 16, 1
	v_add3_u32 v91, v50, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v51, v51
	v_bfe_u32 v93, v48, 16, 1
	v_add3_u32 v92, v49, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v51, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v50, v50
	v_add3_u32 v93, v48, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v50, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v49, v49
	v_bfe_u32 v90, v47, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v49, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v48, v48
	v_bfe_u32 v91, v46, 16, 1
	v_add3_u32 v90, v47, v90, s0
	v_cndmask_b32_e32 v48, v110, v93, vcc
	v_bfe_u32 v92, v45, 16, 1
	v_add3_u32 v91, v46, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v47, v47
	v_bfe_u32 v93, v44, 16, 1
	v_add3_u32 v92, v45, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v47, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v46, v46
	v_add3_u32 v93, v44, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v46, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v45, v45
	v_bfe_u32 v90, v43, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v45, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v44, v44
	v_bfe_u32 v91, v42, 16, 1
	v_add3_u32 v90, v43, v90, s0
	v_cndmask_b32_e32 v44, v110, v93, vcc
	v_bfe_u32 v92, v41, 16, 1
	v_add3_u32 v91, v42, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v43, v43
	v_bfe_u32 v93, v40, 16, 1
	v_add3_u32 v92, v41, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v43, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v42, v42
	v_add3_u32 v93, v40, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v42, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v41, v41
	v_bfe_u32 v90, v39, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v41, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v40, v40
	v_bfe_u32 v91, v38, 16, 1
	v_add3_u32 v90, v39, v90, s0
	v_cndmask_b32_e32 v40, v110, v93, vcc
	v_bfe_u32 v92, v37, 16, 1
	v_add3_u32 v91, v38, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v39, v39
	v_bfe_u32 v93, v36, 16, 1
	v_add3_u32 v92, v37, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v39, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v38, v38
	v_add3_u32 v93, v36, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v38, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v37, v37
	v_bfe_u32 v90, v35, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v37, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v36, v36
	v_bfe_u32 v91, v34, 16, 1
	v_add3_u32 v90, v35, v90, s0
	v_cndmask_b32_e32 v36, v110, v93, vcc
	v_bfe_u32 v92, v33, 16, 1
	v_add3_u32 v91, v34, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v35, v35
	v_bfe_u32 v93, v32, 16, 1
	v_add3_u32 v92, v33, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v35, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v34, v34
	v_add3_u32 v93, v32, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v34, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v33, v33
	v_bfe_u32 v90, v19, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v33, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v32, v32
	v_bfe_u32 v91, v18, 16, 1
	v_add3_u32 v90, v19, v90, s0
	v_cndmask_b32_e32 v32, v110, v93, vcc
	v_bfe_u32 v92, v17, 16, 1
	v_add3_u32 v91, v18, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v19, v19
	v_bfe_u32 v93, v16, 16, 1
	v_add3_u32 v92, v17, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v19, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v18, v18
	v_add3_u32 v93, v16, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v18, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v17, v17
	v_bfe_u32 v90, v15, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v17, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v16, v16
	v_bfe_u32 v91, v14, 16, 1
	v_add3_u32 v90, v15, v90, s0
	v_cndmask_b32_e32 v16, v110, v93, vcc
	v_bfe_u32 v92, v13, 16, 1
	v_add3_u32 v91, v14, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v15, v15
	v_bfe_u32 v93, v12, 16, 1
	v_add3_u32 v92, v13, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v15, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v14, v14
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[130:133], v[214:217], v[4:7], v165, v144 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_add3_u32 v93, v12, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v14, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v13, v13
	v_bfe_u32 v90, v11, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v13, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v12, v12
	v_bfe_u32 v91, v10, 16, 1
	v_add3_u32 v90, v11, v90, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[146:149], v[160:163], v[0:3], v165, v134 op_sel:[1,0,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v12, v110, v93, vcc
	v_bfe_u32 v92, v9, 16, 1
	v_add3_u32 v91, v10, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v11, v11
	v_bfe_u32 v93, v8, 16, 1
	v_add3_u32 v92, v9, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v11, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v10, v10
	v_add3_u32 v93, v8, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v10, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v9, v9
	v_bfe_u32 v90, v7, 16, 1
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v9, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v8, v8
	v_bfe_u32 v91, v6, 16, 1
	v_add3_u32 v90, v7, v90, s0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[130:133], v[150:153], v[0:3], v165, v145 op_sel:[1,0,0] op_sel_hi:[1,0,0] cbsz:4 blgp:4
	v_cndmask_b32_e32 v8, v110, v93, vcc
	v_bfe_u32 v92, v5, 16, 1
	v_add3_u32 v91, v6, v91, s0
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v7, v7
	v_bfe_u32 v93, v4, 16, 1
	v_add3_u32 v92, v5, v92, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v7, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v6, v6
	v_add3_u32 v93, v4, v93, s0
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v6, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v5, v5
	v_lshrrev_b32_e32 v93, 16, v93
	v_bfe_u32 v90, v3, 16, 1
	v_cndmask_b32_e32 v5, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v4, v4
	v_bfe_u32 v91, v2, 16, 1
	v_bfe_u32 v92, v1, 16, 1
	v_cndmask_b32_e32 v4, v110, v93, vcc
	v_bfe_u32 v93, v0, 16, 1
	v_add3_u32 v93, v0, v93, s0
	v_add3_u32 v92, v1, v92, s0
	v_add3_u32 v91, v2, v91, s0
	v_add3_u32 v90, v3, v90, s0
	s_mul_i32 s0, s12, s15
	s_add_i32 s0, s1, s0
	s_mul_i32 s1, s13, s14
	s_add_i32 s1, s0, s1
	s_mul_i32 s0, s12, s14
	s_lshl_b64 s[0:1], s[0:1], 1
	v_lshrrev_b32_e32 v90, 16, v90
	v_cmp_o_f32_e32 vcc, v3, v3
	s_add_u32 s2, s10, s0
	v_lshrrev_b32_e32 v91, 16, v91
	v_cndmask_b32_e32 v3, v110, v90, vcc
	v_cmp_o_f32_e32 vcc, v2, v2
	v_lshl_or_b32 v90, v239, 2, v171
	s_addc_u32 s3, s11, s1
	s_lshl_b64 s[0:1], s[18:19], 1
	v_lshrrev_b32_e32 v92, 16, v92
	v_cndmask_b32_e32 v2, v110, v91, vcc
	v_cmp_o_f32_e32 vcc, v1, v1
	v_mul_lo_u32 v90, s12, v90
	s_add_u32 s0, s2, s0
	v_lshlrev_b32_e32 v91, 1, v238
	v_lshrrev_b32_e32 v93, 16, v93
	v_cndmask_b32_e32 v1, v110, v92, vcc
	v_cmp_o_f32_e32 vcc, v0, v0
	s_addc_u32 s1, s3, s1
	s_and_b32 s2, s12, 0x3fff
	v_lshl_add_u32 v92, v90, 1, v91
	s_lshl_b32 s4, s12, 1
	v_cndmask_b32_e32 v0, v110, v93, vcc
	s_lshl_b32 s2, s2, 16
	s_and_b32 s1, s1, 0xffff
	v_add_u32_e32 v93, s4, v92
	s_or_b32 s1, s2, s1
	v_add_u32_e32 v94, s4, v93
	s_or_b32 s1, s1, 2.0
	s_mov_b32 s3, 0x27000
	s_mov_b32 s2, 0x7ffffffd
	v_add_u32_e32 v95, s4, v94
	s_lshl_b32 s5, s12, 4
	buffer_store_short v107, v92, s[0:3], 0 offen
	buffer_store_short v106, v93, s[0:3], 0 offen
	buffer_store_short v105, v94, s[0:3], 0 offen
	buffer_store_short v104, v95, s[0:3], 0 offen
	buffer_store_short v112, v92, s[0:3], 0 offen offset:32
	buffer_store_short v111, v93, s[0:3], 0 offen offset:32
	buffer_store_short v109, v94, s[0:3], 0 offen offset:32
	buffer_store_short v108, v95, s[0:3], 0 offen offset:32
	buffer_store_short v116, v92, s[0:3], 0 offen offset:64
	buffer_store_short v115, v93, s[0:3], 0 offen offset:64
	buffer_store_short v114, v94, s[0:3], 0 offen offset:64
	buffer_store_short v113, v95, s[0:3], 0 offen offset:64
	buffer_store_short v120, v92, s[0:3], 0 offen offset:96
	buffer_store_short v119, v93, s[0:3], 0 offen offset:96
	buffer_store_short v118, v94, s[0:3], 0 offen offset:96
	buffer_store_short v117, v95, s[0:3], 0 offen offset:96
	buffer_store_short v124, v92, s[0:3], 0 offen offset:128
	buffer_store_short v123, v93, s[0:3], 0 offen offset:128
	buffer_store_short v122, v94, s[0:3], 0 offen offset:128
	buffer_store_short v121, v95, s[0:3], 0 offen offset:128
	buffer_store_short v21, v92, s[0:3], 0 offen offset:160
	buffer_store_short v20, v93, s[0:3], 0 offen offset:160
	buffer_store_short v102, v94, s[0:3], 0 offen offset:160
	buffer_store_short v103, v95, s[0:3], 0 offen offset:160
	buffer_store_short v25, v92, s[0:3], 0 offen offset:192
	buffer_store_short v24, v93, s[0:3], 0 offen offset:192
	buffer_store_short v23, v94, s[0:3], 0 offen offset:192
	buffer_store_short v22, v95, s[0:3], 0 offen offset:192
	v_add_u32_e32 v20, s5, v90
	v_lshl_add_u32 v21, v20, 1, v91
	v_add_u32_e32 v22, s4, v21
	v_add_u32_e32 v23, s4, v22
	v_add_u32_e32 v24, s4, v23
	v_add_u32_e32 v20, s5, v20
	buffer_store_short v29, v21, s[0:3], 0 offen
	buffer_store_short v28, v22, s[0:3], 0 offen
	buffer_store_short v27, v23, s[0:3], 0 offen
	buffer_store_short v26, v24, s[0:3], 0 offen
	buffer_store_short v88, v21, s[0:3], 0 offen offset:32
	buffer_store_short v89, v22, s[0:3], 0 offen offset:32
	buffer_store_short v31, v23, s[0:3], 0 offen offset:32
	buffer_store_short v30, v24, s[0:3], 0 offen offset:32
	buffer_store_short v84, v21, s[0:3], 0 offen offset:64
	buffer_store_short v85, v22, s[0:3], 0 offen offset:64
	buffer_store_short v86, v23, s[0:3], 0 offen offset:64
	buffer_store_short v87, v24, s[0:3], 0 offen offset:64
	buffer_store_short v80, v21, s[0:3], 0 offen offset:96
	buffer_store_short v81, v22, s[0:3], 0 offen offset:96
	buffer_store_short v82, v23, s[0:3], 0 offen offset:96
	buffer_store_short v83, v24, s[0:3], 0 offen offset:96
	buffer_store_short v76, v21, s[0:3], 0 offen offset:128
	buffer_store_short v77, v22, s[0:3], 0 offen offset:128
	buffer_store_short v78, v23, s[0:3], 0 offen offset:128
	buffer_store_short v79, v24, s[0:3], 0 offen offset:128
	buffer_store_short v72, v21, s[0:3], 0 offen offset:160
	buffer_store_short v73, v22, s[0:3], 0 offen offset:160
	buffer_store_short v74, v23, s[0:3], 0 offen offset:160
	buffer_store_short v75, v24, s[0:3], 0 offen offset:160
	buffer_store_short v68, v21, s[0:3], 0 offen offset:192
	buffer_store_short v69, v22, s[0:3], 0 offen offset:192
	buffer_store_short v70, v23, s[0:3], 0 offen offset:192
	buffer_store_short v71, v24, s[0:3], 0 offen offset:192
	v_lshl_add_u32 v21, v20, 1, v91
	v_add_u32_e32 v22, s4, v21
	v_add_u32_e32 v23, s4, v22
	v_add_u32_e32 v20, s5, v20
	v_add_u32_e32 v24, s4, v23
	v_lshl_add_u32 v20, v20, 1, v91
	buffer_store_short v64, v21, s[0:3], 0 offen
	buffer_store_short v65, v22, s[0:3], 0 offen
	buffer_store_short v66, v23, s[0:3], 0 offen
	buffer_store_short v67, v24, s[0:3], 0 offen
	buffer_store_short v60, v21, s[0:3], 0 offen offset:32
	buffer_store_short v61, v22, s[0:3], 0 offen offset:32
	buffer_store_short v62, v23, s[0:3], 0 offen offset:32
	buffer_store_short v63, v24, s[0:3], 0 offen offset:32
	buffer_store_short v56, v21, s[0:3], 0 offen offset:64
	buffer_store_short v57, v22, s[0:3], 0 offen offset:64
	buffer_store_short v58, v23, s[0:3], 0 offen offset:64
	buffer_store_short v59, v24, s[0:3], 0 offen offset:64
	buffer_store_short v52, v21, s[0:3], 0 offen offset:96
	buffer_store_short v53, v22, s[0:3], 0 offen offset:96
	buffer_store_short v54, v23, s[0:3], 0 offen offset:96
	buffer_store_short v55, v24, s[0:3], 0 offen offset:96
	buffer_store_short v48, v21, s[0:3], 0 offen offset:128
	buffer_store_short v49, v22, s[0:3], 0 offen offset:128
	buffer_store_short v50, v23, s[0:3], 0 offen offset:128
	buffer_store_short v51, v24, s[0:3], 0 offen offset:128
	buffer_store_short v44, v21, s[0:3], 0 offen offset:160
	buffer_store_short v45, v22, s[0:3], 0 offen offset:160
	buffer_store_short v46, v23, s[0:3], 0 offen offset:160
	buffer_store_short v47, v24, s[0:3], 0 offen offset:160
	buffer_store_short v40, v21, s[0:3], 0 offen offset:192
	buffer_store_short v41, v22, s[0:3], 0 offen offset:192
	buffer_store_short v42, v23, s[0:3], 0 offen offset:192
	buffer_store_short v43, v24, s[0:3], 0 offen offset:192
	v_add_u32_e32 v21, s4, v20
	v_add_u32_e32 v22, s4, v21
	v_add_u32_e32 v23, s4, v22
	buffer_store_short v36, v20, s[0:3], 0 offen
	buffer_store_short v37, v21, s[0:3], 0 offen
	buffer_store_short v38, v22, s[0:3], 0 offen
	buffer_store_short v39, v23, s[0:3], 0 offen
	buffer_store_short v32, v20, s[0:3], 0 offen offset:32
	buffer_store_short v33, v21, s[0:3], 0 offen offset:32
	buffer_store_short v34, v22, s[0:3], 0 offen offset:32
	buffer_store_short v35, v23, s[0:3], 0 offen offset:32
	buffer_store_short v16, v20, s[0:3], 0 offen offset:64
	buffer_store_short v17, v21, s[0:3], 0 offen offset:64
	buffer_store_short v18, v22, s[0:3], 0 offen offset:64
	buffer_store_short v19, v23, s[0:3], 0 offen offset:64
	buffer_store_short v12, v20, s[0:3], 0 offen offset:96
	buffer_store_short v13, v21, s[0:3], 0 offen offset:96
	buffer_store_short v14, v22, s[0:3], 0 offen offset:96
	buffer_store_short v15, v23, s[0:3], 0 offen offset:96
	buffer_store_short v8, v20, s[0:3], 0 offen offset:128
	buffer_store_short v9, v21, s[0:3], 0 offen offset:128
	buffer_store_short v10, v22, s[0:3], 0 offen offset:128
	buffer_store_short v11, v23, s[0:3], 0 offen offset:128
	buffer_store_short v4, v20, s[0:3], 0 offen offset:160
	buffer_store_short v5, v21, s[0:3], 0 offen offset:160
	buffer_store_short v6, v22, s[0:3], 0 offen offset:160
	buffer_store_short v7, v23, s[0:3], 0 offen offset:160
	buffer_store_short v0, v20, s[0:3], 0 offen offset:192
	buffer_store_short v1, v21, s[0:3], 0 offen offset:192
	buffer_store_short v2, v22, s[0:3], 0 offen offset:192
	buffer_store_short v3, v23, s[0:3], 0 offen offset:192
	s_endpgm
.LBB0_18:
	s_branch .LBB0_2
.LBB0_19:
	s_load_dwordx2 s[40:41], s[0:1], 0x48
	s_mul_hi_u32 s19, s12, 0xe0
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
	v_mov_b64_e32 v[30:31], v[2:3]
	v_mov_b64_e32 v[26:27], v[2:3]
	v_mov_b64_e32 v[22:23], v[2:3]
	v_mov_b64_e32 v[18:19], v[2:3]
	v_mov_b64_e32 v[14:15], v[2:3]
	v_mov_b64_e32 v[252:253], v[2:3]
	v_mov_b64_e32 v[248:249], v[2:3]
	v_mov_b64_e32 v[34:35], v[2:3]
	v_mov_b64_e32 v[38:39], v[2:3]
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
	v_mov_b64_e32 v[82:83], v[2:3]
	v_mov_b64_e32 v[86:87], v[2:3]
	v_mov_b64_e32 v[90:91], v[2:3]
	v_mov_b64_e32 v[94:95], v[2:3]
	v_mov_b64_e32 v[98:99], v[2:3]
	v_mov_b64_e32 v[102:103], v[2:3]
	v_mov_b64_e32 v[106:107], v[2:3]
	v_mov_b64_e32 v[110:111], v[2:3]
	v_mov_b64_e32 v[28:29], v[0:1]
	v_mov_b64_e32 v[24:25], v[0:1]
	v_mov_b64_e32 v[20:21], v[0:1]
	v_mov_b64_e32 v[16:17], v[0:1]
	v_mov_b64_e32 v[12:13], v[0:1]
	v_mov_b64_e32 v[250:251], v[0:1]
	v_mov_b64_e32 v[246:247], v[0:1]
	v_mov_b64_e32 v[32:33], v[0:1]
	v_mov_b64_e32 v[36:37], v[0:1]
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
	v_mov_b64_e32 v[80:81], v[0:1]
	v_mov_b64_e32 v[84:85], v[0:1]
	v_mov_b64_e32 v[88:89], v[0:1]
	v_mov_b64_e32 v[92:93], v[0:1]
	v_mov_b64_e32 v[96:97], v[0:1]
	v_mov_b64_e32 v[100:101], v[0:1]
	v_mov_b64_e32 v[104:105], v[0:1]
	v_mov_b64_e32 v[108:109], v[0:1]
	v_cmp_gt_i64_e64 s[0:1], s[50:51], 0
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccnz .LBB0_15
.LBB0_22:
	s_mov_b32 s3, 0x10000
	s_mov_b32 s2, 0
	s_andn2_b64 vcc, exec, s[8:9]
	s_cbranch_vccnz .LBB0_17
	s_branch .LBB0_16
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel wave_mxfp4_dynamic_gemm_256x224x256
		.amdhsa_group_segment_fixed_size 122880
		.amdhsa_private_segment_fixed_size 524
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
		.amdhsa_next_free_sgpr 98
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
	.size	wave_mxfp4_dynamic_gemm_256x224x256, .Lfunc_end0-wave_mxfp4_dynamic_gemm_256x224x256

	.set wave_mxfp4_dynamic_gemm_256x224x256.num_vgpr, 256
	.set wave_mxfp4_dynamic_gemm_256x224x256.num_agpr, 0
	.set wave_mxfp4_dynamic_gemm_256x224x256.numbered_sgpr, 98
	.set wave_mxfp4_dynamic_gemm_256x224x256.num_named_barrier, 0
	.set wave_mxfp4_dynamic_gemm_256x224x256.private_seg_size, 524
	.set wave_mxfp4_dynamic_gemm_256x224x256.uses_vcc, 1
	.set wave_mxfp4_dynamic_gemm_256x224x256.uses_flat_scratch, 0
	.set wave_mxfp4_dynamic_gemm_256x224x256.has_dyn_sized_stack, 0
	.set wave_mxfp4_dynamic_gemm_256x224x256.has_recursion, 0
	.set wave_mxfp4_dynamic_gemm_256x224x256.has_indirect_call, 0
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
    .group_segment_fixed_size: 122880
    .kernarg_segment_align: 8
    .kernarg_segment_size: 104
    .max_flat_workgroup_size: 512
    .name:           wave_mxfp4_dynamic_gemm_256x224x256
    .private_segment_fixed_size: 524
    .reqd_workgroup_size:
      - 256
      - 2
      - 1
    .sgpr_count:     104
    .sgpr_spill_count: 0
    .symbol:         wave_mxfp4_dynamic_gemm_256x224x256.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     256
    .vgpr_spill_count: 159
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx950
amdhsa.version:
  - 1
  - 0
...

	.end_amdgpu_metadata
