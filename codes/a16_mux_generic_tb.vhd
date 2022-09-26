library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a16_mux_generic_tb is
end entity;

architecture sim of a16_mux_generic_tb is

    -- n precisa ser maior que 4
    constant n   :  integer := 4;

    signal sig0  :   unsigned(n - 1 downto 0) := (0 => '1', others => '0');
    signal sig1  :   unsigned(n - 1 downto 0) := (1 => '1', others => '0');
    signal sig2  :   unsigned(n - 1 downto 0) := (2 => '1', others => '0');
    signal sig3  :   unsigned(n - 1 downto 0) := (3 => '1', others => '0');

    signal sel   :   unsigned(1 downto 0) := "00";

    signal saida :   unsigned(n - 1 downto 0);



begin
    -- Componente com os sinais chamados por ordem de aparição
    --dut_mux: entity work.a15_mux(rtl) 
        -- generic map(n)
        -- port map(sig0, sig1, sig2, sig3, sel, saida);
    
    -- Componente com os sinais chamados nominalmente
    dut_mux: entity work.a16_mux(rtl) 
        generic map(dataWidth => n)
        port map(
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