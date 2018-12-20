--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
--Date        : Thu Dec  6 17:59:16 2018
--Host        : NBOOKPAGANI running 64-bit major release  (build 9200)
--Command     : generate_target gen_clk_wrapper.bd
--Design      : gen_clk_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gen_clk_wrapper is
  port (
    clk : out STD_LOGIC;
    locked : out STD_LOGIC;
    rst : in STD_LOGIC;
    sys_clk : in STD_LOGIC
  );
end gen_clk_wrapper;

architecture STRUCTURE of gen_clk_wrapper is
  component gen_clk is
  port (
    sys_clk : in STD_LOGIC;
    clk : out STD_LOGIC;
    locked : out STD_LOGIC;
    rst : in STD_LOGIC
  );
  end component gen_clk;
begin
gen_clk_i: component gen_clk
     port map (
      clk => clk,
      locked => locked,
      rst => rst,
      sys_clk => sys_clk
    );
end STRUCTURE;
