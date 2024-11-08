# Exercício: Gerador de Sinal UART para o Caractere 'a' em VHDL

**Objetivo:** Desenvolva um testbench em VHDL que simule a transmissão de um caractere 'a' usando o protocolo UART (Universal Asynchronous Receiver/Transmitter). O exercício deve incluir a geração de um bit de início, o envio dos bits de dados, e um bit de parada.

**Especificações:** Configure a transmissão para 8 bits de dados, sem paridade e um bit de parada com um baud rate de 115200 bps. Utilize o `wait for` para simular o intervalo de tempo entre os bits transmitidos. O testbench deve mostrar cada bit sendo enviado através de comandos `report`, assim como permitir a visualização da forma de onda do sinal transmitido. O envio do caractere 'a' deve ocorrer a cada um segundo.