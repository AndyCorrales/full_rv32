set SynModuleInfo {
  {SRCNAME expand MODELNAME expand RTLNAME rv32_core_step_expand}
  {SRCNAME rv32_core_step MODELNAME rv32_core_step RTLNAME rv32_core_step IS_TOP 1
    SUBMODULES {
      {MODELNAME rv32_core_step_faddfsub_32ns_32ns_32_4_full_dsp_1 RTLNAME rv32_core_step_faddfsub_32ns_32ns_32_4_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_fmul_32ns_32ns_32_3_max_dsp_1 RTLNAME rv32_core_step_fmul_32ns_32ns_32_3_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_fdiv_32ns_32ns_32_9_no_dsp_1 RTLNAME rv32_core_step_fdiv_32ns_32ns_32_9_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 8 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_uitofp_32s_32_4_no_dsp_1 RTLNAME rv32_core_step_uitofp_32s_32_4_no_dsp_1 BINDTYPE op TYPE uitofp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_sitofp_32s_32_4_no_dsp_1 RTLNAME rv32_core_step_sitofp_32s_32_4_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME rv32_core_step_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_fsqrt_32ns_32ns_32_8_no_dsp_1 RTLNAME rv32_core_step_fsqrt_32ns_32ns_32_8_no_dsp_1 BINDTYPE op TYPE fsqrt IMPL fabric LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_mul_32ns_32ns_64_1_1 RTLNAME rv32_core_step_mul_32ns_32ns_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_mul_32ns_32s_64_1_1 RTLNAME rv32_core_step_mul_32ns_32s_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_mul_32s_32s_32_1_1 RTLNAME rv32_core_step_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_mul_32s_32s_64_1_1 RTLNAME rv32_core_step_mul_32s_32s_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_sparsemux_19_8_32_1_1 RTLNAME rv32_core_step_sparsemux_19_8_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_core_step_srem_32s_32s_32_36_seq_1 RTLNAME rv32_core_step_srem_32s_32s_32_36_seq_1 BINDTYPE op TYPE srem IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_udiv_32s_32s_32_36_seq_1 RTLNAME rv32_core_step_udiv_32s_32s_32_36_seq_1 BINDTYPE op TYPE udiv IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_sdiv_32s_32s_32_36_seq_1 RTLNAME rv32_core_step_sdiv_32s_32s_32_36_seq_1 BINDTYPE op TYPE sdiv IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_urem_32s_32s_32_36_seq_1 RTLNAME rv32_core_step_urem_32s_32s_32_36_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_sparsemux_9_3_3_1_1 RTLNAME rv32_core_step_sparsemux_9_3_3_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_core_step_sparsemux_11_4_10_1_1 RTLNAME rv32_core_step_sparsemux_11_4_10_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_core_step_sparsemux_9_3_1_1_1 RTLNAME rv32_core_step_sparsemux_9_3_1_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_core_step_bitselect_1ns_32ns_32s_1_1_1 RTLNAME rv32_core_step_bitselect_1ns_32ns_32s_1_1_1 BINDTYPE op TYPE bitselect IMPL auto}
      {MODELNAME rv32_core_step_sparsemux_7_2_32_1_1 RTLNAME rv32_core_step_sparsemux_7_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_core_step_sparsemux_13_5_32_1_1 RTLNAME rv32_core_step_sparsemux_13_5_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_core_step_sparsemux_9_3_32_1_1 RTLNAME rv32_core_step_sparsemux_9_3_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_core_step_mask_table_ROM_AUTO_1R RTLNAME rv32_core_step_mask_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_one_half_minus_one_table_ROM_AUTO_1R RTLNAME rv32_core_step_one_half_minus_one_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_index_table_ROM_AUTO_1R RTLNAME rv32_core_step_index_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_core_step_gmem_m_axi RTLNAME rv32_core_step_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME rv32_core_step_control_s_axi RTLNAME rv32_core_step_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME rv32_core_step_control_r_s_axi RTLNAME rv32_core_step_control_r_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
