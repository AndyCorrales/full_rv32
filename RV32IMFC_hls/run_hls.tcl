# Script de Vitis HLS para el nucleo RV32IM sintetizable.
# Uso: vitis_hls -f run_hls.tcl
#
# Genera: proyecto "rv32_core_proj", corre C-simulation (verifica contra
# los valores ya confirmados en rv32_core_tb.cpp) y C-synthesis (reporte
# de recursos + frecuencia maxima estimada). Los reportes quedan en
# rv32_core_proj/solution1/syn/report/rv32_core_step_csynth.rpt

open_project -reset rv32_core_proj
set_top rv32_core_step

add_files rv32_core.cpp
add_files -tb rv32_core_tb.cpp

open_solution -reset "solution1"

# Kria KV260: Zynq UltraScale+ MPSoC, XCK26, empaque sfvc784, grado -2LV-c.
# Ajustar si el starter kit usa otra revision/part exacto.
set_part {xck26-sfvc784-2LV-c}

# Periodo de reloj objetivo: 10ns = 100MHz (punto de partida conservador;
# el reporte de csynth da el Fmax real estimado, se puede apretar despues).
create_clock -period 10 -name default

csim_design
csynth_design

puts "C-simulation y C-synthesis terminados."
puts "Reporte: rv32_core_proj/solution1/syn/report/rv32_core_step_csynth.rpt"

exit
