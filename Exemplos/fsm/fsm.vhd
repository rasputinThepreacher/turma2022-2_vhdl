library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fsm is
    -- Frquência de Entrada
    generic(input_freq  :   integer := 50e6); -- 50e6 ciclos para 1 segundo

    -- Interfaces da máquina de estados
    port (
        p       :   out     std_logic_vector(1 downto 0);
        clk     :   in      std_logic;
        nRst    :   in      std_logic
    );
end entity fsm;

architecture rtl of fsm is

    -- Quantidade de ciclos para gerar um microsegundo
    constant    microsegundo    :   integer := input_freq / 1e6;

    -- Estados
    type fsm_state is (s0, s1, s2, s3, s4, s5);
    signal estado       : fsm_state := s0;
    signal contador     : integer range 0 to 6 * microsegundo;
    
begin

   fsm: process(clk, nRst) is        
   begin
    if rising_edge(clk) then
        if nRst = '0' then
            estado <= s0;
            contador <= 0;
        else

            -- Incrementa o contador
            contador <= contador + 1;
            case estado is
                -- Estado 0
                when s0 =>
                    p <= "01";
                    if contador = 6 * microsegundo - 1 then
                        contador <= 0;
                        estado <= s1;
                    end if;

                -- Estado 1
                when s1 =>
                    p <= "00";
                    if contador = 2 * microsegundo - 1 then
                        contador <= 0;
                        estado <= s2;
                    end if;

                -- Estado 2
                when s2 =>
                    p <= "10";
                    if contador = 6 * microsegundo - 1 then
                        contador <= 0;
                        estado <= s3;
                    end if;

                -- Estado 3  
                when s3 =>
                    p <= "00";
                    if contador = 3 * microsegundo - 1 then
                        contador <= 0;
                        estado <= s4;
                    end if;

                -- Estado 4    
                when s4 =>
                    p <= "10";
                    if contador = 5 * microsegundo - 1 then
                        contador <= 0;
                        estado <= s5;
                    end if;
                    
                -- Estado 5
                when s5 =>
                    p <= "00";
                    if contador = 2 * microsegundo - 1 then
                        contador <= 0;
                        estado <= s0;
                    end if;
            
                when others =>
                    contador <= 0;
                    estado <= s0;
                    
            
            end case;
            
        end if;
    end if;
   end process fsm;
    
    
    
end architecture rtl;