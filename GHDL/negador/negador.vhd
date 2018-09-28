library IEEE;
use IEEE.std_logic_1164.all;

entity negador1 is
	port(
		a: in std_logic;
		b: out std_logic
	);
end;

architecture negador_arq of negador1 is
begin
	b <= not a;
end;

