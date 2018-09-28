----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2018 16:20:33
-- Design Name: 
-- Module Name: contador4bits_tb - Behavioral
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

entity contador4bits_tb is
--  Port ( );
end contador4bits_tb;

architecture Behavioral of contador4bits_tb is

component contador4bits 
     Port ( clk : in STD_LOGIC;
          rst : in STD_LOGIC;
          Led : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal reset,clk: std_logic;
signal counter:std_logic_vector(3 downto 0);

begin
dut: contador4bits port map (clk => clk, rst=>reset, Led => counter);
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
