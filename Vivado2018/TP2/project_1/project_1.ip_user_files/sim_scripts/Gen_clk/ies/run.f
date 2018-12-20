-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/Gen_clk/ip/Gen_clk_clk_wiz_0_0/Gen_clk_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/Gen_clk/ip/Gen_clk_clk_wiz_0_0/Gen_clk_clk_wiz_0_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/Gen_clk/sim/Gen_clk.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

