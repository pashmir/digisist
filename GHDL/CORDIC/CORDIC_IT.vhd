library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CORDIC_IT is
    Generic (   N_bits : natural := 8;
		IT : natural := 0;
		angle_step : signed(31 downto 0) := "00100000000000000000000000000000"; 
                );
    Port ( clk : in STD_LOGIC;
	   --grados : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
           --sentido : in STD_LOGIC;
	   ai : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
	   xi : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
	   yi : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
	   ao : out STD_LOGIC_VECTOR (N_bits-1 downto 0);
           xo : out STD_LOGIC_VECTOR (N_bits-1 downto 0);
           yo : out STD_LOGIC_VECTOR (N_bits-1 downto 0);
           );
end CORDIC_IT;
architecture Behavioral of CORDIC is
   begin
    process(clk)
    begin
	if rising_edge(clk) then
		if ai > 0 then
                    ao <= ai - angle_step(31 downto 32-N_bits-1);
                    xo <= xi - shift_right(yi,IT);
                    yo <= yi + shift_right(xi,IT);
                else
		    if ai <= 0 then
	                ao <= ai + angle_step(31 downto 32-N_bits-1);
                	xo <= xi + shift_right(yi,IT);
                        yo <= yi - shift_right(xi,IT);
                end if;
	    end if;
    end process;
end Behavioral;