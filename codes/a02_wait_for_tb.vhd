entity a02_wait_for_tb is
end entity;

architecture sim of a02_wait_for_tb is
begin

    -- Thread
    process is
    begin
        -- O processo inicia aqui!
        report "Hello World!";
        wait for 10 ns;
        -- O processo retorna para o inicio!
    end process;

end architecture;