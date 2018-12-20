--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Wed Dec 19 21:09:46 2018
--Host        : cecilia-desktop running 64-bit Ubuntu 18.04.1 LTS
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
    douta_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    doutb_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    ena_0 : in STD_LOGIC;
    enb_0 : in STD_LOGIC
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
    addra : in STD_LOGIC_VECTOR ( 18 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 0 to 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 18 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component video_mem_blk_mem_gen_0_0;
  signal addra_0_1 : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal addrb_0_1 : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal blk_mem_gen_0_douta : STD_LOGIC_VECTOR ( 0 to 0 );
  signal blk_mem_gen_0_doutb : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clka_0_1 : STD_LOGIC;
  signal clkb_0_1 : STD_LOGIC;
  signal ena_0_1 : STD_LOGIC;
  signal enb_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clka_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLKA_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clka_0 : signal is "XIL_INTERFACENAME CLK.CLKA_0, CLK_DOMAIN video_mem_clka_0, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of clkb_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLKB_0 CLK";
  attribute X_INTERFACE_PARAMETER of clkb_0 : signal is "XIL_INTERFACENAME CLK.CLKB_0, CLK_DOMAIN video_mem_clkb_0, FREQ_HZ 100000000, PHASE 0.000";
begin
  addra_0_1(18 downto 0) <= addra_0(18 downto 0);
  addrb_0_1(18 downto 0) <= addrb_0(18 downto 0);
  clka_0_1 <= clka_0;
  clkb_0_1 <= clkb_0;
  douta_0(0) <= blk_mem_gen_0_douta(0);
  doutb_0(0) <= blk_mem_gen_0_doutb(0);
  ena_0_1 <= ena_0;
  enb_0_1 <= enb_0;
blk_mem_gen_0: component video_mem_blk_mem_gen_0_0
     port map (
      addra(18 downto 0) => addra_0_1(18 downto 0),
      addrb(18 downto 0) => addrb_0_1(18 downto 0),
      clka => clka_0_1,
      clkb => clkb_0_1,
      douta(0) => blk_mem_gen_0_douta(0),
      doutb(0) => blk_mem_gen_0_doutb(0),
      ena => ena_0_1,
      enb => enb_0_1
    );
end STRUCTURE;
