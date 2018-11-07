library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--use IEEE.std_logic_arith.all;

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
    constant N_man: natural := N_tot-N_exp-1;
begin
	--- lo que hace el código
	process(clk,a,b)
        variable signo: std_logic := '0';
        variable exp_a: integer;
        variable exp_b: integer;
        variable exp_s: integer;
        variable man_a: natural;
        variable man_b: natural;
        variable man_s: natural;
        variable aux: unsigned(2*N_man+1 downto 0);
	begin
		--- Recupero el valor cada parte del float
		exp_a := to_integer(unsigned(a(N_tot-2 downto N_man)))-bias;
		exp_b := to_integer(unsigned(b(N_tot-2 downto N_man)))-bias;
		man_a := to_integer(unsigned(a(N_man-1 downto 0)));
		man_b := to_integer(unsigned(b(N_man-1 downto 0)));
		man_a := man_a + 2 ** N_man;
		man_b := man_b + 2 ** N_man;

		--- Hago la cuenta
		exp_s := exp_a + exp_b;
		aux := to_unsigned(man_a,N_man+1) * to_unsigned(man_b,N_man+1);
		aux := aux / 2 ** (N_man);
		man_s := to_integer(aux);
		signo := a(N_tot-1) xor b(N_tot-1);
		
		--- si la multiplicación me cambio el exponente lo actualizo
		if man_s >= 2 ** (N_man+1) then
			exp_s := exp_s + 1;
			man_s := man_s - 2 ** (N_man+1);
			man_s := man_s / 2;
		else 
			man_s := man_s - 2 ** (N_man);
		end if;

		--- +- infinito
		if exp_s >= 2 ** (N_exp-1) then
			exp_s := 2 ** (N_exp-1)-1;
			man_s := 2 ** (N_man)-1;
		end if;

		--- numeros desnormalizados
		--if exp_s < -(2 ** (N_exp-1)) then			
		--	man_s := man_s * 2 ** (N_exp-1 - exp_s);
		--	exp_s := - bias;
		--end if;

		--- cero
		if exp_s <= -(2 ** (N_exp-1))+1 then
			exp_s := - bias;
			man_s := 0;
            signo := '0';
		end if;

		--- Armo la señal s
		exp_s := exp_s + bias;
		s(N_tot-1) <= signo; --- signo
		s(N_tot-2 downto N_man) <= std_logic_vector(to_unsigned(exp_s, N_exp));
		s(N_man-1 downto 0) <= std_logic_vector(to_unsigned(man_s, N_man));
		
	end process;
	
end;
