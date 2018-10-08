library IEEE;
use IEEE.std_logic_1164.all;
--- use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity mult_pf is
	generic(
		N_tot: natural := 16;
		N_exp: natural := 4
	);
	port(
		clk: in std_logic;
		a: in std_logic_vector(N_tot-1 downto 0);
		b: in std_logic_vector(N_tot-1 downto 0);
		s: out std_logic_vector(N_tot-1 downto 0)
	);
end;

architecture mult_pf_arq of mult_pf is
    --- declaración variables
    constant bias: natural := 2 ** (N_exp-1) - 1;
    shared variable exp_a: signed(N_exp-1 downto 0);
    shared variable exp_b: signed(N_exp-1 downto 0);
    shared variable exp_s: signed(N_exp-1 downto 0);
    shared variable man_a: unsigned(N_tot-N_exp-1 downto 0);
    shared variable man_b: unsigned(N_tot-N_exp-1 downto 0);
    shared variable man_s: unsigned((N_tot-N_exp)*2-1 downto 0);	
begin

	--- lo que hace el código
	process(clk,a,b)
	begin
	    --- Me fijo si puedo hacer la cuenta, y los flags
	    s(N_tot-1) <= a(N_tot-1) xor b(N_tot-1); --- signo
	    
		--- Recupero el valor cada parte del float
		exp_a := signed(a(N_tot-2 downto N_tot-N_exp-1))-bias;
		exp_b := signed(b(N_tot-2 downto N_tot-N_exp-1))-bias;
		man_a(N_tot-N_exp-2 downto 0) := unsigned(a(N_tot-N_exp-2 downto 0));
		man_b(N_tot-N_exp-2 downto 0) := unsigned(b(N_tot-N_exp-2 downto 0));
		man_a(N_tot-N_exp-1) := '1';
		man_b(N_tot-N_exp-1) := '1';

		--- Hago la cuenta
		exp_s := exp_a + exp_b;
		man_s := man_a * man_b;
		
		--- si la multiplicación me cabio el exponente lo actualizo
        if man_s((N_tot-N_exp)*2-1) = '1' then
            exp_s := exp_s + 1;              
		end if;
		
		--- Armo la señal s
		s(N_tot-2 downto N_tot-N_exp-1) <= std_logic_vector(exp_s + bias);
		s(N_tot-N_exp-2 downto 0) <= std_logic_vector(man_s((N_tot-N_exp)*2-3 downto N_tot-N_exp-1));
		
	end process;
	
end;
