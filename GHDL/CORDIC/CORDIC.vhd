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
    --constant xo : signed(N_bits-1 downto 0):=to_signed(2**(N_bits-1)-1,N_bits);
    --constant yo : signed(N_bits-1 downto 0):=to_signed(0,N_bits);
    type pasos is array(0 to 15) of signed(N_bits downto 0);
    signal xi : pasos :=(    to_signed(2**(N_bits-1)-1,N_bits+1),
                            to_signed(2**(N_bits-1)-1,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1)
                         );
    signal yi : pasos:=(    to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1),
                            to_signed(0,N_bits+1)
                         );
    signal anguloi : pasos:=(   to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1),
                                to_signed(0,N_bits+1)
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
anguloi(0) <= resize(signed(grados),N_bits+1);
x <= STD_LOGIC_VECTOR(resize(xi(6),N_bits));
y <= STD_LOGIC_VECTOR(resize(yi(6),N_bits));
rotation_start : process(enable)
    begin
	if rising_edge(enable) then
	    xi(0) <= xi(6);
	    yi(0) <= yi(6);
	end if;
    end process;
iteracion0: process(clk)
    begin
        if rising_edge(clk) then
		if anguloi(0)>0 then
                    anguloi(1) <= anguloi(0) - resize(tabla_pasos(0)(31 downto 32-N_bits),N_bits+1);
                    xi(1) <= xi(0) - yi(0);
                    yi(1) <= yi(0) + xi(0);
                else
		    if anguloi(0) <= 0 then
	                anguloi(1) <= anguloi(0) + resize(tabla_pasos(0)(31 downto 32-N_bits),N_bits+1);
                	xi(1) <= xi(0) + yi(0);
                        yi(1) <= yi(0) - xi(0);
		    end if;
                end if;
	    end if;
    end process;
iteracion1: process(clk)
    begin
        if rising_edge(clk) then
		if anguloi(1)>0 then
                    anguloi(2) <= anguloi(1) - resize(tabla_pasos(1)(31 downto 32-N_bits),N_bits+1);
                    xi(2) <= xi(1) - shift_right(yi(1),1);
                    yi(2) <= yi(1) + shift_right(xi(1),1);
                else
		    if anguloi(1)<=0 then
	                anguloi(2) <= anguloi(1) + resize(tabla_pasos(1)(31 downto 32-N_bits),N_bits+1);
                	xi(2) <= xi(1) + shift_right(yi(1),1);
                        yi(2) <= yi(1) - shift_right(xi(1),1);
		    end if;
                end if;
	    end if;
    end process;
iteracion2: process(clk)
    begin
        if rising_edge(clk) then
		if anguloi(2)>0 then
                    anguloi(3) <= anguloi(2) - resize(tabla_pasos(2)(31 downto 32-N_bits),N_bits+1);
                    xi(3) <= xi(2) - shift_right(yi(2),2);
                    yi(3) <= yi(2) + shift_right(xi(2),2);
                else
		    if anguloi(2)<=0 then
	                anguloi(3) <= anguloi(2) + resize(tabla_pasos(2)(31 downto 32-N_bits),N_bits+1);
                	xi(3) <= xi(2) + shift_right(yi(2),2);
                        yi(3) <= yi(2) - shift_right(xi(2),2);
		    end if;
                end if;
	    end if;
    end process;
iteracion3: process(clk)
    begin
        if rising_edge(clk) then
		if anguloi(3)>0 then
                    anguloi(4) <= anguloi(3) - resize(tabla_pasos(3)(31 downto 32-N_bits),N_bits+1);
                    xi(4) <= xi(3) - shift_right(yi(3),3);
                    yi(4) <= yi(3) + shift_right(xi(3),3);
                else
		    if anguloi(3)<=0 then
	                anguloi(4) <= anguloi(3) + resize(tabla_pasos(3)(31 downto 32-N_bits),N_bits+1);
                	xi(4) <= xi(3) + shift_right(yi(3),3);
                        yi(4) <= yi(3) - shift_right(xi(3),3);
		    end if;
                end if;
	    end if;
    end process;
iteracion4: process(clk)
    begin
        if rising_edge(clk) then
		if anguloi(4)>0 then
                    anguloi(5) <= anguloi(4) - resize(tabla_pasos(4)(31 downto 32-N_bits),N_bits+1);
                    xi(5) <= xi(4) - shift_right(yi(4),4);
                    yi(5) <= yi(4) + shift_right(xi(4),4);
                else
		    if anguloi(4)<=0 then
	                anguloi(5) <= anguloi(4) + resize(tabla_pasos(4)(31 downto 32-N_bits),N_bits+1);
                	xi(5) <= xi(4) + shift_right(yi(4),4);
                        yi(5) <= yi(4) - shift_right(xi(4),4);
		    end if;
                end if;
	    end if;
    end process;
iteracion5: process(clk)
    variable aux1 : signed(N_bits downto 0);
    variable aux2 : signed(2*(N_bits+1)-1 downto 0);
    begin
        if rising_edge(clk) then
		if anguloi(5)>0 then
                    anguloi(6) <= anguloi(5) - resize(tabla_pasos(5)(31 downto 32-N_bits),N_bits+1);
                    aux1 := xi(5) - shift_right(yi(5),5);
		    aux2 := aux1 * resize(tabla_K(5)(31 downto 32-N_bits),N_bits+1);
		    xi(6) <= aux2(N_bits+N_bits-1 downto N_bits-1);
                    aux1 := yi(5) + shift_right(xi(5),5);
		    aux2 := aux1 * resize(tabla_K(5)(31 downto 32-N_bits),N_bits+1);
		    yi(6) <= aux2(N_bits+N_bits-1 downto N_bits-1);
                else
		    if anguloi(5)<=0 then
	                anguloi(6) <= anguloi(5) + resize(tabla_pasos(5)(31 downto 32-N_bits),N_bits+1);
                	aux1 := xi(5) + shift_right(yi(5),5);
		        aux2 := aux1 * resize(tabla_K(5)(31 downto 32-N_bits),N_bits+1);
		        xi(6) <= aux2(N_bits+N_bits-1 downto N_bits-1);
                        aux1 := yi(5) - shift_right(xi(5),5);
		        aux2 := aux1 * resize(tabla_K(5)(31 downto 32-N_bits),N_bits+1);
		        yi(6) <= aux2(N_bits+N_bits-1 downto N_bits-1);
		    end if;
                end if;
	    end if;
    end process;
end Behavioral;
