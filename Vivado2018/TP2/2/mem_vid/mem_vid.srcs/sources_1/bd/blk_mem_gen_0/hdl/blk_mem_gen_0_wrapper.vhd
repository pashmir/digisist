--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
--Date        : Thu Dec  6 17:51:57 2018
--Host        : NBOOKPAGANI running 64-bit major release  (build 9200)
--Command     : generate_target blk_mem_gen_0_wrapper.bd
--Design      : blk_mem_gen_0_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_mem_gen_0_wrapper is
  port (
    addra_0 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    addrb_0 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    clka_0 : in STD_LOGIC;
    clkb_0 : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    doutb_0 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ena_0 : in STD_LOGIC;
    enb_0 : in STD_LOGIC;
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end blk_mem_gen_0_wrapper;

architecture STRUCTURE of blk_mem_gen_0_wrapper is
  component blk_mem_gen_0 is
  port (
    clkb_0 : in STD_LOGIC;
    clka_0 : in STD_LOGIC;
    ena_0 : in STD_LOGIC;
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    enb_0 : in STD_LOGIC;
    addra_0 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    dina_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    addrb_0 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    doutb_0 : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component blk_mem_gen_0;
begin
blk_mem_gen_0_i: component blk_mem_gen_0
     port map (
      addra_0(18 downto 0) => addra_0(18 downto 0),
      addrb_0(18 downto 0) => addrb_0(18 downto 0),
      clka_0 => clka_0,
      clkb_0 => clkb_0,
      dina_0(2 downto 0) => dina_0(2 downto 0),
      doutb_0(2 downto 0) => doutb_0(2 downto 0),
      ena_0 => ena_0,
      enb_0 => enb_0,
      wea_0(0) => wea_0(0)
    );
end STRUCTURE;
