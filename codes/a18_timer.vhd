library ieee;
use ieee.std_logic_1164.all;    -- permite uso de std_logic ou slv

entity a18_timer is 
    generic(clockFreq   :   integer := 10); -- 10 Hz
    port(
        clk, nRst   :   in      std_logic;
        s, m        :   inout   integer range 0 to 60;
        h           :   inout   integer range 0 to 24
    );
end entity;

architecture rtl of a18_timer is
    -- Sinal para contar ciclos de clock
    signal ticks    :   integer range 0 to clockFreq;
begin
    process(clk, nRst) is
    begin

        if nRst = '0' then
            ticks <= 0;
            s <= 0;
            m <= 0;
            h <= 0;
        elsif falling_edge(clk) then
            -- Verdadeira a cada 1 s
            if ticks = clockFreq - 1 then
                ticks <= 0;
                -- Verdadeira a cada 1 min
                if s = 59 then
                    s <= 0;
                    -- Verdadeira a cada 1 hora
                    if m = 59 then
                        m <= 0;
                        -- Verdadeira a cada 1 dia
                        if h = 23 then
                            h <= 0;
                        else
                            h <= h + 1;
                        end if;
                    else
                        m <= m + 1;
                    end if;
                else
                    s <= s + 1;
                end if;
            else
                ticks <= ticks + 1;
            end if;
        end if;
    end process;
end architecture;

