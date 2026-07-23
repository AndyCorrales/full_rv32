set moduleName cdb_broadcast
set isTopModule 0
set isCombinational 1
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
set C_modelName {cdb_broadcast}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ tag int 3 regular  }
	{ value_r int 32 regular  }
	{ alu_rs_busy_0 int 1 regular {pointer 0} {global 0}  }
	{ alu_rs_s1_ready_0 int 1 regular {pointer 2} {global 2}  }
	{ alu_rs_s1_tag_0 int 3 regular {pointer 0} {global 0}  }
	{ alu_rs_s1_val_0 int 32 regular {pointer 1} {global 1}  }
	{ alu_rs_s2_ready_0 int 1 regular {pointer 2} {global 2}  }
	{ alu_rs_s2_tag_0 int 3 regular {pointer 0} {global 0}  }
	{ alu_rs_s2_val_0 int 32 regular {pointer 1} {global 1}  }
	{ alu_rs_busy_1 int 1 regular {pointer 0} {global 0}  }
	{ md_rs_busy int 1 regular {pointer 0} {global 0}  }
	{ md_rs_s1_ready int 1 regular {pointer 2} {global 2}  }
	{ md_rs_s1_tag int 3 regular {pointer 0} {global 0}  }
	{ md_rs_s1_val int 32 regular {pointer 1} {global 1}  }
	{ md_rs_s2_ready int 1 regular {pointer 2} {global 2}  }
	{ md_rs_s2_tag int 3 regular {pointer 0} {global 0}  }
	{ md_rs_s2_val int 32 regular {pointer 1} {global 1}  }
	{ lsu_rs_busy int 1 regular {pointer 0} {global 0}  }
	{ lsu_rs_s1_ready int 1 regular {pointer 2} {global 2}  }
	{ lsu_rs_s1_tag int 3 regular {pointer 0} {global 0}  }
	{ lsu_rs_s1_val int 8 regular {pointer 1} {global 1}  }
	{ lsu_rs_s2_ready int 1 regular {pointer 2} {global 2}  }
	{ lsu_rs_s2_tag int 3 regular {pointer 0} {global 0}  }
	{ lsu_rs_s2_val int 32 regular {pointer 1} {global 1}  }
	{ br_rs_busy int 1 regular {pointer 0} {global 0}  }
	{ br_rs_s1_ready int 1 regular {pointer 2} {global 2}  }
	{ br_rs_s1_tag int 3 regular {pointer 0} {global 0}  }
	{ br_rs_s1_val int 32 regular {pointer 1} {global 1}  }
	{ br_rs_s2_ready int 1 regular {pointer 2} {global 2}  }
	{ br_rs_s2_tag int 3 regular {pointer 0} {global 0}  }
	{ br_rs_s2_val int 32 regular {pointer 1} {global 1}  }
	{ fpu_rs_busy int 1 regular {pointer 0} {global 0}  }
	{ fpu_rs_s1_ready int 1 regular {pointer 2} {global 2}  }
	{ fpu_rs_s1_tag int 3 regular {pointer 0} {global 0}  }
	{ fpu_rs_s1_val int 32 regular {pointer 1} {global 1}  }
	{ fpu_rs_s2_ready int 1 regular {pointer 2} {global 2}  }
	{ fpu_rs_s2_tag int 3 regular {pointer 0} {global 0}  }
	{ fpu_rs_s2_val int 32 regular {pointer 1} {global 1}  }
	{ fpu_rs_s3_ready int 1 regular {pointer 2} {global 2}  }
	{ fpu_rs_s3_tag int 3 regular {pointer 0} {global 0}  }
	{ fpu_rs_s3_val int 32 regular {pointer 1} {global 1}  }
	{ vec_rs_busy int 1 regular {pointer 0} {global 0}  }
	{ vec_rs_s1_ready int 1 regular {pointer 2} {global 2}  }
	{ vec_rs_s1_tag int 3 regular {pointer 0} {global 0}  }
	{ vec_rs_s1_val int 8 regular {pointer 1} {global 1}  }
	{ sys_rs_busy int 1 regular {pointer 0} {global 0}  }
	{ sys_rs_s1_ready int 1 regular {pointer 2} {global 2}  }
	{ sys_rs_s1_tag int 3 regular {pointer 0} {global 0}  }
	{ sys_rs_s1_val int 32 regular {pointer 1} {global 1}  }
	{ alu_rs_s1_ready_1 int 1 regular {pointer 2} {global 2}  }
	{ alu_rs_s1_tag_1 int 3 regular {pointer 0} {global 0}  }
	{ alu_rs_s1_val_1 int 32 regular {pointer 1} {global 1}  }
	{ alu_rs_s2_ready_1 int 1 regular {pointer 2} {global 2}  }
	{ alu_rs_s2_tag_1 int 3 regular {pointer 0} {global 0}  }
	{ alu_rs_s2_val_1 int 32 regular {pointer 1} {global 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "value_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "alu_rs_busy_0", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "alu_rs_s1_ready_0", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "alu_rs_s1_tag_0", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "alu_rs_s1_val_0", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "alu_rs_s2_ready_0", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "alu_rs_s2_tag_0", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "alu_rs_s2_val_0", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "alu_rs_busy_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "md_rs_busy", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "md_rs_s1_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "md_rs_s1_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "md_rs_s1_val", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "md_rs_s2_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "md_rs_s2_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "md_rs_s2_val", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "lsu_rs_busy", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "lsu_rs_s1_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "lsu_rs_s1_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "lsu_rs_s1_val", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "lsu_rs_s2_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "lsu_rs_s2_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "lsu_rs_s2_val", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "br_rs_busy", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "br_rs_s1_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "br_rs_s1_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "br_rs_s1_val", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "br_rs_s2_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "br_rs_s2_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "br_rs_s2_val", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_busy", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_s1_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "fpu_rs_s1_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_s1_val", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_s2_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "fpu_rs_s2_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_s2_val", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_s3_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "fpu_rs_s3_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fpu_rs_s3_val", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "vec_rs_busy", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "vec_rs_s1_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "vec_rs_s1_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "vec_rs_s1_val", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "sys_rs_busy", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "sys_rs_s1_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "sys_rs_s1_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "sys_rs_s1_val", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "alu_rs_s1_ready_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "alu_rs_s1_tag_1", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "alu_rs_s1_val_1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "alu_rs_s2_ready_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "alu_rs_s2_tag_1", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "alu_rs_s2_val_1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 102
set portList { 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ tag sc_in sc_lv 3 signal 0 } 
	{ value_r sc_in sc_lv 32 signal 1 } 
	{ alu_rs_busy_0 sc_in sc_lv 1 signal 2 } 
	{ alu_rs_s1_ready_0_i sc_in sc_lv 1 signal 3 } 
	{ alu_rs_s1_ready_0_o sc_out sc_lv 1 signal 3 } 
	{ alu_rs_s1_ready_0_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ alu_rs_s1_tag_0 sc_in sc_lv 3 signal 4 } 
	{ alu_rs_s1_val_0 sc_out sc_lv 32 signal 5 } 
	{ alu_rs_s1_val_0_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ alu_rs_s2_ready_0_i sc_in sc_lv 1 signal 6 } 
	{ alu_rs_s2_ready_0_o sc_out sc_lv 1 signal 6 } 
	{ alu_rs_s2_ready_0_o_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ alu_rs_s2_tag_0 sc_in sc_lv 3 signal 7 } 
	{ alu_rs_s2_val_0 sc_out sc_lv 32 signal 8 } 
	{ alu_rs_s2_val_0_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ alu_rs_busy_1 sc_in sc_lv 1 signal 9 } 
	{ md_rs_busy sc_in sc_lv 1 signal 10 } 
	{ md_rs_s1_ready_i sc_in sc_lv 1 signal 11 } 
	{ md_rs_s1_ready_o sc_out sc_lv 1 signal 11 } 
	{ md_rs_s1_ready_o_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ md_rs_s1_tag sc_in sc_lv 3 signal 12 } 
	{ md_rs_s1_val sc_out sc_lv 32 signal 13 } 
	{ md_rs_s1_val_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ md_rs_s2_ready_i sc_in sc_lv 1 signal 14 } 
	{ md_rs_s2_ready_o sc_out sc_lv 1 signal 14 } 
	{ md_rs_s2_ready_o_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ md_rs_s2_tag sc_in sc_lv 3 signal 15 } 
	{ md_rs_s2_val sc_out sc_lv 32 signal 16 } 
	{ md_rs_s2_val_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ lsu_rs_busy sc_in sc_lv 1 signal 17 } 
	{ lsu_rs_s1_ready_i sc_in sc_lv 1 signal 18 } 
	{ lsu_rs_s1_ready_o sc_out sc_lv 1 signal 18 } 
	{ lsu_rs_s1_ready_o_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ lsu_rs_s1_tag sc_in sc_lv 3 signal 19 } 
	{ lsu_rs_s1_val sc_out sc_lv 8 signal 20 } 
	{ lsu_rs_s1_val_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ lsu_rs_s2_ready_i sc_in sc_lv 1 signal 21 } 
	{ lsu_rs_s2_ready_o sc_out sc_lv 1 signal 21 } 
	{ lsu_rs_s2_ready_o_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ lsu_rs_s2_tag sc_in sc_lv 3 signal 22 } 
	{ lsu_rs_s2_val sc_out sc_lv 32 signal 23 } 
	{ lsu_rs_s2_val_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ br_rs_busy sc_in sc_lv 1 signal 24 } 
	{ br_rs_s1_ready_i sc_in sc_lv 1 signal 25 } 
	{ br_rs_s1_ready_o sc_out sc_lv 1 signal 25 } 
	{ br_rs_s1_ready_o_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ br_rs_s1_tag sc_in sc_lv 3 signal 26 } 
	{ br_rs_s1_val sc_out sc_lv 32 signal 27 } 
	{ br_rs_s1_val_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ br_rs_s2_ready_i sc_in sc_lv 1 signal 28 } 
	{ br_rs_s2_ready_o sc_out sc_lv 1 signal 28 } 
	{ br_rs_s2_ready_o_ap_vld sc_out sc_logic 1 outvld 28 } 
	{ br_rs_s2_tag sc_in sc_lv 3 signal 29 } 
	{ br_rs_s2_val sc_out sc_lv 32 signal 30 } 
	{ br_rs_s2_val_ap_vld sc_out sc_logic 1 outvld 30 } 
	{ fpu_rs_busy sc_in sc_lv 1 signal 31 } 
	{ fpu_rs_s1_ready_i sc_in sc_lv 1 signal 32 } 
	{ fpu_rs_s1_ready_o sc_out sc_lv 1 signal 32 } 
	{ fpu_rs_s1_ready_o_ap_vld sc_out sc_logic 1 outvld 32 } 
	{ fpu_rs_s1_tag sc_in sc_lv 3 signal 33 } 
	{ fpu_rs_s1_val sc_out sc_lv 32 signal 34 } 
	{ fpu_rs_s1_val_ap_vld sc_out sc_logic 1 outvld 34 } 
	{ fpu_rs_s2_ready_i sc_in sc_lv 1 signal 35 } 
	{ fpu_rs_s2_ready_o sc_out sc_lv 1 signal 35 } 
	{ fpu_rs_s2_ready_o_ap_vld sc_out sc_logic 1 outvld 35 } 
	{ fpu_rs_s2_tag sc_in sc_lv 3 signal 36 } 
	{ fpu_rs_s2_val sc_out sc_lv 32 signal 37 } 
	{ fpu_rs_s2_val_ap_vld sc_out sc_logic 1 outvld 37 } 
	{ fpu_rs_s3_ready_i sc_in sc_lv 1 signal 38 } 
	{ fpu_rs_s3_ready_o sc_out sc_lv 1 signal 38 } 
	{ fpu_rs_s3_ready_o_ap_vld sc_out sc_logic 1 outvld 38 } 
	{ fpu_rs_s3_tag sc_in sc_lv 3 signal 39 } 
	{ fpu_rs_s3_val sc_out sc_lv 32 signal 40 } 
	{ fpu_rs_s3_val_ap_vld sc_out sc_logic 1 outvld 40 } 
	{ vec_rs_busy sc_in sc_lv 1 signal 41 } 
	{ vec_rs_s1_ready_i sc_in sc_lv 1 signal 42 } 
	{ vec_rs_s1_ready_o sc_out sc_lv 1 signal 42 } 
	{ vec_rs_s1_ready_o_ap_vld sc_out sc_logic 1 outvld 42 } 
	{ vec_rs_s1_tag sc_in sc_lv 3 signal 43 } 
	{ vec_rs_s1_val sc_out sc_lv 8 signal 44 } 
	{ vec_rs_s1_val_ap_vld sc_out sc_logic 1 outvld 44 } 
	{ sys_rs_busy sc_in sc_lv 1 signal 45 } 
	{ sys_rs_s1_ready_i sc_in sc_lv 1 signal 46 } 
	{ sys_rs_s1_ready_o sc_out sc_lv 1 signal 46 } 
	{ sys_rs_s1_ready_o_ap_vld sc_out sc_logic 1 outvld 46 } 
	{ sys_rs_s1_tag sc_in sc_lv 3 signal 47 } 
	{ sys_rs_s1_val sc_out sc_lv 32 signal 48 } 
	{ sys_rs_s1_val_ap_vld sc_out sc_logic 1 outvld 48 } 
	{ alu_rs_s1_ready_1_i sc_in sc_lv 1 signal 49 } 
	{ alu_rs_s1_ready_1_o sc_out sc_lv 1 signal 49 } 
	{ alu_rs_s1_ready_1_o_ap_vld sc_out sc_logic 1 outvld 49 } 
	{ alu_rs_s1_tag_1 sc_in sc_lv 3 signal 50 } 
	{ alu_rs_s1_val_1 sc_out sc_lv 32 signal 51 } 
	{ alu_rs_s1_val_1_ap_vld sc_out sc_logic 1 outvld 51 } 
	{ alu_rs_s2_ready_1_i sc_in sc_lv 1 signal 52 } 
	{ alu_rs_s2_ready_1_o sc_out sc_lv 1 signal 52 } 
	{ alu_rs_s2_ready_1_o_ap_vld sc_out sc_logic 1 outvld 52 } 
	{ alu_rs_s2_tag_1 sc_in sc_lv 3 signal 53 } 
	{ alu_rs_s2_val_1 sc_out sc_lv 32 signal 54 } 
	{ alu_rs_s2_val_1_ap_vld sc_out sc_logic 1 outvld 54 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
}
set NewPortList {[ 
	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tag", "role": "default" }} , 
 	{ "name": "value_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "default" }} , 
 	{ "name": "alu_rs_busy_0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu_rs_busy_0", "role": "default" }} , 
 	{ "name": "alu_rs_s1_ready_0_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu_rs_s1_ready_0", "role": "i" }} , 
 	{ "name": "alu_rs_s1_ready_0_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu_rs_s1_ready_0", "role": "o" }} , 
 	{ "name": "alu_rs_s1_ready_0_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "alu_rs_s1_ready_0", "role": "o_ap_vld" }} , 
 	{ "name": "alu_rs_s1_tag_0", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "alu_rs_s1_tag_0", "role": "default" }} , 
 	{ "name": "alu_rs_s1_val_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "alu_rs_s1_val_0", "role": "default" }} , 
 	{ "name": "alu_rs_s1_val_0_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "alu_rs_s1_val_0", "role": "ap_vld" }} , 
 	{ "name": "alu_rs_s2_ready_0_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu_rs_s2_ready_0", "role": "i" }} , 
 	{ "name": "alu_rs_s2_ready_0_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu_rs_s2_ready_0", "role": "o" }} , 
 	{ "name": "alu_rs_s2_ready_0_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "alu_rs_s2_ready_0", "role": "o_ap_vld" }} , 
 	{ "name": "alu_rs_s2_tag_0", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "alu_rs_s2_tag_0", "role": "default" }} , 
 	{ "name": "alu_rs_s2_val_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "alu_rs_s2_val_0", "role": "default" }} , 
 	{ "name": "alu_rs_s2_val_0_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "alu_rs_s2_val_0", "role": "ap_vld" }} , 
 	{ "name": "alu_rs_busy_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu_rs_busy_1", "role": "default" }} , 
 	{ "name": "md_rs_busy", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "md_rs_busy", "role": "default" }} , 
 	{ "name": "md_rs_s1_ready_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "md_rs_s1_ready", "role": "i" }} , 
 	{ "name": "md_rs_s1_ready_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "md_rs_s1_ready", "role": "o" }} , 
 	{ "name": "md_rs_s1_ready_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "md_rs_s1_ready", "role": "o_ap_vld" }} , 
 	{ "name": "md_rs_s1_tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "md_rs_s1_tag", "role": "default" }} , 
 	{ "name": "md_rs_s1_val", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "md_rs_s1_val", "role": "default" }} , 
 	{ "name": "md_rs_s1_val_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "md_rs_s1_val", "role": "ap_vld" }} , 
 	{ "name": "md_rs_s2_ready_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "md_rs_s2_ready", "role": "i" }} , 
 	{ "name": "md_rs_s2_ready_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "md_rs_s2_ready", "role": "o" }} , 
 	{ "name": "md_rs_s2_ready_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "md_rs_s2_ready", "role": "o_ap_vld" }} , 
 	{ "name": "md_rs_s2_tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "md_rs_s2_tag", "role": "default" }} , 
 	{ "name": "md_rs_s2_val", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "md_rs_s2_val", "role": "default" }} , 
 	{ "name": "md_rs_s2_val_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "md_rs_s2_val", "role": "ap_vld" }} , 
 	{ "name": "lsu_rs_busy", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lsu_rs_busy", "role": "default" }} , 
 	{ "name": "lsu_rs_s1_ready_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lsu_rs_s1_ready", "role": "i" }} , 
 	{ "name": "lsu_rs_s1_ready_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lsu_rs_s1_ready", "role": "o" }} , 
 	{ "name": "lsu_rs_s1_ready_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "lsu_rs_s1_ready", "role": "o_ap_vld" }} , 
 	{ "name": "lsu_rs_s1_tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "lsu_rs_s1_tag", "role": "default" }} , 
 	{ "name": "lsu_rs_s1_val", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "lsu_rs_s1_val", "role": "default" }} , 
 	{ "name": "lsu_rs_s1_val_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "lsu_rs_s1_val", "role": "ap_vld" }} , 
 	{ "name": "lsu_rs_s2_ready_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lsu_rs_s2_ready", "role": "i" }} , 
 	{ "name": "lsu_rs_s2_ready_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lsu_rs_s2_ready", "role": "o" }} , 
 	{ "name": "lsu_rs_s2_ready_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "lsu_rs_s2_ready", "role": "o_ap_vld" }} , 
 	{ "name": "lsu_rs_s2_tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "lsu_rs_s2_tag", "role": "default" }} , 
 	{ "name": "lsu_rs_s2_val", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "lsu_rs_s2_val", "role": "default" }} , 
 	{ "name": "lsu_rs_s2_val_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "lsu_rs_s2_val", "role": "ap_vld" }} , 
 	{ "name": "br_rs_busy", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "br_rs_busy", "role": "default" }} , 
 	{ "name": "br_rs_s1_ready_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "br_rs_s1_ready", "role": "i" }} , 
 	{ "name": "br_rs_s1_ready_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "br_rs_s1_ready", "role": "o" }} , 
 	{ "name": "br_rs_s1_ready_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "br_rs_s1_ready", "role": "o_ap_vld" }} , 
 	{ "name": "br_rs_s1_tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "br_rs_s1_tag", "role": "default" }} , 
 	{ "name": "br_rs_s1_val", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "br_rs_s1_val", "role": "default" }} , 
 	{ "name": "br_rs_s1_val_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "br_rs_s1_val", "role": "ap_vld" }} , 
 	{ "name": "br_rs_s2_ready_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "br_rs_s2_ready", "role": "i" }} , 
 	{ "name": "br_rs_s2_ready_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "br_rs_s2_ready", "role": "o" }} , 
 	{ "name": "br_rs_s2_ready_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "br_rs_s2_ready", "role": "o_ap_vld" }} , 
 	{ "name": "br_rs_s2_tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "br_rs_s2_tag", "role": "default" }} , 
 	{ "name": "br_rs_s2_val", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "br_rs_s2_val", "role": "default" }} , 
 	{ "name": "br_rs_s2_val_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "br_rs_s2_val", "role": "ap_vld" }} , 
 	{ "name": "fpu_rs_busy", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fpu_rs_busy", "role": "default" }} , 
 	{ "name": "fpu_rs_s1_ready_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fpu_rs_s1_ready", "role": "i" }} , 
 	{ "name": "fpu_rs_s1_ready_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fpu_rs_s1_ready", "role": "o" }} , 
 	{ "name": "fpu_rs_s1_ready_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "fpu_rs_s1_ready", "role": "o_ap_vld" }} , 
 	{ "name": "fpu_rs_s1_tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fpu_rs_s1_tag", "role": "default" }} , 
 	{ "name": "fpu_rs_s1_val", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fpu_rs_s1_val", "role": "default" }} , 
 	{ "name": "fpu_rs_s1_val_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "fpu_rs_s1_val", "role": "ap_vld" }} , 
 	{ "name": "fpu_rs_s2_ready_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fpu_rs_s2_ready", "role": "i" }} , 
 	{ "name": "fpu_rs_s2_ready_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fpu_rs_s2_ready", "role": "o" }} , 
 	{ "name": "fpu_rs_s2_ready_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "fpu_rs_s2_ready", "role": "o_ap_vld" }} , 
 	{ "name": "fpu_rs_s2_tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fpu_rs_s2_tag", "role": "default" }} , 
 	{ "name": "fpu_rs_s2_val", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fpu_rs_s2_val", "role": "default" }} , 
 	{ "name": "fpu_rs_s2_val_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "fpu_rs_s2_val", "role": "ap_vld" }} , 
 	{ "name": "fpu_rs_s3_ready_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fpu_rs_s3_ready", "role": "i" }} , 
 	{ "name": "fpu_rs_s3_ready_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fpu_rs_s3_ready", "role": "o" }} , 
 	{ "name": "fpu_rs_s3_ready_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "fpu_rs_s3_ready", "role": "o_ap_vld" }} , 
 	{ "name": "fpu_rs_s3_tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fpu_rs_s3_tag", "role": "default" }} , 
 	{ "name": "fpu_rs_s3_val", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fpu_rs_s3_val", "role": "default" }} , 
 	{ "name": "fpu_rs_s3_val_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "fpu_rs_s3_val", "role": "ap_vld" }} , 
 	{ "name": "vec_rs_busy", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "vec_rs_busy", "role": "default" }} , 
 	{ "name": "vec_rs_s1_ready_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "vec_rs_s1_ready", "role": "i" }} , 
 	{ "name": "vec_rs_s1_ready_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "vec_rs_s1_ready", "role": "o" }} , 
 	{ "name": "vec_rs_s1_ready_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "vec_rs_s1_ready", "role": "o_ap_vld" }} , 
 	{ "name": "vec_rs_s1_tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "vec_rs_s1_tag", "role": "default" }} , 
 	{ "name": "vec_rs_s1_val", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vec_rs_s1_val", "role": "default" }} , 
 	{ "name": "vec_rs_s1_val_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "vec_rs_s1_val", "role": "ap_vld" }} , 
 	{ "name": "sys_rs_busy", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "sys_rs_busy", "role": "default" }} , 
 	{ "name": "sys_rs_s1_ready_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "sys_rs_s1_ready", "role": "i" }} , 
 	{ "name": "sys_rs_s1_ready_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "sys_rs_s1_ready", "role": "o" }} , 
 	{ "name": "sys_rs_s1_ready_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sys_rs_s1_ready", "role": "o_ap_vld" }} , 
 	{ "name": "sys_rs_s1_tag", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sys_rs_s1_tag", "role": "default" }} , 
 	{ "name": "sys_rs_s1_val", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sys_rs_s1_val", "role": "default" }} , 
 	{ "name": "sys_rs_s1_val_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sys_rs_s1_val", "role": "ap_vld" }} , 
 	{ "name": "alu_rs_s1_ready_1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu_rs_s1_ready_1", "role": "i" }} , 
 	{ "name": "alu_rs_s1_ready_1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu_rs_s1_ready_1", "role": "o" }} , 
 	{ "name": "alu_rs_s1_ready_1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "alu_rs_s1_ready_1", "role": "o_ap_vld" }} , 
 	{ "name": "alu_rs_s1_tag_1", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "alu_rs_s1_tag_1", "role": "default" }} , 
 	{ "name": "alu_rs_s1_val_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "alu_rs_s1_val_1", "role": "default" }} , 
 	{ "name": "alu_rs_s1_val_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "alu_rs_s1_val_1", "role": "ap_vld" }} , 
 	{ "name": "alu_rs_s2_ready_1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu_rs_s2_ready_1", "role": "i" }} , 
 	{ "name": "alu_rs_s2_ready_1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu_rs_s2_ready_1", "role": "o" }} , 
 	{ "name": "alu_rs_s2_ready_1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "alu_rs_s2_ready_1", "role": "o_ap_vld" }} , 
 	{ "name": "alu_rs_s2_tag_1", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "alu_rs_s2_tag_1", "role": "default" }} , 
 	{ "name": "alu_rs_s2_val_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "alu_rs_s2_val_1", "role": "default" }} , 
 	{ "name": "alu_rs_s2_val_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "alu_rs_s2_val_1", "role": "ap_vld" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "cdb_broadcast",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "value_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "alu_rs_busy_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "alu_rs_s1_ready_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_s1_tag_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "alu_rs_s1_val_0", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "alu_rs_s2_ready_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_s2_tag_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "alu_rs_s2_val_0", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "alu_rs_busy_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "md_rs_busy", "Type" : "None", "Direction" : "I"},
			{"Name" : "md_rs_s1_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "md_rs_s1_tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "md_rs_s1_val", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "md_rs_s2_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "md_rs_s2_tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "md_rs_s2_val", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "lsu_rs_busy", "Type" : "None", "Direction" : "I"},
			{"Name" : "lsu_rs_s1_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lsu_rs_s1_tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "lsu_rs_s1_val", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "lsu_rs_s2_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lsu_rs_s2_tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "lsu_rs_s2_val", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "br_rs_busy", "Type" : "None", "Direction" : "I"},
			{"Name" : "br_rs_s1_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "br_rs_s1_tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "br_rs_s1_val", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "br_rs_s2_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "br_rs_s2_tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "br_rs_s2_val", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "fpu_rs_busy", "Type" : "None", "Direction" : "I"},
			{"Name" : "fpu_rs_s1_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "fpu_rs_s1_tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "fpu_rs_s1_val", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "fpu_rs_s2_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "fpu_rs_s2_tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "fpu_rs_s2_val", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "fpu_rs_s3_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "fpu_rs_s3_tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "fpu_rs_s3_val", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "vec_rs_busy", "Type" : "None", "Direction" : "I"},
			{"Name" : "vec_rs_s1_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vec_rs_s1_tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "vec_rs_s1_val", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sys_rs_busy", "Type" : "None", "Direction" : "I"},
			{"Name" : "sys_rs_s1_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sys_rs_s1_tag", "Type" : "None", "Direction" : "I"},
			{"Name" : "sys_rs_s1_val", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "alu_rs_s1_ready_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_s1_tag_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "alu_rs_s1_val_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "alu_rs_s2_ready_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_s2_tag_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "alu_rs_s2_val_1", "Type" : "Vld", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	cdb_broadcast {
		tag {Type I LastRead 0 FirstWrite -1}
		value_r {Type I LastRead 0 FirstWrite -1}
		alu_rs_busy_0 {Type I LastRead 0 FirstWrite -1}
		alu_rs_s1_ready_0 {Type IO LastRead 0 FirstWrite 0}
		alu_rs_s1_tag_0 {Type I LastRead 0 FirstWrite -1}
		alu_rs_s1_val_0 {Type O LastRead -1 FirstWrite 0}
		alu_rs_s2_ready_0 {Type IO LastRead 0 FirstWrite 0}
		alu_rs_s2_tag_0 {Type I LastRead 0 FirstWrite -1}
		alu_rs_s2_val_0 {Type O LastRead -1 FirstWrite 0}
		alu_rs_busy_1 {Type I LastRead 0 FirstWrite -1}
		md_rs_busy {Type I LastRead 0 FirstWrite -1}
		md_rs_s1_ready {Type IO LastRead 0 FirstWrite 0}
		md_rs_s1_tag {Type I LastRead 0 FirstWrite -1}
		md_rs_s1_val {Type O LastRead -1 FirstWrite 0}
		md_rs_s2_ready {Type IO LastRead 0 FirstWrite 0}
		md_rs_s2_tag {Type I LastRead 0 FirstWrite -1}
		md_rs_s2_val {Type O LastRead -1 FirstWrite 0}
		lsu_rs_busy {Type I LastRead 0 FirstWrite -1}
		lsu_rs_s1_ready {Type IO LastRead 0 FirstWrite 0}
		lsu_rs_s1_tag {Type I LastRead 0 FirstWrite -1}
		lsu_rs_s1_val {Type O LastRead -1 FirstWrite 0}
		lsu_rs_s2_ready {Type IO LastRead 0 FirstWrite 0}
		lsu_rs_s2_tag {Type I LastRead 0 FirstWrite -1}
		lsu_rs_s2_val {Type O LastRead -1 FirstWrite 0}
		br_rs_busy {Type I LastRead 0 FirstWrite -1}
		br_rs_s1_ready {Type IO LastRead 0 FirstWrite 0}
		br_rs_s1_tag {Type I LastRead 0 FirstWrite -1}
		br_rs_s1_val {Type O LastRead -1 FirstWrite 0}
		br_rs_s2_ready {Type IO LastRead 0 FirstWrite 0}
		br_rs_s2_tag {Type I LastRead 0 FirstWrite -1}
		br_rs_s2_val {Type O LastRead -1 FirstWrite 0}
		fpu_rs_busy {Type I LastRead 0 FirstWrite -1}
		fpu_rs_s1_ready {Type IO LastRead 0 FirstWrite 0}
		fpu_rs_s1_tag {Type I LastRead 0 FirstWrite -1}
		fpu_rs_s1_val {Type O LastRead -1 FirstWrite 0}
		fpu_rs_s2_ready {Type IO LastRead 0 FirstWrite 0}
		fpu_rs_s2_tag {Type I LastRead 0 FirstWrite -1}
		fpu_rs_s2_val {Type O LastRead -1 FirstWrite 0}
		fpu_rs_s3_ready {Type IO LastRead 0 FirstWrite 0}
		fpu_rs_s3_tag {Type I LastRead 0 FirstWrite -1}
		fpu_rs_s3_val {Type O LastRead -1 FirstWrite 0}
		vec_rs_busy {Type I LastRead 0 FirstWrite -1}
		vec_rs_s1_ready {Type IO LastRead 0 FirstWrite 0}
		vec_rs_s1_tag {Type I LastRead 0 FirstWrite -1}
		vec_rs_s1_val {Type O LastRead -1 FirstWrite 0}
		sys_rs_busy {Type I LastRead 0 FirstWrite -1}
		sys_rs_s1_ready {Type IO LastRead 0 FirstWrite 0}
		sys_rs_s1_tag {Type I LastRead 0 FirstWrite -1}
		sys_rs_s1_val {Type O LastRead -1 FirstWrite 0}
		alu_rs_s1_ready_1 {Type IO LastRead 0 FirstWrite 0}
		alu_rs_s1_tag_1 {Type I LastRead 0 FirstWrite -1}
		alu_rs_s1_val_1 {Type O LastRead -1 FirstWrite 0}
		alu_rs_s2_ready_1 {Type IO LastRead 0 FirstWrite 0}
		alu_rs_s2_tag_1 {Type I LastRead 0 FirstWrite -1}
		alu_rs_s2_val_1 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	tag { ap_none {  { tag in_data 0 3 } } }
	value_r { ap_none {  { value_r in_data 0 32 } } }
	alu_rs_busy_0 { ap_none {  { alu_rs_busy_0 in_data 0 1 } } }
	alu_rs_s1_ready_0 { ap_ovld {  { alu_rs_s1_ready_0_i in_data 0 1 }  { alu_rs_s1_ready_0_o out_data 1 1 }  { alu_rs_s1_ready_0_o_ap_vld out_vld 1 1 } } }
	alu_rs_s1_tag_0 { ap_none {  { alu_rs_s1_tag_0 in_data 0 3 } } }
	alu_rs_s1_val_0 { ap_vld {  { alu_rs_s1_val_0 out_data 1 32 }  { alu_rs_s1_val_0_ap_vld out_vld 1 1 } } }
	alu_rs_s2_ready_0 { ap_ovld {  { alu_rs_s2_ready_0_i in_data 0 1 }  { alu_rs_s2_ready_0_o out_data 1 1 }  { alu_rs_s2_ready_0_o_ap_vld out_vld 1 1 } } }
	alu_rs_s2_tag_0 { ap_none {  { alu_rs_s2_tag_0 in_data 0 3 } } }
	alu_rs_s2_val_0 { ap_vld {  { alu_rs_s2_val_0 out_data 1 32 }  { alu_rs_s2_val_0_ap_vld out_vld 1 1 } } }
	alu_rs_busy_1 { ap_none {  { alu_rs_busy_1 in_data 0 1 } } }
	md_rs_busy { ap_none {  { md_rs_busy in_data 0 1 } } }
	md_rs_s1_ready { ap_ovld {  { md_rs_s1_ready_i in_data 0 1 }  { md_rs_s1_ready_o out_data 1 1 }  { md_rs_s1_ready_o_ap_vld out_vld 1 1 } } }
	md_rs_s1_tag { ap_none {  { md_rs_s1_tag in_data 0 3 } } }
	md_rs_s1_val { ap_vld {  { md_rs_s1_val out_data 1 32 }  { md_rs_s1_val_ap_vld out_vld 1 1 } } }
	md_rs_s2_ready { ap_ovld {  { md_rs_s2_ready_i in_data 0 1 }  { md_rs_s2_ready_o out_data 1 1 }  { md_rs_s2_ready_o_ap_vld out_vld 1 1 } } }
	md_rs_s2_tag { ap_none {  { md_rs_s2_tag in_data 0 3 } } }
	md_rs_s2_val { ap_vld {  { md_rs_s2_val out_data 1 32 }  { md_rs_s2_val_ap_vld out_vld 1 1 } } }
	lsu_rs_busy { ap_none {  { lsu_rs_busy in_data 0 1 } } }
	lsu_rs_s1_ready { ap_ovld {  { lsu_rs_s1_ready_i in_data 0 1 }  { lsu_rs_s1_ready_o out_data 1 1 }  { lsu_rs_s1_ready_o_ap_vld out_vld 1 1 } } }
	lsu_rs_s1_tag { ap_none {  { lsu_rs_s1_tag in_data 0 3 } } }
	lsu_rs_s1_val { ap_vld {  { lsu_rs_s1_val out_data 1 8 }  { lsu_rs_s1_val_ap_vld out_vld 1 1 } } }
	lsu_rs_s2_ready { ap_ovld {  { lsu_rs_s2_ready_i in_data 0 1 }  { lsu_rs_s2_ready_o out_data 1 1 }  { lsu_rs_s2_ready_o_ap_vld out_vld 1 1 } } }
	lsu_rs_s2_tag { ap_none {  { lsu_rs_s2_tag in_data 0 3 } } }
	lsu_rs_s2_val { ap_vld {  { lsu_rs_s2_val out_data 1 32 }  { lsu_rs_s2_val_ap_vld out_vld 1 1 } } }
	br_rs_busy { ap_none {  { br_rs_busy in_data 0 1 } } }
	br_rs_s1_ready { ap_ovld {  { br_rs_s1_ready_i in_data 0 1 }  { br_rs_s1_ready_o out_data 1 1 }  { br_rs_s1_ready_o_ap_vld out_vld 1 1 } } }
	br_rs_s1_tag { ap_none {  { br_rs_s1_tag in_data 0 3 } } }
	br_rs_s1_val { ap_vld {  { br_rs_s1_val out_data 1 32 }  { br_rs_s1_val_ap_vld out_vld 1 1 } } }
	br_rs_s2_ready { ap_ovld {  { br_rs_s2_ready_i in_data 0 1 }  { br_rs_s2_ready_o out_data 1 1 }  { br_rs_s2_ready_o_ap_vld out_vld 1 1 } } }
	br_rs_s2_tag { ap_none {  { br_rs_s2_tag in_data 0 3 } } }
	br_rs_s2_val { ap_vld {  { br_rs_s2_val out_data 1 32 }  { br_rs_s2_val_ap_vld out_vld 1 1 } } }
	fpu_rs_busy { ap_none {  { fpu_rs_busy in_data 0 1 } } }
	fpu_rs_s1_ready { ap_ovld {  { fpu_rs_s1_ready_i in_data 0 1 }  { fpu_rs_s1_ready_o out_data 1 1 }  { fpu_rs_s1_ready_o_ap_vld out_vld 1 1 } } }
	fpu_rs_s1_tag { ap_none {  { fpu_rs_s1_tag in_data 0 3 } } }
	fpu_rs_s1_val { ap_vld {  { fpu_rs_s1_val out_data 1 32 }  { fpu_rs_s1_val_ap_vld out_vld 1 1 } } }
	fpu_rs_s2_ready { ap_ovld {  { fpu_rs_s2_ready_i in_data 0 1 }  { fpu_rs_s2_ready_o out_data 1 1 }  { fpu_rs_s2_ready_o_ap_vld out_vld 1 1 } } }
	fpu_rs_s2_tag { ap_none {  { fpu_rs_s2_tag in_data 0 3 } } }
	fpu_rs_s2_val { ap_vld {  { fpu_rs_s2_val out_data 1 32 }  { fpu_rs_s2_val_ap_vld out_vld 1 1 } } }
	fpu_rs_s3_ready { ap_ovld {  { fpu_rs_s3_ready_i in_data 0 1 }  { fpu_rs_s3_ready_o out_data 1 1 }  { fpu_rs_s3_ready_o_ap_vld out_vld 1 1 } } }
	fpu_rs_s3_tag { ap_none {  { fpu_rs_s3_tag in_data 0 3 } } }
	fpu_rs_s3_val { ap_vld {  { fpu_rs_s3_val out_data 1 32 }  { fpu_rs_s3_val_ap_vld out_vld 1 1 } } }
	vec_rs_busy { ap_none {  { vec_rs_busy in_data 0 1 } } }
	vec_rs_s1_ready { ap_ovld {  { vec_rs_s1_ready_i in_data 0 1 }  { vec_rs_s1_ready_o out_data 1 1 }  { vec_rs_s1_ready_o_ap_vld out_vld 1 1 } } }
	vec_rs_s1_tag { ap_none {  { vec_rs_s1_tag in_data 0 3 } } }
	vec_rs_s1_val { ap_vld {  { vec_rs_s1_val out_data 1 8 }  { vec_rs_s1_val_ap_vld out_vld 1 1 } } }
	sys_rs_busy { ap_none {  { sys_rs_busy in_data 0 1 } } }
	sys_rs_s1_ready { ap_ovld {  { sys_rs_s1_ready_i in_data 0 1 }  { sys_rs_s1_ready_o out_data 1 1 }  { sys_rs_s1_ready_o_ap_vld out_vld 1 1 } } }
	sys_rs_s1_tag { ap_none {  { sys_rs_s1_tag in_data 0 3 } } }
	sys_rs_s1_val { ap_vld {  { sys_rs_s1_val out_data 1 32 }  { sys_rs_s1_val_ap_vld out_vld 1 1 } } }
	alu_rs_s1_ready_1 { ap_ovld {  { alu_rs_s1_ready_1_i in_data 0 1 }  { alu_rs_s1_ready_1_o out_data 1 1 }  { alu_rs_s1_ready_1_o_ap_vld out_vld 1 1 } } }
	alu_rs_s1_tag_1 { ap_none {  { alu_rs_s1_tag_1 in_data 0 3 } } }
	alu_rs_s1_val_1 { ap_vld {  { alu_rs_s1_val_1 out_data 1 32 }  { alu_rs_s1_val_1_ap_vld out_vld 1 1 } } }
	alu_rs_s2_ready_1 { ap_ovld {  { alu_rs_s2_ready_1_i in_data 0 1 }  { alu_rs_s2_ready_1_o out_data 1 1 }  { alu_rs_s2_ready_1_o_ap_vld out_vld 1 1 } } }
	alu_rs_s2_tag_1 { ap_none {  { alu_rs_s2_tag_1 in_data 0 3 } } }
	alu_rs_s2_val_1 { ap_vld {  { alu_rs_s2_val_1 out_data 1 32 }  { alu_rs_s2_val_1_ap_vld out_vld 1 1 } } }
}
