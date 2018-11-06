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
		sal: out std_logic_vector(N_tot-1 downto 0)
	);
end;

architecture sum_pf_arq of sum_pf is
	-- Declaracion variables
	constant bias: natural := 2 ** (N_exp-1) - 1;
	constant N_man: natural := N_tot-N_exp-1;
begin
	process(clk,a,b)
		-- Recupero el valor cada parte del float
		variable exp_a:	signed(N_exp-1 downto 0);
		variable exp_b:	signed(N_exp-1 downto 0);
		variable exp_s:	signed(N_exp-1 downto 0);
		variable man_a:	signed(N_man downto 0);
		variable man_b:	signed(N_man downto 0);
		variable man_s:	signed((N_man+1)*2 downto 0);
		variable s_s:	std_logic;
		variable g:	std_logic;
		variable r:	std_logic;
		variable s:	std_logic;
		variable swap:	std_logic;
		variable signo:	std_logic;
		variable carry:	std_logic;
		variable i:	integer :=			0;
		variable aux: integer;
	begin
		exp_a := signed(a(N_tot-2 downto N_man))-bias;
		exp_b := signed(b(N_tot-2 downto N_man))-bias;
		exp_s := (N_exp-1 downto 0 =>'0');
		man_a := "1" & signed(a(N_man-1 downto 0));
		man_b := "1" & signed(b(N_man-1 downto 0));
		man_s := ((N_man+1)*2 downto 0 =>'0');
		-- paso 1
		if exp_a < exp_b then
			exp_s := exp_b;
			exp_b := exp_a;
			exp_a := exp_s;
			man_s := man_b & (N_man + 1 downto 0 => '0');
			man_b := man_a;
			man_a := man_s((N_man+1)*2 downto N_man + 2);
			swap := '1';
		else
			exp_s := exp_a;
			swap := '0';
		end if;
		-- paso 2
		signo := a(N_tot-1) xor b(N_tot-1);
		if signo='1' then
			man_b := not(man_b)+1;
		end if;
		-- paso 3
		if exp_a=exp_b then
			man_s := '0' & man_b & (N_man downto 0 => '0');
		else
			man_s := '0' & (to_integer(exp_a-exp_b) downto 1 => signo) & man_b & (N_man -to_integer(exp_a-exp_b) downto 0 => '0');
		end if;
		g := man_s(N_man);
		r := man_s(N_man-1);
		s := man_s(N_man-2);
		-- paso 4
		man_s := man_s + ('0' & man_a & (N_man downto 0 => '0'));
		carry := std_logic(man_s((N_man+1)*2));
		if (signo and not carry)='1' then
			man_s := not(man_s)+1;
		end if;
		-- paso 5
		if (not(signo) and carry) = '1' then
			man_s := shift_right(man_s,1);
			exp_s := exp_s + 1;
			i := -1;
		else
			i := 0;
			while man_s((N_man+1)*2-1-i) /= '1' and i/=N_man*2 loop
				exp_s := exp_s-1;
				i := i + 1;
			end loop;
			man_s := shift_left(man_s,i);
			if i=N_man*2 then
				exp_s:=to_signed(-bias,N_exp);
			end if;
		end if;
		aux:=to_integer(exp_s+bias);
		if aux > 2 ** N_exp -3 then
			exp_s:=to_signed(2 ** N_exp -2 - bias,N_exp);
			man_s:=(2*(N_man+1) downto 0 => '1');
		end if;
		-- paso 6
		if i=-1 then
			g := man_s(N_man);
			s := g or r or s;
		else 
			if i=0 then
				r := g;
				s := r or s;
			else 
				if i>1 then
					r:='0';
					s:='0';
				end if;
			end if;
		end if;
		-- paso 7
		if (r or s) = '1' then
			man_s := man_s+1;
		end if;
		-- falta lo del mas cercano
		-- paso 8
		s_s := a(N_tot-1);
		if swap='1' then
			s_s := b(N_tot-1);
		end if;
		if (not swap and (signo and not carry))='1' then
			s_s := b(N_tot-1);
		end if;
		-- grabo el valor de la suma
		sal(N_tot-1) <= s_s;
		exp_s := exp_s + bias;
		sal(N_tot-2 downto N_man) <= std_logic_vector(exp_s);
		sal(N_man-1 downto 0) <= std_logic_vector(man_s(2*(N_man+1)-2 downto N_man + 1));
	end process;
end;  
