----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.08.2019 15:29:18
-- Design Name: 
-- Module Name: CORDIC - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CORDIC is
    Generic (   N_bits : natural := 8;
                N_pasos: natural := 8
                );
    Port ( grados : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
           sentido : in STD_LOGIC;
           enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           x : out STD_LOGIC_VECTOR (N_bits-1 downto 0);
           y : out STD_LOGIC_VECTOR (N_bits-1 downto 0)
           );
end CORDIC;
architecture Behavioral of CORDIC is
    signal xo : signed(N_bits-1 downto 0):=to_signed(2**(N_bits-1)-1,N_bits);
    signal yo : signed(N_bits-1 downto 0):=to_signed(0,N_bits);
    signal angulo : signed(N_bits-1 downto 0):=to_signed(0,N_bits);
    type pasos is array(0 to 15) of signed(N_bits-1 downto 0);
    signal xi : pasos :=(   to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits)
                         );
    signal yi : pasos:=(   to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits),
                            to_signed(0,N_bits)
                         );
    signal anguloi : pasos:=(   to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits),
                                to_signed(0,N_bits)
                             );
    -- constant tolerancia : signed(N_bits downto 0) := to_signed(1,n_bits);
    type tabla is array(0 to 15) of signed(31 downto 0);
    constant tabla_K : tabla := (       to_signed(1518500249,32), 
                                        to_signed(1358187913,32),
                                        to_signed(1317635817,32), 
                                        to_signed(1307460871,32), 
                                        to_signed(1304914694,32),
                                        to_signed(1304277994,32), 
                                        to_signed(1304118810,32), 
                                        to_signed(1304079013,32), 
                                        to_signed(1304069064,32), 
                                        to_signed(1304066577,32),
                                        to_signed(1304065955,32), 
                                        to_signed(1304065799,32), 
                                        to_signed(1304065761,32), 
                                        to_signed(1304065751,32), 
                                        to_signed(1304065748,32),
                                        to_signed(1304065748,32));
    constant tabla_pasos : tabla := (   "00100000000000000000000000000000",-- 45.000 * (1/180) * 2 ^ 31 
                                        "00010010111001000000010100011101",-- 26.565 * (1/180) * 2 ^ 31
                                        "00001001111110110011100001011011",-- 14.036 * (1/180) * 2 ^ 31
                                        "00000101000100010001000111010100",--  7.125 * (1/180) * 2 ^ 31
                                        "00000010100010110000110101000011",--  3.576 * (1/180) * 2 ^ 31
                                        "00000001010001011101011111100001",--  1.790 * (1/180) * 2 ^ 31
                                        "00000000101000101111011000011110",--  0.895 * (1/180) * 2 ^ 31
                                        "00000000010100010111110001010101",--  0.448 * (1/180) * 2 ^ 31
                                        "00000000001010001011111001010011",--  0.224 * (1/180) * 2 ^ 31
                                        "00000000000101000101111100101110",--  0.112 * (1/180) * 2 ^ 31
                                        "00000000000010100010111110011000",--  0.056 * (1/180) * 2 ^ 31
                                        "00000000000001010001011111001100",--  0.028 * (1/180) * 2 ^ 31
                                        "00000000000000101000101111100110",--  0.014 * (1/180) * 2 ^ 31
                                        "00000000000000010100010111110011",--  0.007 * (1/180) * 2 ^ 31
                                        "00000000000000001010001011111001",--  0.004 * (1/180) * 2 ^ 31
                                        "00000000000000000101000101111100");-- 0.002 * (1/180) * 2 ^ 31
begin
iteracion1: 
process(clk,enable)
    variable ondelay: unsigned(1 downto 0) := "00"; -- for waiting grados's real value
    begin
        if rising_edge(enable) then
            angulo <= signed(grados);
            if ondelay="11" then
                xo<=xi(2);
                yo<=yi(2);
            end if;
            if ondelay="01" then
                ondelay := "11";
            end if;
            if ondelay="00" then
                ondelay := "01";
            end if;
        end if;
        if rising_edge(clk) then
            if angulo>0 then
                xi(1) <= xo - shift_right(yo,1);
                yi(1) <= yo + shift_right(xo,1);
                anguloi(1) <= angulo - tabla_pasos(0)(31 downto 32-N_bits);
            else
                xi(1) <= xo + shift_right(yo,1);
                yi(1) <= yo - shift_right(xo,1);
                anguloi(1) <= angulo + tabla_pasos(0)(31 downto 32-N_bits);
            end if;
        end if;
    end process;
iteracion2: process(clk)
    begin
        if rising_edge(clk) then
            if anguloi(1)>0 then
                xi(2) <= xi(1) - shift_right(yi(1),2);
                yi(2) <= yi(1) + shift_right(xi(1),2);
                anguloi(2) <= anguloi(1) - tabla_pasos(1)(31 downto 32-N_bits);
            else
                xi(2) <= xi(1) + shift_right(yi(1),2);
                yi(2) <= yi(1) - shift_right(xi(1),2);
                anguloi(2) <= anguloi(1) + tabla_pasos(1)(31 downto 32-N_bits);
            end if;
        end if;
    end process;
x <= STD_LOGIC_VECTOR(xi(2));
y <= STD_LOGIC_VECTOR(yi(2));
end Behavioral;
