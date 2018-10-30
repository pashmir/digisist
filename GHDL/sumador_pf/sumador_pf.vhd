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
	shared variable i: natural;
	shared variable signo: std_logic := '0';
	shared variable g: std_logic := '0';
	shared variable r: std_logic := '0';
	shared variable s: std_logic := '0';
	shared variable p: std_logic := '0';
	shared variable s_s: std_logic;
	shared variable exp_a: signed(N_exp-1 downto 0);
	shared variable exp_b: signed(N_exp-1 downto 0);
	shared variable exp_s: signed(N_exp-1 downto 0);
	shared variable man_a: signed(N_man+1 downto 0);
	shared variable man_b: signed(N_man+1 downto 0);
	shared variable man_s: signed((N_man+1)*2 downto 0);
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
		if (bias +1) = to_integer(exp_a) or (bias +1) = to_integer(exp_b) then
		    exp_s := to_signed(bias + 1, N_exp);
		    man_s := to_signed(0,N_man+2);
		    s_s := '0'; 
		else
			if exp_a < exp_b then
				exp_s := exp_b;
				s_s := b(N_tot-1);
				if signo = '1' then
					man_a := -man_a;
					man_s := man_a & (N_man downto 0 => '0');
					man_s := shift_right(man_s, to_integer(exp_b-exp_a));
					g := man_s(N_man);
					r := man_s(N_man-1);
					s := man_s(N_man-2);
					man_s := man_b & (N_man downto 0 => '0') + man_s;
					i := N_man+1;
					while man_s(i) /= '1' and i/=0 loop
						exp_s := exp_s-1;
						i := i - 1;
					end loop;
					if i=N_man+1 then 
						exp_s := exp_s + 1;
						man_s := shift_right(man_s, 1);
						g := man_s(N_man);
						s := g or r or s;
					else
						man_s := -man_s;
						man_s := shift_left(man_s, N_man-i);
						if i=N_man then
							r := g;
							s := r or s;
						else 
							if i<N_man-1 then
								r:='0';
								s:='0';
							end if;
						end if;
					end if;
					if ((r and s) or (r and p)) ='1' then
						man_s := man_s + to_signed(2**(N_man+1),2*(N_man+1));
						if man_s(N_man+1)='1' then
							exp_s := exp_s + 1;
							man_s := shift_right(man_s, 1);
						end if;
					end if;
				else
					man_s := man_a & (N_man downto 0 => '0');
					man_s := shift_right(man_s, to_integer(exp_b-exp_a));
					g := man_s(N_man);
					r := man_s(N_man-1);
					s := man_s(N_man-2);
					man_s := man_b & (N_man downto 0 => '0') + man_a;
					if man_s(N_man+1)='1' then
						exp_s := exp_s + 1;
						man_s := shift_right(man_s, 1);
						g := man_s(N_man);
						s := g or r or s;
					else
						r := g;
						s := r or s;
					end if;
					if ((r and s) or (r and p))='1' then
						man_s := man_s + to_signed(2**(N_man+1),2*(N_man+1));
						if man_s(N_man+1)='1' then
							exp_s := exp_s + 1;
							man_s := shift_right(man_s, 1);
						end if;
					end if;
				end if;
			else
				exp_s := exp_a;
				s_s := a(N_tot-1);
				if signo='1' then
					man_b := -man_b;
					man_s := man_b & (N_man downto 0 => '0');
					man_s := shift_right(man_s, to_integer(exp_a-exp_b));
					g := man_s(N_man);
					r := man_s(N_man-1);
					s := man_s(N_man-2);
					man_s := man_a & (N_man downto 0 => '0') + man_s;
					i := N_man;
					while (man_s(i) /= '1'  and i/=0) loop
						exp_s:= exp_s-1;
						i := i - 1;
					end loop;
					if i=N_man+1 then 
						exp_s := exp_s + 1;
						man_s := shift_right(man_s, 1);
						g := man_s(N_man);
						s := g or r or s;
					else
						man_s := -man_s;
						s_s := b(N_tot-1);
						man_s := shift_left(man_s, N_man-i);
						if i=N_man then
							r := g;
							s := r or s;
						else 
							if i<N_man-1 then
								r:='0';
								s:='0';
							end if;
						end if;
					end if;
					if ((r and s) or (r and p))='1' then
						man_s := man_s + to_signed(2**(N_man+1),2*(N_man+1));
						if man_s(N_man+1)='1' then
							exp_s := exp_s + 1;
							man_s := shift_right(man_s, 1);
						end if;
					end if;
				else
					man_s := man_b & (N_man downto 0 => '0');
					man_s := shift_right(man_s, to_integer(exp_a-exp_b));
					g := man_s(N_man);
					r := man_s(N_man-1);
					s := man_s(N_man-2);
					man_s := man_a & (N_man downto 0 => '0') + man_s;
					if man_s(N_man+1)='1' then
						exp_s := exp_s + 1;
						man_s := shift_right(man_s, 1);
						g := man_s(N_man);
						s := g or r or s;
					else
						r := g;
						s := r or s;
					end if;
					if ((r and s) or (r and p))='1' then
						man_s := man_s + to_signed(2**(N_man+1),2*(N_man+1));
						if man_s(N_man+1)='1' then
							exp_s := exp_s + 1;
							man_s := shift_right(man_s, 1);
						end if;
					end if;
				end if;
			end if;
		end if;
		sal(N_tot-1) <= s_s;
		exp_s := exp_s + bias;
		sal(N_tot-2 downto N_man) <= std_logic_vector(exp_s);
		sal(N_man-1 downto 0) <= std_logic_vector(man_s(2*(N_man+1)-2 downto N_man + 1));
	end process;
end;  
