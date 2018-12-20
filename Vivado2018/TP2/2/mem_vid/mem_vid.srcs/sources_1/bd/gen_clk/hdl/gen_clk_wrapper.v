//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Thu Dec  6 17:46:56 2018
//Host        : NBOOKPAGANI running 64-bit major release  (build 9200)
//Command     : generate_target gen_clk_wrapper.bd
//Design      : gen_clk_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module gen_clk_wrapper
   (clk,
    locked,
    rst,
    sys_clk);
  output clk;
  output locked;
  input rst;
  input sys_clk;

  wire clk;
  wire locked;
  wire rst;
  wire sys_clk;

  gen_clk gen_clk_i
       (.clk(clk),
        .locked(locked),
        .rst(rst),
        .sys_clk(sys_clk));
endmodule
