library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.my_library.all;
entity delay_tb is
end delay_tb;
architecture delay_tb_arq of delay_tb is
    constant TCK: time:= 20 ns; 		-- periodo de reloj
    constant DELAY_time: natural:= 0; 		-- retardo de procesamiento del DUT
    constant N_bits: natural:= 10;
    signal clk: std_logic:= '0';
    component delay is
    port (i_in : in  t_punto;
	  clk : in std_logic;
	  o_out : out t_punto);
    end component;
    signal a : t_punto := (x=> (others => '1'),y => (others => '1'));
    signal b : t_punto := (x=> (others => '0'),y => (others => '0'));
    signal c : t_punto := (x=> (others => '0'),y => (others => '0'));
    signal d : t_punto := (x=> (others => '0'),y => (others => '0'));
    signal e : t_punto := (x=> (others => '0'),y => (others => '0'));
begin
    -- Generacion del clock del sistema
    clk <= not(clk) after TCK/ 2; -- reloj
    chain1: delay
	port map(i_in=>a, o_out=>b, clk => clk);
    chain2: delay
	port map(i_in=>b, o_out=>c, clk => clk);
    chain3: delay
	port map(i_in=>c, o_out=>d, clk => clk);
    chain4: delay
	port map(i_in=>d, o_out=>e, clk => clk);
    --chain5: delay
	--port map(i_in=>e, o_out=>a, clk => clk);
    
end delay_tb_arq;