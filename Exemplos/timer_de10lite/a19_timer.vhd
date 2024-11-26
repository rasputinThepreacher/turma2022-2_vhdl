library ieee;
use ieee.std_logic_1164.all;    -- permite uso de std_logic ou slv

entity a19_timer is 
    generic(clockFreq   :   integer := 50e6); -- 50 MHz
    port(
        clk, nRst   :   in      std_logic;
        s, m        :   inout   integer range 0 to 60;
        h           :   inout   integer range 0 to 60
    );
end entity;

architecture rtl of a19_timer is
    -- Sinal para contar ciclos de clock
    signal ticks    :   integer;

    -- Procedimento para incrementar um contador
    procedure incrementa(
        signal      contador     :   inout  integer;
        constant    max          :   in     integer;
        constant    habilita     :   in     boolean;
        variable    estouro      :   out    boolean) is
    begin
        estouro := false;
        if habilita then
            if contador = max - 1 then
                estouro := true;
                contador <= 0;
            else
                contador <= contador + 1;
            end if;
        end if;
    end procedure;

begin
    process(clk, nRst) is
        variable controle   :   boolean;
    begin

        if nRst = '0' then
            ticks <= 0;
            s <= 0;
            m <= 0;
            h <= 0;
        elsif falling_edge(clk) then
            -- Procedimentos em cascata
            incrementa(ticks, clockFreq, true, controle);
            incrementa(s, 60, controle, controle);
            incrementa(m, 60, controle, controle);
            incrementa(h, 24, controle, controle);
        end if;
    end process;
end architecture;

