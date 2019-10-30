library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

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
    
  );
end girador;

architecture gir_arq of girador is
    -- COMPONENTES
    component fontrom --se tiene que ir
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

    component vga_ctrl is
        port(
            sys_clk: in std_logic;
            rst: in std_logic;
            sw: in std_logic_vector (2 downto 0);
            hsync , vsync : out std_logic;
            red : out std_logic_vector(3 downto 0);
            green : out std_logic_vector(3 downto 0);
            blue : out std_logic_vector(3 downto 0);
            rx_data: in std_logic_vector(7 downto 0);
            rx_rdy: in std_logic
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
        Generic(	N_bits : natural := 8;  -- m�ximo 32
                    N_steps: natural := 8); -- m�ximo 16
        Port(	clk : in STD_LOGIC;
                enable : in STD_LOGIC;
                degrees : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
                x_in : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
                y_in : in STD_LOGIC_VECTOR (N_bits-1 downto 0);
                x_out : out STD_LOGIC_VECTOR (N_bits-1 downto 0);
                y_out : out STD_LOGIC_VECTOR (N_bits-1 downto 0));
    end component;
    -- VARIABLES
    -- VGA
    signal pixel_value_reg : std_logic_vector (0 downto 0);--este es para setear debería irse
    signal add_video_mem_load : std_logic_vector (18 downto 0);--debería irse
    signal pixel : std_logic_vector (2 downto 0);
    signal pixel_in : std_logic_vector (0 downto 0);--este tambien se tiene que ir
    signal pantalla : std_logic;--no usado
    signal char_add : std_logic_vector(5 downto 0);--esto no se necesita
    signal font_row : std_logic_vector(2 downto 0);--not needed
    signal font_column : std_logic_vector(2 downto 0);--not needed
    signal rom_out : std_logic;--not needed
    signal rst_clk_rx: std_logic;
    -- UART
    signal rx_data: std_logic_vector(7 downto 0);     -- Data output of uart_rx
    signal rx_data_rdy: std_logic;                  -- Data ready output of uart_rx
    -- PUNTOS
    -- Aca va un array con los puntos que se van a girar para ver una recta
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
            rx_data => rx_data,
            rx_rdy => rx_data_rdy
        );
        
    meta_harden_rst_i0: meta_harden
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
    memoria_video: Video_mem --esto se tiene que ir
        port map (
            addra_0 => add_video_mem_load,
            addrb_0 => add_video_mem,
            clka_0 => sys_clk,
            clkb_0 => pixel_clock,
            dina_0 => pixel_in,
            doutb_0 => pixel_value,
            ena_0 => '1',
            enb_0 => '1',
            wea_0 => "1"
        );	
    chars: fontrom--se tiene que ir
        port map(
            char_address => char_add,
            font_row => font_row,
            font_col => font_column,
            rom_out => rom_out
        );
        
    CORDIC: CORDIC_top
        generic map(
            N_bits => N_bits,
            N_steps => 10
        )
        port map(
            degrees=>grados,
            enable=>enable,
            clk=>sys_clk,
            x_out=>x,
            y_out=>y,
            x_in=>xi,
            y_in=>yi
        );
-- process para girar los puntos

-- Process para escribir la memoria de video
process (rx_data_rdy,rst,sys_clk) -- este process se tiene que ir
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
        --A partir de acá se modifica la pantalla
        
        if (rising_edge (sys_clk)) then
            
            conteo := conteo+1;
            if wipe='0' then
                
                font_row<=std_logic_vector(to_unsigned(conteo/8,3));
                font_column<=std_logic_vector(to_unsigned(conteo mod 8,3)); 
                pixel_value_reg(0) <= rom_out;
                dir:=(conteo/8) * 800 + conteo mod 8 + 6400 * (qchars/80) + 8 * (qchars mod 80);
                if (conteo=64) then
                    conteo:=0;
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
        
        
        
        
        -- Acá se termina de modificar la pantalla
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
