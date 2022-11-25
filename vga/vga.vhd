library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity vga is
    generic(
        -- Horizontal
        H_ACTIVE_VIDEO  :   integer := 800;
        H_FRONT_PORCH   :   integer := 40;
        H_SYNC_PULSE    :   integer := 128;
        H_BACK_PORCH    :   integer := 88;

        -- Vertical
        V_ACTIVE_VIDEO  :   integer := 600;
        V_FRONT_PORCH   :   integer := 1;
        V_SYNC_PULSE    :   integer := 4;
        V_BACK_PORCH    :   integer := 23
    );
    port (
        clk             :   in  std_logic;
        h_sync          :   out std_logic;
        v_sync          :   out std_logic;
        r, g, b         :   out std_logic_vector(3 downto 0)
    );
end entity;

architecture rtl of vga is

    constant    h_max   :   integer := H_ACTIVE_VIDEO + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH;
    constant    v_max   :   integer := V_ACTIVE_VIDEO + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH;

    signal      x       :   integer range 0 to h_max := 0;
    signal      active  :   boolean range 0 to v_max := 0;

begin

    -- Sync
    process(clk) is
    begin
        if rising_edge(clk) then
            x <= x + 1;
            if x = h_max then
                x <= 0;
                y <= y + 1;
                if y = v_max then
                    y <= 0;
                end if;
            end if;
        end if;
    end process;

end rtl ; -- rtl