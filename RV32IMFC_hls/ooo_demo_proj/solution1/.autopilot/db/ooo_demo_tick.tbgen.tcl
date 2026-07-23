set moduleName ooo_demo_tick
set isTopModule 1
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
set cdfgNum 4
set C_modelName {ooo_demo_tick}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ reset int 1 regular  }
	{ r0_out int 32 regular {pointer 1}  }
	{ r1_out int 32 regular {pointer 1}  }
	{ r2_out int 32 regular {pointer 1}  }
	{ r3_out int 32 regular {pointer 1}  }
	{ commit_reg int 2 regular {pointer 1}  }
	{ commit_valid int 1 regular {pointer 1}  }
	{ alu_complete_tag int 2 regular {pointer 1}  }
	{ alu_complete_valid int 1 regular {pointer 1}  }
	{ mul_complete_tag int 2 regular {pointer 1}  }
	{ mul_complete_valid int 1 regular {pointer 1}  }
	{ halted int 1 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "reset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "r0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r3_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "commit_reg", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "commit_valid", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "alu_complete_tag", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "alu_complete_valid", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mul_complete_tag", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mul_complete_valid", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "halted", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ reset sc_in sc_lv 1 signal 0 } 
	{ r0_out sc_out sc_lv 32 signal 1 } 
	{ r1_out sc_out sc_lv 32 signal 2 } 
	{ r2_out sc_out sc_lv 32 signal 3 } 
	{ r3_out sc_out sc_lv 32 signal 4 } 
	{ commit_reg sc_out sc_lv 2 signal 5 } 
	{ commit_valid sc_out sc_lv 1 signal 6 } 
	{ alu_complete_tag sc_out sc_lv 2 signal 7 } 
	{ alu_complete_valid sc_out sc_lv 1 signal 8 } 
	{ mul_complete_tag sc_out sc_lv 2 signal 9 } 
	{ mul_complete_valid sc_out sc_lv 1 signal 10 } 
	{ halted sc_out sc_lv 1 signal 11 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"ooo_demo_tick","role":"start","value":"0","valid_bit":"0"},{"name":"ooo_demo_tick","role":"continue","value":"0","valid_bit":"4"},{"name":"ooo_demo_tick","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"ooo_demo_tick","role":"start","value":"0","valid_bit":"0"},{"name":"ooo_demo_tick","role":"done","value":"0","valid_bit":"1"},{"name":"ooo_demo_tick","role":"idle","value":"0","valid_bit":"2"},{"name":"ooo_demo_tick","role":"ready","value":"0","valid_bit":"3"},{"name":"ooo_demo_tick","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "reset", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "reset", "role": "default" }} , 
 	{ "name": "r0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "r0_out", "role": "default" }} , 
 	{ "name": "r1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "r1_out", "role": "default" }} , 
 	{ "name": "r2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "r2_out", "role": "default" }} , 
 	{ "name": "r3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "r3_out", "role": "default" }} , 
 	{ "name": "commit_reg", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "commit_reg", "role": "default" }} , 
 	{ "name": "commit_valid", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "commit_valid", "role": "default" }} , 
 	{ "name": "alu_complete_tag", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "alu_complete_tag", "role": "default" }} , 
 	{ "name": "alu_complete_valid", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu_complete_valid", "role": "default" }} , 
 	{ "name": "mul_complete_tag", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mul_complete_tag", "role": "default" }} , 
 	{ "name": "mul_complete_valid", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mul_complete_valid", "role": "default" }} , 
 	{ "name": "halted", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "halted", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"],
		"CDFG" : "ooo_demo_tick",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "reset", "Type" : "None", "Direction" : "I"},
			{"Name" : "r0_out", "Type" : "None", "Direction" : "O"},
			{"Name" : "r1_out", "Type" : "None", "Direction" : "O"},
			{"Name" : "r2_out", "Type" : "None", "Direction" : "O"},
			{"Name" : "r3_out", "Type" : "None", "Direction" : "O"},
			{"Name" : "commit_reg", "Type" : "None", "Direction" : "O"},
			{"Name" : "commit_valid", "Type" : "None", "Direction" : "O"},
			{"Name" : "alu_complete_tag", "Type" : "None", "Direction" : "O"},
			{"Name" : "alu_complete_valid", "Type" : "None", "Direction" : "O"},
			{"Name" : "mul_complete_tag", "Type" : "None", "Direction" : "O"},
			{"Name" : "mul_complete_valid", "Type" : "None", "Direction" : "O"},
			{"Name" : "halted", "Type" : "None", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_19", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rob_count", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_busy", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_executing", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_remaining", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mul_busy", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mul_executing", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mul_remaining", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_7", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_7", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_11", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_11", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_3", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_3", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_15", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_15", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_18", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_18", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_25", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_25", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_22", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_22", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_6", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_6", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_10", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_10", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_2", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_14", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_14", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_17", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_17", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_24", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_24", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_21", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_21", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_5", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_5", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_9", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_9", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_1", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_13", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_13", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_16", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_16", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_23", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_23", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_20", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_20", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_4", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_4", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_8", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_8", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_12", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Port" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_12", "Inst_start_state" : "1", "Inst_end_state" : "4"}]},
			{"Name" : "rob_head", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rob_tail", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "fetch_pc", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_src1_val", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_src2_val", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mul_src1_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mul_src1_val", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mul_src2_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mul_src2_val", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_op", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_dest_tag", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mul_src1_tag", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mul_src2_tag", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_src1_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_src2_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mul_dest_tag", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_src1_tag", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_src2_tag", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "ooo_demo_tick_Pipeline_VITIS_LOOP_119_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_11", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_15", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_18", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_25", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_22", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_10", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_14", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_17", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_24", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_21", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_9", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_13", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_16", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_23", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_20", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_8", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_12", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_119_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ooo_demo_tick_Pipeline_VITIS_LOOP_119_1_fu_1503.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_1_1_U26", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_1_1_1_U27", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_1_1_1_U28", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_2_1_1_U29", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_32_1_1_U30", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_1_1_1_U31", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_2_1_1_U32", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_1_1_1_U33", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_2_1_1_U34", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_1_1_1_U35", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_4_1_1_U36", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_1_1_1_U37", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_1_1_1_U38", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_32_1_1_U39", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_32_1_1_U40", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_3_32_1_1_U41", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	ooo_demo_tick {
		reset {Type I LastRead 0 FirstWrite -1}
		r0_out {Type O LastRead -1 FirstWrite 1}
		r1_out {Type O LastRead -1 FirstWrite 1}
		r2_out {Type O LastRead -1 FirstWrite 1}
		r3_out {Type O LastRead -1 FirstWrite 1}
		commit_reg {Type O LastRead -1 FirstWrite 0}
		commit_valid {Type O LastRead -1 FirstWrite 0}
		alu_complete_tag {Type O LastRead -1 FirstWrite 0}
		alu_complete_valid {Type O LastRead -1 FirstWrite 0}
		mul_complete_tag {Type O LastRead -1 FirstWrite 0}
		mul_complete_valid {Type O LastRead -1 FirstWrite 0}
		halted {Type O LastRead -1 FirstWrite 1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_19 {Type IO LastRead -1 FirstWrite -1}
		rob_count {Type IO LastRead -1 FirstWrite -1}
		alu_busy {Type IO LastRead -1 FirstWrite -1}
		alu_executing {Type IO LastRead -1 FirstWrite -1}
		alu_remaining {Type IO LastRead -1 FirstWrite -1}
		mul_busy {Type IO LastRead -1 FirstWrite -1}
		mul_executing {Type IO LastRead -1 FirstWrite -1}
		mul_remaining {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_7 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_11 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_3 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_15 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_18 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_25 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_22 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_6 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_10 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_2 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_14 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_17 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_24 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_21 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_5 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_9 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_1 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_13 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_16 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_23 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_20 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_4 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_8 {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u {Type IO LastRead -1 FirstWrite -1}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_12 {Type IO LastRead -1 FirstWrite -1}
		rob_head {Type IO LastRead -1 FirstWrite -1}
		rob_tail {Type IO LastRead -1 FirstWrite -1}
		fetch_pc {Type IO LastRead -1 FirstWrite -1}
		alu_src1_val {Type IO LastRead -1 FirstWrite -1}
		alu_src2_val {Type IO LastRead -1 FirstWrite -1}
		mul_src1_ready {Type IO LastRead -1 FirstWrite -1}
		mul_src1_val {Type IO LastRead -1 FirstWrite -1}
		mul_src2_ready {Type IO LastRead -1 FirstWrite -1}
		mul_src2_val {Type IO LastRead -1 FirstWrite -1}
		alu_op {Type IO LastRead -1 FirstWrite -1}
		alu_dest_tag {Type IO LastRead -1 FirstWrite -1}
		mul_src1_tag {Type IO LastRead -1 FirstWrite -1}
		mul_src2_tag {Type IO LastRead -1 FirstWrite -1}
		alu_src1_ready {Type IO LastRead -1 FirstWrite -1}
		alu_src2_ready {Type IO LastRead -1 FirstWrite -1}
		mul_dest_tag {Type IO LastRead -1 FirstWrite -1}
		alu_src1_tag {Type IO LastRead -1 FirstWrite -1}
		alu_src2_tag {Type IO LastRead -1 FirstWrite -1}}
	ooo_demo_tick_Pipeline_VITIS_LOOP_119_1 {
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_7 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_11 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_3 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_15 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_18 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_25 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_22 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_6 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_10 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_2 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_14 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_17 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_24 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_21 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_5 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_9 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_1 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_13 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_16 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_23 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_20 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_4 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_8 {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u {Type O LastRead -1 FirstWrite 0}
		ooo_demo_tick_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_uint_ap_u_12 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "8"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "9"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	reset { ap_none {  { reset in_data 0 1 } } }
	r0_out { ap_none {  { r0_out out_data 1 32 } } }
	r1_out { ap_none {  { r1_out out_data 1 32 } } }
	r2_out { ap_none {  { r2_out out_data 1 32 } } }
	r3_out { ap_none {  { r3_out out_data 1 32 } } }
	commit_reg { ap_none {  { commit_reg out_data 1 2 } } }
	commit_valid { ap_none {  { commit_valid out_data 1 1 } } }
	alu_complete_tag { ap_none {  { alu_complete_tag out_data 1 2 } } }
	alu_complete_valid { ap_none {  { alu_complete_valid out_data 1 1 } } }
	mul_complete_tag { ap_none {  { mul_complete_tag out_data 1 2 } } }
	mul_complete_valid { ap_none {  { mul_complete_valid out_data 1 1 } } }
	halted { ap_none {  { halted out_data 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
