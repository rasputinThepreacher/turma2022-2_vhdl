library ieee;
use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;

entity a17_flipFlop is
    port(
        clk     :   in  std_logic;
        nRst    :   in  std_logic;
        d       :   in  std_logic;
        q       :   out std_logic
    );
end entity;

architecture rtl of a17_flipFlop is
begin

    -- Flip flop com reset síncrono
    -- process(clk) is
    -- begin
    --     if rising_edge(clk) then    -- falling_edge()
    --         if nRst = '0' then    
    --             q <= '0';
    --         else
    --             q <= d;
    --         end if;
    --     end if;
    -- end process;

    process(clk, nRst) is
        begin
            -- Reset
            if nRst = '0' then
                q <= '0';            
            elsif rising_edge(clk) then    -- falling_edge()
                q <= d;                 
            end if;
    end process;

end architecture;

-- no caso de bit
-- if clk'event and clk = '1' then
    -- ...