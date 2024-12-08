library ieee;
use ieee.std_logic_1164.all;

entity blinker is
    port (
        clk : in std_logic;
        sw 	: in std_logic_vector(1 downto 0);
        led : out std_logic
    );
end entity;

architecture behavior of blinker is
    
    -- define um array de inteiros (necessário no vhdl 1993)
	type int_array is array(natural range <>) of integer range 1 to 31;
	 
	 -- Define a frequência de operação e os períodos para 1 Hz, 5 Hz e 10 Hz
    constant clk_freq       : natural := 50_000_000;
	constant blink_freqs    : int_array(0 to 2) := (1, 5, 10);
    
	-- Saída dos contadores para cada frequência 
    signal osc		:	std_logic_vector(0 to 2) := (others => '0');
	 
begin 

    -- Selecionar o período baseado nas switches
    with sw select
        led <=  osc(0) when "00",
                osc(1) when "01",
                osc(2) when others;   
    
	-- 1 Hz
    F1HZ:   block
        signal counter : natural range 0 to 50e6 := 0;
    begin
        process(clk)	    
        begin
            if rising_edge(clk) then
                if counter >= clk_freq / blink_freqs(0) / 2 then
                    -- Inverter o estado do LED e reiniciar o contador
                    osc(0) <= not osc(0);
                    counter <= 0;
                else
                    counter <= counter + 1;
                end if;            
            end if;
        end process;
    end block F1HZ;
	 
	-- 5 Hz
    F5HZ:   block
        signal counter : natural range 0 to 50e6 := 0;
    begin
        process(clk)	    
        begin
            if rising_edge(clk) then
                if counter >= clk_freq / blink_freqs(1) / 2 then
                    -- Inverter o estado do LED e reiniciar o contador
                    osc(1) <= not osc(1);
                    counter <= 0;
                else
                    counter <= counter + 1;
                end if;            
            end if;
        end process;
    end block F5HZ;
	 
	-- 10 Hz
    F10HZ:   block
        signal counter : natural range 0 to 50e6 := 0;
    begin
        process(clk)	    
        begin
            if rising_edge(clk) then
                if counter >= clk_freq / blink_freqs(2) / 2 then
                    -- Inverter o estado do LED e reiniciar o contador
                    osc(2) <= not osc(2);
                    counter <= 0;
                else
                    counter <= counter + 1;
                end if;            
            end if;
        end process;
    end block F10HZ;							 
							 
end architecture;
