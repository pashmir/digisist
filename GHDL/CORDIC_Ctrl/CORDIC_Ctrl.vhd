library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CORDIC_Ctrl is
end CORDIC_Ctrl;
architecture arq of CORDIC_Ctrl is
	constant TCK: time:= 20 ns; 		-- periodo de reloj
	constant DELAY_time: natural:= 0; 		-- retardo de procesamiento del DUT

	signal clk : std_logic := '0';
	signal c_clk : std_logic := '0';
	signal enable : std_logic := '0';
	signal fr_tick : std_logic := '0';
	signal rst : std_logic := '0';
	signal init_state : std_logic := '0';
	signal b0 : std_logic := '0';
	signal b1 : std_logic := '0';
	signal b2 : std_logic := '0';
	signal grados : std_logic_vector(4 downto 0) := std_logic_vector(to_signed(0,5));

	constant N_Points: natural := 3;
	constant gr_max: signed(4 downto 0) := to_signed(15,5);
	constant gr_min: signed(4 downto 0) := -gr_max;
	
begin
    -- Generacion del clock del sistema
    clk <= not(clk) after TCK/ 2; -- reloj
    b1 <= '1' after TCK * 20;
    b0 <= '1' after TCK * 25;
    fr_tick <= not(fr_tick) after TCK * 43/2;
    rst <= not(rst) after TCK * 75;

    process (clk)
    begin
    --fr_tick <= '0' after TCK * 49/2;
    end process;

    process (clk)
    variable conteo : unsigned(2 downto 0) := "000";
    begin
        if rising_edge(clk) then
            conteo:=conteo+1;
        end if;
        if conteo<4 then
            c_clk<='0';
        else
            c_clk<='1';
        end if;
    end process;

    init: process(clk,fr_tick,b0,b1,b2,rst,c_clk)
	variable init, girar : bit := '0';
	variable i :natural :=0;
	variable j :natural :=0;
	begin
	if rst='1' then
	   init:='0';
	   girar:='1';
	   --i:=0;
           --enable<='1';
       grados<=std_logic_vector(to_signed(0,5));
	else
        if b0='1' and rising_edge(fr_tick) then -- cambio velocidad de giro '+'
            if signed(grados)<signed(gr_max) then
                grados<=std_logic_vector(signed(grados)+1);
            end if;
        end if;
        if b2='1' and rising_edge(fr_tick) then --cambio velocidad de giro '-'
            if signed(grados)>signed(gr_min) then
                grados<=std_logic_vector(signed(grados)-1);
            end if;
        end if;
        
        if i<N_points+1 and rising_edge(c_clk) then
            i:=i+1;
        end if;
        if (rising_edge(fr_tick) and b1='1') then
            girar:='1';
        end if;
	if girar='1' and rising_edge(c_clk) then
	    j:=0;
	    girar:='0';
	end if;
        if j<N_points+1 and rising_edge(c_clk) then
            j:=j+1;
        end if;
        if ((j<N_points) or (i<N_points)) then
            enable<='1';
        else
            enable <='0';
            init:='1';
        end if;
        
        --if rising_edge(sys_clk) then
            if init='1' then
                init_state<='1';
            else --inicializacion, carga los puntos en el sistema
                init_state<='0';
            end if;
	   --end if;
    end if;
    end process;

end arq;