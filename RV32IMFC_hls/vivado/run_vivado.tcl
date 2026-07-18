# Sintesis + implementacion en Vivado del RTL que ya genero Vitis HLS,
# para obtener metricas REALES (post-P&R) en vez de los estimados de
# csynth_design -- mas precisas para "Resultados preliminares".
#
# Precondicion: correr primero, en RV32IMFC_hls/:
#   vitis_hls -f run_hls.tcl
# (esto deja el RTL en rv32_core_proj/solution1/syn/verilog/)
#
# Uso (desde RV32IMFC_hls/):
#   vivado -mode batch -source vivado/run_vivado.tcl
#
# Nota: corre "out of context" (sin integrar a un system completo con
# Zynq PS ni el board file del Kria) -- alcanza para metricas reales de
# recursos/frecuencia de este bloque solo. Integrarlo a un sistema
# completo (AXI interconnect + Zynq PS + memoria) es el siguiente paso,
# necesario recien cuando se quiera correr de verdad en la placa fisica.

set part      "xck26-sfvc784-2LV-c"
set top       "rv32_core_step"
set hls_rtl   "./rv32_core_proj/solution1/syn/verilog"
set clk_ns    10.0

if {![file isdirectory $hls_rtl]} {
    puts "ERROR: no existe $hls_rtl -- corre primero 'vitis_hls -f run_hls.tcl' en esta carpeta."
    exit 1
}

file mkdir reports

create_project -in_memory -part $part

add_files -scan_for_includes $hls_rtl
import_files -force $hls_rtl

set_property top $top [current_fileset]

# El puerto de reloj generado por Vitis HLS para una interfaz ap_ctrl_hs
# se llama "ap_clk" por convencion -- si tu version de Vitis HLS lo
# nombro distinto, ajusta esta linea (revisa la lista de puertos del
# modulo top con "report_ports" o abriendo el .v generado).
create_clock -period $clk_ns -name ap_clk [get_ports ap_clk]

synth_design -top $top -part $part -mode out_of_context

report_utilization -file reports/utilization_synth.rpt
report_timing_summary -file reports/timing_synth.rpt

opt_design
place_design
route_design

report_utilization -file reports/utilization_impl.rpt
report_timing_summary -file reports/timing_impl.rpt

puts "Listo. Numeros finales (post-P&R) en:"
puts "  reports/utilization_impl.rpt"
puts "  reports/timing_impl.rpt"
