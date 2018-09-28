----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2018 20:14:41
-- Design Name: 
-- Module Name: contador_tb - Behavioral
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

entity contador_tb is
--  Port ( );
end contador_tb;

architecture Behavioral of contador_tb is
component contador
    port (
        clock : in STD_LOGIC;
        LED1 : inout STD_LOGIC;
        LED2 : inout STD_LOGIC;
        LED3 : inout STD_LOGIC;
        LED4 : inout STD_LOGIC
    );
end component;
signal clk,LED1,LED2,LED3,LED4: STD_LOGIC;
begin
dut: contador port map (clock => clk, LED1 => LED1, LED2 => LED2, LED3 => LED3, LED4 => LED4);
clock_process:process
begin
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10 ns;    
end process;
end Behavioral;
