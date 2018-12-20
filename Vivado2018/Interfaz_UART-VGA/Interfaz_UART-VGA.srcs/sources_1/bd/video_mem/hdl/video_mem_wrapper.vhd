--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
--Date        : Thu Dec 20 16:44:19 2018
--Host        : NBOOKPAGANI running 64-bit major release  (build 9200)
--Command     : generate_target video_mem_wrapper.bd
--Design      : video_mem_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity video_mem_wrapper is
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
end video_mem_wrapper;

architecture STRUCTURE of video_mem_wrapper is
  component video_mem is
  port (
    addra_0 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    clka_0 : in STD_LOGIC;
    ena_0 : in STD_LOGIC;
    addrb_0 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    clkb_0 : in STD_LOGIC;
    enb_0 : in STD_LOGIC;
    doutb_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    dina_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component video_mem;
begin
video_mem_i: component video_mem
     port map (
      addra_0(18 downto 0) => addra_0(18 downto 0),
      addrb_0(18 downto 0) => addrb_0(18 downto 0),
      clka_0 => clka_0,
      clkb_0 => clkb_0,
      dina_0(0) => dina_0(0),
      doutb_0(0) => doutb_0(0),
      ena_0 => ena_0,
      enb_0 => enb_0,
      wea_0(0) => wea_0(0)
    );
end STRUCTURE;
