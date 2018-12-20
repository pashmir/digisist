//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Thu Dec  6 17:48:06 2018
//Host        : NBOOKPAGANI running 64-bit major release  (build 9200)
//Command     : generate_target blk_mem_gen_0_wrapper.bd
//Design      : blk_mem_gen_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module blk_mem_gen_0_wrapper
   (addra_0,
    addrb_0,
    clka_0,
    clkb_0,
    dina_0,
    doutb_0,
    ena_0,
    enb_0,
    wea_0);
  input [18:0]addra_0;
  input [18:0]addrb_0;
  input clka_0;
  input clkb_0;
  input [2:0]dina_0;
  output [2:0]doutb_0;
  input ena_0;
  input enb_0;
  input [0:0]wea_0;

  wire [18:0]addra_0;
  wire [18:0]addrb_0;
  wire clka_0;
  wire clkb_0;
  wire [2:0]dina_0;
  wire [2:0]doutb_0;
  wire ena_0;
  wire enb_0;
  wire [0:0]wea_0;

  blk_mem_gen_0 blk_mem_gen_0_i
       (.addra_0(addra_0),
        .addrb_0(addrb_0),
        .clka_0(clka_0),
        .clkb_0(clkb_0),
        .dina_0(dina_0),
        .doutb_0(doutb_0),
        .ena_0(ena_0),
        .enb_0(enb_0),
        .wea_0(wea_0));
endmodule
