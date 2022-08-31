entity a04_for_tb is
end entity;

architecture sim of a04_for_tb is
begin

    -- Thread
    process is
    begin
        report "Start!";
        
        for i in 1 to 10 loop
            report "i = " & integer'image(i);
        end loop;

        report "Ateh!";
        wait;
    end process;

end architecture;