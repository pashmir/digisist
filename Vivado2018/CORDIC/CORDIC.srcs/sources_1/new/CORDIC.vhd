----------------------------------------------------------------------------------
-- Calcula CORDIC con enteros de hasta 32 bits, pero con 0.4 grados de tolerancia
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
                N_steps : natural:= 8
    );
    Port ( grados : in STD_LOGIC_VECTOR(N_bits-1 downto 0);
           sentido : in STD_LOGIC;
           enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           x : out STD_LOGIC_VECTOR(N_bits-1 downto 0);
           y : out STD_LOGIC_VECTOR(N_bits-1 downto 0)
    );
end CORDIC;

architecture Behavioral of CORDIC is
    signal xo : STD_LOGIC_VECTOR(N_bits-1 downto 0):=std_logic_vector(to_unsigned(2**(N_bits-1)-1,N_bits));
    signal yo : STD_LOGIC_VECTOR(N_bits-1 downto 0):=std_logic_vector(to_unsigned(0,N_bits));
    signal angulo : integer;
    constant tolerancia : natural := 1;
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
    angulo <= to_integer(signed(grados));
    process(clk,enable)
        variable angulo_actual : integer := 0;
        variable angulo_meta : integer := 0;
        variable direccion : integer:= 1;
        variable xi : integer := to_integer(signed(xo));
        variable yi : integer := to_integer(signed(yo));
        variable i : natural := 0;
        variable status : bit := '0'; -- 1 busy, 0 over
    begin
        if (rising_edge(enable)) then
            status := '1';
            angulo_meta := angulo;
            i:=0;
        end if;
        if rising_edge(clk) then
            if abs(angulo_meta-angulo_actual)>tolerancia and status='1' and i<N_steps then
                if angulo_meta>angulo_actual then
                    direccion:=1;
                else
                    direccion:=-1;
                end if;
                xi:=xi-direccion*yi/(2**i);
                yi:=yi+direccion*xi/(2**i);
                angulo_actual := angulo_actual + direccion * to_integer(tabla_pasos(i)(31 downto 32-N_bits));
                i := i+1;
            else
                if status='1' then
                    xi:=xi*to_integer(tabla_K(i-1)(31 downto 32-N_bits))/2**(N_bits-1);
                    yi:=yi*to_integer(tabla_K(i-1)(31 downto 32-N_bits))/2**(N_bits-1);
                    i:=i+1;
                    angulo_actual:=0;
                    xo <= std_logic_vector(to_signed(xi, N_bits));
                    yo <= std_logic_vector(to_signed(yi, N_bits));
                end if;
                status:='0';
            end if;
            
        end if;
    end process;
    x <= xo;
    y <= yo;
end Behavioral;
