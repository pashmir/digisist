-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../Girador.srcs/sources_1/ip/clock_unit/clock_unit_clk_wiz.v" \
  "../../../../Girador.srcs/sources_1/ip/clock_unit/clock_unit.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

