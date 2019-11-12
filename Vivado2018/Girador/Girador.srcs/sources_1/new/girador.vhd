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
    rxd_pin: in std_logic
    -- Tal vez necesite botones
    
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
            pix_value : in std_logic_vector(0 downto 0)
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
    constant N_bits : natural := 9;
    constant N_steps : natural := 10;
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
    -- UART
    signal rst_clk_rx: std_logic;
    signal rx_data: std_logic_vector(7 downto 0);     -- Data output of uart_rx
    signal rx_data_rdy: std_logic;                  -- Data ready output of uart_rx
    -- PUNTOS
    -- Aca va un array con los puntos que se van a girar para ver una recta
    constant puntos : t_array_punto(0 to N_points-1) := (others=>origen);--tabla con los puntos de la recta inicial
    signal fifo : t_array_punto(0 to N_points-N_steps-1);
    signal fifo_ant : t_array_punto(0 to N_points);
    signal to_turn : t_punto;
    --signal turned : t_punto;
    signal cordic_clk : std_logic;
    signal enable : std_logic;
    signal grados : STD_LOGIC_VECTOR(N_bits-1 downto 0);
    
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
            pix_value => pixel_value
            -- Necesito un IN que sea lo que saca la memoria de video
            -- Necesito un OUT que sea la dire de la video mem
        );
        
    meta_harden_rst_i0: meta_harden -- capaz haya que usar esto para otro boton
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
    begin
        if rising_edge(sys_clk) then
            cordic_clk <= not(cordic_clk);
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
            clk=>cordic_clk,
            x_out=>fifo(0).x,
            y_out=>fifo(0).y,
            x_in=>to_turn.x,
            y_in=>to_turn.y
        );
        
chain: for i in 0 to N_points-N_steps-2 generate
    chain_part: delay
        port map(clk=>cordic_clk,
                 ena=>enable,
                 i_in=>fifo(i),
                 o_out=>fifo(i+1));
end generate;

chain2: for i in 0 to N_points-1 generate
	chain2_link: delay
		port map(clk=>cordic_clk,
		         ena=>enable,
		         i_in=>fifo_ant(i),
		         o_out=>fifo_ant(i+1));
	end generate;
	
process(cordic_clk)
	variable init : bit := '0';
	variable i :natural :=0;
	variable mi_dato : t_punto := origen;
	begin
	if rising_edge(cordic_clk) then
	    if rst='1' then
	       init:='0';
	       i:=0;
	    end if;
		if init='1' then
			to_turn <= fifo(N_points-N_steps-1);
			fifo_ant(0)<=fifo(N_points-N_steps-1);
		else
			mi_dato.x:=std_logic_vector(to_signed(i,N_bits));
			to_turn<=mi_dato;--modificar para cargar la recta inicial
			fifo_ant(0)<=mi_dato;
			i:=i+1;
			if i=N_points then
				init:= '1';
			end if;
		end if;
	end if;
    end process;

-- Process para escribir la memoria de video
process (rx_data_rdy,rst,sys_clk)
    variable conteo : integer := 0;
    variable qchars : integer := 0;
    variable wipe : bit := '0';
    variable dir : integer := 0;
    begin
    if (rst = '1') then
        conteo := 0;
        qchars := 0;
        wipe:='1';
        
    else
        ------------------------------------------
        --A partir de acÃ¡ se modifica la pantalla
        
        if (rising_edge (sys_clk)) then
            
            conteo := conteo+1;
            if wipe='0' then
                
                if conteo mod 2 = 0 then
                    dir := to_integer(unsigned(signed(fifo(0).x)+320) + 800 * unsigned(signed(fifo(0).y)+240));
                    pixel_value_reg(0) <= '1';
                else 
                    dir := to_integer(unsigned(signed(fifo_ant(N_points).x)+320) + 800 * unsigned(signed(fifo_ant(N_points).y)+240));
                    pixel_value_reg(0) <= '0';
                end if;
                
            else 
                pixel_value_reg(0)<='0';
                dir:=conteo;
                if conteo=480000 then
                    wipe:='0';
                    conteo:=0;
                end if;
            end if;    
        end if;
        
        
        
        
        -- AcÃ¡ se termina de modificar la pantalla
        -------------------------------------------
        if (rising_edge (rx_data_rdy) ) then
            qchars := qchars+1;
            
            if (rx_data(0)='0') then
                char_add<="000000";
            else
                char_add<="000001";
            end if;
            
        end if;
        
        if (qchars = 4800) then
            qchars:=0;
        end if; 
        
    end if;
    add_video_mem_load <= std_logic_vector(to_unsigned(dir,add_video_mem_load'length));
    pixel_in <= pixel_value_reg;
end process;

end gir_arq;
