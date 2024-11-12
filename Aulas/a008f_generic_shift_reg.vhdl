library ieee;
use ieee.std_logic_1164.all;

entity a008f_generic_shift_reg is
    generic(n   :   integer := 10);
    port(
        clk         : in  std_logic;
        rst         : in  std_logic;
        data_in     : in  std_logic;
        data_out    : out std_logic
    );
end a008f_generic_shift_reg;

architecture behavioral of a008f_generic_shift_reg is
    signal temp: std_logic_vector(n - 1 downto 0);
begin
    process(clk, rst)
    begin
        if rst = '1' then
            temp <= (others => '0');
        elsif rising_edge(clk) then
            temp <= temp(temp'high-1 downto 0) & data_in;
        end if;
    end process;

    data_out <= temp(temp'high);
end behavioral;
