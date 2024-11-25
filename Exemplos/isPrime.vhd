-- ================================================================
-- ARQUIVO: isPrime.vhdl
-- DESCRIÇÃO:
-- Este módulo VHDL determina se um número inteiro, fornecido através
-- de um switch ('SW'), é um número primo. Um LED específico ('LEDR(0)')
-- é aceso se o número for primo. O algoritmo evita divisões desnecessárias,
-- testando apenas divisores ímpares após verificar se o número é par.
--
-- DEPENDÊNCIAS:
--  - ieee.std_logic_1164.all: Biblioteca para os tipos de lógica padrão.
--  - ieee.numeric_std.all: Biblioteca para operações numéricas com lógica padrão.
-- ================================================================

library ieee;
use ieee.std_logic_1164.all;  -- Inclui os tipos de lógica padrão.
use ieee.numeric_std.all;     -- Inclui operações numéricas para lógica padrão.

entity isPrime is
    generic(
        n   :   integer := 10  -- Define o número de bits para o switch de entrada.
    );
    port (
        SW      : in  unsigned(n - 1 downto 0);  -- Entrada do switch representando um número natural.
        LEDR    : out std_logic_vector(9 downto 0) -- Saída para um vetor de LEDs.
    );
end entity;

architecture rtl of isPrime is
    signal led :	std_logic := '0';  -- Sinal para controle do LED indicativo de número primo.

begin   
    -- Configuração inicial do vetor de LEDs, com apenas o primeiro LED representando se o número é primo.
	LEDR <= (0 => led, others => '0');
    
    -- Processo que verifica se o número da entrada SW é um número primo.
    process(SW) is
        variable i, num: natural := 0;
    begin
        led <= '1';  -- Assume inicialmente que o número é primo.
        i := 3;       -- Começa a verificar divisores a partir de 3.
        num := to_integer(SW);  -- Converte o valor do switch para um número inteiro.

        if num <= 1 then
            led <= '0';  -- Se o número é 1 ou menos, não é primo.
        elsif num = 2 then
            null;  -- 2 é primo, então o LED permanece aceso.
        elsif num mod 2 = 0 then
            led <= '0';  -- Se o número é par e não é 2, então não é primo.
        else
            -- Loop que verifica se há divisores ímpares.
            while i <= num/2 loop
                if num mod i = 0 then
                    led <= '0';  -- Se encontra um divisor, não é primo.
                    exit;  -- Sai do loop se o número não for primo.
                end if;                
                i := i + 2;  -- Incrementa por 2 para verificar apenas ímpares.
            end loop;
        end if;
        
    end process;
    
end architecture rtl;
