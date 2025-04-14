-- entity
entity exercicio2 is
end entity;


--constant nome_da_constante : tipo := valor;

-- architecture 
architecture temporizador of exercicio2 is

    constant TimeDelayVerde : time := 30 sec;
    constant TimeDelayAmarelo : time := 5 sec;


begin


        process 
        begin

            report "Verde";
            wait for TimeDelayVerde;

            report "Amarelo";
            wait for TimeDelayAmarelo;

            report "Vermelho";
            wait for TimeDelayVerde;
            

        end process;  
        


    end architecture;

