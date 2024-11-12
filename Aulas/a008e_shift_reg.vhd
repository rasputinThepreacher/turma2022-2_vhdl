-- O código a seguir trata-se de um registrador de deslocamento em VHDL
-- Fonte: https://embarcados.com.br/implementacao-de-um-shift-register-em-vhdl/

library ieee;
use ieee.std_logic_1164.all;
entity a008e_shift_reg is
    port
    (
        sys_clk : in std_logic;
        sys_rst : in std_logic;
        dado_entrada : in std_logic;
        dado_saida : out std_logic
    );
end a008e_shift_reg;

architecture rtl of a008e_shift_reg is
    signal dado_registrado : std_logic_vector(3 downto 0);
begin
    dado_saida <= dado_registrado(3);
    process(sys_clk, sys_rst)
    begin
        if (sys_rst = '1') then
            dado_registrado <= "0000";
        elsif rising_edge(sys_clk) then
            dado_registrado(0) <= dado_entrada;
            dado_registrado(1) <= dado_registrado(0);
            dado_registrado(2) <= dado_registrado(1);
            dado_registrado(3) <= dado_registrado(2);
        end if;
    end process;
end rtl;
 