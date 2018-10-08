library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

entity PF_testbench is
end entity PF_testbench;

architecture PF_testbench_arq of PF_testbench is
  constant TCK: time:= 20 ns; 		-- periodo de reloj
  constant DELAY: natural:= 0; 		-- retardo de procesamiento del DUT
  constant WORD_SIZE_T: natural:= 25;	-- tama�o de datos
  constant EXP_SIZE_T: natural:= 7;   -- tama�o exponente
  
  signal clk: std_logic:= '0';
  signal a_file: unsigned(WORD_SIZE_T-1 downto 0):= (others => '0');
  signal b_file: unsigned(WORD_SIZE_T-1 downto 0):= (others => '0');
  signal z_file: unsigned(WORD_SIZE_T-1 downto 0):= (others => '0');
  signal z_del: unsigned(WORD_SIZE_T-1 downto 0):= (others => '0');
  signal z_dut: unsigned(WORD_SIZE_T-1 downto 0):= (others => '0');
  
  signal ciclos: integer := 0;
  signal errores: integer := 0;
  
  -- La senal z_del_aux se define por un problema de conversi�n
  signal z_del_aux: std_logic_vector(WORD_SIZE_T-1 downto 0):= (others => '0');
  
  file datos: text open read_mode is "test_mul_float_25_7.txt";
  
  -- Declaracion del componente a probar
  component mult_PF is
    generic(
      N_tot: natural := 25;
      N_exp: natural := 7
      );
    port(
      clk: in std_logic;
      A: in std_logic_vector(N_tot-1 downto 0);	-- Operando A
      B: in std_logic_vector(N_tot-1 downto 0);	-- Operando B
      S: out std_logic_vector(N_tot-1 downto 0)	-- Resultado
      );
  end component mult_PF;
  
  -- Declaracion de la linea de retardo
  component delay_gen is
    generic(
      N: natural:= 26;
      DELAY: natural:= 0
      );        
    port(
      clk: in std_logic;
      A: in std_logic_vector(N-1 downto 0);
      B: out std_logic_vector(N-1 downto 0)
      );
  end component;
  
begin
  -- Generacion del clock del sistema
  clk <= not(clk) after TCK/ 2; -- reloj
--  clock_process :process
--begin
--     clk <= '0';
--     wait for 10 ns;
--     clk <= '1';
--     wait for 10 ns;
--end process;
  Test_Sequence: process
    variable l: line;
    variable ch: character:= ' ';
    variable aux: integer;
  begin
    while not(endfile(datos)) loop 		-- si se quiere leer de stdin se pone "input"
      wait until rising_edge(clk);
      ciclos <= ciclos + 1;			-- solo para debugging
      readline(datos, l); 			-- se lee una linea del archivo de valores de prueba
      read(l, aux); 					-- se extrae un entero de la linea
      a_file <= to_unsigned(aux, WORD_SIZE_T); 	-- se carga el valor del operando A
      read(l, ch); 					-- se lee un caracter (es el espacio)
      read(l, aux); 					-- se lee otro entero de la linea
      b_file <= to_unsigned(aux, WORD_SIZE_T); 	-- se carga el valor del operando B
      read(l, ch); 					-- se lee otro caracter (es el espacio)
      read(l, aux); 					-- se lee otro entero
      z_file <= to_unsigned(aux, WORD_SIZE_T); 	-- se carga el valor de salida (resultado)
    end loop;
    
    file_close(datos);		-- se cierra del archivo
    wait for TCK*(DELAY+1);
    assert false report		-- se aborta la simulacion (fin del archivo)
      "Fin de la simulacion" severity failure;
  end process Test_Sequence;
  
  -- Instanciacion del DUT
  DUT: mult_pf
    generic map(
      N_tot => WORD_SIZE_T,
      N_exp => EXP_SIZE_T
      )
    port map(
      clk => clk,
      A => std_logic_vector(a_file),
      B => std_logic_vector(b_file),
      unsigned(S) => z_dut
      );
  
  -- Instanciacion de la linea de retardo
  del: delay_gen
    generic map(WORD_SIZE_T, DELAY)
    port map(clk, std_logic_vector(z_file), z_del_aux);
  
  z_del <= unsigned(z_del_aux);
  
  -- Verificacion de la condicion
  verificacion: process(clk)
  begin
    if rising_edge(clk) then
--report integer'image(to_integer(a_file)) & " " & integer'image(to_integer(b_file)) & " " & integer'image(to_integer(z_file));
      assert to_integer(z_del) = to_integer(z_dut) report
        "Error: Salida del DUT no coincide con referencia (salida del dut = " & 
        integer'image(to_integer(z_dut)) &
        ", salida del archivo = " &
        integer'image(to_integer(z_del)) & ")"
        severity warning;
      if to_integer(z_del) /= to_integer(z_dut) then
        errores <= errores + 1;
      end if;
    end if;
  end process;
  
end architecture PF_testbench_arq; 
