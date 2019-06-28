----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.06.2019 15:18:16
-- Design Name: 
-- Module Name: char_rom_tb - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity char_rom_tb is
--  Port ( );
end char_rom_tb;

architecture Behavioral of char_rom_tb is
    component fontROM is
        generic(
            addrWidth: integer := 11;
            dataWidth: integer := 8
        );
        port(
            writeEnableA: in std_logic;
            addrA: in std_logic_vector(addrWidth-1 downto 0);
            dataOutA: out std_logic_vector(dataWidth-1 downto 0);
            dataInA: in std_logic_vector(dataWidth-1 downto 0)
        );
    end component;
    signal rom_out: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(0,8));
    signal char_addr: std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(48*16+2, 11));
    
begin
    DUT: fontROM
        generic map(
            addrWidth => 11,
            datawidth => 8
        )
        port map(
            addrA => char_addr,
            dataoutA => rom_out,
            writeenableA => '0',
            datainA => "00000000"
        );
end Behavioral;
