----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2018 20:00:14
-- Design Name: 
-- Module Name: contador - logica
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

entity contador is
    Port ( clock : in STD_LOGIC;
           LED1 : inout STD_LOGIC;
           LED2 : inout STD_LOGIC;
           LED3 : inout STD_LOGIC;
           LED4 : inout STD_LOGIC);
end contador;

architecture logica of contador is
begin
process(clock)
    begin
    if rising_edge(clock) then
        LED1 <= not(LED1);
        LED2 <= LED2 xor LED1;
        LED3 <= LED3 xor (LED2 and LED1);
        LED4 <= LED4 xor (LED3 and LED2 and LED1);
    end if;
end process;
end logica;
