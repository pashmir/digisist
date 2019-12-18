library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use work.my_library.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity girador is
  Port ( 
    --VGA
    sys_clk: in std_logic;
    rst: in std_logic;
    hsync , vsync : out std_logic;
    red : out std_logic_vector(3 downto 0);
    green : out std_logic_vector(3 downto 0);
    blue : out std_logic_vector(3 downto 0);
    --UART
    rxd_pin: in std_logic;
    -- Tal vez necesite botones
    sw : in std_logic_vector(2 downto 0);
    --LEDS para debug
    led: out std_logic_vector(3 downto 0)
  );
end girador;

architecture gir_arq of girador is
    -- COMPONENTES
    component fontrom --evaluar si es necesaria
        generic(
            N: integer:= 6;
            M: integer:= 3;
            W: integer:= 8
        );
        port(
            char_address: in std_logic_vector(5 downto 0);
            font_row, font_col: in std_logic_vector(M-1 downto 0);
            rom_out: out std_logic
        );
    end component;

component video_mem_wrapper is
  port (
    addra_0 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    addrb_0 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    clka_0 : in STD_LOGIC;
    clkb_0 : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    doutb_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    ena_0 : in STD_LOGIC;
    enb_0 : in STD_LOGIC;
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end component;

    component vga_ctrl is
        port(
            sys_clk: in std_logic;
            rst: in std_logic;
            sw: in std_logic_vector (2 downto 0);
            hsync , vsync : out std_logic;
            red : out std_logic_vector(3 downto 0);
            green : out std_logic_vector(3 downto 0);
            blue : out std_logic_vector(3 downto 0);
            -- agregar conexionado para interactuar con memoria
            pixel_clock : out std_logic;
            video_read_add : out std_logic_vector(18 downto 0);
            pix_value : in std_logic_vector(0 downto 0);
            frame_tick : out std_logic
        );
    end component;
    
    component uart_rx is
        generic(
            BAUD_RATE: integer := 115200; 	-- Baud rate
            CLOCK_RATE: integer := 125E6
        );
    
        port(
            -- Write side inputs
            clk_rx: in std_logic;       				-- Clock input
            rst_clk_rx: in std_logic;   				-- Active HIGH reset - synchronous to clk_rx
                            
            rxd_i: in std_logic;        				-- RS232 RXD pin - Directly from pad
            rxd_clk_rx: out std_logic;					-- RXD pin after synchronization to clk_rx
        
            rx_data: out std_logic_vector(7 downto 0);	-- 8 bit data output
                                                        --  - valid when rx_data_rdy is asserted
            rx_data_rdy: out std_logic;  				-- Ready signal for rx_data
            frm_err: out std_logic       				-- The STOP bit was not detected	
        );
    end component;
    
    component meta_harden is
        port(
            clk_dst:     in std_logic;    -- Destination clock
            rst_dst:     in std_logic;    -- Reset - synchronous to destination clock
            signal_src: in std_logic;    -- Asynchronous signal to be synchronized
            signal_dst: out std_logic    -- Synchronized signal
        );
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
    
    component delay is
        port ( i_in : in  t_punto;
	           clk : in std_logic;
	           ena : in std_logic;
	           o_out : out t_punto);
    end component;
    -- Constantes
    --constant N_bits : natural := 9;
    constant N_steps : natural := 16;
    constant N_points : natural := 20;
--    -- Tipos personalizados (están en la biblioteca)
--    type t_punto is record 
--        x : STD_LOGIC_VECTOR(N_bits-1 downto 0);
--        y : STD_LOGIC_VECTOR(N_bits-1 downto 0);
--    end record;
--    type t_array_punto is array(0 to N_points) of t_punto;
    -- VARIABLES
    -- VGA
    signal pixel_value_reg : std_logic_vector (0 downto 0);--este es para setear deberÃ­a irse
    signal add_video_mem_load : std_logic_vector (18 downto 0);--deberÃ­a irse
    signal pixel : std_logic_vector (2 downto 0);
    signal pixel_in : std_logic_vector (0 downto 0);--este tambien se tiene que ir
    signal pixel_value : std_logic_vector(0 downto 0);
    signal add_video_mem : std_logic_vector(18 downto 0);
    signal pix_clock : std_logic;
    signal pantalla : std_logic;--no usado
    signal char_add : std_logic_vector(5 downto 0);--esto no se necesita
    signal font_row : std_logic_vector(2 downto 0);--not needed
    signal font_column : std_logic_vector(2 downto 0);--not needed
    signal rom_out : std_logic;--not needed
    signal fr_tick : std_logic;
    -- UART
    signal rst_clk_rx: std_logic;
    signal rx_data: std_logic_vector(7 downto 0);     -- Data output of uart_rx
    signal rx_data_rdy: std_logic;                  -- Data ready output of uart_rx
    -- PUNTOS
    -- Aca va un array con los puntos que se van a girar para ver una recta
    constant puntos : t_array_punto(0 to N_points-1) := (0 => (x => std_logic_vector(to_signed( 10*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         1 => (x => std_logic_vector(to_signed( 20*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         2 => (x => std_logic_vector(to_signed( 30*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         3 => (x => std_logic_vector(to_signed( 40*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         4 => (x => std_logic_vector(to_signed( 50*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         5 => (x => std_logic_vector(to_signed( 60*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         6 => (x => std_logic_vector(to_signed( 70*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         7 => (x => std_logic_vector(to_signed( 80*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         8 => (x => std_logic_vector(to_signed( 90*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         9 => (x => std_logic_vector(to_signed(100*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         10 => (x => std_logic_vector(to_signed(110*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         11 => (x => std_logic_vector(to_signed(120*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         12 => (x => std_logic_vector(to_signed(130*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         13 => (x => std_logic_vector(to_signed(140*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         14 => (x => std_logic_vector(to_signed(150*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         15 => (x => std_logic_vector(to_signed(160*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         16 => (x => std_logic_vector(to_signed(170*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         17 => (x => std_logic_vector(to_signed(180*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         18 => (x => std_logic_vector(to_signed(190*(2**(N_bits-1-8)),N_bits)),y=>zero),
                                                         19 => (x => std_logic_vector(to_signed(0,N_bits)),y=>zero)
                                                         );--tabla con los puntos de la recta inicial
    signal fifo : t_array_punto(0 to N_points-N_steps-1);
    signal fifo_ant : t_array_punto(0 to 2*N_points-1);
    signal to_turn : t_punto;
    --signal turned : t_punto;
    signal cordic_clk : std_logic;
    signal enable : std_logic:='1';
    signal grados : STD_LOGIC_VECTOR(N_bits-1 downto 0):=zero;
    signal b : std_logic_vector(2 downto 0);
    
begin
    
    VGA: vga_ctrl
        port map (
            sys_clk => sys_clk,
            rst => rst,
            sw => "000",
            hsync => hsync,
            vsync => vsync,
            red => red,
            green => green,
            blue => blue,
            pixel_clock=>pix_clock,
            video_read_add=>add_video_mem,
            pix_value => pixel_value,
            frame_tick => fr_tick
            -- Necesito un IN que sea lo que saca la memoria de video
            -- Necesito un OUT que sea la dire de la video mem
        );
        
    meta_harden_rst_i0: meta_harden -- capaz haya que usar esto para otro boton
        port map(
            clk_dst     => sys_clk,
            rst_dst     => rst,            -- No reset on the hardener for reset!
            signal_src     => sw(0),
            signal_dst     => b(0)
        );
    meta_harden_rst_sw0: meta_harden -- capaz haya que usar esto para otro boton
        port map(
            clk_dst     => sys_clk,
            rst_dst     => rst,            -- No reset on the hardener for reset!
            signal_src     => sw(1),
            signal_dst     => b(1)
        );
    meta_harden_rst_sw1: meta_harden -- capaz haya que usar esto para otro boton
        port map(
            clk_dst     => sys_clk,
            rst_dst     => rst,            -- No reset on the hardener for reset!
            signal_src     => sw(2),
            signal_dst     => b(2)
        );
    meta_harden_rst_sw2: meta_harden -- capaz haya que usar esto para otro boton
        port map(
            clk_dst     => sys_clk,
            rst_dst     => '0',            -- No reset on the hardener for reset!
            signal_src     => rst,
            signal_dst     => rst_clk_rx
        );
        
    UART: uart_rx 
        port map(
            clk_rx         => sys_clk,
            rst_clk_rx     => rst_clk_rx,
    
            rxd_i          => rxd_pin,
            rxd_clk_rx     => open,
    
            rx_data_rdy    => rx_data_rdy,
            rx_data        => rx_data,
            frm_err        => open
        );
    memoria_video: video_mem_wrapper
        port map (
            addra_0 => add_video_mem_load,
            addrb_0 => add_video_mem,
            clka_0 => sys_clk,
            clkb_0 => pix_clock,
            dina_0 => pixel_in,
            doutb_0 => pixel_value,
            ena_0 => '1', --Horrible esto 6.6
            enb_0 => '1',
            wea_0 => "1"
        );	
--    chars: fontrom --evaluar si es necesaria
--        port map(
--            char_address => char_add,
--            font_row => font_row,
--            font_col => font_column,
--            rom_out => rom_out
--        );
    
        
-- Sección del código dedicada a girar puntos
-- esto tiene que ir a 2 clock de velocidad para poder escribir y borrar los puntos
    process (sys_clk)
    variable conteo : unsigned(2 downto 0);
    begin
        if rising_edge(sys_clk) then
            conteo:=conteo+1;
        end if;
        if conteo<4 then
            cordic_clk<='0';
        else
            cordic_clk<='1';
        end if;
    end process;
    
    CORDIC: CORDIC_top
        generic map(
            N_bits => N_bits,
            N_steps => N_steps
        )
        port map(
            degrees=>grados,
            enable=>enable,
            clk=>CORDIC_clk,
            x_out=>fifo(0).x,
            y_out=>fifo(0).y,
            x_in=>to_turn.x,
            y_in=>to_turn.y
        );
        
chain: for i in 0 to N_points-N_steps-2 generate
    chain_part: delay
        port map(clk=>CORDIC_clk,
                 ena=>enable,
                 i_in=>fifo(i),
                 o_out=>fifo(i+1));
end generate;

chain2: for i in 0 to 2*N_points-2 generate
	chain2_link: delay
		port map(clk=>CORDIC_clk,
		         ena=>enable,
		         i_in=>fifo_ant(i),
		         o_out=>fifo_ant(i+1));
	end generate;
-- proceso de control de girado	
init: process(sys_clk,fr_tick,b,rst_clk_rx,cordic_clk)
	variable init, girar : bit := '0';
	variable i :natural :=0;
	variable j :natural :=0;
	begin
	if rst_clk_rx='1' then
	   init:='0';
	   girar:='1';
	   --i:=0;
       enable<='1';
       grados<=zero;
	else
        if rising_edge(fr_tick) then -- cambio velocidad de giro '+'
            if b(0)='1' then
            --if signed(grados)<signed(gr_max) then
                grados<=std_logic_vector(signed(grados)+100000);
            --end if;
            led(0)<='1';
            else
                led(0)<='0';
            end if;
        end if;
        if rising_edge(fr_tick) then --cambio velocidad de giro '-'
            if b(2)='1' then
            --if signed(grados)>signed(gr_min) then
                grados<=std_logic_vector(signed(grados)-100000);
            --end if;
                led(2)<='1';
            else
                led(2)<='0';
            end if;
        end if;
        
        if rising_edge(cordic_clk) then -- tiene que estar
            i:=i+1;
        end if;
        if rising_edge(fr_tick) then 
            if sw(1)='1' then
                girar:='1';
                led(1)<='1';
            else
                led(1)<='0';
            end if;
        end if;
        if girar='1' and rising_edge(cordic_clk) then
            --j:=0;
            girar:='0';
            enable<='1';
        end if;
        if i=N_Points then
            --enable<='0';
            i:=0;
            --init:='1';
        end if;
        led(1)<=b(1);
--        if j<N_points+1 and rising_edge(cordic_clk) then
--            j:=j+1;
--        end if;
--        if ((j<N_points) or (i<N_points)) then
--            enable<='1';
--        else
--            enable <='0';
--            init:='1';
--            led(0)<='1';
--        end if;
            to_turn<=puntos(i);
            fifo_ant(0)<=fifo(N_points-N_steps-1);
        --if rising_edge(sys_clk) then
            --if init='1' then
                --fifo_ant(0)<=fifo(N_points-N_steps-1);
                --to_turn <= fifo(N_points-N_steps-1);
            --else --inicializacion, 
                --to_turn<=puntos(i);
                --fifo_ant(0)<=puntos(i);
                --led(0)<='0';
                --i:=i+1;
            --end if;
	   --end if;
    end if;
    end process;

-- Process para escribir la memoria de video
process (rst,sys_clk,fr_tick)
    variable conteo : integer := 0;
    variable wipe : bit := '0';
    variable dir : integer := 0;
    begin
    if (rst = '1' or rising_edge(fr_tick)) then -- si reset o termina un frame
        conteo := 0;
        wipe:='1';
    else
        if (rising_edge (sys_clk)) then
            conteo := conteo+1;
            if wipe='0' then --ploteo puntos
                dir := 320 + to_integer(signed(fifo_ant(conteo).x(N_bits-1 downto N_bits-9))) + 800 * (to_integer(signed(fifo_ant(conteo).y(N_bits-1 downto N_bits-9)))+240);
                pixel_value_reg(0) <= '1';
                if conteo=N_points then
                    conteo:=0;
                end if;
            else --limpio pantalla
                pixel_value_reg(0)<='0';
                dir:=conteo;
                if conteo=480000 then
                    wipe:='0';
                    conteo:=0;
                end if;
            end if;    
        end if;
    end if;
    add_video_mem_load <= std_logic_vector(to_unsigned(dir,add_video_mem_load'length));
    pixel_in <= pixel_value_reg;
end process;

end gir_arq;
