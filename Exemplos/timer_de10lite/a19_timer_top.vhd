library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a19_timer_top is
    port(
        MAX10_CLK1_50	:  in   std_logic;
		  SW   				:  in   std_logic_vector(0 downto 0);
        HEX0, HEX1		:  out  unsigned(0 to 6);
        HEX2, HEX3		:  out  unsigned(0 to 6);
        HEX4, HEX5  		:  out  unsigned(0 to 6)
    );
end entity;

architecture main of a19_timer_top is
    signal a, b, c  :   integer range 0 to 60;
begin
    decod_s:    entity work.a19_decod(rtl)
        port map(a, HEX0, HEX1);

    decod_m:    entity work.a19_decod(rtl)
        port map(b, HEX2, HEX3);

    decod_h:    entity work.a19_decod(rtl)
        port map(c, HEX4, HEX5);

    timer_0:    entity work.a19_timer(rtl)
		  generic map(50e6)
        port map(MAX10_CLK1_50, SW(0), a, b, c);
end architecture;