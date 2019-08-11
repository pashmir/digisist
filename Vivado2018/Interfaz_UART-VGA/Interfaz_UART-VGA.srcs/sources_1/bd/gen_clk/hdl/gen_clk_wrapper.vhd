--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Thu May 23 19:09:30 2019
--Host        : LAPTOP-T9IKLUT4 running 64-bit major release  (build 9200)
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
