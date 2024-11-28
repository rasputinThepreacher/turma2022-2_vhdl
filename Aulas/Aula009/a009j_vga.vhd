-- O código imprime três quadrados de cores diferentes em um monitor VGA. A resolução utilizada é
-- 800 x 600 pixels a uma taxa de atualização de 72 Hz. Essas configurações são ideais para
-- o kit de10 Lite, pois é necessário um sinal de clock de 50 MHz, já presente na placa.
-- Para outras configurações é necessário utilizar pll.
-- Referências: https://martin.hinner.info/vga/timing.html, 
--              https://embarcados.com.br/controlador-vga-parte-1/
--              https://www.youtube.com/watch?v=WK5FT5RD1sU

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a009j_vga is
    port (
        MAX10_CLK1_50   :   in      std_logic; -- Clock
        -- KEY             :   in      std_logic_vector(0 to 1);
        VGA_R           :   out     std_logic_vector(3 downto 0);
        VGA_G           :   out     std_logic_vector(3 downto 0);
        VGA_B           :   out     std_logic_vector(3 downto 0);
        VGA_VS, VGA_HS  :   out     std_logic
    );
end entity;

architecture rtl of a009j_vga is

    -- Constantes de temporização, indica o início de cada fase dos sinais VGA
    constant H_ACTIVE_VIDEO    :   integer := 800;
    constant H_FRONT_PORCH     :   integer := H_ACTIVE_VIDEO + 56;
    constant H_SYNC            :   integer := H_FRONT_PORCH + 120;
    constant H_BACK_PORCH      :   integer := H_SYNC + 64;
    constant H_PIXELS          :   integer := 1040;


    constant V_ACTIVE_VIDEO    :   integer := 600;
    constant V_FRONT_PORCH     :   integer := V_ACTIVE_VIDEO + 37;
    constant V_SYNC            :   integer := V_FRONT_PORCH + 6;
    constant V_BACK_PORCH      :   integer := V_SYNC + 23;
    constant V_PIXELS          :   integer := 666;

    -- Procedimento para incrmentar contadores verticais e horizontais
    procedure incrementa(
        signal      contador     :   inout  integer;
        constant    max          :   in     integer;
        constant    habilita     :   in     boolean;
        variable    estouro      :   out    boolean) is
    begin
        estouro := false;
        if habilita then
            if contador = max - 1 then
                estouro := true;
                contador <= 0;
            else
                contador <= contador + 1;
            end if;
        end if;
    end procedure;
	 
	-- Procedimento para imprimir um quadrado na tela
	procedure quadrado(
        constant enable  :   in  boolean;   -- Habilita o quadrado
        constant h, v    :   in  integer;   -- Posição atual da varredura
        constant x, y    :   in  integer;   -- Coordenadas no Quadrado     
        constant w       :   in  integer;   -- Lado do quadrado
        constant color   :   in  std_logic_vector(11 downto 0); -- Cor
        variable draw    :   inout std_logic_vector(11 downto 0)) is    -- Indica quando imprimir a cor do quadrado
    begin
        --draw_out := draw_in;
        if enable then
            if (v >= y - w/2 and v < y + w/2) and (h >= x - w/2 and h < x + w/2) then
                draw := color;
            end if;            
            
        end if;
    end procedure;

    
    -- Alias (apelidos)     
    alias clk   :   std_logic is MAX10_CLK1_50;

    -- Sinais
    signal horizontal   :   integer range 0 to H_PIXELS := 0;    -- 800 x 600 72Hz
    signal vertical     :   integer range 0 to V_PIXELS := 0;     -- 800 x 600 72Hz
    signal active       :   boolean;
	
    
begin

    PIXEL_PROC : process(clk)
        variable controle   :   boolean;
    begin
        
        if rising_edge(clk) then
            VGA_HS <= '1';
            VGA_VS <= '1';
            active <= false;           
            if horizontal >= H_FRONT_PORCH and horizontal < H_SYNC then
                VGA_HS <= '0';
            end if;
            if vertical >= V_FRONT_PORCH and vertical < V_SYNC then
                VGA_VS <= '0';
            end if;
            if horizontal < H_ACTIVE_VIDEO and vertical <= V_ACTIVE_VIDEO then
                active <= true;
            end if;
            incrementa(horizontal, H_PIXELS, true, controle);
            incrementa(vertical, V_PIXELS, controle, controle);
        end if;        
    end process;
    
    process(horizontal, vertical, active)
        variable draw : std_logic_vector(11 downto 0);
    begin
        draw := (others => '0');
        quadrado(active, horizontal, vertical, 350, 275, 60, x"F00", draw);
        quadrado(active, horizontal, vertical, 400, 300, 60, x"0F0", draw);
        quadrado(active, horizontal, vertical, 450, 325, 60, x"00F", draw);

        VGA_R <= draw(11 downto 8); -- red
        VGA_G <= draw(7 downto 4);  -- green
        VGA_B <= draw(3 downto 0);  -- blue
        
    end process;
    
    
end architecture;