library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.my_library.all;
entity delay_tb is
end delay_tb;
architecture delay_tb_arq of delay_tb is
    constant TCK: time:= 20 ns; 		-- periodo de reloj
    constant DELAY_time: natural:= 0; 		-- retardo de procesamiento del DUT

    constant N_bits: natural:= 9;
    constant N_steps: natural:= 10;
    constant N_points:natural:= 12;		-- debe ser mayor a N_steps

    signal clk: std_logic:= '0';

    component delay is
    port (i_in : in  t_punto;
	  clk : in std_logic;
	  ena : in std_logic;
	  o_out : out t_punto);
    end component;
    component CORDIC_top is
    Generic(	N_bits : natural := 8;  -- máximo 32
                N_steps: natural := 8); -- máximo 16
    Port(	clk : in STD_LOGIC;
           	enable : in STD_LOGIC;
		degrees : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
		x_in : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
		y_in : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
           	x_out : out STD_LOGIC_VECTOR (N_bits-1 downto 0);
           	y_out : out STD_LOGIC_VECTOR (N_bits-1 downto 0));
    end component;

    constant zero : std_logic_vector(N_bits-1 downto 0) :=(others =>'0');
    constant origen : t_punto := (x=>zero, y=>zero);

    signal fifo : t_array_punto(0 to N_points-N_steps-1);
    signal fifo_ant : t_array_punto(0 to N_points);
    signal aux : t_punto := (x=> (others => '0'),y => (others => '0'));

    constant dato : t_array_punto(0 to N_points-1) := ((x=> (N_bits-2=>'1', others => '0'),y => zero), others => origen);

begin
    -- Generacion del clock del sistema
    clk <= not(clk) after TCK/ 2; -- reloj
    first_link: cordic_top
	generic map(N_bits => N_bits, N_steps => N_steps)
	port map(clk=>clk,enable=>'1',degrees=>(N_bits-2=>'1',others=>'0'),x_out=>fifo(0).x,y_out=>fifo(0).y,x_in=>aux.x,y_in=>aux.y);
    chain: for i in 0 to N_points-N_steps-2 generate
	chain_link: delay
		port map(clk=>clk,ena=>'1',i_in=>fifo(i),o_out=>fifo(i+1));
	end generate;
    chain2: for i in 0 to N_points-1 generate
	chain2_link: delay
		port map(clk=>clk,ena=>'1',i_in=>fifo_ant(i),o_out=>fifo_ant(i+1));
	end generate;

    process(clk)
	variable init : bit := '0';
	variable i :natural :=0;
	variable mi_dato : t_punto := origen;
	begin
	if rising_edge(clk) then
		if init='1' then
			aux <= fifo(N_points-N_steps-1);
			fifo_ant(0) <= fifo(N_points-N_steps-1);
		else
			mi_dato.x:=std_logic_vector(to_signed(i,N_bits));
			aux<=mi_dato;
			fifo_ant(0)<=mi_dato;
			i:=i+1;
			if i=N_points then
				init:= '1';
			end if;
		end if;
	end if;
    end process;
end delay_tb_arq;