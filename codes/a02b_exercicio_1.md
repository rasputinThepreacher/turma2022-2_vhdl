# Exercício 1: Criação de Testbench para Mensagens Temporizadas em VHDL

**Objetivo:** Desenvolver um testbench em VHDL que demonstre o uso do comando `report` para imprimir mensagens em momentos específicos durante a simulação.

**Descrição:**
Este exercício visa introduzir o conceito de temporização em testbenches VHDL. Você irá criar um testbench que imprime a mensagem "Start" no console no início da simulação (em 0 segundos) e "End!" após 1 segundo.

**Instruções:**
1. Utilize a unidade de tempo "segundos" para definir os intervalos de tempo.
2. Empregue o comando `report` para imprimir as mensagens no console de simulação.
3. Certifique-se de que o processo seja interrompido após a impressão da segunda mensagem, evitando que ele reinicie automaticamente.

**Requisitos:**
- A simulação deve iniciar com a impressão de "Start".
- Após um intervalo de 1 segundo, a simulação deve imprimir "End!".
- O testbench deve ser definido sem portas externas, pois é utilizado apenas para simulação.

---

# Unidades de tempo em VHDL
No VHDL, as unidades de tempo são usadas para especificar durações e intervalos de tempo nos seus designs. As unidades básicas são:

- **fs** (femtosegundos)
- **ps** (picosegundos)
- **ns** (nanosegundos)
- **us** (microssegundos)
- **ms** (milissegundos)
- **sec** (segundos)

Você pode usar essas unidades diretamente nos seus códigos para definir atrasos ou intervalos de tempo, por exemplo:

```vhdl
wait for 10 ns; -- espera por 10 nanosegundos
```

Em situações onde você precisa de precisão ou escalas de tempo diferentes, pode ajustar as unidades conforme necessário. Essas unidades são essenciais para simular o comportamento temporal de circuitos em VHDL.
