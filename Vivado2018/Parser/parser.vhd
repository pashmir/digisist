library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity parser is
    generic(N_bits: signed:= 8);
    port(
		--Entradas
        RxReady: in std_logic;						--Recibo el Ready
        RxData: in std_logic_vector(N-1 downto 0);	--Recibo el dato por UART
		Clk: in std_logic;
        --Salidas
        FCont: out std_logic;						--Flag Continuo/Estatico
		FSent: out std_logic;						--Flag Sentido
        Grads: out std_logic_vector(N-1 downto 0)	--grados
		PReady: out std_logic						--parse ready
    );
end;

architecture parser_arq of parser is
begin
     process(clk, rst, ena)									-- E/S que voy a utilizar
	 
	 variable txt: std_logic_vector ((10*N)-1 downto 0);	-- Texto ingresado 10 bytes total
	 
     begin
          if rst = '1' then
               Q <= (others => '0');
          elsif clk = '1' and clk'event then
               if ena = '1' then
                    Q <= D;
               end if;
          end if;
     end process;
end;

-- ver


		variable l: line;
		variable ch: character:= ' ';
		variable aux: integer;
	begin
		while not(endfile(datos)) loop 		-- si se quiere leer de stdin se pone "input"
			wait until rising_edge(clk);
			readline(datos, l); 			-- se lee una linea del archivo de valores de prueba
			read(l, aux); 					-- se extrae un entero de la linea
			a_file <= to_unsigned(aux, N); 	-- se carga el valor del operando A
			read(l, ch); 					-- se lee un caracter (es el espacio)
			read(l, aux); 					-- se lee otro entero de la linea
			b_file <= to_unsigned(aux, N); 	-- se carga el valor del operando B
			read(l, ch); 					-- se lee otro caracter (es el espacio)
			read(l, aux); 					-- se lee otro entero
			-- if aux = 1 then					-- se carga el valor del Cin
				-- cin_file <= '1';
			-- else
				-- cin_file <= '0';
			-- end if;
			--read(l, ch); 					-- se lee otro caracter (es el espacio)
			--read(l, aux); 					-- se lee otro entero
			z_file <= to_unsigned(aux, N); 	-- se carga el valor de salida (resultado)
			read(l, ch); 					-- se lee otro caracter (es el espacio)
			read(l, aux); 					-- se lee otro entero
			-- if aux = 1 then					-- se carga el valor del Cout
				-- cout_file <= '1';
			-- else
				-- cout_file <= '0';
			-- end if;
		end loop;