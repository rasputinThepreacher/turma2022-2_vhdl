entity a08_if_tb is
end entity;

architecture sim of a08_if_tb is

    signal CntUp    :   integer := 0;
    signal CntDown  :   integer := 10;

begin

    process is
    begin

        CntUp <= CntUp + 1;
        CntDown <= CntDown - 1;
        wait for 10 ns;
        
    end process;

    -- Processo A, Wait on
    process is
    begin
        if CntUp = CntDown then
            report "Processo A: Bingo!";
        end if;

        wait on CntUp, CntDown; -- Lista de sensitividade
        
    end process;

    -- Processo B: lista de sensitividae no início
    process(CntUp, CntDown) is
    begin
        if CntUp = CntDown then
            report "Processo B: Bingo!";
        end if;
    end process;

    -- Processo C: comando if completo
    process is
    begin
        if CntUp > CntDown then
            report "CntUp eh maior";
        elsif CntUp < CntDown then
            report "CntUp eh menor";
        else
            report "Iguais!";
        end if;
        wait on CntUp, CntDown;
    end process;


    
end architecture;