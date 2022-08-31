entity a03_loop_tb is
    end entity;
    
    architecture sim of a03_loop_tb is
    begin
    
        -- Thread
        process is
        begin
            report "Start!";

            loop
                report "Dentro do loop";
                wait for 20 ns;
                exit;
            end loop;

            report "Ateh!";
            wait;

        end process;
    
    end architecture;