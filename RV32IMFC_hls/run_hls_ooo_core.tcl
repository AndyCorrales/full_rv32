# Script de Vitis HLS para el core OOO RV32IM (rv32_ooo.cpp).
# Uso: vitis_hls -f run_hls_ooo_core.tcl
#
# Proyecto separado de rv32_core_proj (core escalar) y de ooo_demo_proj
# (mecanismo aislado): este es el core RV32IM integrado con ejecucion
# fuera de orden (fases 1-4 del plan OOO). Reporte en
# rv32_ooo_proj/solution1/syn/report/rv32_ooo_tick_csynth.rpt

open_project -reset rv32_ooo_proj
set_top rv32_ooo_tick

add_files rv32_ooo.cpp
add_files -tb rv32_ooo_tb.cpp

open_solution -reset "solution1"

set_part {xck26-sfvc784-2LV-c}
create_clock -period 10 -name default

csim_design
csynth_design

puts "C-simulation y C-synthesis del core OOO terminados."
puts "Reporte: rv32_ooo_proj/solution1/syn/report/rv32_ooo_tick_csynth.rpt"

exit
