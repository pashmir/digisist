vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../project_1.srcs/sources_1/bd/Gen_clk/ipshared/b65a" "+incdir+../../../../project_1.srcs/sources_1/bd/Gen_clk/ipshared/b65a" \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_1.srcs/sources_1/bd/Gen_clk/ipshared/b65a" "+incdir+../../../../project_1.srcs/sources_1/bd/Gen_clk/ipshared/b65a" \
"../../../bd/Gen_clk/ip/Gen_clk_clk_wiz_0_0/Gen_clk_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/Gen_clk/ip/Gen_clk_clk_wiz_0_0/Gen_clk_clk_wiz_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/Gen_clk/sim/Gen_clk.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

