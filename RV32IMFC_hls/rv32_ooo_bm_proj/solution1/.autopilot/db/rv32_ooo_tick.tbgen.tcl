set moduleName rv32_ooo_tick
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
set cdfgNum 12
set C_modelName {rv32_ooo_tick}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict imem { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict dmem { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict vregs_out { MEM_WIDTH 32 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ reset int 1 regular  }
	{ imem int 32 regular {bram 64 { 1 1 } 1 1 }  }
	{ dmem int 32 regular {bram 64 { 2 2 } 1 1 }  }
	{ disp_valid int 1 regular {pointer 1}  }
	{ disp_tag int 3 regular {pointer 1}  }
	{ disp_pc int 32 regular {pointer 1}  }
	{ alu0_done int 1 regular {pointer 1}  }
	{ alu0_tag int 3 regular {pointer 1}  }
	{ alu1_done int 1 regular {pointer 1}  }
	{ alu1_tag int 3 regular {pointer 1}  }
	{ md_done int 1 regular {pointer 1}  }
	{ md_tag int 3 regular {pointer 1}  }
	{ fpu_done int 1 regular {pointer 1}  }
	{ fpu_tag int 3 regular {pointer 1}  }
	{ lsu_done int 1 regular {pointer 1}  }
	{ lsu_tag int 3 regular {pointer 1}  }
	{ br_done int 1 regular {pointer 1}  }
	{ br_tag int 3 regular {pointer 1}  }
	{ vec_done int 1 regular {pointer 1}  }
	{ vec_tag int 3 regular {pointer 1}  }
	{ commit_valid int 1 regular {pointer 1}  }
	{ commit_is_fp int 1 regular {pointer 1}  }
	{ commit_rd int 5 regular {pointer 1}  }
	{ commit_value int 32 regular {pointer 1}  }
	{ vregs_out int 32 regular {bram 128 { 0 3 } 0 1 }  }
	{ halted int 1 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "reset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "imem", "interface" : "bram", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmem", "interface" : "bram", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "disp_valid", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "disp_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "disp_pc", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "alu0_done", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "alu0_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "alu1_done", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "alu1_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "md_done", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "md_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fpu_done", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fpu_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "lsu_done", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "lsu_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "br_done", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "br_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "vec_done", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "vec_tag", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "commit_valid", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "commit_is_fp", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "commit_rd", "interface" : "wire", "bitwidth" : 5, "direction" : "WRITEONLY"} , 
 	{ "Name" : "commit_value", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "vregs_out", "interface" : "bram", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "halted", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 78
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ reset sc_in sc_lv 1 signal 0 } 
	{ imem_Addr_A sc_out sc_lv 32 signal 1 } 
	{ imem_EN_A sc_out sc_logic 1 signal 1 } 
	{ imem_WEN_A sc_out sc_lv 4 signal 1 } 
	{ imem_Din_A sc_out sc_lv 32 signal 1 } 
	{ imem_Dout_A sc_in sc_lv 32 signal 1 } 
	{ imem_Clk_A sc_out sc_logic 1 signal 1 } 
	{ imem_Rst_A sc_out sc_logic 1 signal 1 } 
	{ imem_Addr_B sc_out sc_lv 32 signal 1 } 
	{ imem_EN_B sc_out sc_logic 1 signal 1 } 
	{ imem_WEN_B sc_out sc_lv 4 signal 1 } 
	{ imem_Din_B sc_out sc_lv 32 signal 1 } 
	{ imem_Dout_B sc_in sc_lv 32 signal 1 } 
	{ imem_Clk_B sc_out sc_logic 1 signal 1 } 
	{ imem_Rst_B sc_out sc_logic 1 signal 1 } 
	{ dmem_Addr_A sc_out sc_lv 32 signal 2 } 
	{ dmem_EN_A sc_out sc_logic 1 signal 2 } 
	{ dmem_WEN_A sc_out sc_lv 4 signal 2 } 
	{ dmem_Din_A sc_out sc_lv 32 signal 2 } 
	{ dmem_Dout_A sc_in sc_lv 32 signal 2 } 
	{ dmem_Clk_A sc_out sc_logic 1 signal 2 } 
	{ dmem_Rst_A sc_out sc_logic 1 signal 2 } 
	{ dmem_Addr_B sc_out sc_lv 32 signal 2 } 
	{ dmem_EN_B sc_out sc_logic 1 signal 2 } 
	{ dmem_WEN_B sc_out sc_lv 4 signal 2 } 
	{ dmem_Din_B sc_out sc_lv 32 signal 2 } 
	{ dmem_Dout_B sc_in sc_lv 32 signal 2 } 
	{ dmem_Clk_B sc_out sc_logic 1 signal 2 } 
	{ dmem_Rst_B sc_out sc_logic 1 signal 2 } 
	{ disp_valid sc_out sc_lv 1 signal 3 } 
	{ disp_tag sc_out sc_lv 3 signal 4 } 
	{ disp_pc sc_out sc_lv 32 signal 5 } 
	{ alu0_done sc_out sc_lv 1 signal 6 } 
	{ alu0_tag sc_out sc_lv 3 signal 7 } 
	{ alu1_done sc_out sc_lv 1 signal 8 } 
	{ alu1_tag sc_out sc_lv 3 signal 9 } 
	{ md_done sc_out sc_lv 1 signal 10 } 
	{ md_tag sc_out sc_lv 3 signal 11 } 
	{ fpu_done sc_out sc_lv 1 signal 12 } 
	{ fpu_tag sc_out sc_lv 3 signal 13 } 
	{ lsu_done sc_out sc_lv 1 signal 14 } 
	{ lsu_tag sc_out sc_lv 3 signal 15 } 
	{ br_done sc_out sc_lv 1 signal 16 } 
	{ br_tag sc_out sc_lv 3 signal 17 } 
	{ vec_done sc_out sc_lv 1 signal 18 } 
	{ vec_tag sc_out sc_lv 3 signal 19 } 
	{ commit_valid sc_out sc_lv 1 signal 20 } 
	{ commit_is_fp sc_out sc_lv 1 signal 21 } 
	{ commit_rd sc_out sc_lv 5 signal 22 } 
	{ commit_value sc_out sc_lv 32 signal 23 } 
	{ vregs_out_Addr_A sc_out sc_lv 32 signal 24 } 
	{ vregs_out_EN_A sc_out sc_logic 1 signal 24 } 
	{ vregs_out_WEN_A sc_out sc_lv 4 signal 24 } 
	{ vregs_out_Din_A sc_out sc_lv 32 signal 24 } 
	{ vregs_out_Dout_A sc_in sc_lv 32 signal 24 } 
	{ vregs_out_Clk_A sc_out sc_logic 1 signal 24 } 
	{ vregs_out_Rst_A sc_out sc_logic 1 signal 24 } 
	{ halted sc_out sc_lv 1 signal 25 } 
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
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"rv32_ooo_tick","role":"start","value":"0","valid_bit":"0"},{"name":"rv32_ooo_tick","role":"continue","value":"0","valid_bit":"4"},{"name":"rv32_ooo_tick","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"rv32_ooo_tick","role":"start","value":"0","valid_bit":"0"},{"name":"rv32_ooo_tick","role":"done","value":"0","valid_bit":"1"},{"name":"rv32_ooo_tick","role":"idle","value":"0","valid_bit":"2"},{"name":"rv32_ooo_tick","role":"ready","value":"0","valid_bit":"3"},{"name":"rv32_ooo_tick","role":"auto_start","value":"0","valid_bit":"7"}] },
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
 	{ "name": "imem_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imem", "role": "Addr_A" }} , 
 	{ "name": "imem_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imem", "role": "EN_A" }} , 
 	{ "name": "imem_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "imem", "role": "WEN_A" }} , 
 	{ "name": "imem_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imem", "role": "Din_A" }} , 
 	{ "name": "imem_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imem", "role": "Dout_A" }} , 
 	{ "name": "imem_Clk_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imem", "role": "Clk_A" }} , 
 	{ "name": "imem_Rst_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imem", "role": "Rst_A" }} , 
 	{ "name": "imem_Addr_B", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imem", "role": "Addr_B" }} , 
 	{ "name": "imem_EN_B", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imem", "role": "EN_B" }} , 
 	{ "name": "imem_WEN_B", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "imem", "role": "WEN_B" }} , 
 	{ "name": "imem_Din_B", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imem", "role": "Din_B" }} , 
 	{ "name": "imem_Dout_B", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imem", "role": "Dout_B" }} , 
 	{ "name": "imem_Clk_B", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imem", "role": "Clk_B" }} , 
 	{ "name": "imem_Rst_B", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imem", "role": "Rst_B" }} , 
 	{ "name": "dmem_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmem", "role": "Addr_A" }} , 
 	{ "name": "dmem_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dmem", "role": "EN_A" }} , 
 	{ "name": "dmem_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dmem", "role": "WEN_A" }} , 
 	{ "name": "dmem_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmem", "role": "Din_A" }} , 
 	{ "name": "dmem_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmem", "role": "Dout_A" }} , 
 	{ "name": "dmem_Clk_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dmem", "role": "Clk_A" }} , 
 	{ "name": "dmem_Rst_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dmem", "role": "Rst_A" }} , 
 	{ "name": "dmem_Addr_B", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmem", "role": "Addr_B" }} , 
 	{ "name": "dmem_EN_B", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dmem", "role": "EN_B" }} , 
 	{ "name": "dmem_WEN_B", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dmem", "role": "WEN_B" }} , 
 	{ "name": "dmem_Din_B", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmem", "role": "Din_B" }} , 
 	{ "name": "dmem_Dout_B", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmem", "role": "Dout_B" }} , 
 	{ "name": "dmem_Clk_B", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dmem", "role": "Clk_B" }} , 
 	{ "name": "dmem_Rst_B", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dmem", "role": "Rst_B" }} , 
 	{ "name": "disp_valid", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_valid", "role": "default" }} , 
 	{ "name": "disp_tag", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "disp_tag", "role": "default" }} , 
 	{ "name": "disp_pc", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "disp_pc", "role": "default" }} , 
 	{ "name": "alu0_done", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu0_done", "role": "default" }} , 
 	{ "name": "alu0_tag", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "alu0_tag", "role": "default" }} , 
 	{ "name": "alu1_done", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "alu1_done", "role": "default" }} , 
 	{ "name": "alu1_tag", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "alu1_tag", "role": "default" }} , 
 	{ "name": "md_done", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "md_done", "role": "default" }} , 
 	{ "name": "md_tag", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "md_tag", "role": "default" }} , 
 	{ "name": "fpu_done", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fpu_done", "role": "default" }} , 
 	{ "name": "fpu_tag", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fpu_tag", "role": "default" }} , 
 	{ "name": "lsu_done", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lsu_done", "role": "default" }} , 
 	{ "name": "lsu_tag", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "lsu_tag", "role": "default" }} , 
 	{ "name": "br_done", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "br_done", "role": "default" }} , 
 	{ "name": "br_tag", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "br_tag", "role": "default" }} , 
 	{ "name": "vec_done", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "vec_done", "role": "default" }} , 
 	{ "name": "vec_tag", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "vec_tag", "role": "default" }} , 
 	{ "name": "commit_valid", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "commit_valid", "role": "default" }} , 
 	{ "name": "commit_is_fp", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "commit_is_fp", "role": "default" }} , 
 	{ "name": "commit_rd", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "commit_rd", "role": "default" }} , 
 	{ "name": "commit_value", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "commit_value", "role": "default" }} , 
 	{ "name": "vregs_out_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "vregs_out", "role": "Addr_A" }} , 
 	{ "name": "vregs_out_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vregs_out", "role": "EN_A" }} , 
 	{ "name": "vregs_out_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "vregs_out", "role": "WEN_A" }} , 
 	{ "name": "vregs_out_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "vregs_out", "role": "Din_A" }} , 
 	{ "name": "vregs_out_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "vregs_out", "role": "Dout_A" }} , 
 	{ "name": "vregs_out_Clk_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vregs_out", "role": "Clk_A" }} , 
 	{ "name": "vregs_out_Rst_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vregs_out", "role": "Rst_A" }} , 
 	{ "name": "halted", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "halted", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "40", "41", "43", "45", "47", "49", "51", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68"],
		"CDFG" : "rv32_ooo_tick",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "141", "EstimateLatencyMax" : "276",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "reset", "Type" : "None", "Direction" : "I"},
			{"Name" : "imem", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "dmem", "Type" : "Bram", "Direction" : "IO"},
			{"Name" : "disp_valid", "Type" : "None", "Direction" : "O"},
			{"Name" : "disp_tag", "Type" : "None", "Direction" : "O"},
			{"Name" : "disp_pc", "Type" : "None", "Direction" : "O"},
			{"Name" : "alu0_done", "Type" : "None", "Direction" : "O"},
			{"Name" : "alu0_tag", "Type" : "None", "Direction" : "O"},
			{"Name" : "alu1_done", "Type" : "None", "Direction" : "O"},
			{"Name" : "alu1_tag", "Type" : "None", "Direction" : "O"},
			{"Name" : "md_done", "Type" : "None", "Direction" : "O"},
			{"Name" : "md_tag", "Type" : "None", "Direction" : "O"},
			{"Name" : "fpu_done", "Type" : "None", "Direction" : "O"},
			{"Name" : "fpu_tag", "Type" : "None", "Direction" : "O"},
			{"Name" : "lsu_done", "Type" : "None", "Direction" : "O"},
			{"Name" : "lsu_tag", "Type" : "None", "Direction" : "O"},
			{"Name" : "br_done", "Type" : "None", "Direction" : "O"},
			{"Name" : "br_tag", "Type" : "None", "Direction" : "O"},
			{"Name" : "vec_done", "Type" : "None", "Direction" : "O"},
			{"Name" : "vec_tag", "Type" : "None", "Direction" : "O"},
			{"Name" : "commit_valid", "Type" : "None", "Direction" : "O"},
			{"Name" : "commit_is_fp", "Type" : "None", "Direction" : "O"},
			{"Name" : "commit_rd", "Type" : "None", "Direction" : "O"},
			{"Name" : "commit_value", "Type" : "None", "Direction" : "O"},
			{"Name" : "vregs_out", "Type" : "Bram", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_1129_11_fu_5869", "Port" : "vregs_out", "Inst_start_state" : "224", "Inst_end_state" : "225"},
					{"ID" : "51", "SubInstance" : "grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_579_5_fu_5883", "Port" : "vregs_out", "Inst_start_state" : "239", "Inst_end_state" : "240"}]},
			{"Name" : "halted", "Type" : "None", "Direction" : "O"},
			{"Name" : "rob_head", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rob_tail", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rob_count", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_executing_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_executing_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "md_rs_executing", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "fpu_rs_executing", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "br_rs_executing", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vec_rs_executing", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "fetch_pc", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "fetch_stalled", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "fetch_done", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_busy_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_busy_0", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_busy_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_busy_1", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "md_rs_busy", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "md_rs_busy", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "fpu_rs_busy", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "fpu_rs_busy", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "lsu_rs_busy", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "lsu_rs_busy", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "br_rs_busy", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "br_rs_busy", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "vec_rs_busy", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "vec_rs_busy", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "sys_rs_busy", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "sys_rs_busy", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "csr_mstatus", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "csr_mie", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "csr_mtvec", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "csr_mscratch", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "csr_mepc", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "csr_mcause", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "csr_mtval", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "csr_mip", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ecall_halt", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vregs", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_1129_11_fu_5869", "Port" : "vregs", "Inst_start_state" : "224", "Inst_end_state" : "225"},
					{"ID" : "49", "SubInstance" : "grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_575_4_fu_5877", "Port" : "vregs", "Inst_start_state" : "237", "Inst_end_state" : "238"},
					{"ID" : "51", "SubInstance" : "grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_579_5_fu_5883", "Port" : "vregs", "Inst_start_state" : "239", "Inst_end_state" : "240"}]},
			{"Name" : "rob_valid", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "rob_ready", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_read_operand_fu_5830", "Port" : "rob_ready", "Inst_start_state" : "216", "Inst_end_state" : "217"},
					{"ID" : "43", "SubInstance" : "grp_read_operand_fp_fu_5845", "Port" : "rob_ready", "Inst_start_state" : "202", "Inst_end_state" : "203"}]},
			{"Name" : "rob_is_ecall", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "rob_is_store", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "rob_addr", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "rob_sdata", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "rob_mem_f3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "rob_dest_is_fp", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "rob_dest", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "rob_value", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_read_operand_fu_5830", "Port" : "rob_value", "Inst_start_state" : "216", "Inst_end_state" : "217"},
					{"ID" : "43", "SubInstance" : "grp_read_operand_fp_fu_5845", "Port" : "rob_value", "Inst_start_state" : "202", "Inst_end_state" : "203"}]},
			{"Name" : "fregs", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "43", "SubInstance" : "grp_read_operand_fp_fu_5845", "Port" : "fregs", "Inst_start_state" : "202", "Inst_end_state" : "203"}]},
			{"Name" : "frat_has_tag", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "43", "SubInstance" : "grp_read_operand_fp_fu_5845", "Port" : "frat_has_tag", "Inst_start_state" : "202", "Inst_end_state" : "203"}]},
			{"Name" : "frat_tag", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "43", "SubInstance" : "grp_read_operand_fp_fu_5845", "Port" : "frat_tag", "Inst_start_state" : "202", "Inst_end_state" : "203"}]},
			{"Name" : "regfile", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_read_operand_fu_5830", "Port" : "regfile", "Inst_start_state" : "216", "Inst_end_state" : "217"}]},
			{"Name" : "rat_has_tag", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_read_operand_fu_5830", "Port" : "rat_has_tag", "Inst_start_state" : "216", "Inst_end_state" : "217"}]},
			{"Name" : "rat_tag", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_read_operand_fu_5830", "Port" : "rat_tag", "Inst_start_state" : "216", "Inst_end_state" : "217"}]},
			{"Name" : "alu_rs_remaining_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_rob_tag_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_f3_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_alt_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_s1_val_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s1_val_0", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_s2_val_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s2_val_0", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_s1_ready_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s1_ready_0", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_s1_tag_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s1_tag_0", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_s2_ready_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s2_ready_0", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_s2_tag_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s2_tag_0", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "md_rs_s1_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "md_rs_s1_ready", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "md_rs_s1_tag", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "md_rs_s1_tag", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "md_rs_s1_val", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "md_rs_s1_val", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "md_rs_s2_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "md_rs_s2_ready", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "md_rs_s2_tag", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "md_rs_s2_tag", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "md_rs_s2_val", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "md_rs_s2_val", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "lsu_rs_s1_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "lsu_rs_s1_ready", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "lsu_rs_s1_tag", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "lsu_rs_s1_tag", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "lsu_rs_s1_val", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "lsu_rs_s1_val", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "lsu_rs_s2_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "lsu_rs_s2_ready", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "lsu_rs_s2_tag", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "lsu_rs_s2_tag", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "lsu_rs_s2_val", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "lsu_rs_s2_val", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "br_rs_s1_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "br_rs_s1_ready", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "br_rs_s1_tag", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "br_rs_s1_tag", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "br_rs_s1_val", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "br_rs_s1_val", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "br_rs_s2_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "br_rs_s2_ready", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "br_rs_s2_tag", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "br_rs_s2_tag", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "br_rs_s2_val", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "br_rs_s2_val", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "fpu_rs_s1_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "fpu_rs_s1_ready", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "fpu_rs_s1_tag", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "fpu_rs_s1_tag", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "fpu_rs_s1_val", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "fpu_rs_s1_val", "Inst_start_state" : "178", "Inst_end_state" : "178"},
					{"ID" : "19", "SubInstance" : "grp_fpu_compute_fu_5799", "Port" : "fpu_rs_s1_val", "Inst_start_state" : "158", "Inst_end_state" : "159"}]},
			{"Name" : "fpu_rs_s2_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "fpu_rs_s2_ready", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "fpu_rs_s2_tag", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "fpu_rs_s2_tag", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "fpu_rs_s2_val", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "fpu_rs_s2_val", "Inst_start_state" : "178", "Inst_end_state" : "178"},
					{"ID" : "19", "SubInstance" : "grp_fpu_compute_fu_5799", "Port" : "fpu_rs_s2_val", "Inst_start_state" : "158", "Inst_end_state" : "159"}]},
			{"Name" : "fpu_rs_s3_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "fpu_rs_s3_ready", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "fpu_rs_s3_tag", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "fpu_rs_s3_tag", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "fpu_rs_s3_val", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "fpu_rs_s3_val", "Inst_start_state" : "178", "Inst_end_state" : "178"},
					{"ID" : "19", "SubInstance" : "grp_fpu_compute_fu_5799", "Port" : "fpu_rs_s3_val", "Inst_start_state" : "158", "Inst_end_state" : "159"}]},
			{"Name" : "vec_rs_s1_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "vec_rs_s1_ready", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "vec_rs_s1_tag", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "vec_rs_s1_tag", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "vec_rs_s1_val", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "vec_rs_s1_val", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "sys_rs_s1_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "sys_rs_s1_ready", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "sys_rs_s1_tag", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "sys_rs_s1_tag", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "sys_rs_s1_val", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "sys_rs_s1_val", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_s1_ready_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s1_ready_1", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_s1_tag_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s1_tag_1", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_s1_val_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s1_val_1", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_s2_ready_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s2_ready_1", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_s2_tag_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s2_tag_1", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_s2_val_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_cdb_broadcast_fu_5684", "Port" : "alu_rs_s2_val_1", "Inst_start_state" : "178", "Inst_end_state" : "178"}]},
			{"Name" : "alu_rs_rob_tag_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_remaining_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "md_rs_remaining", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "md_rs_f3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "md_rs_rob_tag", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "fpu_rs_remaining", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "fpu_rs_rob_tag", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "fpu_rs_r4op", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_fpu_compute_fu_5799", "Port" : "fpu_rs_r4op", "Inst_start_state" : "158", "Inst_end_state" : "159"}]},
			{"Name" : "fpu_rs_f7", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_fpu_compute_fu_5799", "Port" : "fpu_rs_f7", "Inst_start_state" : "158", "Inst_end_state" : "159"}]},
			{"Name" : "fpu_rs_f3", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_fpu_compute_fu_5799", "Port" : "fpu_rs_f3", "Inst_start_state" : "158", "Inst_end_state" : "159"}]},
			{"Name" : "fpu_rs_rs2f", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_fpu_compute_fu_5799", "Port" : "fpu_rs_rs2f", "Inst_start_state" : "158", "Inst_end_state" : "159"}]},
			{"Name" : "mask_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_fpu_compute_fu_5799", "Port" : "mask_table", "Inst_start_state" : "158", "Inst_end_state" : "159"}]},
			{"Name" : "one_half_minus_one_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_fpu_compute_fu_5799", "Port" : "one_half_minus_one_table", "Inst_start_state" : "158", "Inst_end_state" : "159"}]},
			{"Name" : "index_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_fpu_compute_fu_5799", "Port" : "index_table", "Inst_start_state" : "158", "Inst_end_state" : "159"}]},
			{"Name" : "br_rs_is_jalr", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "br_rs_rob_tag", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "br_rs_br_pc", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "br_rs_size", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "br_rs_imm", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "br_rs_f3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lsu_rs_rob_tag", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lsu_rs_f3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lsu_rs_imm", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lsu_rs_is_load", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vec_rs_is_arith", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vec_rs_remaining", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vec_rs_vd_or_vs3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vec_rs_rob_tag", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vec_rs_vs2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vec_rs_vs1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vec_rs_arith_op", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vec_rs_is_load", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "vec_rs_is_store", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sys_rs_rob_tag", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sys_rs_csr_addr", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sys_rs_f3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_f3_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "alu_rs_alt_1", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.vregs_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rob_valid_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rob_ready_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rob_is_ecall_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rob_is_store_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rob_addr_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rob_sdata_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rob_mem_f3_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rob_dest_is_fp_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rob_dest_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rob_value_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fregs_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.frat_has_tag_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.frat_tag_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regfile_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rat_has_tag_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rat_tag_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_cdb_broadcast_fu_5684", "Parent" : "0",
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
			{"Name" : "alu_rs_s2_val_1", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799", "Parent" : "0", "Child" : ["20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39"],
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
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.mask_table_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.one_half_minus_one_table_U", "Parent" : "19"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.index_table_U", "Parent" : "19"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.faddfsub_32ns_32ns_32_4_full_dsp_1_U56", "Parent" : "19"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.fmul_32ns_32ns_32_3_max_dsp_1_U57", "Parent" : "19"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.fdiv_32ns_32ns_32_9_no_dsp_1_U58", "Parent" : "19"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.uitofp_32ns_32_4_no_dsp_1_U59", "Parent" : "19"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.sitofp_32ns_32_4_no_dsp_1_U60", "Parent" : "19"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.fcmp_32ns_32ns_1_2_no_dsp_1_U61", "Parent" : "19"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.fcmp_32ns_32ns_1_2_no_dsp_1_U62", "Parent" : "19"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.fcmp_32ns_32ns_1_2_no_dsp_1_U63", "Parent" : "19"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.fcmp_32ns_32ns_1_2_no_dsp_1_U64", "Parent" : "19"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.fsqrt_32ns_32ns_32_8_no_dsp_1_U65", "Parent" : "19"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.sparsemux_9_3_3_1_1_U66", "Parent" : "19"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.bitselect_1ns_32ns_32s_1_1_1_U67", "Parent" : "19"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.sparsemux_7_2_32_1_1_U68", "Parent" : "19"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.bitselect_1ns_32ns_32s_1_1_1_U69", "Parent" : "19"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.sparsemux_7_2_32_1_1_U70", "Parent" : "19"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.sparsemux_13_5_32_1_1_U71", "Parent" : "19"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fpu_compute_fu_5799.sparsemux_9_3_32_1_1_U72", "Parent" : "19"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.instr_1_expand_fu_5824", "Parent" : "0",
		"CDFG" : "expand",
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
			{"Name" : "c", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_operand_fu_5830", "Parent" : "0", "Child" : ["42"],
		"CDFG" : "read_operand",
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
			{"Name" : "rat_has_tag", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rat_tag", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rob_ready", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "regfile", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rob_value", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_operand_fu_5830.sparsemux_7_2_32_1_1_U96", "Parent" : "41"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_operand_fp_fu_5845", "Parent" : "0", "Child" : ["44"],
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
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_operand_fp_fu_5845.sparsemux_7_2_32_1_1_U103", "Parent" : "43"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_872_10_fu_5860", "Parent" : "0", "Child" : ["46"],
		"CDFG" : "rv32_ooo_tick_Pipeline_VITIS_LOOP_872_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "alu_rs_busy_1_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "alu_rs_busy_0_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "free_alu_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_872_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_872_10_fu_5860.flow_control_loop_pipe_sequential_init_U", "Parent" : "45"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_1129_11_fu_5869", "Parent" : "0", "Child" : ["48"],
		"CDFG" : "rv32_ooo_tick_Pipeline_VITIS_LOOP_1129_11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130", "EstimateLatencyMax" : "130",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "vregs_out", "Type" : "Bram", "Direction" : "O"},
			{"Name" : "vregs", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_1129_11", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_1129_11_fu_5869.flow_control_loop_pipe_sequential_init_U", "Parent" : "47"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_575_4_fu_5877", "Parent" : "0", "Child" : ["50"],
		"CDFG" : "rv32_ooo_tick_Pipeline_VITIS_LOOP_575_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130", "EstimateLatencyMax" : "130",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "vregs", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_575_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_575_4_fu_5877.flow_control_loop_pipe_sequential_init_U", "Parent" : "49"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_579_5_fu_5883", "Parent" : "0", "Child" : ["52"],
		"CDFG" : "rv32_ooo_tick_Pipeline_VITIS_LOOP_579_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130", "EstimateLatencyMax" : "130",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "vregs_out", "Type" : "Bram", "Direction" : "O"},
			{"Name" : "vregs", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_579_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_rv32_ooo_tick_Pipeline_VITIS_LOOP_579_5_fu_5883.flow_control_loop_pipe_sequential_init_U", "Parent" : "51"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_32ns_64_1_1_U116", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_32s_64_1_1_U117", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_1_1_U118", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_64_1_1_U119", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_7_32_1_1_U120", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_7_32_1_1_U121", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_32s_32s_32_36_seq_1_U122", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.udiv_32s_32s_32_36_seq_1_U123", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sdiv_32s_32s_32_36_seq_1_U124", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_32s_32s_32_36_seq_1_U125", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_13_5_32_1_1_x_U126", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_21_9_32_1_1_U127", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_3_32_1_1_U128", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_3_4_1_1_U129", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_3_1_1_U130", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	rv32_ooo_tick {
		reset {Type I LastRead 0 FirstWrite -1}
		imem {Type I LastRead 69 FirstWrite -1}
		dmem {Type IO LastRead 64 FirstWrite 5}
		disp_valid {Type O LastRead -1 FirstWrite 0}
		disp_tag {Type O LastRead -1 FirstWrite 0}
		disp_pc {Type O LastRead -1 FirstWrite 0}
		alu0_done {Type O LastRead -1 FirstWrite 0}
		alu0_tag {Type O LastRead -1 FirstWrite 0}
		alu1_done {Type O LastRead -1 FirstWrite 0}
		alu1_tag {Type O LastRead -1 FirstWrite 0}
		md_done {Type O LastRead -1 FirstWrite 0}
		md_tag {Type O LastRead -1 FirstWrite 0}
		fpu_done {Type O LastRead -1 FirstWrite 0}
		fpu_tag {Type O LastRead -1 FirstWrite 0}
		lsu_done {Type O LastRead -1 FirstWrite 0}
		lsu_tag {Type O LastRead -1 FirstWrite 0}
		br_done {Type O LastRead -1 FirstWrite 0}
		br_tag {Type O LastRead -1 FirstWrite 0}
		vec_done {Type O LastRead -1 FirstWrite 0}
		vec_tag {Type O LastRead -1 FirstWrite 0}
		commit_valid {Type O LastRead -1 FirstWrite 0}
		commit_is_fp {Type O LastRead -1 FirstWrite 0}
		commit_rd {Type O LastRead -1 FirstWrite 0}
		commit_value {Type O LastRead -1 FirstWrite 0}
		vregs_out {Type O LastRead -1 FirstWrite 1}
		halted {Type O LastRead -1 FirstWrite 0}
		rob_head {Type IO LastRead -1 FirstWrite -1}
		rob_tail {Type IO LastRead -1 FirstWrite -1}
		rob_count {Type IO LastRead -1 FirstWrite -1}
		alu_rs_executing_0 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_executing_1 {Type IO LastRead -1 FirstWrite -1}
		md_rs_executing {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_executing {Type IO LastRead -1 FirstWrite -1}
		br_rs_executing {Type IO LastRead -1 FirstWrite -1}
		vec_rs_executing {Type IO LastRead -1 FirstWrite -1}
		fetch_pc {Type IO LastRead -1 FirstWrite -1}
		fetch_stalled {Type IO LastRead -1 FirstWrite -1}
		fetch_done {Type IO LastRead -1 FirstWrite -1}
		alu_rs_busy_0 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_busy_1 {Type IO LastRead -1 FirstWrite -1}
		md_rs_busy {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_busy {Type IO LastRead -1 FirstWrite -1}
		lsu_rs_busy {Type IO LastRead -1 FirstWrite -1}
		br_rs_busy {Type IO LastRead -1 FirstWrite -1}
		vec_rs_busy {Type IO LastRead -1 FirstWrite -1}
		sys_rs_busy {Type IO LastRead -1 FirstWrite -1}
		csr_mstatus {Type IO LastRead -1 FirstWrite -1}
		csr_mie {Type IO LastRead -1 FirstWrite -1}
		csr_mtvec {Type IO LastRead -1 FirstWrite -1}
		csr_mscratch {Type IO LastRead -1 FirstWrite -1}
		csr_mepc {Type IO LastRead -1 FirstWrite -1}
		csr_mcause {Type IO LastRead -1 FirstWrite -1}
		csr_mtval {Type IO LastRead -1 FirstWrite -1}
		csr_mip {Type IO LastRead -1 FirstWrite -1}
		ecall_halt {Type IO LastRead -1 FirstWrite -1}
		vregs {Type IO LastRead -1 FirstWrite -1}
		rob_valid {Type IO LastRead -1 FirstWrite -1}
		rob_ready {Type IO LastRead -1 FirstWrite -1}
		rob_is_ecall {Type IO LastRead -1 FirstWrite -1}
		rob_is_store {Type IO LastRead -1 FirstWrite -1}
		rob_addr {Type IO LastRead -1 FirstWrite -1}
		rob_sdata {Type IO LastRead -1 FirstWrite -1}
		rob_mem_f3 {Type IO LastRead -1 FirstWrite -1}
		rob_dest_is_fp {Type IO LastRead -1 FirstWrite -1}
		rob_dest {Type IO LastRead -1 FirstWrite -1}
		rob_value {Type IO LastRead -1 FirstWrite -1}
		fregs {Type IO LastRead -1 FirstWrite -1}
		frat_has_tag {Type IO LastRead -1 FirstWrite -1}
		frat_tag {Type IO LastRead -1 FirstWrite -1}
		regfile {Type IO LastRead -1 FirstWrite -1}
		rat_has_tag {Type IO LastRead -1 FirstWrite -1}
		rat_tag {Type IO LastRead -1 FirstWrite -1}
		alu_rs_remaining_0 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_rob_tag_0 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_f3_0 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_alt_0 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s1_val_0 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s2_val_0 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s1_ready_0 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s1_tag_0 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s2_ready_0 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s2_tag_0 {Type IO LastRead -1 FirstWrite -1}
		md_rs_s1_ready {Type IO LastRead -1 FirstWrite -1}
		md_rs_s1_tag {Type IO LastRead -1 FirstWrite -1}
		md_rs_s1_val {Type IO LastRead -1 FirstWrite -1}
		md_rs_s2_ready {Type IO LastRead -1 FirstWrite -1}
		md_rs_s2_tag {Type IO LastRead -1 FirstWrite -1}
		md_rs_s2_val {Type IO LastRead -1 FirstWrite -1}
		lsu_rs_s1_ready {Type IO LastRead -1 FirstWrite -1}
		lsu_rs_s1_tag {Type IO LastRead -1 FirstWrite -1}
		lsu_rs_s1_val {Type IO LastRead -1 FirstWrite -1}
		lsu_rs_s2_ready {Type IO LastRead -1 FirstWrite -1}
		lsu_rs_s2_tag {Type IO LastRead -1 FirstWrite -1}
		lsu_rs_s2_val {Type IO LastRead -1 FirstWrite -1}
		br_rs_s1_ready {Type IO LastRead -1 FirstWrite -1}
		br_rs_s1_tag {Type IO LastRead -1 FirstWrite -1}
		br_rs_s1_val {Type IO LastRead -1 FirstWrite -1}
		br_rs_s2_ready {Type IO LastRead -1 FirstWrite -1}
		br_rs_s2_tag {Type IO LastRead -1 FirstWrite -1}
		br_rs_s2_val {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_s1_ready {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_s1_tag {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_s1_val {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_s2_ready {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_s2_tag {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_s2_val {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_s3_ready {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_s3_tag {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_s3_val {Type IO LastRead -1 FirstWrite -1}
		vec_rs_s1_ready {Type IO LastRead -1 FirstWrite -1}
		vec_rs_s1_tag {Type IO LastRead -1 FirstWrite -1}
		vec_rs_s1_val {Type IO LastRead -1 FirstWrite -1}
		sys_rs_s1_ready {Type IO LastRead -1 FirstWrite -1}
		sys_rs_s1_tag {Type IO LastRead -1 FirstWrite -1}
		sys_rs_s1_val {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s1_ready_1 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s1_tag_1 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s1_val_1 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s2_ready_1 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s2_tag_1 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_s2_val_1 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_rob_tag_1 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_remaining_1 {Type IO LastRead -1 FirstWrite -1}
		md_rs_remaining {Type IO LastRead -1 FirstWrite -1}
		md_rs_f3 {Type IO LastRead -1 FirstWrite -1}
		md_rs_rob_tag {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_remaining {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_rob_tag {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_r4op {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_f7 {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_f3 {Type IO LastRead -1 FirstWrite -1}
		fpu_rs_rs2f {Type IO LastRead -1 FirstWrite -1}
		mask_table {Type I LastRead -1 FirstWrite -1}
		one_half_minus_one_table {Type I LastRead -1 FirstWrite -1}
		index_table {Type I LastRead -1 FirstWrite -1}
		br_rs_is_jalr {Type IO LastRead -1 FirstWrite -1}
		br_rs_rob_tag {Type IO LastRead -1 FirstWrite -1}
		br_rs_br_pc {Type IO LastRead -1 FirstWrite -1}
		br_rs_size {Type IO LastRead -1 FirstWrite -1}
		br_rs_imm {Type IO LastRead -1 FirstWrite -1}
		br_rs_f3 {Type IO LastRead -1 FirstWrite -1}
		lsu_rs_rob_tag {Type IO LastRead -1 FirstWrite -1}
		lsu_rs_f3 {Type IO LastRead -1 FirstWrite -1}
		lsu_rs_imm {Type IO LastRead -1 FirstWrite -1}
		lsu_rs_is_load {Type IO LastRead -1 FirstWrite -1}
		vec_rs_is_arith {Type IO LastRead -1 FirstWrite -1}
		vec_rs_remaining {Type IO LastRead -1 FirstWrite -1}
		vec_rs_vd_or_vs3 {Type IO LastRead -1 FirstWrite -1}
		vec_rs_rob_tag {Type IO LastRead -1 FirstWrite -1}
		vec_rs_vs2 {Type IO LastRead -1 FirstWrite -1}
		vec_rs_vs1 {Type IO LastRead -1 FirstWrite -1}
		vec_rs_arith_op {Type IO LastRead -1 FirstWrite -1}
		vec_rs_is_load {Type IO LastRead -1 FirstWrite -1}
		vec_rs_is_store {Type IO LastRead -1 FirstWrite -1}
		sys_rs_rob_tag {Type IO LastRead -1 FirstWrite -1}
		sys_rs_csr_addr {Type IO LastRead -1 FirstWrite -1}
		sys_rs_f3 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_f3_1 {Type IO LastRead -1 FirstWrite -1}
		alu_rs_alt_1 {Type IO LastRead -1 FirstWrite -1}}
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
		alu_rs_s2_val_1 {Type O LastRead -1 FirstWrite 0}}
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
		index_table {Type I LastRead -1 FirstWrite -1}}
	expand {
		c {Type I LastRead 0 FirstWrite -1}}
	read_operand {
		reg_r {Type I LastRead 0 FirstWrite -1}
		rat_has_tag {Type I LastRead 0 FirstWrite -1}
		rat_tag {Type I LastRead 0 FirstWrite -1}
		rob_ready {Type I LastRead 1 FirstWrite -1}
		regfile {Type I LastRead 0 FirstWrite -1}
		rob_value {Type I LastRead 1 FirstWrite -1}}
	read_operand_fp {
		reg_r {Type I LastRead 0 FirstWrite -1}
		frat_has_tag {Type I LastRead 0 FirstWrite -1}
		frat_tag {Type I LastRead 0 FirstWrite -1}
		rob_ready {Type I LastRead 1 FirstWrite -1}
		fregs {Type I LastRead 0 FirstWrite -1}
		rob_value {Type I LastRead 1 FirstWrite -1}}
	rv32_ooo_tick_Pipeline_VITIS_LOOP_872_10 {
		alu_rs_busy_1_load_1 {Type I LastRead 0 FirstWrite -1}
		alu_rs_busy_0_load_1 {Type I LastRead 0 FirstWrite -1}
		free_alu_out {Type O LastRead -1 FirstWrite 1}}
	rv32_ooo_tick_Pipeline_VITIS_LOOP_1129_11 {
		vregs_out {Type O LastRead -1 FirstWrite 1}
		vregs {Type I LastRead 0 FirstWrite -1}}
	rv32_ooo_tick_Pipeline_VITIS_LOOP_575_4 {
		vregs {Type O LastRead -1 FirstWrite 0}}
	rv32_ooo_tick_Pipeline_VITIS_LOOP_579_5 {
		vregs_out {Type O LastRead -1 FirstWrite 1}
		vregs {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "141", "Max" : "276"}
	, {"Name" : "Interval", "Min" : "142", "Max" : "277"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	reset { ap_none {  { reset in_data 0 1 } } }
	imem { bram {  { imem_Addr_A MemPortADDR2 1 32 }  { imem_EN_A MemPortCE2 1 1 }  { imem_WEN_A MemPortWE2 1 4 }  { imem_Din_A MemPortDIN2 1 32 }  { imem_Dout_A MemPortDOUT2 0 32 }  { imem_Clk_A mem_clk 1 1 }  { imem_Rst_A mem_rst 1 1 }  { imem_Addr_B MemPortADDR2 1 32 }  { imem_EN_B MemPortCE2 1 1 }  { imem_WEN_B MemPortWE2 1 4 }  { imem_Din_B MemPortDIN2 1 32 }  { imem_Dout_B MemPortDOUT2 0 32 }  { imem_Clk_B mem_clk 1 1 }  { imem_Rst_B mem_rst 1 1 } } }
	dmem { bram {  { dmem_Addr_A MemPortADDR2 1 32 }  { dmem_EN_A MemPortCE2 1 1 }  { dmem_WEN_A MemPortWE2 1 4 }  { dmem_Din_A MemPortDIN2 1 32 }  { dmem_Dout_A MemPortDOUT2 0 32 }  { dmem_Clk_A mem_clk 1 1 }  { dmem_Rst_A mem_rst 1 1 }  { dmem_Addr_B MemPortADDR2 1 32 }  { dmem_EN_B MemPortCE2 1 1 }  { dmem_WEN_B MemPortWE2 1 4 }  { dmem_Din_B MemPortDIN2 1 32 }  { dmem_Dout_B MemPortDOUT2 0 32 }  { dmem_Clk_B mem_clk 1 1 }  { dmem_Rst_B mem_rst 1 1 } } }
	disp_valid { ap_none {  { disp_valid out_data 1 1 } } }
	disp_tag { ap_none {  { disp_tag out_data 1 3 } } }
	disp_pc { ap_none {  { disp_pc out_data 1 32 } } }
	alu0_done { ap_none {  { alu0_done out_data 1 1 } } }
	alu0_tag { ap_none {  { alu0_tag out_data 1 3 } } }
	alu1_done { ap_none {  { alu1_done out_data 1 1 } } }
	alu1_tag { ap_none {  { alu1_tag out_data 1 3 } } }
	md_done { ap_none {  { md_done out_data 1 1 } } }
	md_tag { ap_none {  { md_tag out_data 1 3 } } }
	fpu_done { ap_none {  { fpu_done out_data 1 1 } } }
	fpu_tag { ap_none {  { fpu_tag out_data 1 3 } } }
	lsu_done { ap_none {  { lsu_done out_data 1 1 } } }
	lsu_tag { ap_none {  { lsu_tag out_data 1 3 } } }
	br_done { ap_none {  { br_done out_data 1 1 } } }
	br_tag { ap_none {  { br_tag out_data 1 3 } } }
	vec_done { ap_none {  { vec_done out_data 1 1 } } }
	vec_tag { ap_none {  { vec_tag out_data 1 3 } } }
	commit_valid { ap_none {  { commit_valid out_data 1 1 } } }
	commit_is_fp { ap_none {  { commit_is_fp out_data 1 1 } } }
	commit_rd { ap_none {  { commit_rd out_data 1 5 } } }
	commit_value { ap_none {  { commit_value out_data 1 32 } } }
	vregs_out { bram {  { vregs_out_Addr_A MemPortADDR2 1 32 }  { vregs_out_EN_A MemPortCE2 1 1 }  { vregs_out_WEN_A MemPortWE2 1 4 }  { vregs_out_Din_A MemPortDIN2 1 32 }  { vregs_out_Dout_A MemPortDOUT2 0 32 }  { vregs_out_Clk_A mem_clk 1 1 }  { vregs_out_Rst_A mem_rst 1 1 } } }
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
