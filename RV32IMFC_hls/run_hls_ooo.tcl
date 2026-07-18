# Script de Vitis HLS para el demostrador OOO (ooo_demo.cpp).
# Uso: vitis_hls -f run_hls_ooo.tcl
#
# Proyecto separado de rv32_core_proj a proposito -- no toca el core
# escalar RV32IMFC ya verificado. Genera "ooo_demo_proj", corre
# csim + csynth, reporte en
# ooo_demo_proj/solution1/syn/report/ooo_demo_tick_csynth.rpt

open_project -reset ooo_demo_proj
set_top ooo_demo_tick

add_files ooo_demo.cpp
add_files -tb ooo_demo_tb.cpp

open_solution -reset "solution1"

set_part {xck26-sfvc784-2LV-c}
create_clock -period 10 -name default

csim_design
csynth_design

puts "C-simulation y C-synthesis del demo OOO terminados."
puts "Reporte: ooo_demo_proj/solution1/syn/report/ooo_demo_tick_csynth.rpt"

exit
