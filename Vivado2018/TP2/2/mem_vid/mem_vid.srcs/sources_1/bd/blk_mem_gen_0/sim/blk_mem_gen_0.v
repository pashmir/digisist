//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Thu Dec  6 17:48:06 2018
//Host        : NBOOKPAGANI running 64-bit major release  (build 9200)
//Command     : generate_target blk_mem_gen_0.bd
//Design      : blk_mem_gen_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "blk_mem_gen_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=blk_mem_gen_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "blk_mem_gen_0.hwdef" *) 
module blk_mem_gen_0
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLKA_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLKA_0, CLK_DOMAIN blk_mem_gen_0_clka_0, FREQ_HZ 100000000, PHASE 0.000" *) input clka_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLKB_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLKB_0, CLK_DOMAIN blk_mem_gen_0_clkb_0, FREQ_HZ 100000000, PHASE 0.000" *) input clkb_0;
  input [2:0]dina_0;
  output [2:0]doutb_0;
  input ena_0;
  input enb_0;
  input [0:0]wea_0;

  wire [18:0]addra_0_1;
  wire [18:0]addrb_0_1;
  wire [2:0]blk_mem_gen_0_doutb;
  wire clka_0_1;
  wire clkb_0_1;
  wire [2:0]dina_0_1;
  wire ena_0_1;
  wire enb_0_1;
  wire [0:0]wea_0_1;

  assign addra_0_1 = addra_0[18:0];
  assign addrb_0_1 = addrb_0[18:0];
  assign clka_0_1 = clka_0;
  assign clkb_0_1 = clkb_0;
  assign dina_0_1 = dina_0[2:0];
  assign doutb_0[2:0] = blk_mem_gen_0_doutb;
  assign ena_0_1 = ena_0;
  assign enb_0_1 = enb_0;
  assign wea_0_1 = wea_0[0];
  blk_mem_gen_0_blk_mem_gen_0_0 video_mem
       (.addra(addra_0_1),
        .addrb(addrb_0_1),
        .clka(clka_0_1),
        .clkb(clkb_0_1),
        .dina(dina_0_1),
        .doutb(blk_mem_gen_0_doutb),
        .ena(ena_0_1),
        .enb(enb_0_1),
        .wea(wea_0_1));
endmodule
