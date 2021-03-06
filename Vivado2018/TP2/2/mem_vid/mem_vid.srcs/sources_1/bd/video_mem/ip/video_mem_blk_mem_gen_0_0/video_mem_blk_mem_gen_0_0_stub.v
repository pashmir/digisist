// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Thu Dec  6 18:17:51 2018
// Host        : NBOOKPAGANI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/barbe_000/Desktop/U/sistemas
//               digitales/tp2/2/mem_vid/mem_vid.srcs/sources_1/bd/video_mem/ip/video_mem_blk_mem_gen_0_0/video_mem_blk_mem_gen_0_0_stub.v}
// Design      : video_mem_blk_mem_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.2" *)
module video_mem_blk_mem_gen_0_0(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[18:0],dina[0:0],clkb,enb,addrb[18:0],doutb[0:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [18:0]addra;
  input [0:0]dina;
  input clkb;
  input enb;
  input [18:0]addrb;
  output [0:0]doutb;
endmodule
