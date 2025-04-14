-- Este testbench VHDL imprime os números de 20 até 1 em ordem decrescente.
-- O loop é interrompido se o valor atual do contador for igual a uma constante pré-definida 'n'.
-- Esta abordagem demonstra como controlar a execução de loops usando condições de saída.


entity a003e_while_loop_tb is
end entity;

architecture sim of a003e_while_loop_tb is
    --constant n  :   integer := 9; -- Declara a constante 'n' com o valor 9 para uso como condição de saída do loop.
    constant n  :   integer := 100; -- Valor modificado por mim do código
    constant FIB_LIMIT : integer := 100;   -- Valor modificado por mim do código 
      
begin

    -- Thread
    process is
        --variable i  :   integer := 20; -- Inicializa a variável 'i' em 20 para contar regressivamente até 1.
        -- Note que i foi declarado sem range, portanto, é uma variável de 32 bits
        variable i  :   integer := 0;
        variable num1 : integer := 0;       -- Valor modificado por mim do código 
        variable num2 : integer := 1;       -- Valor modificado por mim do código 
        variable a : integer := 0;
        
    begin
        report "Start!";
            
            report "i = " & integer'image(num1);           -- Valor modificado por mim do código
            report "i = " & integer'image(num2);           -- Valor modificado por mim do código
        
        while i < FIB_LIMIT loop

            
            --exit when i = n;

            exit when a > FIB_LIMIT;

            a := num1 + num2;    -- valor modificado por mim 
            report "i = " & integer'image(a);

            num1 := num2;
            num2 := a;
            
            i := i + 1;       -- valor modificado por mim     PARA ITERAR
            --i := i - 1;

        end loop;

        report "Ateh!";
        wait;
    end process;

end architecture;