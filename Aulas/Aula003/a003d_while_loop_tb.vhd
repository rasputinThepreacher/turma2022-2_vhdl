-- Este testbench VHDL utiliza um loop 'while' para imprimir os n�meros pares de 0 a 20 no console de simula��o.
-- A vari�vel 'i' controla as itera��es do loop e � inicializada em 0. Este exemplo � �til para aprender como controlar
-- fluxos de execu��o usando loops em VHDL e como vari�veis s�o declaradas e utilizadas dentro de processos.

entity a003d_while_loop_tb is
end entity;

architecture sim of a003d_while_loop_tb is
    constant PRIME_LIMIT : integer := 101;   -- Valor modificado por mim do c�digo 
    
begin

    -- Define um �nico processo chamado 'imprime_pares'
    --imprime_pares: process is
        -- Declara��o de uma vari�vel 'i' com range de 0 a 20. O range restringe os valores que 'i' pode assumir,
        -- proporcionando seguran�a adicional ao evitar valores fora do esperado. Caso seja omitido, o inteiro � de 32 bits
    process is          -- modificado por mim
        -- variable i  :   integer range 0 to 20 := 0; -- Verifique a forma que a vari�vel foi declarada
        variable i  :   integer := 2;                   -- valor modificado
        variable j  :   integer := 3;                   -- valor modificado
        variable is_prime : boolean;                   -- adicionado para checar primalidade
        -- Declara��es de vari�veis e outros objetos s�o feitos sempre antes da palavra begin
    begin
        report "Start!";
        
        -- while i <= 20 loop       c�digo original 
        while i < PRIME_LIMIT loop

            is_prime := true;
            j := 2;

            -- Loop interno para verificar se i � divis�vel por algum valor de 2 at� i-1
            while j < i loop
                if (i mod j) = 0 then
                    is_prime := false;
                    exit;
                end if;
                j := j + 1;
            end loop;

            if is_prime then
                report "i = " & integer'image(i); -- Imprime i
            end if;

            i := i + 1;
            
            -- i := i + 2;
        end loop;

        report "Ateh!";
        wait;
    end process;

end architecture;
