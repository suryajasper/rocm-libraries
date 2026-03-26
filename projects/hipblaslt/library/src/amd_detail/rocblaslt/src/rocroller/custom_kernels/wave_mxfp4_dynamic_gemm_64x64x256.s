.amdgcn_target "amdgcn-amd-amdhsa--gfx950"

.text

.protected wave_mxfp4_dynamic_gemm_64x64x256
.globl wave_mxfp4_dynamic_gemm_64x64x256
.p2align 8
.type wave_mxfp4_dynamic_gemm_64x64x256,@function
wave_mxfp4_dynamic_gemm_64x64x256:
  ; SRD setup prologue
  s_load_dwordx2 s[2:3], s[0:1], 0
  s_load_dwordx2 s[4:5], s[0:1], 8
  s_load_dwordx2 s[6:7], s[0:1], 16
  s_load_dwordx2 s[8:9], s[0:1], 24
  s_load_dwordx2 s[10:11], s[0:1], 32
  s_load_dwordx2 s[12:13], s[0:1], 40
  s_load_dwordx2 s[14:15], s[0:1], 48
  s_branch .L_wave_mxfp4_dynamic_gemm_64x64x256_main
  .p2align 8
  .L_wave_mxfp4_dynamic_gemm_64x64x256_main:
  s_load_dwordx2 s[40:41], s[0:1], 56
  s_waitcnt lgkmcnt(0)
  s_mov_b64 s[20:21], s[2:3]
  s_mov_b32 s22, 0x7FFFFFFE
  s_mov_b32 s23, 0x20000
  s_mov_b64 s[24:25], s[4:5]
  s_mov_b32 s26, 0x7FFFFFFE
  s_mov_b32 s27, 0x20000
  s_mov_b64 s[28:29], s[6:7]
  s_mov_b32 s30, 0x7FFFFFFE
  s_mov_b32 s31, 0x20000
  s_mov_b64 s[32:33], s[8:9]
  s_mov_b32 s34, 0x7FFFFFFE
  s_mov_b32 s35, 0x20000
  s_mov_b64 s[36:37], s[10:11]
  s_mov_b32 s38, 0x7FFFFFFC
  s_mov_b32 s39, 0x20000
  s_mov_b32 s44, s12
  s_mov_b32 s45, s14
  s_mov_b32 s46, s40
  ; End SRD setup
  v_and_b32 v88, 1023, v0
  v_bfe_u32 v87, v0, 10, 10
  v_lshlrev_b32 v84, 4, v87
  v_lshrrev_b32 v85, 6, v88
  v_lshlrev_b32 v83, 3, v85
  v_lshl_or_b32 v86, v87, 4, v83
  v_lshl_or_b32 v83, v87, 1, v85
  v_lshlrev_b32 v82, 6, 0
  v_sub_u32 v81, v86, v82
  s_nop 0
  v_readfirstlane_b32 s2, v81
  s_lshr_b32 s3, s46, 1
  s_lshr_b32 s4, s45, 6
  s_and_b32 s5, s45, 63
  s_cmp_lg_u32 s5, 0
  s_addc_u32 s6, s4, 0
  s_and_b32 s4, s6, 31
  s_max_i32 s7, s4, 1
  v_cmp_gt_i32 vcc, s4, 0
  v_mov_b32 v86, 1
  v_cndmask_b32 v80, 0, v86, vcc
  s_lshr_b32 s4, s44, 6
  s_and_b32 s8, s44, 63
  s_cmp_lg_u32 s8, 0
  s_addc_u32 s9, s4, 0
  s_mul_i32 s4, s9, s17
  s_add_u32 s10, s16, s4
  s_cmp_lg_u32 s5, 0
  s_lshr_b32 s11, s6, 5
  s_cmp_lg_u32 s8, 0
  s_mul_i32 s12, s11, s9
  s_lshl_b32 s11, s12, 5
  v_mov_b32 v86, s10
  v_cmp_ge_i32 vcc, v86, s11
  v_mov_b32 v86, 1
  v_cndmask_b32 v76, 0, v86, vcc
  v_and_b32 v86, v80, v76
  s_cmp_lg_u32 s5, 0
  s_cmp_lg_u32 s8, 0
  s_mul_i32 s11, s12, -32
  s_add_u32 s13, s16, s11
  s_cmp_lg_u32 s8, 0
  s_add_u32 s14, s13, s4
  v_mov_b32 v76, s7
  v_cvt_f32_u32 v79, v76
  v_rcp_f32 v76, v79
  v_mov_b32 v15, 1333788670
  v_mul_f32 v79, v15, v76
  v_cvt_u32_f32 v76, v79
  v_mov_b32 v79, s7
  v_sub_u32 v75, 0, v79
  v_mul_lo_u32 v79, v75, v76
  v_mul_hi_u32 v75, v76, v79
  v_add_u32 v79, v76, v75
  v_mov_b32 v76, s14
  v_mul_hi_u32 v75, v76, v79
  v_mov_b32 v76, s7
  v_mul_lo_u32 v74, v75, v76
  v_mov_b32 v76, s14
  v_sub_u32 v78, v76, v74
  v_mov_b32 v76, s7
  v_subrev_u32 v74, v76, v78
  v_mov_b32 v76, s7
  v_cmp_ge_u32 vcc, v78, v76
  v_mov_b32 v76, 1
  v_cndmask_b32 v77, 0, v76, vcc
  v_add_u32 v76, v75, v77
  v_cndmask_b32 v77, v78, v74
  v_mov_b32 v73, s7
  v_cmp_ge_u32 vcc, v77, v73
  v_mov_b32 v77, 1
  v_cndmask_b32 v73, 0, v77, vcc
  v_add_u32 v77, v76, v73
  s_nop 0
  v_readfirstlane_b32 s13, v77
  s_cmp_lg_u32 s8, 0
  s_lshr_b32 s15, s10, 5
  s_cmp_lg_u32 s8, 0
  v_mov_b32 v76, s9
  v_cvt_f32_u32 v77, v76
  v_rcp_f32 v76, v77
  s_nop 0
  v_mul_f32 v77, v15, v76
  v_cvt_u32_f32 v76, v77
  v_mov_b32 v77, s9
  v_sub_u32 v73, 0, v77
  v_mul_lo_u32 v77, v73, v76
  v_mul_hi_u32 v73, v76, v77
  v_add_u32 v77, v76, v73
  v_mov_b32 v76, s15
  v_mul_hi_u32 v73, v76, v77
  v_mov_b32 v76, s9
  v_mul_lo_u32 v77, v73, v76
  v_mov_b32 v76, s15
  v_sub_u32 v68, v76, v77
  v_mov_b32 v76, s9
  v_subrev_u32 v77, v76, v68
  v_mov_b32 v76, s9
  v_cmp_ge_u32 vcc, v68, v76
  v_mov_b32 v76, 1
  v_cndmask_b32 v72, 0, v76, vcc
  v_add_u32 v76, v73, v72
  v_cndmask_b32 v72, v68, v77
  v_mov_b32 v71, s9
  v_cmp_ge_u32 vcc, v72, v71
  v_mov_b32 v72, 1
  v_cndmask_b32 v71, 0, v72, vcc
  v_add_u32 v72, v76, v71
  s_nop 0
  v_readfirstlane_b32 s18, v72
  s_mul_i32 s19, s18, s9
  s_sub_u32 s18, s15, s19
  v_cmp_ne_u32 vcc, v86, 0
  v_mov_b32 v76, s13
  v_mov_b32 v72, s18
  v_cndmask_b32 v71, v72, v76
  v_lshlrev_b32 v76, 6, v71
  v_lshl_or_b32 v72, v87, 4, v76
  v_lshrrev_b32 v76, 3, v88
  v_or_b32 v66, v72, v76
  v_sub_u32 v72, v66, v82
  v_and_b32 v66, v76, 7
  v_and_b32 v65, v88, 7
  v_xor_b32 v70, v65, v66
  v_lshlrev_b32 v66, 4, v70
  v_mul_lo_u32 v64, v72, s3
  v_add_u32 v69, v64, v66
  s_mul_i32 s13, s44, s46
  s_lshr_b32 s15, s13, 1
  s_and_b32 s21, s21, 0xffff
  s_or_b32 s21, s21, 0x40000000
  s_add_u32 s22, s15, 0
  s_mov_b32 s23, 0x27000
  v_lshlrev_b32 v67, 5, v70
  v_cmp_lt_i32 vcc, v67, s46
  v_mov_b32 v70, 1
  v_cndmask_b32 v63, 0, v70, vcc
  v_cmp_lt_i32 vcc, v72, s44
  v_mov_b32 v70, 1
  v_cndmask_b32 v62, 0, v70, vcc
  v_and_b32 v70, v63, v62
  v_cmp_ne_u32 vcc, v70, 0
  v_mov_b32 v15, 2147483647
  v_cndmask_b32 v61, v15, v69
  s_lshl_b32 s19, s2, 7
  s_add_u32 s2, s19, 9216
  s_mov_b32 m0, s2
  buffer_load_dwordx4 v61, s[20:23], 0 offen lds
  v_add_u32 v70, v81, 32
  s_nop 0
  v_readfirstlane_b32 s40, v70
  v_add_u32 v81, v72, 32
  v_mul_lo_u32 v72, v81, s3
  v_add_u32 v70, v72, v66
  v_cmp_lt_i32 vcc, v81, s44
  v_mov_b32 v81, 1
  v_cndmask_b32 v69, 0, v81, vcc
  v_and_b32 v81, v63, v69
  v_cmp_ne_u32 vcc, v81, 0
  v_cndmask_b32 v63, v15, v70, vcc
  s_lshl_b32 s41, s40, 7
  s_add_u32 s40, s41, 9216
  s_mov_b32 m0, s40
  buffer_load_dwordx4 v63, s[20:23], 0 offen lds
  v_min_i32 v81, v83, 1
  v_lshlrev_b32 v83, 8, v81
  s_nop 0
  v_readfirstlane_b32 s42, v83
  s_lshr_b32 s43, s46, 5
  v_lshl_add_u32 v83, v71, 1, v81
  v_mul_lo_u32 v71, v83, s46
  v_lshlrev_b32 v83, 5, v71
  v_lshl_add_u32 v71, v88, 7, v83
  v_lshlrev_b32 v83, 13, v85
  v_sub_u32 v70, v71, v83
  v_mov_b32 v83, s46
  v_cvt_f32_u32 v71, v83
  v_rcp_f32 v83, v71
  s_nop 0
  v_mov_b32 v15, 1333788670
  v_mul_f32 v71, v15, v83
  v_cvt_u32_f32 v83, v71
  v_mov_b32 v71, s46
  v_sub_u32 v63, 0, v71
  v_mul_lo_u32 v71, v63, v83
  v_mul_hi_u32 v63, v83, v71
  v_add_u32 v71, v83, v63
  v_mul_hi_u32 v83, v70, v71
  v_mov_b32 v63, s46
  v_mul_lo_u32 v61, v83, v63
  v_sub_u32 v63, v70, v61
  v_mov_b32 v61, s46
  v_subrev_u32 v60, v61, v63
  v_mov_b32 v61, s46
  v_cmp_ge_u32 vcc, v63, v61
  v_mov_b32 v61, 1
  v_cndmask_b32 v51, 0, v61, vcc
  v_add_u32 v61, v83, v51
  v_cndmask_b32 v51, v63, v60
  v_mov_b32 v56, s46
  v_cmp_ge_u32 vcc, v51, v56
  v_mov_b32 v51, 1
  v_cndmask_b32 v56, 0, v51, vcc
  v_add_u32 v51, v61, v56
  v_mov_b32 v61, s46
  v_cmp_ge_u32 vcc, v63, v61
  v_mov_b32 v61, 1
  v_cndmask_b32 v56, 0, v61, vcc
  v_add_u32 v61, v83, v56
  v_cndmask_b32 v83, v63, v60
  v_mov_b32 v63, s46
  v_cmp_ge_u32 vcc, v83, v63
  v_mov_b32 v83, 1
  v_cndmask_b32 v63, 0, v83, vcc
  v_add_u32 v83, v61, v63
  v_mul_lo_u32 v63, v83, s46
  v_sub_u32 v83, v70, v63
  v_lshrrev_b32 v63, 5, v83
  v_mul_lo_u32 v83, v51, s43
  v_add_u32 v61, v83, v63
  s_lshr_b32 s47, s13, 5
  s_and_b32 s25, s25, 0xffff
  s_or_b32 s25, s25, 0x40000000
  s_add_u32 s26, s47, 0
  s_mov_b32 s27, 0x27000
  s_add_u32 s13, s42, 512
  s_mov_b32 m0, s13
  buffer_load_dword v61, s[24:27], 0 offen lds
  s_cmp_lg_u32 s5, 0
  s_cmp_lg_u32 s5, 0
  s_and_b32 s52, s6, 4294967264
  s_cmp_lg_u32 s5, 0
  s_cmp_lg_u32 s8, 0
  s_cmp_lg_u32 s8, 0
  v_mov_b32 v83, s7
  v_cmp_ge_u32 vcc, v78, v83
  v_mov_b32 v83, 1
  v_cndmask_b32 v63, 0, v83, vcc
  v_add_u32 v83, v75, v63
  v_cndmask_b32 v75, v78, v74
  v_mov_b32 v74, s7
  v_cmp_ge_u32 vcc, v75, v74
  v_mov_b32 v75, 1
  v_cndmask_b32 v74, 0, v75, vcc
  v_add_u32 v75, v83, v74
  s_nop 0
  v_readfirstlane_b32 s6, v75
  s_mul_i32 s53, s6, s7
  s_sub_u32 s6, s14, s53
  s_add_u32 s14, s52, s6
  s_cmp_lg_u32 s8, 0
  s_and_b32 s6, s10, 31
  s_cmp_lg_u32 s8, 0
  s_cmp_lg_u32 s8, 0
  v_mov_b32 v83, s9
  v_cmp_ge_u32 vcc, v68, v83
  v_mov_b32 v83, 1
  v_cndmask_b32 v75, 0, v83, vcc
  v_cndmask_b32 v83, v68, v77
  v_mov_b32 v75, s9
  v_cmp_ge_u32 vcc, v83, v75
  v_mov_b32 v83, 1
  v_cndmask_b32 v75, 0, v83, vcc
  s_cmp_lg_u32 s8, 0
  s_cmp_lg_u32 s8, 0
  v_mov_b32 v83, s9
  v_cmp_ge_u32 vcc, v68, v83
  v_mov_b32 v83, 1
  v_cndmask_b32 v75, 0, v83, vcc
  v_add_u32 v83, v73, v75
  v_cndmask_b32 v75, v68, v77
  v_mov_b32 v74, s9
  v_cmp_ge_u32 vcc, v75, v74
  v_mov_b32 v75, 1
  v_cndmask_b32 v74, 0, v75, vcc
  v_add_u32 v75, v83, v74
  s_nop 0
  v_readfirstlane_b32 s9, v75
  v_mov_b32 v83, s9
  v_mov_b32 v75, s6
  v_lshl_or_b32 v74, v83, 5, v75
  v_cmp_ne_u32 vcc, v86, 0
  v_mov_b32 v83, s14
  v_cndmask_b32 v75, v74, v83
  v_lshlrev_b32 v83, 6, v75
  v_lshl_or_b32 v74, v87, 5, v83
  v_and_b32 v78, v88, 63
  v_lshrrev_b32 v77, 4, v78
  v_lshlrev_b32 v78, 8, v77
  v_lshl_add_u32 v73, v88, 4, v78
  v_lshrrev_b32 v78, 4, v88
  v_lshlrev_b32 v68, 8, v78
  v_sub_u32 v63, v73, v68
  v_mov_b32 v73, s3
  v_cvt_f32_u32 v68, v73
  v_rcp_f32 v73, v68
  s_nop 0
  v_mul_f32 v68, v15, v73
  v_cvt_u32_f32 v73, v68
  v_mov_b32 v68, s3
  v_sub_u32 v61, 0, v68
  v_mul_lo_u32 v68, v61, v73
  v_mul_hi_u32 v61, v73, v68
  v_add_u32 v68, v73, v61
  v_mul_hi_u32 v73, v63, v68
  v_mov_b32 v61, s3
  v_mul_lo_u32 v60, v73, v61
  v_sub_u32 v61, v63, v60
  v_mov_b32 v60, s3
  v_subrev_u32 v51, v60, v61
  v_mov_b32 v60, s3
  v_cmp_ge_u32 vcc, v61, v60
  v_mov_b32 v60, 1
  v_cndmask_b32 v56, 0, v60, vcc
  v_add_u32 v60, v73, v56
  v_cndmask_b32 v56, v61, v51
  v_mov_b32 v57, s3
  v_cmp_ge_u32 vcc, v56, v57
  v_mov_b32 v56, 1
  v_cndmask_b32 v57, 0, v56, vcc
  v_add_u32 v56, v60, v57
  v_add_u32 v60, v74, v56
  v_mov_b32 v56, s3
  v_cmp_ge_u32 vcc, v61, v56
  v_mov_b32 v56, 1
  v_cndmask_b32 v57, 0, v56, vcc
  v_add_u32 v56, v73, v57
  v_cndmask_b32 v57, v61, v51
  v_mov_b32 v58, s3
  v_cmp_ge_u32 vcc, v57, v58
  v_mov_b32 v57, 1
  v_cndmask_b32 v58, 0, v57, vcc
  v_add_u32 v57, v56, v58
  v_mul_lo_u32 v56, v57, s3
  v_sub_u32 v57, v63, v56
  v_mul_lo_u32 v56, v60, s3
  v_add_u32 v60, v56, v57
  s_mul_i32 s6, s45, s46
  s_lshr_b32 s9, s6, 1
  s_add_u32 s30, s9, 0
  buffer_load_dwordx4 v[52:55], v60, s[28:31], 0 offen
  v_mov_b32 v15, 1024
  v_add_u32 v60, v63, v15
  v_mul_hi_u32 v56, v60, v68
  v_mov_b32 v58, s3
  v_mul_lo_u32 v59, v56, v58
  v_sub_u32 v58, v60, v59
  v_mov_b32 v59, s3
  v_subrev_u32 v50, v59, v58
  v_mov_b32 v59, s3
  v_cmp_ge_u32 vcc, v58, v59
  v_mov_b32 v59, 1
  v_cndmask_b32 v49, 0, v59, vcc
  v_add_u32 v59, v56, v49
  v_cndmask_b32 v49, v58, v50
  v_mov_b32 v48, s3
  v_cmp_ge_u32 vcc, v49, v48
  v_mov_b32 v49, 1
  v_cndmask_b32 v48, 0, v49, vcc
  v_add_u32 v49, v59, v48
  v_add_u32 v59, v74, v49
  v_mov_b32 v49, s3
  v_cmp_ge_u32 vcc, v58, v49
  v_mov_b32 v49, 1
  v_cndmask_b32 v48, 0, v49, vcc
  v_add_u32 v49, v56, v48
  v_cndmask_b32 v48, v58, v50
  v_mov_b32 v14, s3
  v_cmp_ge_u32 vcc, v48, v14
  v_mov_b32 v48, 1
  v_cndmask_b32 v14, 0, v48, vcc
  v_add_u32 v48, v49, v14
  v_mul_lo_u32 v49, v48, s3
  v_sub_u32 v48, v60, v49
  v_mul_lo_u32 v60, v59, s3
  v_add_u32 v59, v60, v48
  buffer_load_dwordx4 v[44:47], v59, s[28:31], 0 offen
  v_mov_b32 v60, s3
  v_cmp_ge_u32 vcc, v61, v60
  v_mov_b32 v60, 1
  v_cndmask_b32 v59, 0, v60, vcc
  v_add_u32 v60, v73, v59
  v_cndmask_b32 v73, v61, v51
  v_mov_b32 v61, s3
  v_cmp_ge_u32 vcc, v73, v61
  v_mov_b32 v73, 1
  v_cndmask_b32 v61, 0, v73, vcc
  v_add_u32 v73, v60, v61
  v_add_u32 v61, v74, v73
  v_add_u32 v73, v61, 16
  v_mul_lo_u32 v61, v73, s3
  v_add_u32 v73, v61, v57
  buffer_load_dwordx4 v[40:43], v73, s[28:31], 0 offen
  v_mov_b32 v73, s3
  v_cmp_ge_u32 vcc, v58, v73
  v_mov_b32 v73, 1
  v_cndmask_b32 v61, 0, v73, vcc
  v_add_u32 v73, v56, v61
  v_cndmask_b32 v61, v58, v50
  v_mov_b32 v60, s3
  v_cmp_ge_u32 vcc, v61, v60
  v_mov_b32 v61, 1
  v_cndmask_b32 v60, 0, v61, vcc
  v_add_u32 v61, v73, v60
  v_add_u32 v73, v74, v61
  v_add_u32 v61, v73, 16
  v_mul_lo_u32 v73, v61, s3
  v_add_u32 v61, v73, v48
  buffer_load_dwordx4 v[56:59], v61, s[28:31], 0 offen
  ; unhandled: rocdl.sched.barrier
  v_lshlrev_b32 v73, 2, v88
  v_lshlrev_b32 v61, 6, v78
  v_sub_u32 v78, v73, v61
  s_add_u32 s9, s43, 7
  s_lshr_b32 s10, s9, 3
  v_lshl_or_b32 v61, v75, 1, v87
  v_mul_lo_u32 v75, s10, v61
  v_lshl_add_u32 v61, v75, 8, v78
  v_lshlrev_b32 v75, 6, v77
  v_add_u32 v60, v61, v75
  s_and_b32 s10, s9, 4294967288
  v_mov_b32 v61, s10
  v_cvt_f32_u32 v51, v61
  v_rcp_f32 v61, v51
  s_nop 0
  v_mov_b32 v15, 1333788670
  v_mul_f32 v51, v15, v61
  v_cvt_u32_f32 v61, v51
  v_mov_b32 v51, s10
  v_sub_u32 v50, 0, v51
  v_mul_lo_u32 v51, v50, v61
  v_mul_hi_u32 v50, v61, v51
  v_add_u32 v51, v61, v50
  v_mul_hi_u32 v61, v60, v51
  v_mov_b32 v50, s10
  v_mul_lo_u32 v49, v61, v50
  v_sub_u32 v50, v60, v49
  v_mov_b32 v49, s10
  v_subrev_u32 v48, v49, v50
  v_mov_b32 v49, s10
  v_cmp_ge_u32 vcc, v50, v49
  v_mov_b32 v49, 1
  v_cndmask_b32 v14, 0, v49, vcc
  v_add_u32 v49, v61, v14
  v_cndmask_b32 v61, v50, v48
  v_mov_b32 v50, s10
  v_cmp_ge_u32 vcc, v61, v50
  v_mov_b32 v61, 1
  v_cndmask_b32 v50, 0, v61, vcc
  v_add_u32 v61, v49, v50
  v_add_u32 v50, v78, v75
  v_mul_hi_u32 v75, v50, v51
  v_mov_b32 v78, s10
  v_mul_lo_u32 v49, v75, v78
  v_sub_u32 v78, v50, v49
  v_mov_b32 v49, s10
  v_subrev_u32 v48, v49, v78
  v_mov_b32 v49, s10
  v_cmp_ge_u32 vcc, v78, v49
  v_mov_b32 v49, 1
  v_cndmask_b32 v14, 0, v49, vcc
  v_add_u32 v49, v75, v14
  v_cndmask_b32 v75, v78, v48
  v_mov_b32 v78, s10
  v_cmp_ge_u32 vcc, v75, v78
  v_mov_b32 v75, 1
  v_cndmask_b32 v78, 0, v75, vcc
  v_add_u32 v75, v49, v78
  v_mul_lo_u32 v78, v75, s10
  v_sub_u32 v75, v50, v78
  v_mul_lo_u32 v78, v61, s43
  v_add_u32 v61, v78, v75
  s_lshr_b32 s9, s6, 5
  s_add_u32 s34, s9, 0
  buffer_load_dword v75, v61, s[32:35], 0 offen
  ; unhandled: rocdl.sched.barrier
  s_waitcnt vmcnt(0)
  s_barrier
  ; unhandled: rocdl.sched.barrier
  v_mov_b32 v15, 128
  v_add_u32 v78, v66, v15
  v_add_u32 v61, v64, v78
  v_mov_b32 v15, 256
  v_add_u32 v64, v67, v15
  v_cmp_lt_i32 vcc, v64, s46
  v_mov_b32 v64, 1
  v_cndmask_b32 v67, 0, v64, vcc
  v_and_b32 v64, v67, v62
  v_cmp_ne_u32 vcc, v64, 0
  v_mov_b32 v15, 2147483647
  v_cndmask_b32 v62, v15, v61
  s_add_u32 s6, s19, 1024
  s_mov_b32 m0, s6
  buffer_load_dwordx4 v62, s[20:23], 0 offen lds
  v_add_u32 v64, v72, v78
  v_and_b32 v78, v67, v69
  v_cmp_ne_u32 vcc, v78, 0
  v_cndmask_b32 v72, v15, v64, vcc
  s_add_u32 s9, s41, 1024
  s_mov_b32 m0, s9
  buffer_load_dwordx4 v72, s[20:23], 0 offen lds
  v_mov_b32 v15, 8192
  v_add_u32 v78, v70, v15
  v_mul_hi_u32 v72, v78, v71
  v_mov_b32 v71, s46
  v_mul_lo_u32 v70, v72, v71
  v_sub_u32 v71, v78, v70
  v_mov_b32 v70, s46
  v_subrev_u32 v64, v70, v71
  v_mov_b32 v70, s46
  v_cmp_ge_u32 vcc, v71, v70
  v_mov_b32 v70, 1
  v_cndmask_b32 v69, 0, v70, vcc
  v_add_u32 v70, v72, v69
  v_cndmask_b32 v69, v71, v64
  v_mov_b32 v67, s46
  v_cmp_ge_u32 vcc, v69, v67
  v_mov_b32 v69, 1
  v_cndmask_b32 v67, 0, v69, vcc
  v_add_u32 v69, v70, v67
  v_mov_b32 v70, s46
  v_cmp_ge_u32 vcc, v71, v70
  v_mov_b32 v70, 1
  v_cndmask_b32 v67, 0, v70, vcc
  v_add_u32 v70, v72, v67
  v_cndmask_b32 v72, v71, v64
  v_mov_b32 v71, s46
  v_cmp_ge_u32 vcc, v72, v71
  v_mov_b32 v72, 1
  v_cndmask_b32 v71, 0, v72, vcc
  v_add_u32 v72, v70, v71
  v_mul_lo_u32 v71, v72, s46
  v_sub_u32 v72, v78, v71
  v_lshrrev_b32 v78, 5, v72
  v_mul_lo_u32 v72, v69, s43
  v_add_u32 v71, v72, v78
  s_mov_b32 m0, s42
  buffer_load_dword v71, s[24:27], 0 offen lds
  s_cmp_lg_u32 s5, 0
  s_cmp_lg_u32 s8, 0
  v_cmp_le_i32 vcc, s12, 0
  v_mov_b32 v78, 1
  v_cndmask_b32 v72, 0, v78, vcc
  v_and_b32 v78, v72, v80
  s_cmp_lg_u32 s5, 0
  s_cmp_lg_u32 s8, 0
  v_mov_b32 v80, s11
  v_mul_hi_u32 v72, v80, v79
  v_mov_b32 v79, s7
  v_mul_lo_u32 v71, v72, v79
  v_sub_u32 v79, v80, v71
  v_mov_b32 v80, s7
  v_subrev_u32 v71, v80, v79
  v_mov_b32 v80, s7
  v_cmp_ge_u32 vcc, v79, v80
  v_mov_b32 v80, 1
  v_cndmask_b32 v70, 0, v80, vcc
  v_add_u32 v80, v72, v70
  v_cndmask_b32 v70, v79, v71
  v_mov_b32 v64, s7
  v_cmp_ge_u32 vcc, v70, v64
  v_mov_b32 v70, 1
  v_cndmask_b32 v64, 0, v70, vcc
  v_add_u32 v70, v80, v64
  s_nop 0
  v_readfirstlane_b32 s14, v70
  v_cmp_ne_u32 vcc, v78, 0
  v_mov_b32 v80, s14
  v_cndmask_b32 v70, 0, v80, vcc
  v_lshl_or_b32 v80, v70, 9, v73
  ds_read_b32 v64, v80 offset:512
  v_lshl_add_u32 v69, v70, 6, v88
  v_and_b32 v67, 4294967280, v88
  v_sub_u32 v62, v69, v67
  v_lshlrev_b32 v69, 5, v85
  v_add_u32 v61, v62, v69
  v_xor_b32 v62, v77, v65
  v_lshlrev_b32 v49, 4, v62
  v_lshlrev_b32 v62, 7, v61
  v_add_u32 v61, v62, v49
  ds_read_b128 v[36:39], v61 offset:9216
  v_or_b32 v49, v77, 4
  v_xor_b32 v48, v49, v65
  v_lshlrev_b32 v65, 4, v48
  v_add_u32 v49, v62, v65
  ds_read_b128 v[32:35], v49 offset:9216
  s_lshr_b32 s14, s46, 8
  s_and_b32 s19, s46, 255
  s_cmp_lg_u32 s19, 0
  s_addc_u32 s19, s14, 0
  v_mov_b32 v15, 2048
  v_add_u32 v65, v63, v15
  v_mul_hi_u32 v62, v65, v68
  v_mov_b32 v48, s3
  v_mul_lo_u32 v14, v62, v48
  v_sub_u32 v48, v65, v14
  v_mov_b32 v14, s3
  v_subrev_u32 v1, v14, v48
  v_mov_b32 v14, s3
  v_cmp_ge_u32 vcc, v48, v14
  v_mov_b32 v14, 1
  v_cndmask_b32 v13, 0, v14, vcc
  v_add_u32 v14, v62, v13
  v_cndmask_b32 v13, v48, v1
  v_mov_b32 v0, s3
  v_cmp_ge_u32 vcc, v13, v0
  v_mov_b32 v13, 1
  v_cndmask_b32 v0, 0, v13, vcc
  v_add_u32 v13, v14, v0
  v_add_u32 v14, v74, v13
  v_mul_lo_u32 v13, v14, s3
  v_mov_b32 v14, s3
  v_cmp_ge_u32 vcc, v48, v14
  v_mov_b32 v14, 1
  v_cndmask_b32 v0, 0, v14, vcc
  v_add_u32 v14, v62, v0
  v_cndmask_b32 v0, v48, v1
  v_mov_b32 v12, s3
  v_cmp_ge_u32 vcc, v0, v12
  v_mov_b32 v0, 1
  v_cndmask_b32 v12, 0, v0, vcc
  v_add_u32 v0, v14, v12
  v_mul_lo_u32 v14, v0, s3
  v_sub_u32 v0, v65, v14
  v_add_u32 v65, v13, v0
  v_mov_b32 v15, 3072
  v_add_u32 v14, v63, v15
  v_mul_hi_u32 v13, v14, v68
  v_mov_b32 v12, s3
  v_mul_lo_u32 v28, v13, v12
  v_sub_u32 v12, v14, v28
  v_mov_b32 v28, s3
  v_subrev_u32 v29, v28, v12
  v_mov_b32 v28, s3
  v_cmp_ge_u32 vcc, v12, v28
  v_mov_b32 v28, 1
  v_cndmask_b32 v30, 0, v28, vcc
  v_add_u32 v28, v13, v30
  v_cndmask_b32 v30, v12, v29
  v_mov_b32 v31, s3
  v_cmp_ge_u32 vcc, v30, v31
  v_mov_b32 v30, 1
  v_cndmask_b32 v31, 0, v30, vcc
  v_add_u32 v30, v28, v31
  v_add_u32 v28, v74, v30
  v_mul_lo_u32 v30, v28, s3
  v_mov_b32 v28, s3
  v_cmp_ge_u32 vcc, v12, v28
  v_mov_b32 v28, 1
  v_cndmask_b32 v31, 0, v28, vcc
  v_add_u32 v28, v13, v31
  v_cndmask_b32 v31, v12, v29
  v_mov_b32 v24, s3
  v_cmp_ge_u32 vcc, v31, v24
  v_mov_b32 v31, 1
  v_cndmask_b32 v24, 0, v31, vcc
  v_add_u32 v31, v28, v24
  v_mul_lo_u32 v28, v31, s3
  v_sub_u32 v31, v14, v28
  v_add_u32 v14, v30, v31
  v_mov_b32 v28, s3
  v_cmp_ge_u32 vcc, v48, v28
  v_mov_b32 v28, 1
  v_cndmask_b32 v30, 0, v28, vcc
  v_add_u32 v28, v62, v30
  v_cndmask_b32 v62, v48, v1
  v_mov_b32 v48, s3
  v_cmp_ge_u32 vcc, v62, v48
  v_mov_b32 v62, 1
  v_cndmask_b32 v48, 0, v62, vcc
  v_add_u32 v62, v28, v48
  v_add_u32 v48, v74, v62
  v_add_u32 v62, v48, 16
  v_mul_lo_u32 v48, v62, s3
  v_add_u32 v62, v48, v0
  v_mov_b32 v48, s3
  v_cmp_ge_u32 vcc, v12, v48
  v_mov_b32 v48, 1
  v_cndmask_b32 v1, 0, v48, vcc
  v_add_u32 v48, v13, v1
  v_cndmask_b32 v1, v12, v29
  v_mov_b32 v13, s3
  v_cmp_ge_u32 vcc, v1, v13
  v_mov_b32 v1, 1
  v_cndmask_b32 v13, 0, v1, vcc
  v_add_u32 v1, v48, v13
  v_add_u32 v48, v74, v1
  v_add_u32 v1, v48, 16
  v_mul_lo_u32 v48, v1, s3
  v_add_u32 v1, v48, v31
  v_mov_b32 v15, 256
  v_add_u32 v48, v60, v15
  v_mul_hi_u32 v13, v48, v51
  v_mov_b32 v0, s10
  v_mul_lo_u32 v12, v13, v0
  v_sub_u32 v0, v48, v12
  v_mov_b32 v48, s10
  v_subrev_u32 v12, v48, v0
  v_mov_b32 v48, s10
  v_cmp_ge_u32 vcc, v0, v48
  v_mov_b32 v48, 1
  v_cndmask_b32 v28, 0, v48, vcc
  v_add_u32 v48, v13, v28
  v_cndmask_b32 v13, v0, v12
  v_mov_b32 v0, s10
  v_cmp_ge_u32 vcc, v13, v0
  v_mov_b32 v13, 1
  v_cndmask_b32 v0, 0, v13, vcc
  v_add_u32 v13, v48, v0
  v_mul_lo_u32 v48, v13, s43
  v_add_u32 v13, v50, v15
  v_mul_hi_u32 v0, v13, v51
  v_mov_b32 v12, s10
  v_mul_lo_u32 v28, v0, v12
  v_sub_u32 v12, v13, v28
  v_mov_b32 v28, s10
  v_subrev_u32 v29, v28, v12
  v_mov_b32 v28, s10
  v_cmp_ge_u32 vcc, v12, v28
  v_mov_b32 v28, 1
  v_cndmask_b32 v30, 0, v28, vcc
  v_add_u32 v28, v0, v30
  v_cndmask_b32 v0, v12, v29
  v_mov_b32 v12, s10
  v_cmp_ge_u32 vcc, v0, v12
  v_mov_b32 v0, 1
  v_cndmask_b32 v12, 0, v0, vcc
  v_add_u32 v0, v28, v12
  v_mul_lo_u32 v12, v0, s10
  v_sub_u32 v0, v13, v12
  v_add_u32 v13, v48, v0
  s_cmp_lg_u32 s5, 0
  s_cmp_lg_u32 s8, 0
  s_mul_i32 s14, s12, s7
  s_mul_i32 s12, s14, -32
  s_cmp_lg_u32 s8, 0
  s_mul_i32 s14, s4, s7
  s_add_u32 s4, s12, s14
  s_mul_i32 s12, s4, s7
  s_mul_i32 s4, s7, s7
  s_mul_i32 s14, s16, s4
  s_add_u32 s41, s12, s14
  s_mul_i32 s12, s4, s7
  v_mov_b32 v48, s12
  v_cvt_f32_u32 v0, v48
  v_rcp_f32 v48, v0
  s_nop 0
  v_mov_b32 v15, 1333788670
  v_mul_f32 v0, v15, v48
  v_cvt_u32_f32 v48, v0
  v_mov_b32 v0, s12
  v_sub_u32 v12, 0, v0
  v_mul_lo_u32 v0, v12, v48
  v_mul_hi_u32 v12, v48, v0
  v_add_u32 v0, v48, v12
  v_mov_b32 v48, s41
  v_mul_hi_u32 v12, v48, v0
  v_mov_b32 v48, s12
  v_mul_lo_u32 v0, v12, v48
  v_mov_b32 v48, s41
  v_sub_u32 v28, v48, v0
  v_mov_b32 v48, s12
  v_subrev_u32 v0, v48, v28
  v_mov_b32 v48, s12
  v_cmp_ge_u32 vcc, v28, v48
  v_mov_b32 v48, 1
  v_cndmask_b32 v29, 0, v48, vcc
  v_add_u32 v48, v12, v29
  v_cndmask_b32 v12, v28, v0
  v_mov_b32 v0, s12
  v_cmp_ge_u32 vcc, v12, v0
  v_mov_b32 v0, 1
  v_cndmask_b32 v12, 0, v0, vcc
  v_add_u32 v0, v48, v12
  s_nop 0
  v_readfirstlane_b32 s4, v0
  v_cmp_ne_u32 vcc, v86, 0
  v_mov_b32 v48, s4
  v_mov_b32 v0, s18
  v_cndmask_b32 v12, v0, v48
  v_lshl_or_b32 v86, v12, 6, v84
  v_or_b32 v84, v86, v76
  v_sub_u32 v86, v84, v82
  v_mul_lo_u32 v84, v86, s3
  v_mov_b32 v15, 256
  v_add_u32 v82, v66, v15
  v_add_u32 v76, v84, v82
  v_add_u32 v48, v86, 32
  v_mul_lo_u32 v86, v48, s3
  v_add_u32 v48, v86, v82
  v_mul_lo_u32 v82, v12, s46
  v_mul_lo_u32 v0, s46, v81
  v_lshl_add_u32 v81, v82, 1, v0
  v_add_u32 v82, v81, v73
  v_lshlrev_b32 v81, 8, v85
  v_sub_u32 v85, v82, v81
  v_mov_b32 v15, 512
  v_add_u32 v82, v85, v15
  v_mov_b32 v15, 4096
  v_add_u32 v81, v63, v15
  v_mul_hi_u32 v73, v81, v68
  v_mov_b32 v0, s3
  v_mul_lo_u32 v28, v73, v0
  v_sub_u32 v0, v81, v28
  v_mov_b32 v28, s3
  v_subrev_u32 v29, v28, v0
  v_mov_b32 v28, s3
  v_cmp_ge_u32 vcc, v0, v28
  v_mov_b32 v28, 1
  v_cndmask_b32 v30, 0, v28, vcc
  v_add_u32 v28, v73, v30
  v_cndmask_b32 v30, v0, v29
  v_mov_b32 v31, s3
  v_cmp_ge_u32 vcc, v30, v31
  v_mov_b32 v30, 1
  v_cndmask_b32 v31, 0, v30, vcc
  v_add_u32 v30, v28, v31
  v_add_u32 v28, v74, v30
  v_mul_lo_u32 v30, v28, s3
  v_mov_b32 v28, s3
  v_cmp_ge_u32 vcc, v0, v28
  v_mov_b32 v28, 1
  v_cndmask_b32 v31, 0, v28, vcc
  v_add_u32 v28, v73, v31
  v_cndmask_b32 v31, v0, v29
  v_mov_b32 v24, s3
  v_cmp_ge_u32 vcc, v31, v24
  v_mov_b32 v31, 1
  v_cndmask_b32 v24, 0, v31, vcc
  v_add_u32 v31, v28, v24
  v_mul_lo_u32 v28, v31, s3
  v_sub_u32 v31, v81, v28
  v_add_u32 v81, v30, v31
  v_mov_b32 v15, 5120
  v_add_u32 v28, v63, v15
  v_mul_hi_u32 v63, v28, v68
  v_mov_b32 v68, s3
  v_mul_lo_u32 v30, v63, v68
  v_sub_u32 v68, v28, v30
  v_mov_b32 v30, s3
  v_subrev_u32 v24, v30, v68
  v_mov_b32 v30, s3
  v_cmp_ge_u32 vcc, v68, v30
  v_mov_b32 v30, 1
  v_cndmask_b32 v25, 0, v30, vcc
  v_add_u32 v30, v63, v25
  v_cndmask_b32 v25, v68, v24
  v_mov_b32 v26, s3
  v_cmp_ge_u32 vcc, v25, v26
  v_mov_b32 v25, 1
  v_cndmask_b32 v26, 0, v25, vcc
  v_add_u32 v25, v30, v26
  v_add_u32 v30, v74, v25
  v_mul_lo_u32 v25, v30, s3
  v_mov_b32 v30, s3
  v_cmp_ge_u32 vcc, v68, v30
  v_mov_b32 v30, 1
  v_cndmask_b32 v26, 0, v30, vcc
  v_add_u32 v30, v63, v26
  v_cndmask_b32 v26, v68, v24
  v_mov_b32 v27, s3
  v_cmp_ge_u32 vcc, v26, v27
  v_mov_b32 v26, 1
  v_cndmask_b32 v27, 0, v26, vcc
  v_add_u32 v26, v30, v27
  v_mul_lo_u32 v30, v26, s3
  v_sub_u32 v26, v28, v30
  v_add_u32 v28, v25, v26
  v_mov_b32 v30, s3
  v_cmp_ge_u32 vcc, v0, v30
  v_mov_b32 v30, 1
  v_cndmask_b32 v25, 0, v30, vcc
  v_add_u32 v30, v73, v25
  v_cndmask_b32 v73, v0, v29
  v_mov_b32 v0, s3
  v_cmp_ge_u32 vcc, v73, v0
  v_mov_b32 v73, 1
  v_cndmask_b32 v0, 0, v73, vcc
  v_add_u32 v73, v30, v0
  v_add_u32 v0, v74, v73
  v_add_u32 v73, v0, 16
  v_mul_lo_u32 v0, v73, s3
  v_add_u32 v73, v0, v31
  v_mov_b32 v0, s3
  v_cmp_ge_u32 vcc, v68, v0
  v_mov_b32 v0, 1
  v_cndmask_b32 v29, 0, v0, vcc
  v_add_u32 v0, v63, v29
  v_cndmask_b32 v63, v68, v24
  v_mov_b32 v68, s3
  v_cmp_ge_u32 vcc, v63, v68
  v_mov_b32 v68, 1
  v_cndmask_b32 v63, 0, v68, vcc
  v_add_u32 v68, v0, v63
  v_add_u32 v63, v74, v68
  v_add_u32 v74, v63, 16
  v_mul_lo_u32 v68, v74, s3
  v_add_u32 v74, v68, v26
  v_mov_b32 v15, 512
  v_add_u32 v68, v60, v15
  v_mul_hi_u32 v63, v68, v51
  v_mov_b32 v60, s10
  v_mul_lo_u32 v0, v63, v60
  v_sub_u32 v60, v68, v0
  v_mov_b32 v68, s10
  v_subrev_u32 v0, v68, v60
  v_mov_b32 v68, s10
  v_cmp_ge_u32 vcc, v60, v68
  v_mov_b32 v68, 1
  v_cndmask_b32 v29, 0, v68, vcc
  v_add_u32 v68, v63, v29
  v_cndmask_b32 v63, v60, v0
  v_mov_b32 v60, s10
  v_cmp_ge_u32 vcc, v63, v60
  v_mov_b32 v63, 1
  v_cndmask_b32 v60, 0, v63, vcc
  v_add_u32 v63, v68, v60
  v_mul_lo_u32 v68, v63, s43
  v_add_u32 v63, v50, v15
  v_mul_hi_u32 v60, v63, v51
  v_mov_b32 v51, s10
  v_mul_lo_u32 v50, v60, v51
  v_sub_u32 v51, v63, v50
  v_mov_b32 v50, s10
  v_subrev_u32 v0, v50, v51
  v_mov_b32 v50, s10
  v_cmp_ge_u32 vcc, v51, v50
  v_mov_b32 v50, 1
  v_cndmask_b32 v29, 0, v50, vcc
  v_add_u32 v50, v60, v29
  v_cndmask_b32 v60, v51, v0
  v_mov_b32 v51, s10
  v_cmp_ge_u32 vcc, v60, v51
  v_mov_b32 v60, 1
  v_cndmask_b32 v51, 0, v60, vcc
  v_add_u32 v60, v50, v51
  v_mul_lo_u32 v51, v60, s10
  v_sub_u32 v60, v63, v51
  v_add_u32 v63, v68, v60
  v_mov_b32 v15, 384
  v_add_u32 v68, v66, v15
  v_add_u32 v66, v84, v68
  v_add_u32 v84, v86, v68
  v_mov_b32 v15, 768
  v_add_u32 v86, v85, v15
  v_or_b32 v85, v80, 1
  v_accvgpr_write_b32 a0, 0
  v_accvgpr_write_b32 a1, 0
  v_accvgpr_write_b32 a2, 0
  v_accvgpr_write_b32 a3, 0
  s_mov_b32 s3, 0
  s_mul_i32 s4, s3, 2048
  v_add_u32 v68, v14, s4
  v_add_u32 v60, v62, s4
  v_add_u32 v62, v1, s4
  s_mov_b32 s3, 0
  s_mul_i32 s10, s3, 256
  s_mov_b32 s3, 0
  s_mul_i32 s12, s3, 128
  v_add_u32 v51, v48, s12
  v_add_u32 v50, v82, s10
  v_add_u32 v82, v81, s4
  v_add_u32 v81, v28, s4
  v_add_u32 v48, v73, s4
  v_add_u32 v73, v74, s4
  v_add_u32 v74, v63, s10
  v_add_u32 v63, v84, s12
  v_add_u32 v84, v86, s10
  v_accvgpr_write_b32 a4, 0
  v_accvgpr_write_b32 a5, 0
  v_accvgpr_write_b32 a6, 0
  v_accvgpr_write_b32 a7, 0
  v_accvgpr_write_b32 a8, 0
  v_accvgpr_write_b32 a9, 0
  v_accvgpr_write_b32 a10, 0
  v_accvgpr_write_b32 a11, 0
  v_accvgpr_write_b32 a12, 0
  v_accvgpr_write_b32 a13, 0
  v_accvgpr_write_b32 a14, 0
  v_accvgpr_write_b32 a15, 0
  s_mov_b32 s3, 0
  s_mov_b32 s4, 0
  s_mov_b32 s10, 0
  s_mov_b32 s12, 0
  s_mov_b32 s14, 0
  s_mov_b32 s18, 0
  s_mov_b32 s41, 0
L_loop_0:
  s_waitcnt vmcnt(3) & lgkmcnt(0)
  s_barrier
  ; unhandled: rocdl.sched.barrier
  v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], v[36:39], v[52:55], a[0:3], v64, v75 op_sel_hi:[0,0,0] cbsz:4 blgp:4
  buffer_load_dwordx4 v[28:31], v65, s[28:31], s41 offen
  v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], v[32:35], v[44:47], a[0:3], v64, v75 op_sel_hi:[1,1,0] cbsz:4 blgp:4
  ds_read_b128 v[24:27], v61 offset:11264
  v_mfma_scale_f32_16x16x128_f8f6f4 a[4:7], v[36:39], v[40:43], a[4:7], v64, v75 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
  buffer_load_dwordx4 v[8:11], v68, s[28:31], s41 offen
  v_mfma_scale_f32_16x16x128_f8f6f4 a[4:7], v[32:35], v[56:59], a[4:7], v64, v75 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
  ds_read_b128 v[16:19], v49 offset:11264
  ds_read_b32 v86, v85 offset:512
  buffer_load_dwordx4 v[4:7], v60, s[28:31], s41 offen
  buffer_load_dwordx4 v[20:23], v62, s[28:31], s41 offen
  buffer_load_dword v14, v13, s[32:35], s3 offen
  ; unhandled: rocdl.sched.barrier
  s_waitcnt vmcnt(5) & lgkmcnt(0)
  s_barrier
  ; unhandled: rocdl.sched.barrier
  ; unhandled: rocdl.sched.barrier
  v_mfma_scale_f32_16x16x128_f8f6f4 a[8:11], v[24:27], v[52:55], a[8:11], v86, v75 op_sel_hi:[0,0,0] cbsz:4 blgp:4
  s_add_u32 s43, s18, 2
  s_cmp_lt_i32 s43, s19
  s_and_b32 s21, s21, 0xffff
  s_or_b32 s21, s21, 0x40000000
  s_cmp_lt_i32 s43, s19
  s_cselect_b32 s22, s15, 0
  s_mov_b32 s23, 0x27000
  s_mov_b32 m0, s2
  buffer_load_dwordx4 v76, s[20:23], s4 offen lds
  v_mfma_scale_f32_16x16x128_f8f6f4 a[8:11], v[16:19], v[44:47], a[8:11], v86, v75 op_sel_hi:[1,1,0] cbsz:4 blgp:4
  ds_read_b128 v[0:3], v61 offset:1024
  v_mfma_scale_f32_16x16x128_f8f6f4 a[12:15], v[24:27], v[40:43], a[12:15], v86, v75 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
  s_mov_b32 m0, s40
  buffer_load_dwordx4 v51, s[20:23], s4 offen lds
  s_cmp_lt_i32 s43, s19
  s_and_b32 s25, s25, 0xffff
  s_or_b32 s25, s25, 0x40000000
  s_cmp_lt_i32 s43, s19
  s_cselect_b32 s26, s47, 0
  s_mov_b32 s27, 0x27000
  s_mov_b32 m0, s13
  buffer_load_dword v50, s[24:27], s10 offen lds
  v_mfma_scale_f32_16x16x128_f8f6f4 a[12:15], v[16:19], v[56:59], a[12:15], v86, v75 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
  ds_read_b128 v[24:27], v49 offset:1024
  ds_read_b32 v86, v80
  ; unhandled: rocdl.sched.barrier
  s_waitcnt vmcnt(3) & lgkmcnt(0)
  s_barrier
  ; unhandled: rocdl.sched.barrier
  ; unhandled: rocdl.sched.barrier
  v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], v[0:3], v[28:31], a[0:3], v86, v14 op_sel_hi:[0,0,0] cbsz:4 blgp:4
  buffer_load_dwordx4 v[52:55], v82, s[28:31], s41 offen
  v_mfma_scale_f32_16x16x128_f8f6f4 a[0:3], v[24:27], v[8:11], a[0:3], v86, v14 op_sel_hi:[1,1,0] cbsz:4 blgp:4
  ds_read_b128 v[16:19], v61 offset:3072
  v_mfma_scale_f32_16x16x128_f8f6f4 a[4:7], v[0:3], v[4:7], a[4:7], v86, v14 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
  buffer_load_dwordx4 v[44:47], v81, s[28:31], s41 offen
  v_mfma_scale_f32_16x16x128_f8f6f4 a[4:7], v[24:27], v[20:23], a[4:7], v86, v14 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
  ds_read_b128 v[24:27], v49 offset:3072
  ds_read_b32 v86, v85
  buffer_load_dwordx4 v[40:43], v48, s[28:31], s41 offen
  buffer_load_dwordx4 v[56:59], v73, s[28:31], s41 offen
  buffer_load_dword v75, v74, s[32:35], s3 offen
  ; unhandled: rocdl.sched.barrier
  s_waitcnt vmcnt(5) & lgkmcnt(0)
  s_barrier
  ; unhandled: rocdl.sched.barrier
  ; unhandled: rocdl.sched.barrier
  v_mfma_scale_f32_16x16x128_f8f6f4 a[8:11], v[16:19], v[28:31], a[8:11], v86, v14 op_sel_hi:[0,0,0] cbsz:4 blgp:4
  s_add_u32 s53, s18, 3
  s_cmp_lt_i32 s53, s19
  s_and_b32 s21, s21, 0xffff
  s_or_b32 s21, s21, 0x40000000
  s_cmp_lt_i32 s53, s19
  s_cselect_b32 s22, s15, 0
  s_mov_b32 s23, 0x27000
  s_mov_b32 m0, s6
  buffer_load_dwordx4 v66, s[20:23], s12 offen lds
  v_mfma_scale_f32_16x16x128_f8f6f4 a[8:11], v[24:27], v[8:11], a[8:11], v86, v14 op_sel_hi:[1,1,0] cbsz:4 blgp:4
  ds_read_b128 v[36:39], v61 offset:9216
  v_mfma_scale_f32_16x16x128_f8f6f4 a[12:15], v[16:19], v[4:7], a[12:15], v86, v14 op_sel:[0,1,0] op_sel_hi:[0,0,0] cbsz:4 blgp:4
  s_mov_b32 m0, s9
  buffer_load_dwordx4 v63, s[20:23], s12 offen lds
  s_cmp_lt_i32 s53, s19
  s_and_b32 s25, s25, 0xffff
  s_or_b32 s25, s25, 0x40000000
  s_cmp_lt_i32 s53, s19
  s_cselect_b32 s26, s47, 0
  s_mov_b32 s27, 0x27000
  s_mov_b32 m0, s42
  buffer_load_dword v84, s[24:27], s14 offen lds
  v_mfma_scale_f32_16x16x128_f8f6f4 a[12:15], v[24:27], v[20:23], a[12:15], v86, v14 op_sel:[0,1,0] op_sel_hi:[1,1,0] cbsz:4 blgp:4
  ds_read_b128 v[32:35], v49 offset:9216
  ds_read_b32 v64, v80 offset:512
  ; unhandled: rocdl.sched.barrier
  s_waitcnt vmcnt(3) & lgkmcnt(0)
  s_barrier
  ; unhandled: rocdl.sched.barrier
  s_add_u32 s41, s41, 4096
  s_add_u32 s3, s3, 512
  s_add_u32 s4, s4, 256
  s_add_u32 s10, s10, 512
  s_add_u32 s12, s12, 256
  s_add_u32 s14, s14, 512
  s_cmp_lt_u32 s43, s19
  s_mov_b32 s18, s43
  s_cbranch_scc1 L_loop_0
  s_waitcnt vmcnt(0) & lgkmcnt(0)
  s_barrier
  v_lshlrev_b32 v84, 6, v70
  v_sub_u32 v85, 0, v84
  v_lshl_add_u32 v84, v12, 6, v85
  s_cmp_lg_u32 s5, 0
  s_cmp_lg_u32 s5, 0
  s_cmp_lg_u32 s5, 0
  s_cmp_lg_u32 s8, 0
  v_mov_b32 v85, s7
  v_cmp_ge_u32 vcc, v79, v85
  v_mov_b32 v85, 1
  v_cndmask_b32 v86, 0, v85, vcc
  v_add_u32 v85, v72, v86
  v_cndmask_b32 v86, v79, v71
  v_mov_b32 v82, s7
  v_cmp_ge_u32 vcc, v86, v82
  v_mov_b32 v86, 1
  v_cndmask_b32 v82, 0, v86, vcc
  v_add_u32 v86, v85, v82
  s_nop 0
  v_readfirstlane_b32 s2, v86
  s_mul_i32 s3, s2, s7
  s_sub_u32 s2, s11, s3
  s_add_u32 s3, s52, s2
  v_cmp_ne_u32 vcc, v78, 0
  v_mov_b32 v85, s3
  v_cndmask_b32 v86, 0, v85, vcc
  v_lshlrev_b32 v85, 6, v86
  v_sub_u32 v82, v83, v85
  v_lshl_or_b32 v85, v70, 6, v69
  v_lshl_or_b32 v83, v77, 2, v85
  v_lshl_add_u32 v85, v86, 6, v88
  v_lshl_add_u32 v88, v87, 5, v85
  v_sub_u32 v87, v88, v67
  v_mul_lo_u32 v88, v84, s45
  v_mul_lo_u32 v84, v83, s45
  v_add_u32 v85, v88, v82
  v_add_u32 v88, v84, v87
  s_mov_b64 s[48:49], s[36:37]
  v_readfirstlane_b32 s51, v85
  s_mul_hi_i32 s50, s51, 2
  s_mul_i32 s52, s51, 2
  s_add_u32 s48, s48, s52
  s_addc_u32 s49, s49, s50
  s_mov_b32 s50, 0x7FFFFFFC
  s_mov_b32 s51, 0x20000
  v_lshlrev_b32 v84, 1, v88
  v_accvgpr_read_b32 v88, a0
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v84, s[48:51], 0 offen
  v_or_b32 v88, v83, 1
  v_mul_lo_u32 v85, v88, s45
  v_add_u32 v88, v85, v87
  v_lshlrev_b32 v85, 1, v88
  v_accvgpr_read_b32 v88, a1
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v85, s[48:51], 0 offen
  v_or_b32 v88, v83, 2
  v_mul_lo_u32 v86, v88, s45
  v_add_u32 v88, v86, v87
  v_lshlrev_b32 v86, 1, v88
  v_accvgpr_read_b32 v88, a2
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v86, s[48:51], 0 offen
  v_or_b32 v88, v83, 3
  v_mul_lo_u32 v82, v88, s45
  v_add_u32 v88, v82, v87
  v_lshlrev_b32 v82, 1, v88
  v_accvgpr_read_b32 v88, a3
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v82, s[48:51], 0 offen
  v_accvgpr_read_b32 v88, a4
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v84, s[48:51], 0 offen offset:32
  v_accvgpr_read_b32 v88, a5
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v85, s[48:51], 0 offen offset:32
  v_accvgpr_read_b32 v88, a6
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v86, s[48:51], 0 offen offset:32
  v_accvgpr_read_b32 v88, a7
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v82, s[48:51], 0 offen offset:32
  v_add_u32 v88, v83, 16
  v_mul_lo_u32 v84, v88, s45
  v_add_u32 v88, v84, v87
  v_lshlrev_b32 v84, 1, v88
  v_accvgpr_read_b32 v88, a8
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v84, s[48:51], 0 offen
  v_add_u32 v88, v83, 17
  v_mul_lo_u32 v85, v88, s45
  v_add_u32 v88, v85, v87
  v_lshlrev_b32 v85, 1, v88
  v_accvgpr_read_b32 v88, a9
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v85, s[48:51], 0 offen
  v_add_u32 v88, v83, 18
  v_mul_lo_u32 v86, v88, s45
  v_add_u32 v88, v86, v87
  v_lshlrev_b32 v86, 1, v88
  v_accvgpr_read_b32 v88, a10
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v86, s[48:51], 0 offen
  v_add_u32 v88, v83, 19
  v_mul_lo_u32 v83, v88, s45
  v_add_u32 v88, v83, v87
  v_lshlrev_b32 v87, 1, v88
  v_accvgpr_read_b32 v88, a11
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v87, s[48:51], 0 offen
  v_accvgpr_read_b32 v88, a12
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v84, s[48:51], 0 offen offset:32
  v_accvgpr_read_b32 v88, a13
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v85, s[48:51], 0 offen offset:32
  v_accvgpr_read_b32 v88, a14
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v86, s[48:51], 0 offen offset:32
  v_accvgpr_read_b32 v88, a15
  v_cvt_pk_bf16_f32 v88, v88, 0
  buffer_store_short v88, v87, s[48:51], 0 offen offset:32
  s_endpgm

.section .rodata,#alloc
.p2align 6
.amdhsa_kernel wave_mxfp4_dynamic_gemm_64x64x256
  .amdhsa_group_segment_fixed_size 17408
  .amdhsa_private_segment_fixed_size 0
  .amdhsa_kernarg_size 128
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
  .amdhsa_accum_offset 96
  .amdhsa_next_free_vgpr 112
  .amdhsa_next_free_sgpr 56
  .amdhsa_system_sgpr_workgroup_id_x 1
  .amdhsa_system_sgpr_workgroup_id_y 1
  .amdhsa_system_sgpr_workgroup_id_z 1
  .amdhsa_system_vgpr_workitem_id 1
  .amdhsa_float_denorm_mode_32 3
  .amdhsa_float_denorm_mode_16_64 3
.end_amdhsa_kernel

.amdgpu_metadata
---
amdhsa.version:
  - 1
  - 0
amdhsa.kernels:
  - .name: wave_mxfp4_dynamic_gemm_64x64x256
    .symbol: wave_mxfp4_dynamic_gemm_64x64x256.kd
    .args:
      - .name:       arg0_ptr
        .offset:     0
        .size:       8
        .value_kind: global_buffer
        .value_type: 'i8*'
      - .name:       arg1_ptr
        .offset:     8
        .size:       8
        .value_kind: global_buffer
        .value_type: 'i8*'
      - .name:       arg2_ptr
        .offset:     16
        .size:       8
        .value_kind: global_buffer
        .value_type: 'i8*'
      - .name:       arg3_ptr
        .offset:     24
        .size:       8
        .value_kind: global_buffer
        .value_type: 'i8*'
      - .name:       arg4_ptr
        .offset:     32
        .size:       8
        .value_kind: global_buffer
        .value_type: 'i8*'
      - .name:       arg5_ptr
        .offset:     40
        .size:       8
        .value_kind: global_buffer
        .value_type: 'i8*'
      - .name:       arg6_ptr
        .offset:     48
        .size:       8
        .value_kind: global_buffer
        .value_type: 'i8*'
      - .name:       arg7_ptr
        .offset:     56
        .size:       8
        .value_kind: global_buffer
        .value_type: 'i8*'
    .kernarg_segment_size: 128
    .group_segment_fixed_size: 17408
    .private_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .wavefront_size: 64
    .sgpr_count: 55
    .vgpr_count: 89
    .agpr_count: 16
    .max_flat_workgroup_size: 256
...
.end_amdgpu_metadata
