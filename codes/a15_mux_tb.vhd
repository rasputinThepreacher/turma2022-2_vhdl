library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a15_mux_tb is
end a15_mux_tb ;

architecture sim of a15_mux_tb is

    signal sig0  :   unsigned(7 downto 0) := x"AA";
    signal sig1  :   unsigned(7 downto 0) := x"BB";
    signal sig2  :   unsigned(7 downto 0) := x"CC";
    signal sig3  :   unsigned(7 downto 0) := x"DD";

    signal sel   :   unsigned(1 downto 0) := "00";

    signal saida :   unsigned(7 downto 0);



begin
    -- Componente com os sinais chamados por ordem de aparição
    --dut_mux: entity work.a15_mux(rtl) port map(sig0, sig1, sig2, sig3, sel, saida);
    
    -- Componente com os sinais chamados nominalmente
    dut_mux: entity work.a15_mux(rtl) port map(
        --Cmp           -- testbench
        sel     =>      sel,
        sig0    =>      sig0,
        sig1    =>      sig1,
        sig2    =>      sig2,
        sig3    =>      sig3,
        saida   =>      saida
    );

    process is
    begin
        wait for 10 ns;
        sel <= sel + 1;
        if sel = "11" then
            wait;
        end if;
    end process;

end architecture ; -- sim