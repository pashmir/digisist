----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2018 16:11:03
-- Design Name: 
-- Module Name: Contador4bits - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Contador4bits is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           Led : out STD_LOGIC_VECTOR (3 downto 0));
end Contador4bits;

architecture Behavioral of Contador4bits is
signal count : STD_LOGIC_VECTOR (3 downto 0);
begin
    process (clk, rst)
    begin
        if (rst = '1') then
            count <= "0000";
        else
            if (rising_edge (clk)) then
                count <= count + '1';
            end if;
        end if;
    end process;

Led <= count; 
   
end Behavioral;
