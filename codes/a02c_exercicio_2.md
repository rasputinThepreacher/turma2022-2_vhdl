# Exercício: Controle de Semáforo com VHDL

**Objetivo:** Desenvolver um testbench em VHDL que simule o funcionamento de um semáforo utilizando wait for para controlar as transições entre luzes vermelha, amarela e verde.

**Descrição:**
Criar um testbench VHDL que simule um semáforo simples. O semáforo deve seguir a sequência padrão de luzes de tráfego: verde, amarelo e vermelho. Cada luz deve permanecer ativa por um período específico de tempo antes de mudar para a próxima. A simulação deve ser capaz de executar indefinidamente.

**Instruções:**
1. **Inicialização:** Definir uma entidade e arquitetura sem portas, pois o sistema é simulado internamente.
2. **Constantes de Tempo:** Declarar constantes para a duração de cada luz:
   - Verde: 30 segundos
   - Amarelo: 5 segundos
   - Vermelho: 30 segundos
3. **Processo de Simulação:** Criar um processo que utilize um `process` para simular a sequência de luzes do semáforo:
   - A luz verde deve ser ativada primeiro, seguida pela amarela e então a vermelha.
   - Utilizar o comando `report` para imprimir qual luz está ativa no momento.
   - Incluir atrasos apropriados usando `wait for` para cada luz.
   - O process deve permitir que a sequência de luzes se repita indefinidamente.

Este exercício proporciona uma oportunidade prática para os alunos explorarem como loops podem ser aplicados para simular e controlar sistemas de tempo real em VHDL, ao mesmo tempo em que reforça conceitos fundamentais de controle de fluxo e temporização em sistemas embarcados.

---
# Constante em VHDL

Em VHDL, uma **constante** é um identificador que mantém um valor fixo que não muda ao longo de toda a execução do programa. Constantes são úteis para definir valores que são usados frequentemente no código e não requerem modificação, facilitando a manutenção e a legibilidade do código.

## Como declarar uma constante

Para declarar uma constante em VHDL, você pode usar a sintaxe básica no bloco de arquitetura ou dentro de um processo, dependendo do escopo onde a constante será utilizada. A sintaxe é:

```vhdl
constant nome_da_constante : tipo := valor;
```

## Exemplo de Declaração de Constante de Tempo

Aqui está um exemplo de como declarar uma constante de tempo na arquitetura VHDL:

```vhdl
architecture Behavioral of MyCircuit is
    -- Declara uma constante de tempo
    constant TimeDelay : time := 20 ns;
begin
    -- O código que utiliza a constante TimeDelay viria aqui
end architecture;
```

Neste exemplo, `TimeDelay` é uma constante do tipo `time` com um valor de 20 nanosegundos. Essa constante pode ser utilizada em todo o bloco de arquitetura para especificar atrasos de tempo, como em comandos `wait for`.

Utilizar constantes para definir tempos de atraso melhora a clareza do código e facilita ajustes nos tempos de atraso, já que o valor está definido em um único local.

Para utilizar uma constante de tempo no comando `wait for` em VHDL, primeiro você precisa declarar a constante como mencionado anteriormente. Depois, pode utilizar essa constante como argumento para o comando `wait for`, que é usado para introduzir atrasos na execução de um processo.

## Exemplo Completo
Vamos expandir o exemplo anterior para mostrar como você pode usar a constante de tempo `TimeDelay` declarada na arquitetura para controlar um atraso em um processo VHDL.

1. **Declaração da Constante:** 
   - Declarar a constante de tempo na seção de arquitetura.

2. **Uso da Constante no Processo:**
   - Utilizar a constante no comando `wait for` para especificar quanto tempo o processo deve pausar.

```vhdl
architecture Behavioral of MyCircuit is
    -- Declara uma constante de tempo.
    constant TimeDelay : time := 20 ns;
begin
    -- Processo que utiliza a constante TimeDelay para definir um atraso.
    process
    begin
        -- Alguma lógica de processamento aqui, por exemplo:
        report "Processo iniciado.";
        
        -- Espera pelo período definido pela constante TimeDelay.
        wait for TimeDelay;

        -- Continua após o atraso.
        report "20 nanosegundos se passaram.";
        
        -- Pausa o processo indefinidamente após a execução dos comandos.
        wait;
    end process;
end architecture;
```

## Explicação
- **Declaração de Constante:** A constante `TimeDelay` é definida no início da arquitetura e tem um valor atribuído de 20 nanosegundos. Esta constante é do tipo `time`, o que a torna adequada para uso em comandos que exigem especificação de tempo, como `wait for`.
- **Uso em `wait for`:** Dentro do processo, o comando `wait for TimeDelay;` usa a constante para introduzir um atraso de 20 nanosegundos. Isso faz com que o processo pause por esse tempo antes de continuar a executar as próximas linhas de código.
- **Relatório de Processo:** Antes e depois do atraso, o comando `report` é usado para imprimir mensagens na saída de simulação, indicando o início do processo e a conclusão do atraso.

Este exemplo mostra como as constantes de tempo podem ser integradas de forma eficiente em um design VHDL para gerenciar a temporização dentro de simulações, facilitando a leitura, manutenção e modificação dos tempos de atraso definidos em um projeto.