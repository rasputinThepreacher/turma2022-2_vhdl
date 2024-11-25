-- ================================================================
-- ARQUIVO: contador.vhdl
-- DESCRIÇÃO:
-- Este módulo VHDL implementa um contador que conta de 0 a 9 e
-- exibe cada número em um display de sete segmentos. A lógica para
-- decodificar o valor binário em representação de sete segmentos é
-- realizada através de uma procedimento interno chamado 'decodificando'.
--
-- DEPENDÊNCIAS:
--  - ieee.std_logic_1164.all: Biblioteca para os tipos de lógica padrão.
--  - ieee.numeric_std.all: Biblioteca para operações numéricas com lógica padrão.
-- ================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador is
	port(
		clk, rst	:	in		std_logic;		-- Clock e reset assíncrono
		hex		:	out	std_logic_vector(0 to 6)	-- Saída para o display de sete segmentos
	);
end entity;

architecture rtl of contador is
	signal i	:	unsigned(3 downto 0) := "0000";	-- Contador binário de 4 bits
	
	-- Procedimento para decodificar o valor do contador para o display de sete segmentos
	procedure decodificando(
		constant valor  :   in   unsigned(3 downto 0);
		signal   saida  :   out  std_logic_vector(0 to 6)
	) is
	begin
		case(valor) is
			when "0000" => saida <= not "1111110"; -- 0
			when "0001" => saida <= not "0110000"; -- 1
			when "0010" => saida <= not "1101101"; -- 2
			when "0011" => saida <= not "1111001"; -- 3
			when "0100" => saida <= not "0110011"; -- 4
			when "0101" => saida <= not "1011011"; -- 5
			when "0110" => saida <= not "1011111"; -- 6
			when "0111" => saida <= not "1110000"; -- 7
			when "1000" => saida <= not "1111111"; -- 8
			when "1001" => saida <= not "1111011"; -- 9
			when others => saida <= "0000000";		-- Invalido
		end case;
	end;

begin
	process(clk, rst)
	begin
		if rst = '0' then
			i <= "0000";	-- Reseta o contador
		elsif rising_edge(clk) then
			i <= i + 1;
			if i = "1001" then -- Se igual a 9, resete para 0
				i <= "0000";
			end if;
		end if;
	end process;
	
	decodificando(i, hex); -- Chama o procedimento de decodificação

end architecture;
