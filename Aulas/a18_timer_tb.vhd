library ieee;
use ieee.std_logic_1164.all;

entity a18_timer_tb is
end entity;

architecture sim of a18_timer_tb is
    constant clockFreq      :   integer := 10;
    constant clkPer         :   time := 1000 ms/clockFreq;

    signal clk, nRst    :   std_logic   := '0'; 

    signal segundo      :   integer range 0 to 60;
    signal minuto       :   integer range 0 to 60;
    signal hora         :   integer range 0 to 24;

begin
    -- Dispositivo sobre teste (device under test - DUT)
    i_timer : entity work.a18_timer(rtl)
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


