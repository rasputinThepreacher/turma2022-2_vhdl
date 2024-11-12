library ieee;
use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;

entity a008b_flipFlop_tb is
end entity;

architecture sim of a008b_flipFlop_tb is

    constant clkFreq    :   integer := 100e6;   -- 100 MHz
    constant clkPer     :   time    := 1000 ms / clkFreq;

    signal clk  :   std_logic := '1';
    signal nRst :   std_logic := '0';
    signal d    :   std_logic := '0';
    signal q    :   std_logic;

begin

    -- Instanciação do flip flop
    i_ff    :   entity work.a17_flipFlop(rtl) port map(clk, nRst, d, q);

    -- Geração de clock  
    clk <= not clk after clkPer / 2;

    -- Sequência de teste
    process is
    begin
        nRst <= '1';

        wait for 20 ns;
        d <= '1';
        wait for 22 ns;
        d <= '0';
        wait for 6 ns;
        d <= '1';
        wait for 20 ns;

        -- Reset
        nRst <= '0';

        wait;
    end process;

end architecture;