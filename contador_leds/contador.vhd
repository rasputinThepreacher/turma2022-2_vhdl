library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador is 
	generic(
		-- Número de bits do contador
		n			:	integer := 10;
		-- Período de contagem. O valor representa ciclos de clock
		delay		:	integer := 25e6);

	port(
		-- Entradas
		clk,nRst	:	in		std_logic;
		-- Saída
		q			:	out	unsigned(n - 1	downto 0));

end entity;

architecture rtl of contador is 

	-- Habilita a contagem a cada ciclo de delay
	signal habilita : boolean;

begin

	-- Processo para gerar o ciclo de delay
	process(clk) is
		variable j	:	integer range 0 to delay;
	begin
		if rising_edge(clk) then
			j := j + 1;
			habilita <= false;
			if j = delay - 1 then
				j := 0;
				habilita <= true;
			end if;
		end if;
	
	end process;

	process(clk, nRst) is 
		variable i	: unsigned(n - 1	downto 0);
	begin
		if nRst = '0' then
			i := (others => '0');

		-- Contagem acontece uma vez a cada ciclo de delay
		elsif habilita = true then
			if rising_edge(clk) then
				i := i + 1;
			end if;
		end if;
		q <= i;
	end process;
	
end architecture;