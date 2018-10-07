library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.nueric_std.all;

entity mult_pf is
	generic(
		N_tot: natural := 16;
		N_exp: natural := 4
	);
	port(
		clk: in std_logic;
		a: in std_logic_vector(N_tot-1 downto 0);
		b: in std_logic_vector(N_tot-1 downto 0);
		s: out std_logic_vector(N-1 downto 0)
	);
end

architecture mult_pf_arq of mult_pf is
	--- declaración variables
	variable exp_a: signed;
	variable exp_b: signed;
	variable exp_s: signed;
	variable man_a: unsigned;
	variable man_b: unsigned;
	variable man_s: unsigned;	
begin
	--- lo que hace el código
	process(clk)
	begin
		--- Recupero el valor cada parte del float
		exp_a := signed(a(N_tot downto N_tot-N_exp));
		exp_b := signed(b(N_tot downto N_tot-N_exp));
		man_a := unsigned(a(N_exp downto 0));
		man_b := unsigned(b(N_exp downto 0));

		--- Hago la cuenta
		exp_s := exp_a + exp_b;
		man_s := man_a * man_b;
		
		--- Armo la señal s
		s(N_tot downto N_tot-N_exp) <= std_logic_vector(exp_s);
		s(N_exp downto 0) <= std_logic_vector(man_s);
	end process;
	
end;
