; To reproduce the .rocmasm from .optimized.ll, run:
; llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx950 -mattr='-fma-mix-insts' -O3 <.optimized.ll> -o <out.rocmasm>

	.amdgcn_target "amdgcn-amd-amdhsa--gfx950"
	.text
	.globl	wave_mxfp4_dynamic_gemm_64x64x256
	.p2align	8
	.type	wave_mxfp4_dynamic_gemm_64x64x256,@function
wave_mxfp4_dynamic_gemm_64x64x256:
	s_load_dwordx2 s[2:3], s[0:1], 0x0
	s_load_dwordx8 s[4:11], s[0:1], 0x8
	s_load_dwordx4 s[12:15], s[0:1], 0x28
	s_waitcnt lgkmcnt(0)
	s_branch .LBB0_0
	.p2align	8
.LBB0_0:
	s_load_dwordx2 s[18:19], s[0:1], 0x38
	s_mov_b64 s[20:21], s[2:3]
	v_and_b32_e32 v20, 0x3ff, v0
	v_bfe_u32 v0, v0, 10, 10
	v_lshrrev_b32_e32 v21, 6, v20
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s24, s19, 31
	s_mov_b32 s25, s24
	s_xor_b64 s[26:27], s[18:19], s[24:25]
	s_lshr_b32 s2, s27, 31
	s_add_u32 s2, s26, s2
	s_addc_u32 s3, s27, 0
	v_lshlrev_b32_e32 v9, 5, v0
	s_ashr_i64 s[2:3], s[2:3], 1
	s_mov_b32 s44, s17
	s_mov_b32 s17, 0
	v_lshl_or_b32 v1, v21, 3, v9
	s_xor_b64 s[36:37], s[2:3], s[24:25]
	v_lshrrev_b32_e32 v2, 3, v20
	s_mov_b64 s[12:13], s[6:7]
	v_readfirstlane_b32 s14, v1
	v_or_b32_e32 v1, v2, v9
	s_lshl_b64 s[6:7], s[16:17], 6
	s_and_b32 s2, s36, 0x3fff
	v_or_b32_e32 v4, s6, v1
	v_bitop3_b32 v3, v2, 7, v20 bitop3:0x48
	s_bitset1_b32 s2, 14
	v_lshlrev_b32_e32 v22, 4, v3
	v_mul_lo_u32 v23, s36, v4
	s_lshl_b32 s28, s2, 16
	s_and_b32 s2, s21, 0xffff
	s_lshl_b32 s33, s14, 7
	s_or_b32 s21, s2, s28
	s_mov_b32 s23, 0x27000
	s_mov_b32 s22, 0x7ffffffe
	v_add_u32_e32 v4, v22, v23
	s_mov_b32 m0, s33
	s_add_u32 s29, s36, -1
	buffer_load_dwordx4 v4, s[20:23], 0 offen lds
	s_addc_u32 s15, 0, 0
	s_mov_b32 s14, s17
	s_cmp_lg_u64 s[14:15], 0
	s_cbranch_scc0 .LBB0_8
	v_cvt_f32_u32_e32 v4, s36
	v_mov_b32_e32 v5, 0x4f800000
	s_sub_u32 s14, 0, s36
	s_subb_u32 s17, 0, 0
	v_fmac_f32_e32 v4, 0, v5
	v_rcp_f32_e32 v4, v4
	s_nop 0
	v_mul_f32_e32 v4, 0x5f7ffffc, v4
	v_mul_f32_e32 v5, 0x2f800000, v4
	v_trunc_f32_e32 v5, v5
	v_fmamk_f32 v4, v5, 0xcf800000, v4
	v_cvt_u32_f32_e32 v5, v5
	v_cvt_u32_f32_e32 v4, v4
	v_readfirstlane_b32 s30, v5
	v_readfirstlane_b32 s31, v4
	s_mul_i32 s34, s14, s30
	s_mul_hi_u32 s37, s14, s31
	s_mul_i32 s35, s17, s31
	s_add_i32 s34, s37, s34
	s_add_i32 s34, s34, s35
	s_mul_i32 s38, s14, s31
	s_mul_i32 s37, s31, s34
	s_mul_hi_u32 s39, s31, s38
	s_mul_hi_u32 s35, s31, s34
	s_add_u32 s37, s39, s37
	s_addc_u32 s35, 0, s35
	s_mul_hi_u32 s40, s30, s38
	s_mul_i32 s38, s30, s38
	s_add_u32 s37, s37, s38
	s_mul_hi_u32 s39, s30, s34
	s_addc_u32 s35, s35, s40
	s_addc_u32 s37, s39, 0
	s_mul_i32 s34, s30, s34
	s_add_u32 s34, s35, s34
	s_addc_u32 s35, 0, s37
	s_add_u32 s31, s31, s34
	s_addc_u32 s30, s30, s35
	s_mul_i32 s34, s14, s30
	s_mul_hi_u32 s35, s14, s31
	s_add_i32 s34, s35, s34
	s_mul_i32 s17, s17, s31
	s_add_i32 s34, s34, s17
	s_mul_i32 s14, s14, s31
	s_mul_hi_u32 s35, s30, s14
	s_mul_i32 s37, s30, s14
	s_mul_i32 s39, s31, s34
	s_mul_hi_u32 s14, s31, s14
	s_mul_hi_u32 s38, s31, s34
	s_add_u32 s14, s14, s39
	s_addc_u32 s38, 0, s38
	s_add_u32 s14, s14, s37
	s_mul_hi_u32 s17, s30, s34
	s_addc_u32 s14, s38, s35
	s_addc_u32 s17, s17, 0
	s_mul_i32 s34, s30, s34
	s_add_u32 s14, s14, s34
	s_addc_u32 s17, 0, s17
	s_add_u32 s14, s31, s14
	s_addc_u32 s17, s30, s17
	s_mul_i32 s31, s29, s17
	s_mul_hi_u32 s34, s29, s14
	s_mul_hi_u32 s30, s29, s17
	s_add_u32 s31, s34, s31
	s_addc_u32 s30, 0, s30
	s_mul_i32 s14, s15, s14
	s_add_u32 s14, s31, s14
	s_addc_u32 s14, s30, 0
	s_addc_u32 s30, 0, 0
	s_mul_i32 s17, s15, s17
	s_add_u32 s14, s14, s17
	s_addc_u32 s17, 0, s30
	s_mul_i32 s17, s36, s17
	s_mul_hi_u32 s34, s36, s14
	s_add_u32 s30, s14, 1
	s_add_u32 s31, s14, 2
	s_add_i32 s34, s34, s17
	s_mul_i32 s17, s36, s14
	s_sub_u32 s17, s29, s17
	s_subb_u32 s15, s15, s34
	s_sub_u32 s34, s17, s36
	s_subb_u32 s35, s15, 0
	s_cmp_ge_u32 s34, s36
	s_cselect_b32 s34, -1, 0
	s_cmp_eq_u32 s35, 0
	s_cselect_b32 s34, s34, -1
	s_cmp_lg_u32 s34, 0
	s_cselect_b32 s30, s31, s30
	s_cmp_ge_u32 s17, s36
	s_cselect_b32 s17, -1, 0
	s_cmp_eq_u32 s15, 0
	s_cselect_b32 s15, s17, -1
	s_cmp_lg_u32 s15, 0
	s_cselect_b32 s38, s30, s14
	s_cbranch_execnz .LBB0_3
.LBB0_2:
	v_cvt_f32_u32_e32 v4, s36
	s_sub_i32 s2, 0, s36
	v_rcp_iflag_f32_e32 v4, v4
	s_nop 0
	v_mul_f32_e32 v4, 0x4f7ffffe, v4
	v_cvt_u32_f32_e32 v4, v4
	s_nop 0
	v_readfirstlane_b32 s3, v4
	s_mul_i32 s2, s2, s3
	s_mul_hi_u32 s2, s3, s2
	s_add_i32 s3, s3, s2
	s_mul_hi_u32 s2, s29, s3
	s_mul_i32 s14, s2, s36
	s_sub_i32 s14, s29, s14
	s_add_i32 s3, s2, 1
	s_sub_i32 s15, s14, s36
	s_cmp_ge_u32 s14, s36
	s_cselect_b32 s2, s3, s2
	s_cselect_b32 s14, s15, s14
	s_add_i32 s3, s2, 1
	s_cmp_ge_u32 s14, s36
	s_cselect_b32 s38, s3, s2
.LBB0_3:
	v_lshlrev_b32_e32 v4, 1, v20
	v_lshlrev_b32_e32 v3, 8, v3
	v_and_b32_e32 v4, 0x100, v4
	v_sub_u32_e32 v6, v3, v4
	v_lshlrev_b32_e32 v5, 4, v2
	v_add_u32_e32 v25, v6, v5
	s_mov_b32 s45, 0
	v_mul_hi_u32 v6, s38, v25
	v_mul_lo_u32 v7, v6, s36
	s_lshl_b64 s[34:35], s[44:45], 6
	v_sub_u32_e32 v7, v25, v7
	v_and_or_b32 v8, v1, 48, s34
	v_add_u32_e32 v1, v8, v6
	v_cmp_le_u32_e32 vcc, s36, v7
	v_mov_b32_e32 v6, s36
	s_add_i32 s37, s33, 0x4000
	v_subbrev_co_u32_e64 v1, s[2:3], 0, v1, vcc
	v_cndmask_b32_e32 v6, 0, v6, vcc
	v_mul_lo_u32 v1, v1, s36
	s_and_b32 s2, s13, 0xffff
	s_mov_b32 s15, 0x27000
	s_mov_b32 s14, 0x7ffffffe
	s_or_b32 s13, s2, s28
	v_add3_u32 v1, v7, v6, v1
	s_mov_b32 m0, s37
	s_ashr_i32 s2, s27, 31
	buffer_load_dwordx4 v1, s[12:15], 0 offen lds
	s_lshr_b32 s2, s2, 27
	s_add_u32 s2, s26, s2
	s_addc_u32 s3, s27, 0
	s_ashr_i64 s[2:3], s[2:3], 5
	s_xor_b64 s[2:3], s[2:3], s[24:25]
	s_add_u32 s17, s2, 7
	s_addc_u32 s24, s3, 0
	s_sub_u32 s25, -8, s2
	s_subb_u32 s26, -1, s3
	v_cmp_lt_i64_e64 s[2:3], s[2:3], -7
	s_nop 1
	v_cndmask_b32_e64 v1, 0, -1, s[2:3]
	s_and_b64 s[2:3], s[2:3], exec
	s_cselect_b32 s3, s26, s24
	s_cselect_b32 s2, s25, s17
	s_ashr_i32 s17, s3, 31
	s_lshr_b32 s17, s17, 29
	s_add_u32 s2, s2, s17
	s_addc_u32 s3, s3, 0
	v_readfirstlane_b32 s24, v1
	s_ashr_i64 s[2:3], s[2:3], 3
	s_mov_b32 s25, s24
	s_xor_b64 s[2:3], s[2:3], s[24:25]
	s_lshl_b32 s17, s2, 3
	s_add_u32 s28, s17, -1
	s_addc_u32 s27, 0, 0
	s_mov_b32 s26, s45
	s_cmp_lg_u64 s[26:27], 0
	s_cbranch_scc0 .LBB0_9
	v_cvt_f32_u32_e32 v1, s17
	v_mov_b32_e32 v6, 0x4f800000
	s_sub_u32 s26, 0, s17
	s_subb_u32 s29, 0, 0
	v_fmac_f32_e32 v1, 0, v6
	v_rcp_f32_e32 v1, v1
	s_nop 0
	v_mul_f32_e32 v1, 0x5f7ffffc, v1
	v_mul_f32_e32 v6, 0x2f800000, v1
	v_trunc_f32_e32 v6, v6
	v_fmamk_f32 v1, v6, 0xcf800000, v1
	v_cvt_u32_f32_e32 v6, v6
	v_cvt_u32_f32_e32 v1, v1
	v_readfirstlane_b32 s30, v6
	v_readfirstlane_b32 s31, v1
	s_mul_i32 s39, s26, s30
	s_mul_hi_u32 s41, s26, s31
	s_mul_i32 s40, s29, s31
	s_add_i32 s39, s41, s39
	s_add_i32 s39, s39, s40
	s_mul_i32 s42, s26, s31
	s_mul_i32 s41, s31, s39
	s_mul_hi_u32 s43, s31, s42
	s_mul_hi_u32 s40, s31, s39
	s_add_u32 s41, s43, s41
	s_addc_u32 s40, 0, s40
	s_mul_hi_u32 s45, s30, s42
	s_mul_i32 s42, s30, s42
	s_add_u32 s41, s41, s42
	s_mul_hi_u32 s43, s30, s39
	s_addc_u32 s40, s40, s45
	s_addc_u32 s41, s43, 0
	s_mul_i32 s39, s30, s39
	s_add_u32 s39, s40, s39
	s_addc_u32 s40, 0, s41
	s_add_u32 s31, s31, s39
	s_addc_u32 s30, s30, s40
	s_mul_i32 s39, s26, s30
	s_mul_hi_u32 s40, s26, s31
	s_add_i32 s39, s40, s39
	s_mul_i32 s29, s29, s31
	s_add_i32 s39, s39, s29
	s_mul_i32 s26, s26, s31
	s_mul_hi_u32 s40, s30, s26
	s_mul_i32 s41, s30, s26
	s_mul_i32 s43, s31, s39
	s_mul_hi_u32 s26, s31, s26
	s_mul_hi_u32 s42, s31, s39
	s_add_u32 s26, s26, s43
	s_addc_u32 s42, 0, s42
	s_add_u32 s26, s26, s41
	s_mul_hi_u32 s29, s30, s39
	s_addc_u32 s26, s42, s40
	s_addc_u32 s29, s29, 0
	s_mul_i32 s39, s30, s39
	s_add_u32 s26, s26, s39
	s_addc_u32 s29, 0, s29
	s_add_u32 s26, s31, s26
	s_addc_u32 s29, s30, s29
	s_mul_i32 s31, s28, s29
	s_mul_hi_u32 s39, s28, s26
	s_mul_hi_u32 s30, s28, s29
	s_add_u32 s31, s39, s31
	s_addc_u32 s30, 0, s30
	s_mul_i32 s26, s27, s26
	s_add_u32 s26, s31, s26
	s_addc_u32 s26, s30, 0
	s_addc_u32 s30, 0, 0
	s_mul_i32 s29, s27, s29
	s_add_u32 s26, s26, s29
	s_addc_u32 s29, 0, s30
	s_mul_i32 s29, s17, s29
	s_mul_hi_u32 s39, s17, s26
	s_add_u32 s30, s26, 1
	s_add_u32 s31, s26, 2
	s_add_i32 s39, s39, s29
	s_mul_i32 s29, s17, s26
	s_sub_u32 s29, s28, s29
	s_subb_u32 s27, s27, s39
	s_sub_u32 s39, s29, s17
	s_subb_u32 s40, s27, 0
	s_cmp_ge_u32 s39, s17
	s_cselect_b32 s39, -1, 0
	s_cmp_eq_u32 s40, 0
	s_cselect_b32 s39, s39, -1
	s_cmp_lg_u32 s39, 0
	s_cselect_b32 s30, s31, s30
	s_cmp_ge_u32 s29, s17
	s_cselect_b32 s29, -1, 0
	s_cmp_eq_u32 s27, 0
	s_cselect_b32 s27, s29, -1
	s_cmp_lg_u32 s27, 0
	s_cselect_b32 s42, s30, s26
	s_load_dwordx2 s[40:41], s[0:1], 0x48
	s_cbranch_execnz .LBB0_6
.LBB0_5:
	v_cvt_f32_u32_e32 v1, s17
	s_sub_i32 s24, 0, s17
	v_rcp_iflag_f32_e32 v1, v1
	s_nop 0
	v_mul_f32_e32 v1, 0x4f7ffffe, v1
	v_cvt_u32_f32_e32 v1, v1
	s_nop 0
	v_readfirstlane_b32 s25, v1
	s_mul_i32 s24, s24, s25
	s_mul_hi_u32 s24, s25, s24
	s_add_i32 s25, s25, s24
	s_mul_hi_u32 s24, s28, s25
	s_mul_i32 s26, s24, s17
	s_sub_i32 s26, s28, s26
	s_add_i32 s25, s24, 1
	s_sub_i32 s27, s26, s17
	s_cmp_ge_u32 s26, s17
	s_cselect_b32 s24, s25, s24
	s_cselect_b32 s26, s27, s26
	s_add_i32 s25, s24, 1
	s_cmp_ge_u32 s26, s17
	s_cselect_b32 s42, s25, s24
.LBB0_6:
	v_lshrrev_b32_e32 v1, 4, v20
	v_bfe_u32 v24, v20, 4, 2
	v_lshlrev_b32_e32 v6, 6, v24
	v_bfe_u32 v7, v20, 6, 1
	v_lshlrev_b32_e32 v18, 2, v20
	v_lshlrev_b32_e32 v19, 6, v1
	v_or_b32_e32 v16, v6, v7
	v_sub_u32_e32 v17, v18, v19
	v_add_u32_e32 v12, v17, v16
	v_mov_b32_e32 v13, 0
	v_mul_lo_u32 v26, s3, v4
	v_mad_u64_u32 v[14:15], s[24:25], s2, v4, 0
	v_mad_u64_u32 v[10:11], s[2:3], s2, v4, v[12:13]
	v_and_b32_e32 v11, -3, v10
	v_mul_hi_u32 v11, s42, v11
	v_mul_lo_u32 v13, s17, v11
	v_sub_u32_e32 v13, v10, v13
	v_cmp_le_u32_e32 vcc, s17, v13
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s3, s40, s7
	s_mul_hi_u32 s24, s40, s6
	v_subbrev_co_u32_e32 v27, vcc, 0, v11, vcc
	v_mul_hi_u32 v11, s42, v12
	v_or_b32_e32 v29, 2, v10
	v_mul_lo_u32 v11, s17, v11
	s_add_i32 s3, s24, s3
	s_mul_i32 s24, s41, s6
	v_mul_hi_u32 v30, s42, v29
	v_sub_u32_e32 v11, v12, v11
	s_add_i32 s3, s3, s24
	s_mul_i32 s24, s40, s6
	v_mul_lo_u32 v31, s17, v30
	v_mov_b32_e32 v28, s17
	v_cmp_le_u32_e32 vcc, s17, v11
	s_add_u32 s24, s4, s24
	v_sub_u32_e32 v29, v29, v31
	v_cndmask_b32_e32 v13, 0, v28, vcc
	s_addc_u32 s3, s5, s3
	s_and_b32 s4, s40, 0x3fff
	v_cmp_le_u32_e32 vcc, s17, v29
	s_bitset1_b32 s4, 14
	s_and_b32 s3, s3, 0xffff
	v_subbrev_co_u32_e32 v29, vcc, 0, v30, vcc
	v_or_b32_e32 v30, 2, v12
	s_lshl_b32 s4, s4, 16
	v_mul_hi_u32 v31, s42, v30
	s_or_b32 s25, s3, s4
	v_mul_lo_u32 v31, s17, v31
	v_sub_u32_e32 v30, v30, v31
	s_add_u32 s28, s18, -1
	s_mov_b32 s2, 0
	v_cmp_le_u32_e32 vcc, s17, v30
	s_addc_u32 s3, 0, 0
	s_mov_b32 s27, 0x27000
	s_mov_b32 s26, 0x7ffffffe
	v_mul_lo_u32 v27, s40, v27
	v_cndmask_b32_e32 v28, 0, v28, vcc
	v_mul_lo_u32 v29, s40, v29
	s_cmp_lg_u64 s[2:3], 0
	v_sub_u32_e32 v30, v12, v31
	s_cbranch_scc0 .LBB0_10
	v_cvt_f32_u32_e32 v31, s18
	v_mov_b32_e32 v32, 0x4f800000
	s_sub_u32 s2, 0, s18
	s_subb_u32 s29, 0, 0
	v_fmac_f32_e32 v31, 0, v32
	v_rcp_f32_e32 v31, v31
	s_mov_b64 s[4:5], 0
	v_mul_f32_e32 v31, 0x5f7ffffc, v31
	v_mul_f32_e32 v32, 0x2f800000, v31
	v_trunc_f32_e32 v32, v32
	v_fmamk_f32 v31, v32, 0xcf800000, v31
	v_cvt_u32_f32_e32 v32, v32
	v_cvt_u32_f32_e32 v31, v31
	v_readfirstlane_b32 s30, v32
	v_readfirstlane_b32 s31, v31
	s_mul_i32 s39, s2, s30
	s_mul_hi_u32 s43, s2, s31
	s_mul_i32 s41, s29, s31
	s_add_i32 s39, s43, s39
	s_add_i32 s39, s39, s41
	s_mul_i32 s45, s2, s31
	s_mul_i32 s43, s31, s39
	s_mul_hi_u32 s46, s31, s45
	s_mul_hi_u32 s41, s31, s39
	s_add_u32 s43, s46, s43
	s_addc_u32 s41, 0, s41
	s_mul_hi_u32 s47, s30, s45
	s_mul_i32 s45, s30, s45
	s_add_u32 s43, s43, s45
	s_mul_hi_u32 s46, s30, s39
	s_addc_u32 s41, s41, s47
	s_addc_u32 s43, s46, 0
	s_mul_i32 s39, s30, s39
	s_add_u32 s39, s41, s39
	s_addc_u32 s41, 0, s43
	s_add_u32 s31, s31, s39
	s_addc_u32 s30, s30, s41
	s_mul_i32 s39, s2, s30
	s_mul_hi_u32 s41, s2, s31
	s_add_i32 s39, s41, s39
	s_mul_i32 s29, s29, s31
	s_add_i32 s39, s39, s29
	s_mul_i32 s2, s2, s31
	s_mul_hi_u32 s41, s30, s2
	s_mul_i32 s43, s30, s2
	s_mul_i32 s46, s31, s39
	s_mul_hi_u32 s2, s31, s2
	s_mul_hi_u32 s45, s31, s39
	s_add_u32 s2, s2, s46
	s_addc_u32 s45, 0, s45
	s_add_u32 s2, s2, s43
	s_mul_hi_u32 s29, s30, s39
	s_addc_u32 s2, s45, s41
	s_addc_u32 s29, s29, 0
	s_mul_i32 s39, s30, s39
	s_add_u32 s2, s2, s39
	s_addc_u32 s29, 0, s29
	s_add_u32 s2, s31, s2
	s_addc_u32 s29, s30, s29
	s_mul_i32 s31, s28, s29
	s_mul_hi_u32 s39, s28, s2
	s_mul_hi_u32 s30, s28, s29
	s_add_u32 s31, s39, s31
	s_addc_u32 s30, 0, s30
	s_mul_i32 s2, s3, s2
	s_add_u32 s2, s31, s2
	s_addc_u32 s2, s30, 0
	s_addc_u32 s30, 0, 0
	s_mul_i32 s29, s3, s29
	s_add_u32 s2, s2, s29
	s_addc_u32 s29, 0, s30
	s_mul_i32 s29, s18, s29
	s_mul_hi_u32 s39, s18, s2
	s_add_u32 s30, s2, 1
	s_add_u32 s31, s2, 2
	s_add_i32 s39, s39, s29
	s_mul_i32 s29, s18, s2
	s_sub_u32 s29, s28, s29
	s_subb_u32 s3, s3, s39
	s_sub_u32 s39, s29, s18
	s_subb_u32 s41, s3, 0
	s_cmp_ge_u32 s39, s18
	s_cselect_b32 s39, -1, 0
	s_cmp_eq_u32 s41, 0
	s_cselect_b32 s39, s39, -1
	s_cmp_lg_u32 s39, 0
	s_cselect_b32 s30, s31, s30
	s_cmp_ge_u32 s29, s18
	s_cselect_b32 s29, -1, 0
	s_cmp_eq_u32 s3, 0
	s_cselect_b32 s3, s29, -1
	s_cmp_lg_u32 s3, 0
	s_cselect_b32 s48, s30, s2
	s_branch .LBB0_11
.LBB0_8:
	s_branch .LBB0_2
.LBB0_9:
	s_load_dwordx2 s[40:41], s[0:1], 0x48
	s_branch .LBB0_5
.LBB0_10:
	s_mov_b64 s[4:5], -1
.LBB0_11:
	s_load_dwordx2 s[46:47], s[0:1], 0x58
	v_add_u32_e32 v15, v15, v26
	v_add3_u32 v26, v27, v11, v13
	s_andn2_b64 vcc, exec, s[4:5]
	v_add3_u32 v27, v29, v30, v28
	s_cbranch_vccnz .LBB0_13
	v_cvt_f32_u32_e32 v11, s18
	s_sub_i32 s2, 0, s18
	v_rcp_iflag_f32_e32 v11, v11
	s_nop 0
	v_mul_f32_e32 v11, 0x4f7ffffe, v11
	v_cvt_u32_f32_e32 v11, v11
	s_nop 0
	v_readfirstlane_b32 s3, v11
	s_mul_i32 s2, s2, s3
	s_mul_hi_u32 s2, s3, s2
	s_add_i32 s3, s3, s2
	s_mul_hi_u32 s2, s28, s3
	s_mul_i32 s4, s2, s18
	s_sub_i32 s4, s28, s4
	s_add_i32 s3, s2, 1
	s_sub_i32 s5, s4, s18
	s_cmp_ge_u32 s4, s18
	s_cselect_b32 s2, s3, s2
	s_cselect_b32 s4, s5, s4
	s_add_i32 s3, s2, 1
	s_cmp_ge_u32 s4, s18
	s_cselect_b32 s48, s3, s2
.LBB0_13:
	s_movk_i32 s2, 0xf800
	v_lshlrev_b32_e32 v35, 7, v20
	buffer_load_ubyte v13, v26, s[24:27], 0 offen
	buffer_load_ubyte v11, v27, s[24:27], 0 offen offset:2
	v_lshlrev_b32_e32 v36, 11, v24
	v_mad_i32_i24 v27, v1, s2, v35
	v_add_u32_e32 v31, v27, v36
	v_mul_hi_u32 v26, s48, v31
	v_mul_lo_u32 v28, s18, v26
	v_sub_u32_e32 v28, v31, v28
	v_cmp_le_u32_e32 vcc, s18, v28
	v_mov_b32_e32 v29, s18
	s_mov_b32 s31, 0x27000
	v_subbrev_co_u32_e64 v26, s[2:3], 0, v26, vcc
	v_cndmask_b32_e32 v29, 0, v29, vcc
	v_add_u32_e32 v28, v29, v28
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s2, s46, s35
	s_mul_hi_u32 s3, s46, s34
	v_ashrrev_i32_e32 v29, 31, v28
	s_add_i32 s2, s3, s2
	s_mul_i32 s3, s47, s34
	v_xor_b32_e32 v28, v29, v28
	s_add_i32 s2, s2, s3
	s_mul_i32 s3, s46, s34
	v_ashrrev_i32_e32 v30, 31, v28
	s_add_u32 s28, s8, s3
	v_lshrrev_b32_e32 v30, 27, v30
	s_addc_u32 s2, s9, s2
	s_and_b32 s3, s46, 0x3fff
	v_add_u32_e32 v28, v28, v30
	s_bitset1_b32 s3, 14
	v_add_u32_e32 v26, v9, v26
	v_ashrrev_i32_e32 v28, 5, v28
	s_and_b32 s2, s2, 0xffff
	s_lshl_b32 s3, s3, 16
	v_mul_lo_u32 v26, v26, s46
	s_or_b32 s29, s2, s3
	s_mov_b32 s30, 0x7ffffffe
	v_xad_u32 v26, v28, v29, v26
	buffer_load_dword v30, v26, s[28:31], 0 offen
	v_cmp_eq_u32_e64 s[2:3], 0, v0
	s_and_b64 vcc, exec, s[2:3]
	s_waitcnt vmcnt(0)
	s_barrier
	s_cbranch_vccnz .LBB0_15
	s_barrier
.LBB0_15:
	s_sub_u32 s8, 0, s18
	s_subb_u32 s9, 0, s19
	s_add_u32 s39, s18, -1
	s_addc_u32 s41, s19, -1
	v_cmp_lt_i64_e64 s[4:5], s[18:19], 1
	v_and_b32_e32 v28, 7, v20
	v_lshl_add_u32 v29, v21, 11, v27
	v_cndmask_b32_e64 v26, 0, -1, s[4:5]
	s_and_b64 s[4:5], s[4:5], exec
	s_cselect_b32 s5, s9, s41
	s_cselect_b32 s4, s8, s39
	s_ashr_i32 s8, s5, 31
	s_lshr_b32 s8, s8, 24
	s_add_u32 s4, s4, s8
	s_addc_u32 s5, s5, 0
	v_readfirstlane_b32 s8, v26
	s_ashr_i64 s[4:5], s[4:5], 8
	s_mov_b32 s9, s8
	s_xor_b64 s[4:5], s[4:5], s[8:9]
	s_lshr_b32 s8, s5, 31
	s_add_u32 s8, s4, s8
	s_addc_u32 s9, s5, 0
	s_and_b32 s8, s8, -2
	v_bitop3_b32 v26, v24, v20, 7 bitop3:0x78
	s_sub_u32 s50, s4, s8
	v_lshlrev_b32_e32 v32, 4, v26
	v_lshl_add_u32 v0, v0, 12, v27
	v_bitop3_b32 v28, v24, v28, 4 bitop3:0x36
	s_subb_u32 s51, s5, s9
	v_or_b32_e32 v26, v29, v32
	v_or_b32_e32 v27, v0, v32
	v_lshlrev_b32_e32 v32, 4, v28
	v_cmp_lt_i64_e64 s[4:5], s[8:9], 1
	s_mov_b64 s[52:53], 0
	v_or_b32_e32 v28, v32, v29
	v_or_b32_e32 v29, v32, v0
	s_and_b64 vcc, exec, s[4:5]
	s_cbranch_vccnz .LBB0_22
	s_movk_i32 s4, 0x100
	v_mul_i32_i24_e32 v37, 0xfffff800, v1
	v_add3_u32 v0, v17, v16, s4
	v_mov_b32_e32 v1, 0
	v_lshl_add_u64 v[16:17], v[14:15], 0, v[0:1]
	v_add_u32_e32 v0, v3, v5
	v_sub_u32_e32 v0, v0, v4
	v_add_u32_e32 v17, 0x1000, v0
	v_add_u32_e32 v0, v2, v9
	v_lshl_add_u32 v2, s16, 6, v0
	v_mul_lo_u32 v2, v2, s36
	v_add3_u32 v34, v2, v22, s4
	v_add3_u32 v2, v6, v18, v7
	v_sub_u32_e32 v40, v2, v19
	v_add_u32_e32 v2, v37, v36
	s_movk_i32 s4, 0x4000
	v_and_b32_e32 v0, 0x70, v0
	v_add_u32_e32 v32, 0x800, v25
	v_add_u32_e32 v33, 0x100, v12
	v_add_u32_e32 v15, 0x2000, v31
	v_add3_u32 v35, v2, v35, s4
	v_lshl_add_u32 v36, s44, 6, v0
	s_add_i32 s16, s33, 0x2000
	v_mov_b32_e32 v37, s36
	s_add_i32 s19, s33, 0x6000
	v_mov_b32_e32 v38, s17
	v_mov_b32_e32 v39, s18
	v_mov_b64_e32 v[18:19], s[8:9]
	v_mov_b32_e32 v0, v1
	v_mov_b32_e32 v2, v1
	v_mov_b32_e32 v3, v1
	v_mov_b32_e32 v4, v1
	v_mov_b32_e32 v5, v1
	v_mov_b32_e32 v6, v1
	v_mov_b32_e32 v7, v1
.LBB0_17:
	v_add_u32_e32 v42, 0xfffff800, v17
	s_mov_b32 m0, s16
	v_add_u32_e32 v41, 0xffffff80, v34
	v_mul_hi_u32 v43, s38, v42
	s_barrier
	buffer_load_dwordx4 v41, s[20:23], 0 offen lds
	v_lshl_add_u32 v41, s52, 11, v32
	v_mul_lo_u32 v43, v43, s36
	v_sub_u32_e32 v43, v41, v43
	v_cmp_le_u32_e32 vcc, s36, v43
	s_mov_b32 m0, s19
	s_nop 0
	v_cndmask_b32_e32 v43, 0, v37, vcc
	v_subbrev_co_u32_e32 v44, vcc, 0, v36, vcc
	v_mul_lo_u32 v44, s36, v44
	v_add3_u32 v42, v43, v44, v42
	buffer_load_dwordx4 v42, s[12:15], 0 offen lds
	v_add_u32_e32 v43, v14, v40
	s_lshl_b32 s4, s52, 8
	v_add_u32_e32 v44, 0x100, v43
	v_add_u32_e32 v42, s4, v10
	v_mul_hi_u32 v44, s42, v44
	v_add_u32_e32 v42, 0x100, v42
	v_mul_lo_u32 v45, s17, v44
	v_add_u32_e32 v46, 0x100, v40
	v_sub_u32_e32 v45, v42, v45
	v_mul_hi_u32 v46, s42, v46
	v_cmp_le_u32_e32 vcc, s17, v45
	v_add_u32_e32 v45, s4, v33
	v_mul_lo_u32 v46, s17, v46
	v_subbrev_co_u32_e32 v44, vcc, 0, v44, vcc
	v_sub_u32_e32 v46, v45, v46
	v_cmp_le_u32_e32 vcc, s17, v46
	v_mul_lo_u32 v44, s40, v44
	v_add_u32_e32 v49, 0x102, v40
	v_cndmask_b32_e32 v47, 0, v38, vcc
	v_add3_u32 v44, v46, v44, v47
	v_add_u32_e32 v47, 0x102, v43
	v_mul_hi_u32 v47, s42, v47
	v_add_u32_e32 v46, s4, v16
	v_mul_lo_u32 v48, s17, v47
	v_sub_u32_e32 v48, v46, v48
	v_add_u32_e32 v48, 2, v48
	v_mul_hi_u32 v49, s42, v49
	v_cmp_le_u32_e32 vcc, s17, v48
	v_add_u32_e32 v48, 2, v45
	v_mul_lo_u32 v49, s17, v49
	v_subbrev_co_u32_e32 v47, vcc, 0, v47, vcc
	v_sub_u32_e32 v50, v48, v49
	v_cmp_le_u32_e32 vcc, s17, v50
	v_add_u32_e32 v51, 0xffffff02, v45
	v_mul_lo_u32 v47, s40, v47
	v_cndmask_b32_e32 v50, 0, v38, vcc
	v_sub_u32_e32 v49, v51, v49
	v_add3_u32 v47, v47, v49, v50
	buffer_load_ubyte v49, v44, s[24:27], 0 offen
	buffer_load_ubyte v50, v47, s[24:27], 0 offen offset:256
	v_add_u32_e32 v47, 0xffffe000, v35
	v_mul_hi_u32 v47, s48, v47
	v_lshl_add_u32 v44, s52, 13, v15
	v_mul_lo_u32 v52, s18, v47
	v_sub_u32_e32 v52, v44, v52
	v_cmp_le_u32_e32 vcc, s18, v52
	s_nop 1
	v_cndmask_b32_e32 v53, 0, v39, vcc
	v_add_u32_e32 v52, v53, v52
	v_ashrrev_i32_e32 v53, 31, v52
	v_xor_b32_e32 v52, v53, v52
	v_ashrrev_i32_e32 v54, 31, v52
	v_subbrev_co_u32_e64 v47, s[4:5], 0, v47, vcc
	v_lshrrev_b32_e32 v54, 27, v54
	v_add_u32_e32 v52, v52, v54
	v_add_u32_e32 v47, v9, v47
	v_ashrrev_i32_e32 v52, 5, v52
	v_mul_lo_u32 v47, v47, s46
	v_xad_u32 v47, v52, v53, v47
	buffer_load_dword v47, v47, s[28:31], 0 offen
	ds_read_b128 v[52:55], v26
	ds_read_b128 v[56:59], v27 offset:16384
	ds_read_b128 v[60:63], v27 offset:18432
	s_barrier
	s_setprio 1
	s_waitcnt vmcnt(7)
	v_and_b32_e32 v13, 0xff, v13
	s_waitcnt vmcnt(5) lgkmcnt(1)
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[52:55], v[56:59], v[0:3], v13, v30 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[52:55], v[60:63], v[4:7], v13, v30 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_barrier
	ds_read_b128 v[52:55], v28
	ds_read_b128 v[56:59], v29 offset:16384
	ds_read_b128 v[60:63], v29 offset:18432
	s_waitcnt vmcnt(3)
	s_barrier
	s_setprio 1
	v_and_b32_e32 v11, 0xff, v11
	s_waitcnt lgkmcnt(1)
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[52:55], v[56:59], v[0:3], v11, v30 op_sel_hi:[0,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[52:55], v[60:63], v[4:7], v11, v30 op_sel:[0,1,0] op_sel_hi:[0,1,0] cbsz:4 blgp:4
	s_setprio 0
	v_mul_hi_u32 v11, s38, v17
	v_mul_lo_u32 v11, v11, s36
	v_sub_u32_e32 v11, v41, v11
	v_add_u32_e32 v11, 0x800, v11
	v_cmp_le_u32_e32 vcc, s36, v11
	s_mov_b32 m0, s33
	s_barrier
	v_cndmask_b32_e32 v11, 0, v37, vcc
	v_subbrev_co_u32_e32 v13, vcc, 0, v36, vcc
	v_mul_lo_u32 v13, s36, v13
	buffer_load_dwordx4 v34, s[20:23], 0 offen lds
	v_add3_u32 v11, v11, v13, v17
	s_mov_b32 m0, s37
	s_nop 0
	buffer_load_dwordx4 v11, s[12:15], 0 offen lds
	v_add_u32_e32 v11, 0x200, v43
	v_mul_hi_u32 v11, s42, v11
	v_mul_lo_u32 v13, s17, v11
	v_sub_u32_e32 v13, v42, v13
	v_add_u32_e32 v13, 0x100, v13
	v_add_u32_e32 v41, 0x200, v40
	v_cmp_le_u32_e32 vcc, s17, v13
	v_mul_hi_u32 v13, s42, v41
	v_mul_lo_u32 v13, s17, v13
	v_sub_u32_e32 v13, v45, v13
	v_subbrev_co_u32_e32 v11, vcc, 0, v11, vcc
	v_add_u32_e32 v30, 0x100, v13
	v_cmp_le_u32_e32 vcc, s17, v30
	v_mul_lo_u32 v11, s40, v11
	s_nop 0
	v_cndmask_b32_e32 v30, 0, v38, vcc
	v_add3_u32 v30, v11, v13, v30
	v_add_u32_e32 v11, 0x202, v43
	v_mul_hi_u32 v11, s42, v11
	v_mul_lo_u32 v13, s17, v11
	v_sub_u32_e32 v13, v46, v13
	v_add_u32_e32 v13, 0x102, v13
	v_cmp_le_u32_e32 vcc, s17, v13
	v_add_u32_e32 v13, 0x202, v40
	v_mul_hi_u32 v13, s42, v13
	v_mul_lo_u32 v13, s17, v13
	v_sub_u32_e32 v40, v48, v13
	v_subbrev_co_u32_e32 v11, vcc, 0, v11, vcc
	v_add_u32_e32 v40, 0x100, v40
	v_cmp_le_u32_e32 vcc, s17, v40
	v_mul_lo_u32 v11, s40, v11
	v_sub_u32_e32 v13, v51, v13
	v_cndmask_b32_e32 v40, 0, v38, vcc
	v_add3_u32 v40, v13, v11, v40
	buffer_load_ubyte v13, v30, s[24:27], 0 offen offset:256
	buffer_load_ubyte v11, v40, s[24:27], 0 offen offset:512
	v_mul_hi_u32 v30, s48, v35
	v_mul_lo_u32 v40, s18, v30
	v_sub_u32_e32 v40, v44, v40
	v_add_u32_e32 v40, 0x2000, v40
	v_cmp_le_u32_e32 vcc, s18, v40
	s_nop 1
	v_cndmask_b32_e32 v42, 0, v39, vcc
	v_add_u32_e32 v40, v42, v40
	v_ashrrev_i32_e32 v42, 31, v40
	v_xor_b32_e32 v40, v42, v40
	v_ashrrev_i32_e32 v43, 31, v40
	v_subbrev_co_u32_e64 v30, s[4:5], 0, v30, vcc
	v_lshrrev_b32_e32 v43, 27, v43
	v_add_u32_e32 v40, v40, v43
	v_add_u32_e32 v30, v9, v30
	v_ashrrev_i32_e32 v40, 5, v40
	v_mul_lo_u32 v30, v30, s46
	v_xad_u32 v30, v40, v42, v30
	buffer_load_dword v30, v30, s[28:31], 0 offen
	ds_read_b128 v[42:45], v26 offset:8192
	ds_read_b128 v[52:55], v27 offset:24576
	ds_read_b128 v[56:59], v27 offset:26624
	s_barrier
	s_setprio 1
	s_waitcnt vmcnt(5) lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[42:45], v[52:55], v[0:3], v49, v47 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[42:45], v[56:59], v[4:7], v49, v47 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_barrier
	ds_read_b128 v[42:45], v28 offset:8192
	ds_read_b128 v[52:55], v29 offset:24576
	ds_read_b128 v[56:59], v29 offset:26624
	s_waitcnt vmcnt(3)
	s_barrier
	s_setprio 1
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[42:45], v[52:55], v[0:3], v50, v47 op_sel_hi:[0,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[42:45], v[56:59], v[4:7], v50, v47 op_sel:[0,1,0] op_sel_hi:[0,1,0] cbsz:4 blgp:4
	s_setprio 0
	s_add_u32 s52, s52, 2
	s_addc_u32 s53, s53, 0
	v_cmp_ge_i64_e32 vcc, s[52:53], v[18:19]
	v_add_u32_e32 v17, 0x1000, v17
	v_add_u32_e32 v34, 0x100, v34
	v_add_u32_e32 v35, 0x4000, v35
	v_mov_b32_e32 v40, v41
	s_cbranch_vccz .LBB0_17
	s_load_dwordx2 s[4:5], s[0:1], 0x60
	v_cmp_gt_i64_e64 s[0:1], s[50:51], 0
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccz .LBB0_23
.LBB0_19:
	s_lshl_b32 s16, s8, 8
	v_lshl_add_u32 v15, s8, 13, v31
	v_add3_u32 v14, v12, v14, s16
	v_add_u32_e32 v12, s16, v12
	v_lshl_add_u32 v16, s8, 11, v25
	s_lshl_b32 s0, s8, 7
	v_add3_u32 v17, v23, v22, s0
	v_add_u32_e32 v17, 0x80, v17
	s_add_i32 m0, s33, 0x2000
	v_add_u32_e32 v16, 0x800, v16
	s_barrier
	buffer_load_dwordx4 v17, s[20:23], 0 offen lds
	v_mul_hi_u32 v17, s38, v16
	v_mul_lo_u32 v18, v17, s36
	v_sub_u32_e32 v16, v16, v18
	v_add_u32_e32 v8, v8, v17
	v_cmp_le_u32_e32 vcc, s36, v16
	v_mov_b32_e32 v17, s36
	s_add_i32 m0, s33, 0x6000
	v_subbrev_co_u32_e64 v8, s[0:1], 0, v8, vcc
	v_cndmask_b32_e32 v17, 0, v17, vcc
	v_mul_lo_u32 v8, v8, s36
	v_add3_u32 v8, v16, v17, v8
	buffer_load_dwordx4 v8, s[12:15], 0 offen lds
	s_movk_i32 s8, 0x2000
	s_movk_i32 s9, 0x6000
	v_add_u32_e32 v8, s16, v10
	v_add_u32_e32 v8, 0x100, v8
	v_mul_hi_u32 v10, s42, v8
	v_mul_lo_u32 v16, s17, v10
	v_sub_u32_e32 v8, v8, v16
	v_cmp_le_u32_e32 vcc, s17, v8
	v_mov_b32_e32 v17, s17
	v_add_u32_e32 v14, 0x102, v14
	v_subbrev_co_u32_e32 v8, vcc, 0, v10, vcc
	v_add_u32_e32 v10, 0x100, v12
	v_mul_hi_u32 v16, s42, v10
	v_mul_lo_u32 v16, s17, v16
	v_sub_u32_e32 v16, v10, v16
	v_cmp_le_u32_e32 vcc, s17, v16
	v_mul_lo_u32 v8, s40, v8
	v_add_u32_e32 v12, 0x102, v12
	v_cndmask_b32_e32 v18, 0, v17, vcc
	v_add3_u32 v8, v16, v8, v18
	v_mul_hi_u32 v16, s42, v14
	v_mul_lo_u32 v18, s17, v16
	v_sub_u32_e32 v14, v14, v18
	v_cmp_le_u32_e32 vcc, s17, v14
	s_nop 1
	v_subbrev_co_u32_e32 v14, vcc, 0, v16, vcc
	v_mul_hi_u32 v16, s42, v12
	v_mul_lo_u32 v16, s17, v16
	v_sub_u32_e32 v12, v12, v16
	v_cmp_le_u32_e32 vcc, s17, v12
	v_mul_lo_u32 v14, s40, v14
	v_sub_u32_e32 v10, v10, v16
	v_cndmask_b32_e32 v12, 0, v17, vcc
	v_add3_u32 v10, v10, v14, v12
	buffer_load_ubyte v12, v8, s[24:27], 0 offen
	buffer_load_ubyte v14, v10, s[24:27], 0 offen offset:2
	v_add_u32_e32 v8, 0x2000, v15
	v_mul_hi_u32 v10, s48, v8
	v_mul_lo_u32 v15, s18, v10
	v_sub_u32_e32 v8, v8, v15
	v_cmp_le_u32_e32 vcc, s18, v8
	v_mov_b32_e32 v15, s18
	s_nop 0
	v_cndmask_b32_e32 v15, 0, v15, vcc
	v_add_u32_e32 v8, v15, v8
	v_ashrrev_i32_e32 v15, 31, v8
	v_xor_b32_e32 v8, v15, v8
	v_ashrrev_i32_e32 v16, 31, v8
	v_subbrev_co_u32_e64 v10, s[0:1], 0, v10, vcc
	v_lshrrev_b32_e32 v16, 27, v16
	v_add_u32_e32 v8, v8, v16
	v_add_u32_e32 v10, v9, v10
	v_ashrrev_i32_e32 v8, 5, v8
	v_mul_lo_u32 v10, v10, s46
	v_xad_u32 v8, v8, v15, v10
	buffer_load_dword v8, v8, s[28:31], 0 offen
	ds_read_b128 v[16:19], v26
	ds_read_b128 v[32:35], v27 offset:16384
	ds_read_b128 v[36:39], v27 offset:18432
	s_barrier
	s_setprio 1
	s_waitcnt vmcnt(7)
	v_and_b32_e32 v10, 0xff, v13
	s_waitcnt vmcnt(5) lgkmcnt(0)
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[16:19], v[32:35], v[0:3], v10, v30 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[16:19], v[36:39], v[4:7], v10, v30 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	s_setprio 0
	s_barrier
	ds_read_b128 v[16:19], v28
	ds_read_b128 v[32:35], v29 offset:16384
	ds_read_b128 v[36:39], v29 offset:18432
	s_waitcnt vmcnt(3)
	s_barrier
	s_setprio 1
	v_and_b32_e32 v10, 0xff, v11
	s_waitcnt lgkmcnt(1)
	s_nop 0
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[16:19], v[32:35], v[0:3], v10, v30 op_sel_hi:[0,1,0] cbsz:4 blgp:4
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[16:19], v[36:39], v[4:7], v10, v30 op_sel:[0,1,0] op_sel_hi:[0,1,0] cbsz:4 blgp:4
	s_setprio 0
	s_waitcnt vmcnt(2)
	v_mov_b32_e32 v13, v12
	s_waitcnt vmcnt(1)
	v_mov_b32_e32 v11, v14
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v30, v8
	s_andn2_b64 vcc, exec, s[2:3]
	s_cbranch_vccnz .LBB0_21
.LBB0_20:
	s_barrier
.LBB0_21:
	v_add_u32_e32 v8, s8, v26
	s_waitcnt lgkmcnt(0)
	s_barrier
	ds_read_b128 v[14:17], v8
	v_add_u32_e32 v8, s9, v27
	ds_read_b128 v[32:35], v8
	v_add_u32_e32 v12, s8, v28
	v_add_u32_e32 v10, s9, v29
	ds_read_b128 v[26:29], v12
	ds_read_b128 v[36:39], v8 offset:2048
	s_waitcnt vmcnt(2)
	v_and_b32_e32 v8, 0xff, v13
	s_movk_i32 s0, 0x7fff
	s_mul_hi_u32 s1, s4, s6
	s_waitcnt vmcnt(0) lgkmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[14:17], v[32:35], v[0:3], v8, v30 op_sel_hi:[0,0,0] cbsz:4 blgp:4
	ds_read_b128 v[32:35], v10
	ds_read_b128 v[40:43], v10 offset:2048
	v_and_b32_e32 v10, 0xff, v11
	v_lshlrev_b32_e32 v9, 1, v9
	s_waitcnt lgkmcnt(2)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[14:17], v[36:39], v[4:7], v8, v30 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
	v_mov_b32_e32 v14, 0x7fc0
	v_lshlrev_b32_e32 v8, 4, v21
	v_lshl_or_b32 v8, v24, 2, v8
	s_waitcnt lgkmcnt(1)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[0:3], v[26:29], v[32:35], v[0:3], v10, v30 op_sel_hi:[0,1,0] cbsz:4 blgp:4
	v_mul_lo_u32 v8, s4, v8
	s_waitcnt lgkmcnt(0)
	v_mfma_scale_f32_16x16x128_f8f6f4 v[4:7], v[26:29], v[40:43], v[4:7], v10, v30 op_sel:[0,1,0] op_sel_hi:[0,1,0] cbsz:4 blgp:4
	s_nop 4
	v_bfe_u32 v10, v3, 16, 1
	v_bfe_u32 v11, v2, 16, 1
	v_add3_u32 v10, v3, v10, s0
	v_bfe_u32 v12, v1, 16, 1
	v_add3_u32 v11, v2, v11, s0
	v_lshrrev_b32_e32 v10, 16, v10
	v_cmp_o_f32_e32 vcc, v3, v3
	v_bfe_u32 v13, v0, 16, 1
	v_add3_u32 v12, v1, v12, s0
	v_lshrrev_b32_e32 v11, 16, v11
	v_cndmask_b32_e32 v3, v14, v10, vcc
	v_cmp_o_f32_e32 vcc, v2, v2
	v_add3_u32 v13, v0, v13, s0
	v_lshrrev_b32_e32 v12, 16, v12
	v_cndmask_b32_e32 v2, v14, v11, vcc
	v_cmp_o_f32_e32 vcc, v1, v1
	v_lshrrev_b32_e32 v13, 16, v13
	v_bfe_u32 v10, v7, 16, 1
	v_cndmask_b32_e32 v1, v14, v12, vcc
	v_cmp_o_f32_e32 vcc, v0, v0
	v_bfe_u32 v11, v6, 16, 1
	v_bfe_u32 v12, v5, 16, 1
	v_cndmask_b32_e32 v0, v14, v13, vcc
	v_bfe_u32 v13, v4, 16, 1
	v_add3_u32 v13, v4, v13, s0
	v_add3_u32 v12, v5, v12, s0
	v_add3_u32 v11, v6, v11, s0
	v_add3_u32 v10, v7, v10, s0
	s_mul_i32 s0, s4, s7
	s_add_i32 s0, s1, s0
	s_mul_i32 s1, s5, s6
	s_add_i32 s1, s0, s1
	s_mul_i32 s0, s4, s6
	s_lshl_b64 s[0:1], s[0:1], 1
	s_add_u32 s2, s10, s0
	s_addc_u32 s3, s11, s1
	s_lshl_b64 s[0:1], s[34:35], 1
	s_add_u32 s0, s2, s0
	v_lshrrev_b32_e32 v10, 16, v10
	v_cmp_o_f32_e32 vcc, v7, v7
	s_addc_u32 s1, s3, s1
	s_and_b32 s2, s4, 0x3fff
	v_cndmask_b32_e32 v7, v14, v10, vcc
	v_and_b32_e32 v10, 15, v20
	s_lshl_b32 s2, s2, 16
	s_and_b32 s1, s1, 0xffff
	s_or_b32 s1, s2, s1
	v_lshl_add_u32 v9, v10, 1, v9
	s_or_b32 s1, s1, 2.0
	s_mov_b32 s3, 0x27000
	s_mov_b32 s2, 0x7ffffffd
	v_lshl_add_u32 v8, v8, 1, v9
	s_lshl_b32 s4, s4, 1
	v_lshrrev_b32_e32 v11, 16, v11
	v_cmp_o_f32_e32 vcc, v6, v6
	buffer_store_short v0, v8, s[0:3], 0 offen
	v_add_u32_e32 v0, s4, v8
	v_lshrrev_b32_e32 v12, 16, v12
	v_cndmask_b32_e32 v6, v14, v11, vcc
	v_cmp_o_f32_e32 vcc, v5, v5
	buffer_store_short v1, v0, s[0:3], 0 offen
	v_add_u32_e32 v1, s4, v0
	v_lshrrev_b32_e32 v13, 16, v13
	v_cndmask_b32_e32 v5, v14, v12, vcc
	v_cmp_o_f32_e32 vcc, v4, v4
	buffer_store_short v2, v1, s[0:3], 0 offen
	v_add_u32_e32 v2, s4, v1
	v_cndmask_b32_e32 v4, v14, v13, vcc
	buffer_store_short v3, v2, s[0:3], 0 offen
	buffer_store_short v4, v8, s[0:3], 0 offen offset:32
	buffer_store_short v5, v0, s[0:3], 0 offen offset:32
	buffer_store_short v6, v1, s[0:3], 0 offen offset:32
	buffer_store_short v7, v2, s[0:3], 0 offen offset:32
	s_endpgm
.LBB0_22:
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, v4
	v_mov_b32_e32 v6, v4
	v_mov_b32_e32 v7, v4
	v_mov_b64_e32 v[0:1], v[4:5]
	v_mov_b64_e32 v[2:3], v[6:7]
	s_load_dwordx2 s[4:5], s[0:1], 0x60
	v_cmp_gt_i64_e64 s[0:1], s[50:51], 0
	s_and_b64 vcc, exec, s[0:1]
	s_cbranch_vccnz .LBB0_19
.LBB0_23:
	s_movk_i32 s9, 0x4000
	s_mov_b32 s8, 0
	s_andn2_b64 vcc, exec, s[2:3]
	s_cbranch_vccnz .LBB0_21
	s_branch .LBB0_20
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel wave_mxfp4_dynamic_gemm_64x64x256
		.amdhsa_group_segment_fixed_size 32768
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
		.amdhsa_next_free_vgpr 64
		.amdhsa_next_free_sgpr 54
		.amdhsa_accum_offset 64
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
	.size	wave_mxfp4_dynamic_gemm_64x64x256, .Lfunc_end0-wave_mxfp4_dynamic_gemm_64x64x256

	.set wave_mxfp4_dynamic_gemm_64x64x256.num_vgpr, 64
	.set wave_mxfp4_dynamic_gemm_64x64x256.num_agpr, 0
	.set wave_mxfp4_dynamic_gemm_64x64x256.numbered_sgpr, 54
	.set wave_mxfp4_dynamic_gemm_64x64x256.num_named_barrier, 0
	.set wave_mxfp4_dynamic_gemm_64x64x256.private_seg_size, 0
	.set wave_mxfp4_dynamic_gemm_64x64x256.uses_vcc, 1
	.set wave_mxfp4_dynamic_gemm_64x64x256.uses_flat_scratch, 0
	.set wave_mxfp4_dynamic_gemm_64x64x256.has_dyn_sized_stack, 0
	.set wave_mxfp4_dynamic_gemm_64x64x256.has_recursion, 0
	.set wave_mxfp4_dynamic_gemm_64x64x256.has_indirect_call, 0
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
    .group_segment_fixed_size: 32768
    .kernarg_segment_align: 8
    .kernarg_segment_size: 104
    .max_flat_workgroup_size: 512
    .name:           wave_mxfp4_dynamic_gemm_64x64x256
    .private_segment_fixed_size: 0
    .reqd_workgroup_size:
      - 256
      - 2
      - 1
    .sgpr_count:     60
    .sgpr_spill_count: 0
    .symbol:         wave_mxfp4_dynamic_gemm_64x64x256.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     64
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx950
amdhsa.version:
  - 1
  - 0
...

	.end_amdgpu_metadata
