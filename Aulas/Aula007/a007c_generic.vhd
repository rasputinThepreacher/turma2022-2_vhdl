-- Este design VHDL implementa um multiplexador (mux) parametrizado usando um parâmetro genérico 'dataWidth'.
-- A parametrização permite que o mux seja facilmente ajustado para diferentes larguras de dados sem alterar
-- a lógica interna do código. O parâmetro 'dataWidth' define a largura dos vetores de entrada e saída,
-- tornando o componente versátil e adaptável a diversas aplicações que requerem multiplexação de sinais.

library ieee;
use ieee.std_logic_1164.all; -- Inclui a biblioteca padrão para operações com std_logic e std_logic_vector.
use ieee.numeric_std.all;    -- Inclui a biblioteca para operações com tipos aritméticos como 'unsigned'.

entity a007c_generic is
    generic(dataWidth : integer := 10); -- Parâmetro genérico que define a largura dos dados do mux.
    port(
        sig0, sig1, sig2, sig3  :   in  unsigned(dataWidth - 1 downto 0); -- Entradas do mux com largura parametrizada.
        sel                     :   in  unsigned(1 downto 0); -- Sinal de seleção de 2 bits.
        --sel                   :   in  unsigned(9 downto 0); -- Sinal de seleção de 10 bits.(ALTERADO POR MIM)
		  saida                   :   out unsigned(dataWidth - 1 downto 0); -- Saída do mux com largura parametrizada.
		  
		  chaves                  :   in integer range  0 to 1023;
		  led                     :   out std_logic); 
		  
		  
end entity;

architecture rtl of a007c_generic is

				constant a : integer := 0;
				constant b : integer := 1;
				variable c : integer;

begin

	 


    -- Processo sensível aos sinais de entrada e ao sinal de seleção.
    process(sel, sig0, sig1, sig2, sig3) is
    begin
        case sel is
            when "00" =>
                saida <= sig0; -- A saída assume o valor de sig0 se sel é "00".
            when "01" =>
                saida <= sig1; -- A saída assume o valor de sig1 se sel é "01".
            when "10" =>
                saida <= sig2; -- A saída assume o valor de sig2 se sel é "10".
            when "11" =>
                saida <= sig3; -- A saída assume o valor de sig3 se sel é "11".
            when others => -- Caso o sinal de seleção seja inválido.
                saida <= (others => 'X'); -- Atribui 'X' (desconhecido) a toda a saída.
        end case;
    end process;
	 
	 process(chaves) is
	 begin
			
			while c <= chaves loop
			-- sequencia de fibonacci 
			
			c <= a + b;
			a <= b;
			b <= c;
		
			
			led <= '0'; 
		
	
			if chaves = 3 then
					
					led <= '1';
					
			elsif chaves = 7 then 
					led <=  '1';
					
			elsif chaves = 15 then 
					led <=  '1';
					
			else 	led <= '0';  -- 'W' weak  (teste)
					
			end if;
			
			end loop;
			
	 end process;
	 
end rtl; -- Fim da arquitetura RTL.
