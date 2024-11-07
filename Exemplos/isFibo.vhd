library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity isFibo is
    generic(
        n   :   integer := 10
    );
    port (
        SW      :   in  unsigned(n - 1 downto 0);
        LEDR    :   out std_logic_vector(9 downto 0)
    );
end entity isFibo;

architecture rtl of isFibo is

    signal led :	std_logic := '0';
        
begin  
    
    LEDR <= "000000000" & led;
    
    process(sw) is
        variable fibo, fibo_1, fibo_2, num  :   natural;
    begin
        led <= '0';
        fibo_2 := 0;
        fibo_1 := 1;
        fibo := 1;
        num := to_integer(sw);

        if num <= 1 then
            led <= '1';
        else
            while fibo <= num loop
                fibo := fibo_1 + fibo_2;
                fibo_2 := fibo_1;
                fibo_1 := fibo;
                report "fibo = " & natural'image(fibo);
                if fibo = num then
                    led <= '1';
                    report "Led 1!";
                    exit;
                end if;            
            end loop;
        end if;
        
    end process;
    
end architecture rtl;