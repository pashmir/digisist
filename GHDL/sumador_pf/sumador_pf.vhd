library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sum_pf is 
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

architecture sum_pf_arq of sum_pf is
	-- Declaracion variables
	constant bias: natural := 2 ** (N_exp-1) - 1;
	constant N_man: natural := N_tot-N_exp-1;
	shared variable i: natural;
	shared variable signo: std_logic := '0';
	shared variable s_s: std_logic;
	shared variable exp_a: signed(N_exp-1 downto 0);
	shared variable exp_b: signed(N_exp-1 downto 0);
	shared variable exp_s: signed(N_exp-1 downto 0);
	shared variable man_a: signed(N_man+1 downto 0);
	shared variable man_b: signed(N_man+1 downto 0);
	shared variable man_s: signed(N_man+1 downto 0);
begin
	process(clk,a,b)
	begin
		-- Recupero el valor cada parte del float
		exp_a := signed(a(N_tot-2 downto N_man))-bias;
		exp_b := signed(b(N_tot-2 downto N_man))-bias;
		man_a(N_man-1 downto 0) := signed(a(N_man-1 downto 0));
		man_b(N_man-1 downto 0) := signed(b(N_man-1 downto 0));
		man_a(N_man+1 downto N_man) := "01";
		man_b(N_man+1 downto N_man) := "01";
		signo := a(N_tot-1) xor b(N_tot-1); -- el signo de la operacion
		
		if exp_a < exp_b then
			exp_s := exp_b;
			s_s := b(N_tot-1);
			if signo = '1' then
				man_a := -man_a;
				man_a := shift_right(man_a, to_integer(exp_b-exp_a));
				man_s := man_b + man_a;
				i := N_man;
				while man_s(i) /= '1' loop
					exp_s := exp_s-1;
				end loop;
				man_s := shift_left(man_s, N_man-i);
			else
				man_a := shift_right(man_a, to_integer(exp_b-exp_a));
				man_s := man_b + man_a;
				if man_s(N_man+1)='1' then
					exp_s := exp_s + 1;
					man_s := shift_right(man_s, 1);
				end if;
			end if;
		else
			exp_s := exp_a;
			s_s := a(N_tot-1);
			if signo='1' then
				man_b := -man_b;
				man_b := shift_right(man_b, to_integer(exp_a-exp_b));
				man_s := man_a + man_b;
				i := N_man;
				while man_s(i) /= '1' loop
					exp_s:= exp_s-1;
					i := i + 1;
				end loop;
				man_s := shift_left(man_s, N_man-i);
			else
				man_b := shift_right(man_b, to_integer(exp_a-exp_b));
				man_s := man_a + man_b;
				if man_s(N_man+1)='1' then
					exp_s := exp_s + 1;
					man_s := shift_right(man_s, 1);
				end if;
			end if;
		end if;
		s(N_tot-1) <= s_s;
		exp_s := exp_s + bias;
		s(N_tot-2 downto N_man) <= std_logic_vector(exp_s);
		s(N_man-1 downto 0) <= std_logic_vector(man_s(N_man-1 downto 0));
	end process;
end;  
