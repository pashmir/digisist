library IEEE;
use IEEE.std_logic_1164.all;

entity sumador_1b is
	port(
		A: in std_logic;
		B: in std_logic;
		Ci: in std_logic;
		S: out std_logic;
		Co: out std_logic
	);
end;

architecture sumador_1b_arq of sumador_1b is
begin
	S <= A xor B xor Ci;
	Co <= (A and B) or (A and Ci) or (B and Ci);
end;
