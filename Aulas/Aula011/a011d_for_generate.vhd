library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blinker is
    generic(
        n   : natural := 4  -- Número de chaves de seleção
    );
    port (
        clk : in std_logic;
        sw 	: in unsigned(n - 1 downto 0);
        led : out std_logic
    );
end entity;

architecture behavior of blinker is
    
    -- define um array de inteiros (necessário no vhdl 1993)
	type int_array is array(natural range <>) of integer range 1 to 31;
	 
	 -- Define a frequência de operação e os períodos para 1 Hz, 5 Hz e 10 Hz
    constant clk_freq       : natural := 50_000_000;
	constant blink_freqs    : int_array(0 to 2**n - 1) := (1, 5, 10, 4, 8 => 2, others => 1);
    
	-- Saída dos contadores para cada frequência 
    signal osc		:	std_logic_vector(0 to 2**n - 1) := (others => '0');
	 
begin 

    -- Selecionar o período baseado nas switches
    led <= osc(to_integer(sw));      
    
	-- Estrutura Generate
    CONT_GEN : for i in 0 to 2**n - 1 generate
        process(clk)
            variable counter : natural range 0 to 50e6 := 0;
        begin
            if rising_edge(clk) then
                if counter >= clk_freq / blink_freqs(i) / 2 then
                    -- Inverter o estado do LED e reiniciar o contador
                    osc(i) <= not osc(i);
                    counter := 0;
                else
                    counter := counter + 1;
                end if;            
            end if;
        end process;
    end generate;							 
							 
end architecture;
