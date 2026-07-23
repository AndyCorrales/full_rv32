set ModuleHierarchy {[{
"Name" : "rv32_ooo_tick","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_cdb_broadcast_fu_5684","ID" : "1","Type" : "sequential"},
	{"Name" : "grp_fpu_compute_fu_5799","ID" : "2","Type" : "sequential"},
	{"Name" : "instr_1_expand_fu_5824","ID" : "3","Type" : "sequential"},
	{"Name" : "grp_read_operand_fu_5830","ID" : "4","Type" : "sequential"},
	{"Name" : "grp_read_operand_fp_fu_5845","ID" : "5","Type" : "sequential"},
	{"Name" : "grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_872_10_fu_5860","ID" : "6","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_872_10","ID" : "7","Type" : "pipeline"},]},
	{"Name" : "grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_1129_11_fu_5869","ID" : "8","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_1129_11","ID" : "9","Type" : "pipeline"},]},
	{"Name" : "grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_575_4_fu_5877","ID" : "10","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_575_4","ID" : "11","Type" : "pipeline"},]},
	{"Name" : "grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_579_5_fu_5883","ID" : "12","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_579_5","ID" : "13","Type" : "pipeline"},]},]
}]}