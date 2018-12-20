----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.12.2018 21:19:44
-- Design Name: 
-- Module Name: Interfaz_UART-VGA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity interfaz_UART_VGA is
port(
        --VGA
	    sys_clk: in std_logic;
		rst: in std_logic;
		sw: in std_logic_vector (2 downto 0);
		hsync , vsync : out std_logic;
		red : out std_logic_vector(3 downto 0);
		green : out std_logic_vector(3 downto 0);
		blue : out std_logic_vector(3 downto 0);
		--USART
		rxd_pin: in std_logic
	);
end interfaz_UART_VGA;

architecture interfaz_arq of Interfaz_UART_VGA is
    signal rst_clk_rx: std_logic;
    -- Between uart_rx and led_ctl
    signal rx_data: std_logic_vector(7 downto 0);     -- Data output of uart_rx
    signal rx_data_rdy: std_logic;                  -- Data ready output of uart_rx
    
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

begin
    VGA: vga_ctrl
        port map (
            sys_clk => sys_clk,
            rst => rst,
            sw => sw,
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

end interfaz_arq;
