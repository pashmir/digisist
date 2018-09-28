----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2018 21:49:27
-- Design Name: 
-- Module Name: prescaler_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity prescaler_tb is
--  Port ( );
end prescaler_tb;

architecture Behavioral of prescaler_tb is
component prescaler 
     Port ( clk_125 : in STD_LOGIC;
          rst : in STD_LOGIC;
          clk_1 : out STD_LOGIC);
end component;

signal reset,clk: std_logic;
signal clk_out:std_logic;


begin
dut: prescaler port map (clk_125 => clk, rst=>reset, clk_1 => clk_out);
   -- Clock process definitions
clock_process :process
begin
  clk <= '0';
  wait for 10 ns;
  clk <= '1';
  wait for 10 ns;
end process;

-- reset process
Rst_proc: process
begin        
   -- hold reset state for 100 ns.
    reset <= '1';
    wait for 20 ns;    
    reset <= '0';
    wait for 300 ns;    
    wait;
end process;


end Behavioral;
