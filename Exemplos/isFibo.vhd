-- ================================================================
-- ARQUIVO: isFibo.vhdl
-- DESCRIÇÃO:
-- Este módulo VHDL verifica se o valor de entrada (um número natural)
-- fornecido por um switch ('SW') é um número de Fibonacci. Se for,
-- acende um LED específico ('LEDR(0)'). A verificação é realizada
-- calculando sequencialmente os números de Fibonacci até atingir ou
-- ultrapassar o número fornecido.
--
-- DEPENDÊNCIAS:
--  - ieee.std_logic_1164.all: Biblioteca para os tipos de lógica padrão.
--  - ieee.numeric_std.all: Biblioteca para operações numéricas com lógica padrão.
-- ================================================================

library ieee;
use ieee.std_logic_1164.all;  -- Inclui os tipos de lógica padrão.
use ieee.numeric_std.all;     -- Inclui operações numéricas para lógica padrão.

entity isFibo is
    generic(
        n   : integer := 10   -- Define o número de bits para o switch de entrada.
    );
    port (
        SW      : in  unsigned(n - 1 downto 0);  -- Entrada do switch representando um número natural.
        LEDR    : out std_logic_vector(9 downto 0) -- Saída para um vetor de LEDs.
    );
end entity;

architecture rtl of isFibo is
    signal led : std_logic := '0';  -- Sinal para controle do LED indicativo de número Fibonacci.
        
begin  
    
    -- Atribui o estado do LED 'led' ao primeiro LED do vetor.
    LEDR <= (0 => led, others => '0');
    
    -- Processo que verifica se o número da entrada SW é um número de Fibonacci.
    process(SW) is
        variable fibo, fibo_1, fibo_2, num  : natural; -- Variáveis para armazenar os números Fibonacci e o número de entrada.
    begin
        led <= '0';  -- Inicializa o LED como desligado.
        fibo_2 := 0;  -- Primeiro número de Fibonacci.
        fibo_1 := 1;  -- Segundo número de Fibonacci.
        fibo := 1;    -- Inicia a sequência com o primeiro número Fibonacci.
        num := to_integer(SW);  -- Converte o valor do switch para um número inteiro.

        -- Verifica se o número é 0 ou 1, que são os primeiros números de Fibonacci.
        if num <= 1 then
            led <= '1';  -- Acende o LED se o número for 0 ou 1.
        else
            -- Laço para calcular a sequência de Fibonacci até encontrar o número ou exceder o valor.
            while fibo <= num loop
                fibo := fibo_1 + fibo_2;  -- Calcula o próximo número de Fibonacci.
                fibo_2 := fibo_1;  -- Atualiza o penúltimo número.
                fibo_1 := fibo;    -- Atualiza o último número.
                
                -- Se o número calculado for igual ao número da entrada, acende o LED.
                if fibo = num then
                    led <= '1';
                    exit;  -- Sai do laço se encontrar o número.
                end if;            
            end loop;
        end if;
        
    end process;
    
end architecture rtl;
