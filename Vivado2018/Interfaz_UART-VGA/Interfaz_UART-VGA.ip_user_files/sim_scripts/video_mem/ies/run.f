-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_2 \
  "../../../../Interfaz_UART-VGA.srcs/sources_1/bd/video_mem/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/video_mem/ip/video_mem_blk_mem_gen_0_0/sim/video_mem_blk_mem_gen_0_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/video_mem/sim/video_mem.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

