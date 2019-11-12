// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Oct 30 20:27:59 2019
// Host        : DESKTOP-DUF9KV0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top video_mem -prefix
//               video_mem_ video_mem_stub.v
// Design      : video_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module video_mem(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
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
