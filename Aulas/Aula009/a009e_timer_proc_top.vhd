library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a009e_timer_proc_top is
    port(
        MAX10_CLK1_50   :  in   std_logic; -- Clock
        -- KEY foi colocado como vetor para facilitar o pin planer utilizando o projeto modelo do kit DE10 lite 
        -- Neste projeto, todas as atribuições dos periféricos da placa já estão prontos.
        -- No entanto, KEY deve ser definido como um vetor para que isso funcione adequadamente.
		KEY				:	in   std_logic_vector(0 downto 0); -- Reset: indice 0
        HEX0, HEX1      :  out  std_logic_vector(0 to 6); -- segundos
        HEX2, HEX3      :  out  std_logic_vector(0 to 6); -- minutos
        HEX4, HEX5      :  out  std_logic_vector(0 to 6)  -- horas
    );
end entity;

architecture main of a009e_timer_proc_top is
    signal a, b, c  :   integer range 0 to 60;
begin
    decod_s:    entity work.a009d_decod(rtl)
        port map(a, HEX0, HEX1);

    decod_m:    entity work.a009d_decod(rtl)
        port map(b, HEX2, HEX3);

    decod_h:    entity work.a009d_decod(rtl)
        port map(c, HEX4, HEX5);

    timer_0:    entity work.a009c_timer_proc(rtl)
		  generic map(50e6)
        port map(MAX10_CLK1_50, KEY(0), a, b, c);
end architecture;