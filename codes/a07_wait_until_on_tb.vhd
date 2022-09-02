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

    process is
    begin
        wait on CntUp, CntDown;
        report "CntUp = " & integer'image(CntUp) & "CntDown = " & integer'image(CntDown);
    end process;

    process is
    begin
        wait until CntUp = CntDown;
        report "**** Bingo! ****";
    end process;


    
end architecture;