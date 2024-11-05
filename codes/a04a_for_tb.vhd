-- O objetivo deste código é imprimir os números inteiros de 1 a 5 e de 4 a 0 no console de simulação.

entity a04a_for_tb is
end entity;

architecture sim of a04a_for_tb is
begin

    -- Thread
    imprime: process is -- o Rótulo "imprime é opcional"
    begin
        report "Start!"; -- Início do testbench
        
        -- Imprime os números de 1 a 5 com o comando report
        crescente: for i in 1 to 5 loop -- O o rótulo "crescente" é opcional
            report "i = " & integer'image(i);
        end loop;

        -- Imprime os números de 4 a 1 com o comando report
        descrescente: for i in 4 downto 0 loop -- O o rótulo "decrescente" é opcional
            report "i = " & integer'image(i);
        end loop;

        report "Ateh!";
        wait;
    end process;

    -- Note que o tempo para rodar todo esse process na simulação é nulo

end architecture;