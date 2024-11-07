library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity isPrime is
    generic(
        n   :   integer := 10
    );
    port (
        SW      :   in  unsigned(n - 1 downto 0);
        LEDR     :  out std_logic_vector(9 downto 0)
    );
end entity isPrime;

architecture rtl of isPrime is

    signal led :	std_logic := '0';

        
begin   

	LEDR <= "000000000" & led;
    
    process(sw) is
        variable i , num  :   natural := 0;
    begin
        led <= '1';
        i := 3;        
        num := to_integer(sw);

        if num <= 1 then
            led <= '0';
        elsif num = 2 then
            null;
        elsif num mod 2 = 0 then
            led <= '0';
        else
            while i <= num/2 loop
                if num mod i = 0 then
                    led <= '0';
                    exit;
                end if;                
                i := i + 2;                            
            end loop;
        end if;
        
    end process;
    
end architecture rtl;