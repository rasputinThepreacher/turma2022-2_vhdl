library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a17b_contador is
    generic(n   :   integer := 8);
    port(
        clk, nRst   :   in  std_logic;
        q           :   out unsigned(n - 1 downto 0)
    );
end entity;

architecture rtl of a17b_contador is
    signal q_temp : unsigned(n - 1 downto 0);
begin
    process(clk, nRst) is
    begin
        if nRst = '0' then -- Reset
            q_temp <= (others => '0');
        elsif rising_edge(clk) then
            q_temp <= q_temp + 1;
        end if;
    end process;
    q <= q_temp;
end architecture;