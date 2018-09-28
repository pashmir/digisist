library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.nueric_std.all;

entity mult_pf is
	generic(
		N_tot: natural := 16;
		N_exp: natural := 4
	);
	port(
		a: in std_logic_vector(N_tot-1 downto 0);
		b: in std_logic_vector(N_tot-1 downto 0);
		s: out std_logic_vector(N-1 downto 0)
	);
end

architecture mult_pf_arq of mult_pf is
	--- declaración variables
	variable exp_a: integer;
	variable exp_b: integer;
	variable exp_s: integer;
	variable man_a: unsigned;
	variable man_b: unsigned;
	variable man_s: unsigned;	
begin
	--- lo que hace el código
	
	--- Recupero el valor cada parte del float
	exp_a <= 
	--- Hago la cuenta
	exp_s <= exp_a + exp_b;
	man_s <= man_a * man_b;
	
end;
