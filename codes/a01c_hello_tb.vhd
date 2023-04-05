use std.textio.all;

entity a01c_hello_tb is
end entity;

architecture tb of a01c_hello_tb is
    
begin
    process
        variable L: line;
    begin
        -- Imprimir números de 1 a 10 no console
        for i in 1 to 10 loop
            
            -- Converter o número para uma string com a função image
            write(L, "loop " & integer'image(i));
            -- Imprimir o número no console
            writeline(output, L);
            
        end loop;

        -- Aguardar um tempo antes de finalizar o processo (opcional)
        wait for 100 ms;

        -- Finalizar o processo
        assert false report "Teste concluido!" severity note;
        wait;
    end process;
end architecture;
    