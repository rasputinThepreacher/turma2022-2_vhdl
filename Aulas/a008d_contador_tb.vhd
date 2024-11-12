library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a008d_contador_tb is
end entity;

architecture sim of a008d_contador_tb is
    constant n          :   integer := 5;
    constant clkFreq    :   integer := 100e6;   -- 100 MHz
    constant clkPer     :   time    := 1000 ms / clkFreq;

    signal clk  :   std_logic := '1';
    signal nRst :   std_logic := '0';
    signal q    :   unsigned(n - 1 downto 0);

begin

    -- Instanciação do contador
    i_cont    :   entity work.a17b_contador(rtl) 
        generic map(n)
        port map(clk, nRst, q);

    -- Geração de clock  
    clk <= not clk after clkPer / 2;

    nRst <= '1' after 15 ns;

end architecture;