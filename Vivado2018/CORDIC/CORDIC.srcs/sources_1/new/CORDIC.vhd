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
    type tabla is array(0 to 15) of unsigned(N_bits-1 downto 0);
    constant tabla_K : tabla := (      to_unsigned(1518500249,N_bits), to_unsigned(1358187913,N_bits), to_unsigned(1317635817,N_bits), to_unsigned(1307460871,N_bits), to_unsigned(1304914694,N_bits),
       to_unsigned(1304277994,N_bits), to_unsigned(1304118810,N_bits), to_unsigned(1304079013,N_bits), to_unsigned(1304069064,N_bits), to_unsigned(1304066577,N_bits),
       to_unsigned(1304065955,N_bits), to_unsigned(1304065799,N_bits), to_unsigned(1304065761,N_bits), to_unsigned(1304065751,N_bits), to_unsigned(1304065748,N_bits),
       to_unsigned(1304065748,N_bits));
    constant tabla_pasos : tabla := (to_unsigned(536870912,N_bits), to_unsigned(316933405,N_bits), to_unsigned(167458907,N_bits),  to_unsigned(85004756,N_bits),  to_unsigned(42667331,N_bits),  to_unsigned(21354465,N_bits),
       to_unsigned(10679838,N_bits), to_unsigned(5340245,N_bits),   to_unsigned(2670163,N_bits),   to_unsigned(1335086,N_bits),    to_unsigned(667544,N_bits),    to_unsigned(333772,N_bits),
       to_unsigned(166886,N_bits),   to_unsigned(83443,N_bits),     to_unsigned(41721,N_bits),     to_unsigned(20860,N_bits));
begin
    angulo <= to_integer(signed(grados));
    process(clk,enable)
        variable angulo_inicial : integer := 0;
        variable angulo_actual : integer := 0;
        variable angulo_meta : integer := 0;
        variable direccion : integer:= 1;
        variable xi : integer := 2**(N_bits-1)-1;
        variable yi : integer := 0;
        variable i : natural := 0;
        variable status : bit := '0'; -- 1 busy, 0 over
    begin
        if (rising_edge(enable)) then
            status := '1';
            angulo_meta := angulo_inicial+angulo;
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
                angulo_actual := angulo_actual + direccion * to_integer(tabla_pasos(15-i));
                i := i+1;
            else
                if status='1' then
                    xi:=xi*to_integer(tabla_K(16-i));
                    yi:=yi*to_integer(tabla_K(16-i));
                    i:=i+1;
                    angulo_inicial:=angulo_actual;
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
