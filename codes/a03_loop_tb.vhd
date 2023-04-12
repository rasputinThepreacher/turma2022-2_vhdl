entity a03_loop_tb is
end entity;

architecture sim of a03_loop_tb is

begin

    -- Thread
    process is
        variable i : integer:=0;
    begin
        report "Start!";

        loop
            report "Dentro do loop: " & integer'image(i);
            wait for 20 ns;
            if i = 10 then
                exit;
            end if;  
            i := i + 1;              
        end loop;

        report "Ateh!";
        wait;

    end process;



end architecture;