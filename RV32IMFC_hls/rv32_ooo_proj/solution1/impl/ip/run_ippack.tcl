# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
# Tool Version Limit: 2024.11
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
# 
# ==============================================================
source -notrace "/home/andy/Programas/Vivado/Vitis/2024.2/common/scripts/ipxhls.tcl"
set ip_dir "/media/andy/9cf23886-b985-4f84-a422-2da06e76f300/home/byovsh/Documents/Vscode/Proyecto/RV32IMFC_hls/rv32_ooo_proj/solution1/impl/ip"
set data_file "/media/andy/9cf23886-b985-4f84-a422-2da06e76f300/home/byovsh/Documents/Vscode/Proyecto/RV32IMFC_hls/rv32_ooo_proj/solution1/solution1_data.json"
set ip_types "vitis sysgen"
if { [catch {::ipx::utils::package_hls_ip $ip_dir $data_file $ip_types } res] } {
  puts "Caught error:\n$::errorInfo"
  error $res
}
