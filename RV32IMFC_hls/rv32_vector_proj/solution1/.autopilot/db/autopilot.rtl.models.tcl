set SynModuleInfo {
  {SRCNAME rv32_vector_step_Pipeline_VITIS_LOOP_54_1 MODELNAME rv32_vector_step_Pipeline_VITIS_LOOP_54_1 RTLNAME rv32_vector_step_rv32_vector_step_Pipeline_VITIS_LOOP_54_1
    SUBMODULES {
      {MODELNAME rv32_vector_step_flow_control_loop_pipe_sequential_init RTLNAME rv32_vector_step_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME rv32_vector_step_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME rv32_vector_step MODELNAME rv32_vector_step RTLNAME rv32_vector_step IS_TOP 1
    SUBMODULES {
      {MODELNAME rv32_vector_step_mul_32s_32s_32_1_1 RTLNAME rv32_vector_step_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME rv32_vector_step_gmem_m_axi RTLNAME rv32_vector_step_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME rv32_vector_step_control_s_axi RTLNAME rv32_vector_step_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME rv32_vector_step_control_r_s_axi RTLNAME rv32_vector_step_control_r_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
