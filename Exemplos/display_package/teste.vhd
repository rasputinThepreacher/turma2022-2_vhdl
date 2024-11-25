library ieee, display_utils;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use display_utils.display.all;

entity teste is
	port(
		MAX10_CLK1_50	:	in		std_logic;
		KEY				:	in		std_logic_vector(0 to 1);
		--SW 				:	in		std_logic_vector(9 downto 0);
		HEX0				:	out 	std_logic_vector(0 to 6);
		HEX1				:	out 	std_logic_vector(0 to 6);
		HEX2				:	out 	std_logic_vector(0 to 6);
		HEX3				:	out 	std_logic_vector(0 to 6)
	);
end entity;

architecture main of teste is
	constant n_bits	:	integer := 13;
	signal digits 		: 	display_vector(3 downto 0);
	signal q		  		: 	unsigned(n_bits - 1 downto 0);
begin
	HEX0 <= digits(0);
	HEX1 <= digits(1);
	HEX2 <= digits(2);
	HEX3 <= digits(3);
	digits <= display(q, 4, 10, anode);
	
	u1: counter
		generic map(50e6, 100, n_bits)
		port map(MAX10_CLK1_50, KEY(0), KEY(1), q);
end architecture;