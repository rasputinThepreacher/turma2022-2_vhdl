library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a19_decod is
    port(
        contador    :   in  integer;
        d0, d1      :   out std_logic_vector(0 to 6)
    );
end entity;

architecture rtl of a19_decod is
    function decodificando(valor: integer) return std_logic_vector is
        variable saida: std_logic_vector(6 downto 0);
    begin
        case valor is
            when 0 => saida := not "1111110";
            when 1 => saida := not "0110000";
            when 2 => saida := not "1101101";
            when 3 => saida := not "1111001";
            when 4 => saida := not "0110011";
            when 5 => saida := not "1011011";
            when 6 => saida := not "1011111";
            when 7 => saida := not "1110000";
            when 8 => saida := not "1111111";
            when 9 => saida := not "1111011";
            when others => saida := "0000000";
        end case;
    
        return saida;
    end decodificando;
    
begin

    process(contador) is
        variable dezena, unidade :   integer;
    begin

        dezena := contador / 10;
        unidade := unidade mod 10;
        d1 <= decodificando(dezena);
        d0 <= decodificando(unidade);
        
    end process;

end architecture;
