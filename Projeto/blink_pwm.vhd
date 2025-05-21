
library ieee;
use ieee.std_logic_1164.all;

entity blink_pwm is

			generic(sysfreq	: integer := 50e6;	
                    ledfreq : integer := 2
                );  -- valor do clock da placa 50 MH
            port(
                    clk : in std_logic;
                    led : out std_logic
                    
            );

end entity;

architecture comportamental of blink_pwm is

        signal led_temp : std_logic;
        signal enable :   boolean := False;  -- começando com falso
begin
        led <= led_temp;
        -- processo para piscar o led
        process(clk, enable) is
        begin 

            if rising_edge(clk) then  
                    if enable then
                        led_temp <= not led_temp;
                    end if;
            end if;    
        end process;


        process(clk) is 
                variable cnt : integer range 0 to sysfreq/ (2 * ledfreq) := 0;
        begin   
                if rising_edge(clk) then 
                        cnt := cnt + 1;
                        enable <= False;
                        if cnt = sysfreq/ (2 * ledfreq) then
                            cnt := 0;
                            enable <= True;
                        end if;    
                end if;
        end process;
end architecture;













