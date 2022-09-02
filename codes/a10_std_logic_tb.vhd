library ieee;
use ieee.std_logic_1164.all;

entity a10_std_logic_tb is
end entity;

architecture sim of a10_std_logic_tb is

    signal clock    :   std_logic := '0';
    
begin

    process is
    begin
        wait for 10 ns;
        clock <= not clock;

    end process;

    
end architecture;