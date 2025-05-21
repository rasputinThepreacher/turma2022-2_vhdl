
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity leds_top is
			
			port(
			
				
			    	MAX10_CLK1_50 : in std_logic;
					SW            : in unsigned(9 downto 0);
					LEDR          : out std_logic_vector(9 downto 0)
					
			
			);
			
end entity;


architecture estrutural of leds_top is

			constant sysfreq : integer := 50e6;


begin 
			-- Label
			disp_blink_pwm: entity work.blink_pwm(comportamental)  -- chamando a comportamental de blin_pwm
			generic map(      sysfreq => sysfreq,	
                           ledfreq => 2 
            )  -- valor do clock da placa 50 MH
				
			port map(
						
						clk => MAX10_CLK1_50,
						led => LEDR(0)
						
			);
			
			disp_pwm : entity work.pwm(comportamental)
			generic map(      sysfreq => sysfreq,	
                       pwmfreq => 1000 
            )  -- valor do clock da placa 50 MH
				
			port map(
						
						clk => MAX10_CLK1_50,
						led => LEDR(1),
						sw => SW(3 downto 0) 
						
			);
			
			-- instanciação posicional
			disp_blink2: entity work.blink_pwm(comportamental)  -- chamando a comportamental de blin_pwm

			generic map(sysfreq, 1)
			port map (MAX10_CLK1_50,LEDR(2));
			
			
		end architecture;