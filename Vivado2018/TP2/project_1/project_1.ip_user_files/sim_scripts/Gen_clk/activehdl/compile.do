vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_1.srcs/sources_1/bd/Gen_clk/ipshared/b65a" "+incdir+../../../../project_1.srcs/sources_1/bd/Gen_clk/ipshared/b65a" \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_1.srcs/sources_1/bd/Gen_clk/ipshared/b65a" "+incdir+../../../../project_1.srcs/sources_1/bd/Gen_clk/ipshared/b65a" \
"../../../bd/Gen_clk/ip/Gen_clk_clk_wiz_0_0/Gen_clk_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/Gen_clk/ip/Gen_clk_clk_wiz_0_0/Gen_clk_clk_wiz_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/Gen_clk/sim/Gen_clk.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

