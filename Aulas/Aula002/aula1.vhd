-- entity
entity exercicio1 is
end entity;


--constant nome_da_constante : tipo := valor;

-- architecture 
architecture temporizacao of exercicio1 is

    constant TimeDelay : time := 20 ns;

begin




        process 
        begin
            report "Start";
            wait for 10 sec;
            report "End";
            wait;

        end process;  
        


    end architecture;

