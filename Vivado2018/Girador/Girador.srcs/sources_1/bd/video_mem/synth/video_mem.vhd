--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Sun Nov 10 18:37:10 2019
--Host        : DESKTOP-DUF9KV0 running 64-bit major release  (build 9200)
--Command     : generate_target video_mem.bd
--Design      : video_mem
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity video_mem is
  port (
    addra_0 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    addrb_0 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    clka_0 : in STD_LOGIC;
    clkb_0 : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    doutb_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    ena_0 : in STD_LOGIC;
    enb_0 : in STD_LOGIC;
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of video_mem : entity is "video_mem,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=video_mem,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of video_mem : entity is "video_mem.hwdef";
end video_mem;

architecture STRUCTURE of video_mem is
  component video_mem_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 18 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 0 to 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 18 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component video_mem_blk_mem_gen_0_0;
  signal addra_0_1 : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal addrb_0_1 : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal blk_mem_gen_0_doutb : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clka_0_1 : STD_LOGIC;
  signal clkb_0_1 : STD_LOGIC;
  signal dina_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ena_0_1 : STD_LOGIC;
  signal enb_0_1 : STD_LOGIC;
  signal wea_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clka_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLKA_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clka_0 : signal is "XIL_INTERFACENAME CLK.CLKA_0, CLK_DOMAIN video_mem_clka_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of clkb_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLKB_0 CLK";
  attribute X_INTERFACE_PARAMETER of clkb_0 : signal is "XIL_INTERFACENAME CLK.CLKB_0, CLK_DOMAIN video_mem_clkb_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
begin
  addra_0_1(18 downto 0) <= addra_0(18 downto 0);
  addrb_0_1(18 downto 0) <= addrb_0(18 downto 0);
  clka_0_1 <= clka_0;
  clkb_0_1 <= clkb_0;
  dina_0_1(0) <= dina_0(0);
  doutb_0(0) <= blk_mem_gen_0_doutb(0);
  ena_0_1 <= ena_0;
  enb_0_1 <= enb_0;
  wea_0_1(0) <= wea_0(0);
blk_mem_gen_0: component video_mem_blk_mem_gen_0_0
     port map (
      addra(18 downto 0) => addra_0_1(18 downto 0),
      addrb(18 downto 0) => addrb_0_1(18 downto 0),
      clka => clka_0_1,
      clkb => clkb_0_1,
      dina(0) => dina_0_1(0),
      doutb(0) => blk_mem_gen_0_doutb(0),
      ena => ena_0_1,
      enb => enb_0_1,
      wea(0) => wea_0_1(0)
    );
end STRUCTURE;
