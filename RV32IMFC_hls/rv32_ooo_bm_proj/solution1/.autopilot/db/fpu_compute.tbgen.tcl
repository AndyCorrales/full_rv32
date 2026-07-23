set moduleName fpu_compute
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 12
set C_modelName {fpu_compute}
set C_modelType { int 32 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ fpu_rs_s1_val int 32 regular {pointer 0} {global 0}  }
	{ fpu_rs_s2_val int 32 regular {pointer 0} {global 0}  }
	{ fpu_rs_s3_val int 32 regular {pointer 0} {global 0}  }
	{ fpu_rs_r4op int 3 regular {pointer 0} {global 0}  }
	{ fpu_rs_f7 int 7 regular {pointer 0} {global 0}  }
	{ fpu_rs_f3 int 3 regular {pointer 0} {global 0}  }
	{ fpu_rs_rs2f int 5 regular {pointer 0} {global 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "fpu_rs_s1_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_s2_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_s3_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_r4op", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_f7", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_f3", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_rs2f", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ fpu_rs_s1_val sc_in sc_lv 32 signal 0 } 
	{ fpu_rs_s2_val sc_in sc_lv 32 signal 1 } 
	{ fpu_rs_s3_val sc_in sc_lv 32 signal 2 } 
	{ fpu_rs_r4op sc_in sc_lv 3 signal 3 } 
	{ fpu_rs_f7 sc_in sc_lv 7 signal 4 } 
	{ fpu_rs_f3 sc_in sc_lv 3 signal 5 } 
	{ fpu_rs_rs2f sc_in sc_lv 5 signal 6 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "fpu_rs_s1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fpu_rs_s1_val", "role": "default" }} , 
 	{ "name": "fpu_rs_s2_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fpu_rs_s2_val", "role": "default" }} , 
 	{ "name": "fpu_rs_s3_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fpu_rs_s3_val", "role": "default" }} , 
 	{ "name": "fpu_rs_r4op", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fpu_rs_r4op", "role": "default" }} , 
 	{ "name": "fpu_rs_f7", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "fpu_rs_f7", "role": "default" }} , 
 	{ "name": "fpu_rs_f3", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fpu_rs_f3", "role": "default" }} , 
 	{ "name": "fpu_rs_rs2f", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "fpu_rs_rs2f", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"],
		"CDFG" : "fpu_compute",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "9",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "fpu_rs_s1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "fpu_rs_s2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "fpu_rs_s3_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "fpu_rs_r4op", "Type" : "None", "Direction" : "I"},
			{"Name" : "fpu_rs_f7", "Type" : "None", "Direction" : "I"},
			{"Name" : "fpu_rs_f3", "Type" : "None", "Direction" : "I"},
			{"Name" : "fpu_rs_rs2f", "Type" : "None", "Direction" : "I"},
			{"Name" : "mask_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "one_half_minus_one_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "index_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mask_table_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.one_half_minus_one_table_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.index_table_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_4_full_dsp_1_U56", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_3_max_dsp_1_U57", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_9_no_dsp_1_U58", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.uitofp_32ns_32_4_no_dsp_1_U59", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32ns_32_4_no_dsp_1_U60", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U61", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U62", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U63", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U64", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fsqrt_32ns_32ns_32_8_no_dsp_1_U65", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_3_3_1_1_U66", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bitselect_1ns_32ns_32s_1_1_1_U67", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_32_1_1_U68", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bitselect_1ns_32ns_32s_1_1_1_U69", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_32_1_1_U70", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_13_5_32_1_1_U71", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_3_32_1_1_U72", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fpu_compute {
		fpu_rs_s1_val {Type I LastRead 0 FirstWrite -1}
		fpu_rs_s2_val {Type I LastRead 0 FirstWrite -1}
		fpu_rs_s3_val {Type I LastRead 0 FirstWrite -1}
		fpu_rs_r4op {Type I LastRead 0 FirstWrite -1}
		fpu_rs_f7 {Type I LastRead 0 FirstWrite -1}
		fpu_rs_f3 {Type I LastRead 0 FirstWrite -1}
		fpu_rs_rs2f {Type I LastRead 0 FirstWrite -1}
		mask_table {Type I LastRead -1 FirstWrite -1}
		one_half_minus_one_table {Type I LastRead -1 FirstWrite -1}
		index_table {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "9"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "9"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	fpu_rs_s1_val { ap_none {  { fpu_rs_s1_val in_data 0 32 } } }
	fpu_rs_s2_val { ap_none {  { fpu_rs_s2_val in_data 0 32 } } }
	fpu_rs_s3_val { ap_none {  { fpu_rs_s3_val in_data 0 32 } } }
	fpu_rs_r4op { ap_none {  { fpu_rs_r4op in_data 0 3 } } }
	fpu_rs_f7 { ap_none {  { fpu_rs_f7 in_data 0 7 } } }
	fpu_rs_f3 { ap_none {  { fpu_rs_f3 in_data 0 3 } } }
	fpu_rs_rs2f { ap_none {  { fpu_rs_rs2f in_data 0 5 } } }
}
