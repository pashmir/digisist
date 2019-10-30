library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CORDIC_tb is
end CORDIC_tb;

architecture Behavioral of CORDIC_tb is
    constant TCK: time:= 20 ns; 		-- periodo de reloj
    constant DELAY: natural:= 0; 		-- retardo de procesamiento del DUT
    constant N_bits: natural:= 10;
    signal clk: std_logic:= '0';
    signal grados : STD_LOGIC_VECTOR(N_bits-1 downto 0):=(others=>'0');
    signal enable : std_logic :='0';
    signal x : STD_LOGIC_VECTOR(N_bits-1 downto 0):=(others=>'0');
    signal y : STD_LOGIC_VECTOR(N_bits-1 downto 0):=(N_bits-1=>'0',others=>'1');
    
    component CORDIC_top is
        generic(
            N_bits : natural := 8;
            N_steps : natural := 8
        );
        port(
            degrees : in STD_LOGIC_VECTOR(N_bits-1 downto 0);
            enable : in STD_LOGIC;
            clk : in STD_LOGIC;
            x : out STD_LOGIC_VECTOR(N_bits-1 downto 0);
            y : out STD_LOGIC_VECTOR(N_bits-1 downto 0)
        );
    end component;
begin
    -- Generacion del clock del sistema
    clk <= not(clk) after TCK/ 2; -- reloj
    DUT: CORDIC_top
        generic map(
            N_bits => N_bits,
            N_steps => 10
        )
        port map(
            degrees=>grados,
            enable=>enable,
            clk=>clk,
            x=>x,
            y=>y
        );
        grados <= (N_bits-1-1=>'1',others=>'0'); --45�
        enable<='1' after TCK*10;
end Behavioral;
