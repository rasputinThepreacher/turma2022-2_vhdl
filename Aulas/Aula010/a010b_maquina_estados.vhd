-- Descrição
-- Objetivo: Cligadotrolar um LED com uma máquina de estados baseada no estado das chaves.
-- Funciligadoamento:
-- Quando CHAVE0 está em 1, a máquina entra no estado "ligado" e acende o LED.
-- Quando CHAVE1 está em 1, a máquina entra no estado "pisca" e o LED pisca.
-- Quando ambas as chaves estão em 0, a máquina entra no estado "desligado" e apaga o LED.

library ieee;
use ieee.std_logic_1164.all;

entity a010b_maquina_estados is
    Port (
        CLK     : in  STD_LOGIC;      -- Clock de entrada
        RESET   : in  STD_LOGIC;      -- Botão de reset
        CHAVE0  : in  STD_LOGIC;      -- Chave para estado "ligado"
        CHAVE1  : in  STD_LOGIC;      -- Chave para estado "pisca"
        LED     : out STD_LOGIC       -- Saída do LED
    );
end entity;

architecture Behavioral of a010b_maquina_estados is

    -- Definição dos estados
    type state_type is (desligado, ligado, pisca);
    signal state, next_state : state_type;
    signal pisca_counter : integer range 0 to 50000000 := 0; -- Para piscar o LED
    signal pisca_signal : STD_LOGIC := '0';

begin

    -- Processo de máquina de estados sequencial
    process(CLK, RESET)
    begin
        if RESET = '0' then
            state <= desligado;
        elsif rising_edge(CLK) then
            state <= next_state;
        end if;
    end process;

    -- Lógica combinaciligadoal da máquina de estados
    process(state, CHAVE0, CHAVE1)
    begin
        case state is
            when desligado =>
                if CHAVE0 = '1' then
                    next_state <= ligado;
                elsif CHAVE1 = '1' then
                    next_state <= pisca;
                else
                    next_state <= desligado;
                end if;

            when ligado =>
                if CHAVE0 = '0' and CHAVE1 = '1' then
                    next_state <= pisca;
                elsif CHAVE0 = '0' and CHAVE1 = '0' then
                    next_state <= desligado;
                else
                    next_state <= ligado;
                end if;

            when pisca =>
                if CHAVE0 = '1' then
                    next_state <= ligado;
                elsif CHAVE1 = '0' then
                    next_state <= desligado;
                else
                    next_state <= pisca;
                end if;

            when others =>
                next_state <= desligado;
        end case;
    end process;

    -- Lógica para cligadotrolar o LED
    process(CLK)
    begin
        if rising_edge(CLK) then
            if state = pisca then
                pisca_counter <= pisca_counter + 1;
                if pisca_counter = 25000000 then
                    pisca_signal <= NOT pisca_signal; -- Troca o estado do LED
                    pisca_counter <= 0;
                end if;
            else
                pisca_signal <= '0';
                pisca_counter <= 0;
            end if;
        end if;
    end process;

    -- Saída do LED
    LED <= '1' when state = ligado else
           pisca_signal when state = pisca else
           '0'; -- LED apagado no estado desligado

end Behavioral;
