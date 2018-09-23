----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2018 20:33:14
-- Design Name: 
-- Module Name: FFJK - estados
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

entity FFJK is
    Port ( J : in STD_LOGIC;
           K : in STD_LOGIC;
           Q : inout STD_LOGIC;
           Qn : inout STD_LOGIC;
           Ck : in STD_LOGIC);
end FFJK;

architecture FFJK_arq of FFJK is
    signal Qant:std_logic;
begin
    process(ck)
    begin
    if rising_edge(ck) then
        if (J = '1' and K = '1') then
            Qant <= not(Qant);
        end if;
        if (J = '1' and K = '0') then
            Qant <= '1';
        end if;
        if (J = '0' and K = '1') then
            Qant <= '0';
        end if;
        if (J = '0' and K = '0') then
            Qant <= Qant;
        end if;
    end if;
end process;
Q<=Qant;
end FFJK_arq;
