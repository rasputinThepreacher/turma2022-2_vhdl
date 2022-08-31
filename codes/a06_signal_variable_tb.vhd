entity a06_signal_variable_tb is
end entity;

architecture sim of a06_signal_variable_tb is

    signal mysignal     :   integer     := 0;

begin

    process is
        variable myvariable     :   integer     := 0;
    begin
        report "**** INICIO ****";

        myvariable := myvariable + 1;
        mysignal <= mysignal + 1;

        report "VARIAVEL = " & integer'image(myvariable) & " SINAL = " & integer'image(mysignal);

        myvariable := myvariable + 1;
        mysignal <= mysignal + 1;

        report "VARIAVEL = " & integer'image(myvariable) & " SINAL = " & integer'image(mysignal);

        wait for 10 ns;

    end process;


    
end architecture;