set SynModuleInfo {
  {SRCNAME ooo_demo_tick_Pipeline_VITIS_LOOP_119_1 MODELNAME ooo_demo_tick_Pipeline_VITIS_LOOP_119_1 RTLNAME ooo_demo_tick_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1
    SUBMODULES {
      {MODELNAME ooo_demo_tick_flow_control_loop_pipe_sequential_init RTLNAME ooo_demo_tick_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME ooo_demo_tick_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME ooo_demo_tick MODELNAME ooo_demo_tick RTLNAME ooo_demo_tick IS_TOP 1
    SUBMODULES {
      {MODELNAME ooo_demo_tick_mul_32s_32s_32_1_1 RTLNAME ooo_demo_tick_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME ooo_demo_tick_sparsemux_9_2_1_1_1 RTLNAME ooo_demo_tick_sparsemux_9_2_1_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME ooo_demo_tick_sparsemux_9_2_2_1_1 RTLNAME ooo_demo_tick_sparsemux_9_2_2_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME ooo_demo_tick_sparsemux_9_2_32_1_1 RTLNAME ooo_demo_tick_sparsemux_9_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME ooo_demo_tick_sparsemux_7_2_1_1_1 RTLNAME ooo_demo_tick_sparsemux_7_2_1_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME ooo_demo_tick_sparsemux_7_2_2_1_1 RTLNAME ooo_demo_tick_sparsemux_7_2_2_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME ooo_demo_tick_sparsemux_7_2_4_1_1 RTLNAME ooo_demo_tick_sparsemux_7_2_4_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME ooo_demo_tick_sparsemux_7_2_32_1_1 RTLNAME ooo_demo_tick_sparsemux_7_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME ooo_demo_tick_sparsemux_9_3_32_1_1 RTLNAME ooo_demo_tick_sparsemux_9_3_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME ooo_demo_tick_control_s_axi RTLNAME ooo_demo_tick_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
