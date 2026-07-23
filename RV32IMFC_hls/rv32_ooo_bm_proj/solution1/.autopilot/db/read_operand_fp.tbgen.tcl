set moduleName read_operand_fp
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
set C_modelName {read_operand_fp}
set C_modelType { int 36 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict frat_has_tag { MEM_WIDTH 1 MEM_SIZE 32 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict frat_tag { MEM_WIDTH 3 MEM_SIZE 32 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rob_ready { MEM_WIDTH 1 MEM_SIZE 8 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict fregs { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rob_value { MEM_WIDTH 32 MEM_SIZE 32 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ reg_r int 5 regular  }
	{ frat_has_tag int 1 regular {array 32 { 1 3 } 1 1 } {global 0}  }
	{ frat_tag int 3 regular {array 32 { 1 3 } 1 1 } {global 0}  }
	{ rob_ready int 1 regular {array 8 { 1 3 } 1 1 } {global 0}  }
	{ fregs int 32 regular {array 32 { 1 3 } 1 1 } {global 0}  }
	{ rob_value int 32 regular {array 8 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "reg_r", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "frat_has_tag", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "frat_tag", "interface" : "memory", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rob_ready", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fregs", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rob_value", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 36} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ reg_r sc_in sc_lv 5 signal 0 } 
	{ frat_has_tag_address0 sc_out sc_lv 5 signal 1 } 
	{ frat_has_tag_ce0 sc_out sc_logic 1 signal 1 } 
	{ frat_has_tag_q0 sc_in sc_lv 1 signal 1 } 
	{ frat_tag_address0 sc_out sc_lv 5 signal 2 } 
	{ frat_tag_ce0 sc_out sc_logic 1 signal 2 } 
	{ frat_tag_q0 sc_in sc_lv 3 signal 2 } 
	{ rob_ready_address0 sc_out sc_lv 3 signal 3 } 
	{ rob_ready_ce0 sc_out sc_logic 1 signal 3 } 
	{ rob_ready_q0 sc_in sc_lv 1 signal 3 } 
	{ fregs_address0 sc_out sc_lv 5 signal 4 } 
	{ fregs_ce0 sc_out sc_logic 1 signal 4 } 
	{ fregs_q0 sc_in sc_lv 32 signal 4 } 
	{ rob_value_address0 sc_out sc_lv 3 signal 5 } 
	{ rob_value_ce0 sc_out sc_logic 1 signal 5 } 
	{ rob_value_q0 sc_in sc_lv 32 signal 5 } 
	{ ap_return_0 sc_out sc_lv 1 signal -1 } 
	{ ap_return_1 sc_out sc_lv 32 signal -1 } 
	{ ap_return_2 sc_out sc_lv 3 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "reg_r", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "reg_r", "role": "default" }} , 
 	{ "name": "frat_has_tag_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "frat_has_tag", "role": "address0" }} , 
 	{ "name": "frat_has_tag_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "frat_has_tag", "role": "ce0" }} , 
 	{ "name": "frat_has_tag_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "frat_has_tag", "role": "q0" }} , 
 	{ "name": "frat_tag_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "frat_tag", "role": "address0" }} , 
 	{ "name": "frat_tag_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "frat_tag", "role": "ce0" }} , 
 	{ "name": "frat_tag_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "frat_tag", "role": "q0" }} , 
 	{ "name": "rob_ready_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rob_ready", "role": "address0" }} , 
 	{ "name": "rob_ready_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rob_ready", "role": "ce0" }} , 
 	{ "name": "rob_ready_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rob_ready", "role": "q0" }} , 
 	{ "name": "fregs_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "fregs", "role": "address0" }} , 
 	{ "name": "fregs_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fregs", "role": "ce0" }} , 
 	{ "name": "fregs_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fregs", "role": "q0" }} , 
 	{ "name": "rob_value_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rob_value", "role": "address0" }} , 
 	{ "name": "rob_value_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rob_value", "role": "ce0" }} , 
 	{ "name": "rob_value_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rob_value", "role": "q0" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "read_operand_fp",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "reg_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "frat_has_tag", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "frat_tag", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rob_ready", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fregs", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rob_value", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_32_1_1_U103", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	read_operand_fp {
		reg_r {Type I LastRead 0 FirstWrite -1}
		frat_has_tag {Type I LastRead 0 FirstWrite -1}
		frat_tag {Type I LastRead 0 FirstWrite -1}
		rob_ready {Type I LastRead 1 FirstWrite -1}
		fregs {Type I LastRead 0 FirstWrite -1}
		rob_value {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	reg_r { ap_none {  { reg_r in_data 0 5 } } }
	frat_has_tag { ap_memory {  { frat_has_tag_address0 mem_address 1 5 }  { frat_has_tag_ce0 mem_ce 1 1 }  { frat_has_tag_q0 mem_dout 0 1 } } }
	frat_tag { ap_memory {  { frat_tag_address0 mem_address 1 5 }  { frat_tag_ce0 mem_ce 1 1 }  { frat_tag_q0 mem_dout 0 3 } } }
	rob_ready { ap_memory {  { rob_ready_address0 mem_address 1 3 }  { rob_ready_ce0 mem_ce 1 1 }  { rob_ready_q0 mem_dout 0 1 } } }
	fregs { ap_memory {  { fregs_address0 mem_address 1 5 }  { fregs_ce0 mem_ce 1 1 }  { fregs_q0 mem_dout 0 32 } } }
	rob_value { ap_memory {  { rob_value_address0 mem_address 1 3 }  { rob_value_ce0 mem_ce 1 1 }  { rob_value_q0 mem_dout 0 32 } } }
}
