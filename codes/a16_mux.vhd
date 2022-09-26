library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a16_mux is
    generic(dataWidth : integer := 8);
    port(
        sig0, sig1, sig2, sig3  :   in  unsigned(dataWidth - 1 downto 0);
        sel                     :   in  unsigned(1 downto 0);
        saida                   :   out unsigned(dataWidth - 1 downto 0));
end entity;

architecture rtl of a16_mux is
begin

    process(sel, sig0, sig1, sig2, sig3) is
    begin
        case sel is
            when "00" =>
                saida <= sig0;
            when "01" =>
                saida <= sig1;
            when "10" =>
                saida <= sig2;
            when "11" =>
                saida <= sig3;
            when others => -- 'U', 'X', '-', etc
                saida <= (others => 'X');
        end case;

    end process;

end rtl ; -- rtl