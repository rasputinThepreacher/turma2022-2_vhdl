library ieee;
use ieee.std_logic_1164.all;

entity shiftreg is
    port(
        KEY     :   in  std_logic_vector(1 downto 0);
        SW      :   in  std_logic_vector(0 downto 0);
        LEDR    :   out std_logic_vector(9 downto 0)
    );
end entity;

architecture rtl of shiftreg is
    signal temp : std_logic_vector(9 downto 0);
	
    -- Define um procedimento para realizar o deslocamento
    procedure shift_proc(signal data: inout std_logic_vector; data_in: in std_logic; nRst: in std_logic; signal clk: in std_logic) is
    begin
        if nRst = '0' then
            data <= (others => '0');
        elsif rising_edge(clk) then
            data <= data_in & data(data'high downto data'low + 1);
        end if;
    end procedure shift_proc;
	
begin
    -- Invoca o procedimento dentro de um processo
--    shift_process: process(KEY, SW, temp)
--    begin
--        shift_proc(temp, SW(0), KEY(1), KEY(0));
--    end process shift_process;

	shift_proc(temp, SW(0), KEY(1), KEY(0));

    LEDR <= temp;

end architecture;
