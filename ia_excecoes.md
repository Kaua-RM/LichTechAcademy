## Qual a diferença entre um erro e uma exceção em Dart? 

##### Em Dart, tanto erros quanto exceções representam problemas que ocorrem durante a execução do programa, mas eles geralmente indicam diferentes graus de severidade e expectativas de tratamento.


+ #### Erro (Error): Um Error geralmente representa um problema sério com o sistema ou com a lógica fundamental do programa. Geralmente, erros não são esperados em um código bem escrito e, na maioria das vezes, não se tenta capturá-los. Eles indicam falhas que podem ser difíceis ou impossíveis de se recuperar, como estouro de pilha (StackOverflowError) ou falta de memória (OutOfMemoryError).

+ #### Exceção (Exception): Uma Exception representa um problema que pode ocorrer durante a execução normal do programa, mas que é razoavelmente esperado e para o qual o programa pode tentar se recuperar ou lidar de alguma forma. Exemplos comuns incluem tentar ler um arquivo que não existe (FileNotFoundException) ou realizar uma operação inválida em um objeto.

##### Em resumo: Erros são geralmente mais graves e indicam problemas no nível do sistema ou falhas lógicas irremediáveis, enquanto exceções são mais comuns e representam situações anormais que o código pode tentar tratar.

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### O erro é proviniente do programador , que acaba por realizar alguma lógica ou aplicação com algum problema de sintaxe , o erro deve ser corrigido , não tratado . Já a excessão é proviniente do usuário , o programador deve prever esses pontos em que uma excessão do fluxo original acontece , a excessão deve ser tratada


---

## Em quais situações devo esperar encontrar um erro, e em quais devo esperar uma exceção? 

#### Erros:

+ ##### Problemas com o ambiente de execução (por exemplo, falta de memória).
+ ##### Falhas internas na máquina virtual Dart.
+ ##### Erros de programação muito graves que levam a estados inconsistentes (embora, idealmente, esses sejam pegos durante o desenvolvimento).

#### Exceções:

+ ##### Entrada de dados inválida fornecida pelo usuário.
+ ##### Falha ao abrir ou ler um arquivo.
+  ##### Problemas de rede (por exemplo, falha na conexão).
+ ##### Tentar acessar um índice fora dos limites de uma lista.
+ ##### Realizar operações inválidas em objetos (por exemplo, dividir por zero, embora em Dart isso resulte em um double.infinity ou double.nan).
+ ##### Condições inesperadas em bibliotecas externas.

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Um erro é mais que um simples deslize do programador , ele pode aparecer em toda parte do programa, por isso é sempre bom vericar a instalação da linguagem , o ambiente e tudo que tem haver com a linguagem poder rodar na sua máquina. 


---

##  O que fazem os blocos 'try', 'catch' e 'finally' em Dart? 

##### Esses blocos são usados para lidar com exceções em Dart:

+ #### try: O bloco try contém o código que pode potencialmente lançar uma exceção. O Dart começa executando o código dentro do bloco try.

+ ##### catch: Se uma exceção ocorrer dentro do bloco try, a execução é imediatamente transferida para o bloco catch correspondente. Você pode ter múltiplos blocos catch para lidar com diferentes tipos de exceções. O bloco catch recebe o objeto da exceção capturada (e opcionalmente o rastreamento da pilha).

+ ##### finally: O bloco finally contém código que sempre será executado, independentemente de uma exceção ter sido lançada ou não dentro do bloco try (e se foi capturada ou não). É comumente usado para realizar tarefas de limpeza, como fechar arquivos ou liberar recursos.

```Dart

try {
  // Código que pode lançar uma exceção
  int resultado = 10 ~/ 0; // Isso lançará uma IntegerDivisionByZeroException
  print('Resultado: $resultado'); // Esta linha não será alcançada
} catch (e) {
  // Bloco para capturar e lidar com a exceção
  print('Ocorreu um erro: $e');
} finally {
  // Bloco que sempre será executado
  print('Bloco finally executado.');
}
```
----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Já conhecia a parte de try cath , pois tive que aprender esse conteudo para uma prova de suficiência do curso técnico de Desenvolvimento de Sistemas , não é tão complicado , só é preciso entender alguns pontos importantes como : saber declarar uma excessão , saber criar uma excessão e entre outros.  


---



## Como posso capturar diferentes tipos de exceções usando 'catch'?

##### Você pode ter múltiplos blocos catch para lidar com tipos específicos de exceções. O primeiro bloco catch cujo tipo corresponde ao tipo da exceção lançada será executado. Você também pode ter um bloco catch genérico (sem especificar o tipo) para capturar qualquer exceção que não tenha sido capturada por um bloco catch específico.

```Dart

try {
  // Código que pode lançar diferentes tipos de exceções
  dynamic valor = 'abc';
  int numero = int.parse(valor); // Pode lançar um FormatException
  List<int> lista = [1, 2];
  print(lista[2]); // Pode lançar um RangeError
} on FormatException catch (e) {
  print('Erro de formato: $e');
} on RangeError catch (e, stackTrace) {
  print('Erro de índice: $e');
  print('Rastreamento da pilha:\n$stackTrace');
} catch (e) {
  print('Outro erro ocorreu: $e');
} finally {
  print('Finalizando o tratamento de exceções.');
}
```
##### No exemplo acima, se um FormatException for lançado, o primeiro bloco on FormatException será executado. Se um RangeError for lançado, o segundo bloco on RangeError será executado. Qualquer outra exceção será capturada pelo bloco catch (e) genérico. Note que o bloco catch específico para RangeError também captura o rastreamento da pilha (stack trace).

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Para mim essa parte deve ser só usada em casos bem especifícos , pois pode tornar o código mais difícil de ler e realizar a manutenção.


---

## Em quais situações é útil usar o bloco 'finally'? 
##### O bloco finally é útil em situações onde você precisa garantir que um certo pedaço de código seja executado, independentemente do que aconteça no bloco try. Alguns casos comuns incluem:Liberar recursos: Fechar arquivos abertos, liberar conexões de banco de dados ou liberar outros recursos do sistema.Garantir um estado consistente: Desfazer alterações parciais se uma operação falhar.Log de auditoria: Registrar que uma determinada seção de código foi concluída, com sucesso ou com falha.

```Dart

import 'dart:io';

void main() {
  File? arquivo;
  try {
    arquivo = File('exemplo.txt');
    String conteudo = arquivo.readAsStringSync();
    print('Conteúdo do arquivo: $conteudo');
  } catch (e) {
    print('Erro ao ler o arquivo: $e');
  } finally {
    arquivo?.close(); // Garante que o arquivo seja fechado, se foi aberto
    print('Operação de arquivo concluída.');
  }
}
```

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Não cheguei a utilizar quase nada do finally programando, pois ele é bem especifíco, mas é uma mão na roda quando se precisa conectar o programa ao banco de dados  


---


## Por que eu precisaria lançar uma exceção em meu código? 

##### Você pode precisar lançar uma exceção em seu código para sinalizar que algo inesperado ou inválido aconteceu e que o código atual não pode continuar sua execução de forma segura ou correta. Isso é importante para:

+ #### Indicar falhas: Comunicar claramente que uma operação não pôde ser concluída devido a uma condição específica.
+ #### Impedir estados inválidos: Evitar que o programa continue com dados inconsistentes ou em um estado incorreto.
+ #### Fornecer informações de erro: Dar aos chamadores da sua função ou método a oportunidade de entender o que deu errado e potencialmente tomar medidas corretivas.
+ #### Separar a lógica de tratamento de erros: Permitir que o tratamento de erros seja feito em um nível superior da aplicação, mantendo seu código mais limpo e focado na lógica principal. 

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Se precisa lançar uma excessão , quando alguma parte do código acaba por não seguir o fluxo original do programa, para mim esse é o motivo .  


---


## Como posso personalizar mensagens de erro ao lançar exceções? 

##### Ao lançar uma exceção, você pode fornecer uma mensagem descritiva para ajudar a entender a causa do problema. Muitas classes de exceção em Dart permitem que você passe uma mensagem no construtor.

```Dart

void verificarIdade(int idade) {
  if (idade < 0) {
    throw ArgumentError('A idade não pode ser negativa. Valor fornecido: $idade');
  }
  print('Idade válida: $idade');
}

void main() {
  try {
    verificarIdade(-5);
  } catch (e) {
    print('Erro: $e'); // Saída: Erro: Invalid argument(s): A idade não pode ser negativa. Valor fornecido: -5
  }
}

```

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Na atividade de excessões, eu só utilizei o `throw` e mandava uma mensagem , pois é possivel enviar qualquer objeto pelo `throw` 


---


## Quais são as melhores práticas para lançar exceções em Dart? 
+ #### Lance exceções específicas: Use tipos de exceção que descrevam precisamente a natureza do erro. Isso facilita o tratamento adequado da exceção.
+ #### Forneça mensagens claras e informativas: A mensagem da exceção deve ser útil para entender a causa do problema. Inclua detalhes relevantes, como valores de variáveis ou o contexto em que o erro ocorreu.
+ #### Documente as exceções que sua função pode lançar: Isso ajuda os usuários da sua função a saberem quais erros podem ocorrer e como eles podem ser tratados.
+ #### Lance exceções em situações excepcionais: Não use exceções para fluxo de controle normal do seu programa. Elas devem ser reservadas para situações inesperadas.
+ #### Considere criar suas próprias classes de exceção: Para erros específicos da sua aplicação, criar classes de exceção personalizadas pode fornecer mais informações e permitir um tratamento mais específico.
+ #### Evite capturar Exception genericamente sem uma boa razão: Tentar capturar todas as exceções pode esconder problemas específicos e dificultar a recuperação adequada. Se você capturar uma exceção genérica, considere relançá-la se não puder tratá-la completamente.

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Essa parte de boas maneiras de declaração de excessão , segue a mesma linha de se declarar uma variável , se utilizando de mensagens claras e informativas , assim como se declara o nome de uma variável.


---

## Qual a diferença entre usar 'assert' e lançar uma exceção para verificar condições? 

##### Tanto assert quanto o lançamento de exceções podem ser usados para verificar condições em seu código, mas eles têm propósitos e comportamentos diferentes:

+ #### assert: A instrução assert é usada para verificar condições que devem ser verdadeiras durante o desenvolvimento e teste. Se a condição em um assert for falsa, o programa irá parar a execução (em modo de desenvolvimento ou depuração). Em modo de produção, as instruções assert são geralmente ignoradas e não têm efeito. O objetivo principal do assert é ajudar os desenvolvedores a identificar erros lógicos em tempo de desenvolvimento.

+ #### Lançar uma Exceção: Lançar uma exceção é uma forma de sinalizar que ocorreu um erro em tempo de execução que precisa ser tratado. As exceções são ativas tanto em modo de desenvolvimento quanto em produção e permitem que o programa tente se recuperar da falha.

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### O assert serve para o programador verficar se sua lógica do programa está correta , enquanto que a exception serve para ajudar o usuário a não sair do fluxo original do programa. 


---

## Em quais situações o 'assert' é mais útil durante o desenvolvimento? 
##### O assert é particularmente útil nas seguintes situações durante o desenvolvimento:

+ #### Verificar pré-condições de funções: Garantir que os argumentos passados para uma função atendam a certos requisitos antes que a lógica principal da função seja executada.
+ #### Verificar pós-condições de funções: Confirmar que o estado do programa é como esperado após a execução de uma função.
+ #### Verificar invariantes de classe: Assegurar que as propriedades de um objeto de classe mantêm certos valores ou relações em pontos específicos da execução.
+ #### Detectar estados impossíveis: Sinalizar erros lógicos onde o programa atingiu um estado que nunca deveria acontecer se a lógica estivesse correta.
+ #### Documentação executável: Os asserts servem como uma forma de documentar as expectativas sobre o estado do programa em pontos específicos do código.

```Dart

void processarIdade(int idade) {
  assert(idade >= 0, 'A idade não pode ser negativa.');
  // Lógica para processar a idade
  print('Processando idade: $idade');
}

void main() {
  processarIdade(30); // Isso funcionará normalmente
  // processarIdade(-5); // Isso causará uma falha de asserção em modo de desenvolvimento
}
```

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### O assert serve como um tipo de verficador que auxilia o programador a verificar o fluxo de sua aplicação. 


---


