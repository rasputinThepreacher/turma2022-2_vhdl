-- Este testbench VHDL imprime os números de 20 até 1 em ordem decrescente.
-- O loop é interrompido se o valor atual do contador for igual a uma constante pré-definida 'n'.
-- Esta abordagem demonstra como controlar a execução de loops usando condições de saída.


entity a05_while_tb is
end entity;

architecture sim of a05_while_tb is
    constant n  :   integer := 9; -- Declara a constante 'n' com o valor 9 para uso como condição de saída do loop.
begin

    -- Thread
    process is
        variable i  :   integer := 20; -- Inicializa a variável 'i' em 20 para contar regressivamente até 1.
        -- Note que i foi declarado sem range, portanto, é uma variável de 32 bits
    begin
        report "Start!";
        
        while i > 0 loop
            exit when i = n;
            report "i = " & integer'image(i);
            i := i - 1;
        end loop;

        report "Ateh!";
        wait;
    end process;

end architecture;