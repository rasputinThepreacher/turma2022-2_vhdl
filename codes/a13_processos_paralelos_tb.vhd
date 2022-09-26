library ieee;
use ieee.std_logic_1164.all; -- usado em operações lógicas com os tipos std_logic e std_logic_vector
use ieee.numeric_std.all; -- usado em operações aritméticas com os tipos signed e unsigned  

entity a13_processos_paralelos_tb is
end entity;

architecture sim of a13_processos_paralelos_tb is

    signal Uns   :   unsigned(5 downto 0) := (others => '0');
    signal Mul1, Mul2, Mul3  :   unsigned(7 downto 0);
    signal clk, rst : std_logic := '0';
    
begin

    process is
    begin
        Uns <= Uns + 1;
        wait for 10 ns;                
    end process ; -- nd sim ; -- sim 
    
    -- multiplica Uns por 4
    process is
    begin
        Mul1 <= Uns & "00";
        wait on Uns;
    end process;

    -- multiplica Uns por 4, equivalente ao anterior
    process(Uns) is
    begin
        Mul2 <= Uns & "00";
    end process;

    -- Forma concorrente de se fazer
    Mul3 <= Uns & "00";
    
    -- geraçao de clock
    clk <= not clk after 10 ns;

    rst <= '1' after 35 ns, '0' after 55 ns;
    

end architecture;