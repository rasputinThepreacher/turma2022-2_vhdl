library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a12_sig_unsig_tb is
end entity;

architecture sim of a12_sig_unsig_tb is

    signal UnsCnt   :   unsigned(7 downto 0) := (others => '0');
    signal SigCnt   :   signed(7 downto 0) := (others => '0');

begin

   
    process is
    begin

        wait for 10 ns;
        -- Atualizar os contadores
        UnsCnt <= UnsCnt + 1;
        SigCnt <= SigCnt + 1;
        
    end process ; -- nd sim ; -- sim
    
    

end architecture;