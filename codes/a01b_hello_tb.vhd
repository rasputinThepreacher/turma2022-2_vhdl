library std; -- opcional
use std.textio.all; -- obrigatório 

entity a01b_hello_tb is
end entity;

architecture tb of a01b_hello_tb is
begin
    process
        variable L: line;
    begin
        -- Escrever a mensagem desejada no buffer "L"
        write(L, string'("Ola, esta e a mensagem impressa no console!"));

        -- Imprimir a mensagem no console
        writeline(output, L);

        -- Aguardar um tempo antes de finalizar o processo (opcional)
        wait for 100 ms;

        -- Finalizar o processo
        assert false report "Teste concluido!" severity note;
        wait; -- O testbech para aqui!
    end process;
end architecture tb;