library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CORDIC_top is
    Generic (   N_bits : natural := 8;
                N_pasos: natural := 8
                );
    Port ( grados : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
           enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           x : out STD_LOGIC_VECTOR (N_bits-1 downto 0);
           y : out STD_LOGIC_VECTOR (N_bits-1 downto 0)
           );
end CORDIC_top;
architecture Behavioral of CORDIC_top is
    constant xo : signed(N_bits downto 0):=to_signed(2**(N_bits-1)-1,N_bits+1);
    constant yo : signed(N_bits downto 0):=to_signed(0,N_bits+1);
    type tuplas is array(0 to N_pasos, 0 to 2) of STD_LOGIC_VECTOR(N_bits downto 0);
    signal matriz : tuplas := 	(others => 	(0 => STD_LOGIC_VECTOR(yo),
						 1 => STD_LOGIC_VECTOR(xo),
						 2 => STD_LOGIC_VECTOR(yo)
						)
				);
    component CORDIC_IT is 
	Generic (   N_bits : natural := 8;
		iteration : natural := 0;
		angle_step : signed(31 downto 0) := "00100000000000000000000000000000" 
                );
    	Port ( clk : in STD_LOGIC;
	   ai : in STD_LOGIC_VECTOR (N_bits downto 0);
	   xi : in STD_LOGIC_VECTOR (N_bits downto 0);
	   yi : in STD_LOGIC_VECTOR (N_bits downto 0);
	   ao : out STD_LOGIC_VECTOR (N_bits downto 0);
           xo : out STD_LOGIC_VECTOR (N_bits downto 0);
           yo : out STD_LOGIC_VECTOR (N_bits downto 0)
           );
    end component;
    type tabla is array(0 to 15) of signed(31 downto 0);
    constant K : tabla := (	to_signed(1518500249,32), 
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
    constant pasos : tabla := (   "00100000000000000000000000000000",-- 45.000 * (1/180) * 2 ^ 31 
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
matriz(0,0) <= STD_LOGIC_VECTOR(resize(signed(grados),N_bits+1));
x <= STD_LOGIC_VECTOR(resize(signed(matriz(N_pasos,1)),N_bits));
y <= STD_LOGIC_VECTOR(resize(signed(matriz(N_pasos,2)),N_bits));
rotation_start : process(clk)
    begin
	if ((rising_edge(clk))and(enable = '1')) then
	    matriz(0,1) <= matriz(N_pasos,1);
	    matriz(0,2) <= matriz(N_pasos,2);
	end if;
    end process;
iteraciones: for i in 0 to N_pasos-2 generate
	iteracion_inst: CORDIC_IT 
	    generic map(N_bits,i,pasos(i))
	    port map(clk,matriz(i,0),matriz(i,1),matriz(i,2),matriz(i+1,0),matriz(i+1,1),matriz(i+1,2));
    end generate;

scaling: process(clk)
    variable aux1 : signed(N_bits downto 0);
    variable aux2 : signed(2*(N_bits+1)-1 downto 0);
    begin
        if rising_edge(clk) then
		aux1 := signed(matriz(N_pasos-1,1));
		aux2 := aux1 * resize(K(N_pasos-1)(31 downto 32-N_bits),N_bits+1);
		matriz(N_pasos,1) <= STD_LOGIC_VECTOR(aux2(N_bits+N_bits-1 downto N_bits-1));
		aux1 := signed(matriz(N_pasos-1,2));
		aux2 := aux1 * resize(K(N_pasos-1)(31 downto 32-N_bits),N_bits+1);
		matriz(N_pasos,2) <= STD_LOGIC_VECTOR(aux2(N_bits+N_bits-1 downto N_bits-1));
	    end if;
    end process;
end Behavioral;
