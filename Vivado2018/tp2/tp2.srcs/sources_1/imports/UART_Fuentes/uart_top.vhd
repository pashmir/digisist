-------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2015 10:24:29 AM
-- Design Name: 
-- Module Name: uart_top
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
--////////////////////////////////////////////////////////////////////////////////

library IEEE;
use IEEE.std_logic_1164.all;

entity uart_top is
	port(
		--Write side inputs
		clk_pin: in std_logic;		-- Clock input (from pin)
		rst_pin: in std_logic;		-- Active HIGH reset (from pin)
		btn_pin: in std_logic;		-- Button to swap high and low bits
		rxd_pin: in std_logic; 		-- Uart input
		led_pins: out std_logic_vector(3 downto 0) -- 4 LED outputs
	);
	
	--Pines
	attribute LOC: string;
	attribute IOSTANDARD:string;
	attribute LOC of clk_pin: signal is "B8";
	attribute LOC of rst_pin: signal is "B18";
	attribute LOC of btn_pin: signal is "G18";
	attribute LOC of rxd_pin: signal is "U6";
	attribute LOC of led_pins: signal is "K14 K15 J15 J14";
	attribute IOSTANDARD of clk_pin: signal is "LVCMOS33";
    attribute IOSTANDARD of rst_pin: signal is "LVCMOS33";
    attribute IOSTANDARD of btn_pin: signal is "LVCMOS33";
    attribute IOSTANDARD of rxd_pin: signal is "LVCMOS33";
    attribute IOSTANDARD of led_pins: signal is "LVCMOS33";
end;
	

architecture uart_top_arq of uart_top is

	component uart_led is
		generic(
			BAUD_RATE: integer := 115200;   
			CLOCK_RATE: integer := 50E6
		);
		port(
			-- Write side inputs
			clk_pin:	in std_logic;      					-- Clock input (from pin)
			rst_pin: 	in std_logic;      					-- Active HIGH reset (from pin)
			btn_pin: 	in std_logic;      					-- Button to swap high and low bits
			rxd_pin: 	in std_logic;      					-- RS232 RXD pin - directly from pin
			led_pins: 	out std_logic_vector(3 downto 0)    -- 8 LED outputs
		);
		
		
	end component;

begin

	U0: uart_led
		generic map(
			BAUD_RATE => 115200,
			CLOCK_RATE => 125E6
		)
		port map(
			clk_pin => clk_pin,  	-- Clock input (from pin)
			rst_pin => rst_pin,  	-- Active HIGH reset (from pin)
			btn_pin => btn_pin,  	-- Button to swap high and low bits
			rxd_pin => rxd_pin,  	-- RS232 RXD pin - directly from pin
			led_pins => led_pins 	-- 8 LED outputs
		);
end;
