library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a19_timer_top is
    port(
        clk, nRst   :  in   std_logic;
        u_sec, d_sec:  out  unsigned(0 to 6);
        u_min, d_min:  out  unsigned(0 to 6);
        u_hr, d_hr  :  out  unsigned(0 to 6)
    );
end entity;

architecture main of a19_timer_top is
    signal a, b, c  :   integer;
begin
    decod_s:    entity work.a19_decod(rtl)
        port map(a, u_sec, d_sec);

    decod_m:    entity work.a19_decod(rtl)
        port map(b, u_min, d_min);

    decod_h:    entity work.a19_decod(rtl)
        port map(c, u_hr, d_hr);

    timer_0:    entity work.a19_timer(rtl)
        port map(clk, nRst, a, b, c);
end architecture;