entity a05_while_tb is
end entity;

architecture sim of a05_while_tb is
begin

    -- Thread
    process is
        variable i  :   integer := 0;
    begin
        report "Start!";
        
        while i < 10 loop
            report "i = " & integer'image(i);
            i := i + 2;
        end loop;

        report "Ateh!";
        wait;
    end process;

end architecture;