library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity isPrime_tb is    
end entity isPrime_tb;

architecture rtl of isPrime_tb is
    constant n      :   natural := 10;
    
    signal  SW      :   unsigned(n - 1 downto 0) := (others => '0');
    signal  LEDR    :   std_logic_vector(9 downto 0);

begin

    dut: entity work.isPrime(rtl)
        generic map(n)
        port map(SW, LEDR);

    NUMBERS_PROC : process
    begin

        wait for 100 ns;
        SW <= SW + 1;
        
    end process;
    
    
    
end architecture rtl;