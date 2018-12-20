---------------------------------------------------------
--
-- Controlador de VGA
-- Version actualizada a 07/06/2016
--
-- Modulos:
--    vga_sync
--    gen_pixels
--
---------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_ctrl is
	port(
	    sys_clk: in std_logic;
		rst: in std_logic;
		sw: in std_logic_vector (2 downto 0);
		hsync , vsync : out std_logic;
		red : out std_logic_vector(3 downto 0);
		green : out std_logic_vector(3 downto 0);
		blue : out std_logic_vector(3 downto 0)
	);
	
	-- attribute LOC: string;
	-- attribute LOC of clk: signal is "C9";
	-- attribute LOC of rst: signal is "D18";
	-- attribute LOC of sw: signal is "H18 L14 L13";
	-- attribute LOC of hsync: signal is "F15";
	-- attribute LOC of vsync: signal is "F14";
	-- attribute LOC of rgb: signal is "H14 H15 G15";

end vga_ctrl;

architecture vga_ctrl_arch of vga_ctrl is

	signal rgb_reg: std_logic_vector(2 downto 0);
	signal pixel_x, pixel_y: std_logic_vector(9 downto 0);
	signal video_on: std_logic;
	signal clk50: std_logic;
	signal pixel_clock : std_logic;
    signal add_video_mem : std_logic_vector (18 downto 0);
    signal pixel_value : std_logic_vector (0 downto 0);
    signal pixel_value_reg : std_logic_vector (0 downto 0);
    signal add_video_mem_load : std_logic_vector (18 downto 0);
    signal pixel : std_logic_vector (2 downto 0);
    signal pixel_in : std_logic_vector (0 downto 0);
    signal pantalla : std_logic;

component gen_clk_wrapper is
  port (
    rst : in STD_LOGIC;
    sys_clk : in STD_LOGIC;
    clk : out STD_LOGIC;
    locked : out STD_LOGIC
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

begin
    clock_unit: gen_clk_wrapper
        port map (
        clk => clk50,
        locked => open,
        rst => rst,
        sys_clk => sys_clk
        );
	-- instanciacion del controlador VGA
	vga_sync_unit: entity work.vga_sync
		port map(
			clk 	=> clk50,
			rst 	=> rst,
			hsync 	=> hsync,
			vsync 	=> vsync,
			vidon	=> video_on,
			p_tick 	=> pixel_clock,
			pixel_x => pixel_x,
			pixel_y => pixel_y
		);

	pixeles: entity work.gen_pixels
		port map(
			clk		=> clk50,
			reset	=> rst,
			sw		=> pixel,
			pixel_x	=> pixel_x,
			pixel_y	=> pixel_y,
			ena		=> video_on,
			red		=> red,
			green  => green,
			blue   => blue
		);
		
-- contador para generar el address (controlado por pixel_clock y reseteado por pixel_x y pixel_y)
process (pixel_clock,rst, pixel_x,pixel_y)
    variable conteo : integer := 0;
    begin
    if ((rst = '1') or ((pixel_x = "0000000000") and (pixel_y = "0000000000"))) then
        conteo := 0;
        if (sw(0) = '0') then
            pantalla <= '0';
        else
            pantalla <= '1';
        end if;
    else
        if (rising_edge (pixel_clock)) then
            conteo := conteo + 1;
        end if;
        if (conteo = 307200) then
            conteo := 0;
        end if;
    end if;
    add_video_mem <= std_logic_vector(to_unsigned(conteo,add_video_mem'length));
end process;

	
memoria_video: Video_mem_wrapper 
           port map (
           addra_0 => add_video_mem_load,
           addrb_0 => add_video_mem,
           clka_0 => clk50,
           clkb_0 => pixel_clock,
           dina_0 => pixel_in,
           doutb_0 => pixel_value,
           ena_0 => '1',
           enb_0 => '1',
           wea_0 => "1"
           );		

-- Process para escribir la memoria de video
process (clk50,rst,pixel_x,pixel_y)
    variable conteo : integer := 0;
    begin
    if ((rst = '1') or ((pixel_x = "0000000000") and (pixel_y = "0000000000"))) then
        conteo := 0;
    else
        if (rising_edge (clk50)) then
            conteo := conteo + 1;
            if (pantalla = '0') then
                if (to_integer(unsigned(pixel_x)) mod 8 = 0) or (to_integer(unsigned(pixel_y)) mod 8 = 0) then
                    pixel_value_reg <= "1";
                else
                    pixel_value_reg <= "0";
                end if;
            else
                if (to_integer(unsigned(pixel_x)) mod 16 = 0) or (to_integer(unsigned(pixel_y)) mod 16 = 0) then
                    pixel_value_reg <= "1";
                else
                    pixel_value_reg <= "0";
                end if;
            end if;    
        end if;
        if (conteo = 307200) then
            conteo := 0;
        end if;
    end if;
    add_video_mem_load <= std_logic_vector(to_unsigned(conteo,add_video_mem_load'length));
    pixel_in <= pixel_value_reg;
end process;

pixel <= pixel_value(0) & pixel_value(0) & pixel_value(0); 	
	
end vga_ctrl_arch;