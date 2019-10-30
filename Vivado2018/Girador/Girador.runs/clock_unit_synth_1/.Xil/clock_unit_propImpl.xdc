set_property SRC_FILE_INFO {cfile:d:/Users/Ceci/Documents/Facu/digisist/Vivado2018/Girador/Girador.srcs/sources_1/ip/clock_unit/clock_unit.xdc rfile:../../../Girador.srcs/sources_1/ip/clock_unit/clock_unit.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.08
