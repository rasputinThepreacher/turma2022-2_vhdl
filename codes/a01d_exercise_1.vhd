-- Exercício 1
-- Desenvolva um testbench em VHDL que imprima os números de 1 a 10 no console.
-- Utilize o comando 'report' para realizar a impressão dos números.




























-- Resolução
-- Declaração da entidade do testbench.
entity print_numbers_tb is
end print_numbers_tb;

-- Declaração da arquitetura do testbench.
architecture behavior of print_numbers_tb is
begin
    -- Processo para imprimir números de 1 a 10 usando o comando report.
    process
    begin
        -- Loop para passar pelos números de 1 a 10.
        for i in 1 to 10 loop
            -- Comando report para imprimir cada número no console de simulação.
            report "Número: " & integer'image(i);
            -- Pequeno atraso entre as impressões para facilitar a visualização (opcional).
            wait for 10 ns;
        end loop;
        
        -- Finalizar a simulação após imprimir todos os números.
        wait;
    end process;
end behavior;