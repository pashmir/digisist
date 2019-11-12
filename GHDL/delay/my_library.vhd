library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package my_library is
    constant N_bits :natural:=9;
    type t_punto is record 
        x : STD_LOGIC_VECTOR(N_bits-1 downto 0);
        y : STD_LOGIC_VECTOR(N_bits-1 downto 0);
    end record;
    type t_array_punto is array(integer range <>) of t_punto;
end my_library;