entity a01_hello_tb is
end entity;

architecture sim of a01_hello_tb is
begin

    -- Thread
    imprime: process is
    begin

        report "Hello World!";
        wait;

    end process;

end architecture;