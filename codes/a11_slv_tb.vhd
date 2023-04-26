library ieee;
use ieee.std_logic_1164.all;

entity a11_slv_tb is
end entity;

architecture sim of a11_slv_tb is

    signal slv1 :   std_logic_vector(8 downto 1);
    signal clk  :   std_logic_vector(7 downto 0) := "01010101";
    signal slv2 :   std_logic_vector(7 downto 0) := (others => '0');
    signal slv3 :   std_logic_vector(9 downto 0) := (0 => '1', others => '0');
    signal slv4 :   std_logic_vector(7 downto 0) := x"FE";
    signal slv5 :   std_logic_vector(0 to 7) := x"AA";

    
begin

    -- Gera clocks
    process is
    begin
        wait for 10 ns;
        clk <= not clk;
    end process ; -- nd sim ; -- sim
    
    -- Deslocamento de bits
    process is
    begin

        wait for 10 ns;

        for i in slv3'left downto slv3'right + 1 loop
            slv3(i) <= slv3(i - 1);
        end loop;
        slv3(slv3'right) <= slv3(slv3'left);

    end process;

end architecture;