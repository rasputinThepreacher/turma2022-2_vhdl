# Exercício: Identificador de número da sequencia de Fibonacci

**Objetivo:** Crie um código em VHDL que indique se as chaves do kit de10 lite representam um número da sequência de Fibonacci.

## Operadores lógicos

Os operadores lógicos em VHDL são fundamentais para a construção de expressões que controlam o fluxo de dados e a lógica de decisão em circuitos digitais. Esses operadores permitem a realização de operações lógicas básicas, como AND, OR, NOT, NAND, NOR, XOR, e XNOR, que são a base para o desenvolvimento de funções mais complexas em circuitos digitais.

Os operadores lógicos podem ser aplicados a vários tipos de dados específicos que são comumente usados para representar sinais e condições em projetos de circuitos digitais. Esses tipos de dados incluem:

1. **STD_LOGIC e STD_LOGIC_VECTOR**:
   - `STD_LOGIC` é um dos tipos de dados mais usados em VHDL, representando um único bit que pode ter nove valores possíveis, incluindo '0', '1', 'Z' (alta impedância), 'W' (weak, fraco), 'L' (low), 'H' (high), '-' (don't care), 'X' (desconhecido), e 'U' (não inicializado).
   - `STD_LOGIC_VECTOR` é uma coleção de elementos `STD_LOGIC`, usada para representar um grupo de sinais digitais ou um bus de dados.
   - Os operadores lógicos podem ser usados para manipular esses tipos, aplicando operações bit a bit em vetores ou entre elementos individuais de `STD_LOGIC`.

2. **BOOLEAN**:
   - O tipo `BOOLEAN` é usado para representar valores verdadeiros ou falsos, típicos em expressões condicionais e controle de fluxo lógico.
   - Os operadores lógicos como AND, OR e NOT são frequentemente usados com variáveis `BOOLEAN` para construir condições lógicas complexas dentro de estruturas de controle como `if` e `case`.

3. **BIT e BIT_VECTOR**:
   - Similar ao `STD_LOGIC`, o tipo `BIT` representa um único bit que pode ser '0' ou '1'.
   - `BIT_VECTOR` é uma coleção de bits e pode ser manipulada por operadores lógicos da mesma forma que `STD_LOGIC_VECTOR`.
   - A diferença principal entre `BIT`/`BIT_VECTOR` e `STD_LOGIC`/`STD_LOGIC_VECTOR` está na menor quantidade de estados possíveis para `BIT`, o que pode simplificar algumas operações lógicas.

Os operadores lógicos são fundamentais para esses tipos de dados em VHDL, pois permitem a implementação direta da lógica digital, que é essencial no design e simulação de circuitos eletrônicos. O uso desses operadores com os tipos de dados adequados garante que o comportamento dos circuitos projetados em VHDL seja claro e correto, especialmente ao modelar e simular a lógica de controle e os caminhos de dados em sistemas digitais complexos.

### Tipos de Operadores Lógicos em VHDL

1. **AND** (`and`):
   - Realiza a operação lógica E entre dois ou mais sinais ou condições.
   - Retorna `TRUE` apenas se todos os operandos forem `TRUE`.

2. **OR** (`or`):
   - Realiza a operação lógica OU entre dois ou mais sinais ou condições.
   - Retorna `TRUE` se pelo menos um dos operandos for `TRUE`.

3. **NOT** (`not`):
   - Realiza a operação lógica NÃO em um sinal ou condição.
   - Inverte o valor do operando; se `TRUE` retorna `FALSE`, e vice-versa.

4. **NAND** (`nand`):
   - Realiza a operação lógica E-NÃO entre dois ou mais sinais.
   - Retorna `FALSE` apenas se todos os operandos forem `TRUE`.

5. **NOR** (`nor`):
   - Realiza a operação lógica OU-NÃO entre dois ou mais sinais.
   - Retorna `TRUE` apenas se todos os operandos forem `FALSE`.

6. **XOR** (`xor`):
   - Realiza a operação de OU exclusivo entre dois sinais.
   - Retorna `TRUE` se os operandos tiverem valores diferentes.

7. **XNOR** (`xnor`):
   - Realiza a operação de NÃO-OU exclusivo entre dois sinais.
   - Retorna `TRUE` se os operandos tiverem o mesmo valor.

### Exemplo Prático

Aqui está um exemplo simples de como esses operadores podem ser usados em VHDL para controlar a lógica de um circuito simples:

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Logic_Operations is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out STD_LOGIC_VECTOR(6 downto 0));
end Logic_Operations;

architecture Behavioral of Logic_Operations is
begin
    C(0) <= A and B;         -- AND operation
    C(1) <= A or B;          -- OR operation
    C(2) <= not A;           -- NOT operation
    C(3) <= A nand B;        -- NAND operation
    C(4) <= A nor B;         -- NOR operation
    C(5) <= A xor B;         -- XOR operation
    C(6) <= A xnor B;        -- XNOR operation
end Behavioral;
```

Neste exemplo, as entradas `A` e `B` são combinadas usando diferentes operadores lógicos, e os resultados são atribuídos aos diferentes bits do vetor de saída `C`.

### Conclusão

Os operadores lógicos são essenciais para o desenvolvimento de hardware em VHDL, permitindo a implementação de diversas funções lógicas que são cruciais no design de sistemas digitais. Cada operador tem sua utilidade específica e, dependendo da necessidade do projeto, pode-se escolher o mais adequado para otimizar a performance e a funcionalidade do circuito.