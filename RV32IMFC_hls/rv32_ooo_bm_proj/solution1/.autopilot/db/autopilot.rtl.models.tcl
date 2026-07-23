set SynModuleInfo {
  {SRCNAME cdb_broadcast MODELNAME cdb_broadcast RTLNAME rv32_ooo_tick_cdb_broadcast}
  {SRCNAME fpu_compute MODELNAME fpu_compute RTLNAME rv32_ooo_tick_fpu_compute
    SUBMODULES {
      {MODELNAME rv32_ooo_tick_faddfsub_32ns_32ns_32_4_full_dsp_1 RTLNAME rv32_ooo_tick_faddfsub_32ns_32ns_32_4_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_fmul_32ns_32ns_32_3_max_dsp_1 RTLNAME rv32_ooo_tick_fmul_32ns_32ns_32_3_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_fdiv_32ns_32ns_32_9_no_dsp_1 RTLNAME rv32_ooo_tick_fdiv_32ns_32ns_32_9_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 8 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_uitofp_32ns_32_4_no_dsp_1 RTLNAME rv32_ooo_tick_uitofp_32ns_32_4_no_dsp_1 BINDTYPE op TYPE uitofp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_sitofp_32ns_32_4_no_dsp_1 RTLNAME rv32_ooo_tick_sitofp_32ns_32_4_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME rv32_ooo_tick_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_fsqrt_32ns_32ns_32_8_no_dsp_1 RTLNAME rv32_ooo_tick_fsqrt_32ns_32ns_32_8_no_dsp_1 BINDTYPE op TYPE fsqrt IMPL fabric LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_sparsemux_9_3_3_1_1 RTLNAME rv32_ooo_tick_sparsemux_9_3_3_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_ooo_tick_bitselect_1ns_32ns_32s_1_1_1 RTLNAME rv32_ooo_tick_bitselect_1ns_32ns_32s_1_1_1 BINDTYPE op TYPE bitselect IMPL auto}
      {MODELNAME rv32_ooo_tick_sparsemux_7_2_32_1_1 RTLNAME rv32_ooo_tick_sparsemux_7_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_ooo_tick_sparsemux_13_5_32_1_1 RTLNAME rv32_ooo_tick_sparsemux_13_5_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_ooo_tick_sparsemux_9_3_32_1_1 RTLNAME rv32_ooo_tick_sparsemux_9_3_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_ooo_tick_fpu_compute_mask_table_ROM_AUTO_1R RTLNAME rv32_ooo_tick_fpu_compute_mask_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_fpu_compute_one_half_minus_one_table_ROM_AUTO_1R RTLNAME rv32_ooo_tick_fpu_compute_one_half_minus_one_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_fpu_compute_index_table_ROM_AUTO_1R RTLNAME rv32_ooo_tick_fpu_compute_index_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME expand MODELNAME expand RTLNAME rv32_ooo_tick_expand}
  {SRCNAME read_operand MODELNAME read_operand RTLNAME rv32_ooo_tick_read_operand}
  {SRCNAME read_operand_fp MODELNAME read_operand_fp RTLNAME rv32_ooo_tick_read_operand_fp}
  {SRCNAME rv32_ooo_tick_Pipeline_VITIS_LOOP_872_10 MODELNAME rv32_ooo_tick_Pipeline_VITIS_LOOP_872_10 RTLNAME rv32_ooo_tick_rv32_ooo_tick_Pipeline_VITIS_LOOP_872_10
    SUBMODULES {
      {MODELNAME rv32_ooo_tick_flow_control_loop_pipe_sequential_init RTLNAME rv32_ooo_tick_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME rv32_ooo_tick_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME rv32_ooo_tick_Pipeline_VITIS_LOOP_1129_11 MODELNAME rv32_ooo_tick_Pipeline_VITIS_LOOP_1129_11 RTLNAME rv32_ooo_tick_rv32_ooo_tick_Pipeline_VITIS_LOOP_1129_11}
  {SRCNAME rv32_ooo_tick_Pipeline_VITIS_LOOP_575_4 MODELNAME rv32_ooo_tick_Pipeline_VITIS_LOOP_575_4 RTLNAME rv32_ooo_tick_rv32_ooo_tick_Pipeline_VITIS_LOOP_575_4}
  {SRCNAME rv32_ooo_tick_Pipeline_VITIS_LOOP_579_5 MODELNAME rv32_ooo_tick_Pipeline_VITIS_LOOP_579_5 RTLNAME rv32_ooo_tick_rv32_ooo_tick_Pipeline_VITIS_LOOP_579_5}
  {SRCNAME rv32_ooo_tick MODELNAME rv32_ooo_tick RTLNAME rv32_ooo_tick IS_TOP 1
    SUBMODULES {
      {MODELNAME rv32_ooo_tick_mul_32ns_32ns_64_1_1 RTLNAME rv32_ooo_tick_mul_32ns_32ns_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_mul_32ns_32s_64_1_1 RTLNAME rv32_ooo_tick_mul_32ns_32s_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_mul_32s_32s_32_1_1 RTLNAME rv32_ooo_tick_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_mul_32s_32s_64_1_1 RTLNAME rv32_ooo_tick_mul_32s_32s_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_sparsemux_17_7_32_1_1 RTLNAME rv32_ooo_tick_sparsemux_17_7_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_ooo_tick_srem_32s_32s_32_36_seq_1 RTLNAME rv32_ooo_tick_srem_32s_32s_32_36_seq_1 BINDTYPE op TYPE srem IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_udiv_32s_32s_32_36_seq_1 RTLNAME rv32_ooo_tick_udiv_32s_32s_32_36_seq_1 BINDTYPE op TYPE udiv IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_sdiv_32s_32s_32_36_seq_1 RTLNAME rv32_ooo_tick_sdiv_32s_32s_32_36_seq_1 BINDTYPE op TYPE sdiv IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_urem_32s_32s_32_36_seq_1 RTLNAME rv32_ooo_tick_urem_32s_32s_32_36_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_sparsemux_13_5_32_1_1_x RTLNAME rv32_ooo_tick_sparsemux_13_5_32_1_1_x BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_ooo_tick_sparsemux_21_9_32_1_1 RTLNAME rv32_ooo_tick_sparsemux_21_9_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_ooo_tick_sparsemux_9_3_4_1_1 RTLNAME rv32_ooo_tick_sparsemux_9_3_4_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_ooo_tick_sparsemux_7_2_3_1_1 RTLNAME rv32_ooo_tick_sparsemux_7_2_3_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME rv32_ooo_tick_vregs_RAM_AUTO_1R1W RTLNAME rv32_ooo_tick_vregs_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_rob_valid_RAM_AUTO_1R1W RTLNAME rv32_ooo_tick_rob_valid_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_rob_is_ecall_RAM_AUTO_1R1W RTLNAME rv32_ooo_tick_rob_is_ecall_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_rob_addr_RAM_AUTO_1R1W RTLNAME rv32_ooo_tick_rob_addr_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_rob_sdata_RAM_AUTO_1R1W RTLNAME rv32_ooo_tick_rob_sdata_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_rob_mem_f3_RAM_AUTO_1R1W RTLNAME rv32_ooo_tick_rob_mem_f3_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_rob_dest_RAM_AUTO_1R1W RTLNAME rv32_ooo_tick_rob_dest_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_fregs_RAM_AUTO_1R1W RTLNAME rv32_ooo_tick_fregs_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_frat_has_tag_RAM_AUTO_1R1W RTLNAME rv32_ooo_tick_frat_has_tag_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_frat_tag_RAM_AUTO_1R1W RTLNAME rv32_ooo_tick_frat_tag_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rv32_ooo_tick_control_s_axi RTLNAME rv32_ooo_tick_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
