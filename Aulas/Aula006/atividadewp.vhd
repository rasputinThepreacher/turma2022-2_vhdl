-- Este testbench VHDL utiliza um loop 'while' para imprimir os números pares de 0 a 20 no console de simulação.
-- A variável 'i' controla as iterações do loop e é inicializada em 0. Este exemplo é útil para aprender como controlar
-- fluxos de execução usando loops em VHDL e como variáveis são declaradas e utilizadas dentro de processos.
library ieee;
use ieee.std_logic_1164.all; -- Importa a biblioteca IEEE para acesso aos tipos de dados 'std_logic' e 'std_logic_vector'.


entity atividadewp is
end entity;

architecture sim of atividadewp is

    signal teste : std_logic_vector(9 downto 0) := "1101010010"; -- Vetor com o primeiro bit como '1' e os demais como '0'.
    signal cnt, cnt2 :  natural := 0;        -- declarar a variavel na arquitetura antes do process

    type valores_t is array(3 downto 0) of std_logic_vector(9 downto 0);
        constant valores : valores_t := (
            "1101010010",
            "1010101010",
            "0000000000",
            "1111111111"
        );


begin

    -- Define um único processo chamado 'imprime_pares'
    --imprime_pares: process is
        -- Declaração de uma variável 'i' com range de 0 a 20. O range restringe os valores que 'i' pode assumir,
        -- proporcionando segurança adicional ao evitar valores fora do esperado. Caso seja omitido, o inteiro é de 32 bits
    process is          -- modificado por mim
        -- variable i  :   integer range 0 to 20 := 0; -- Verifique a forma que a variável foi declarada
        variable i  :   integer := 0;                   -- valor modificado
        variable idx : natural  := 0;
        -- Declarações de variáveis e outros objetos são feitos sempre antes da palavra begin
    begin


        wait for 100 ns;
       idx := idx + 1;
       teste <= valores(idx);


        for i in valores'range loop
            

            if teste(i) = '1' then
                cnt <= cnt + 1;
                wait for 10 ns;            
            
            end if;
        
        end loop;


         --while i <= teste'length loop

         --           if teste(i) = '1' then
         --               cnt <= cnt + 1;
         --               wait for 10 ns;
         --           end if;   
                    
          --          i := i + 1;
        -- end loop;
            

        report "total de 1s: " & integer'image(cnt);

        wait;
    end process;

end architecture;