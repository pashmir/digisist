----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2018 22:05:46
-- Design Name: 
-- Module Name: ContadorPlaca - Behavioral
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

entity ContadorPlaca is
    Port ( clk_in : in STD_LOGIC;
           rst_in : in STD_LOGIC;
           Led : out STD_LOGIC_VECTOR (3 downto 0));
end ContadorPlaca;

architecture Behavioral of ContadorPlaca is
component prescaler 
     Port ( clk_125 : in STD_LOGIC;
          rst : in STD_LOGIC;
          clk_1 : out STD_LOGIC);
end component;
component contador4bits 
     Port ( clk : in STD_LOGIC;
          rst : in STD_LOGIC;
          Led : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal reset_sys : std_logic;
signal clk_sys : std_logic;
signal clk_contador : std_logic;
signal led_sys : std_logic_vector (3 downto 0);
begin
sys_prescaler: prescaler port map (clk_125 => clk_sys, rst => reset_sys, clk_1 => clk_contador); 
sys_counter: contador4bits port map (clk => clk_contador, rst => reset_sys, Led => led_sys);

reset_sys <= rst_in;
clk_sys <= clk_in;
Led <= led_sys;

end Behavioral;
