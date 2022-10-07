library ieee;
use ieee.std_logic_1164.all;

entity a19_timer_tb is
end entity;

architecture sim of a19_timer_tb is
    constant clockFreq      :   integer := 10;
    constant clkPer         :   time := 1000 ms/clockFreq;

    signal clk, nRst    :   std_logic   := '0'; 

    signal segundo      :   integer;
    signal minuto       :   integer;
    signal hora         :   integer;

begin
    -- Dispositivo sobre teste (device under test - DUT)
    i_timer : entity work.a19_timer(rtl)
        generic map(clockFreq)
        port map(clk, nRst, segundo, minuto, hora);

    -- Clock
    clk <= not clk after clkPer / 2;

    -- Reset
    process is
    begin
        wait until rising_edge(clk);
        wait until rising_edge(clk);

        -- Removo o sistema do reset
        nRst <= '1';

        wait;
    end process;

end architecture;


