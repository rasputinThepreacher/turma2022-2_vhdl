library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a17b_contador is
    generic(n   :   integer := 8);
    port(
        clk, nRst   :   in  std_logic;
        q           :   inout unsigned(n - 1 downto 0)
    );
end entity;

architecture rtl of a17b_contador is
begin
    process(clk, nRst) is
    begin
        if nRst = '0' then
            q <= (others => '0');
        elsif rising_edge(clk) then
            q <= q + 1;
        end if;
    end process;
end architecture;