## Sobre a interação com a IA 

Ao pesquisar sobre os prompts propostos , observei muitos contéudos que já estão habilitados no curso , entretanto , a IA conseguiu aprofundar esses contéudos bases , como vai ser verificado aqui neste documento

----


## Sobre as boas praticas ao declarar variáveis 


- Ao se declarar variaveis , é preciso se antentar a `clareza` da variavel , ou seja , se o nome dela descreve a funcionalidade que a mesma possui no código , evitando nomes genéricos como `x` , `temp` ou `valor1` . Além disso , é viavel se utilizar o padrão `camelCase`. Todavia , é preciso analisar outros fatores , como a `tipagem` , `SafeNull` e outros assuntos  que serão abordados mais para fente.

- Exemplo:

```dart
Exemplo:
// Boa prática: tipagem explícita e nome significativo
String nomeDoUsuario = "João Silva";

// Boa prática: constante em tempo de compilação
const double pi = 3.14159;

// Boa prática: variável final
final int codigoDoProduto = 12345;

// Boa prática: inicialização com null safety
String? endereco;
```




----

## Sobre a utilização das variáveis nulas(`?`) e o modificador `late`

- Para se utilizar da melhor forma possível as variáveis nulas , é preciso entender que o DART possui o sistema de segurança contra as mesmas , sendo conhecido como `NullSafet`, que impedi a não atribuição de valores , entretanto , se for realmente necessário , o DART possui a `?` como forma de burlar este sistemas , veja uma demonstração:

``` dart 
// Dados de um usuário que podem ou não ter um endereço
String? enderecoUsuario;

// Função que busca o endereço do usuário (pode retornar null)
String? buscarEndereco(int idUsuario) {
  // Simulação de busca no banco de dados
  if (idUsuario == 1) {
    return "Rua A, 123";
  } else {
    return null;
  }
}
```

- Agora, em relação ao modificador `late` , o DART proíbe que a atribuição de uma variável não aconteca em sua criação, esse fator além de restrigir o  programador a ter colocar um valor na variavel que pode ser usada depois , acaba por gastar mais dados do que o necessário , como por exemplo , a chamada de uma função dentro de uma  que não será utilizada no momento da criação da variável que ira armazenar ela. Todavia , o DART possui o modificador `late` , que possibilita o programador a atribuir valores na variável após sua criação , além de verificar se a variável com alguma função está sendo chamada , gerando uma otimização nos recurso e melhorando o desempenho do projeto. Veja um exemplo : 

```dart 
class Exemplo {
  late String? texto; // Pode ser nulo, inicialização tardia

  void iniciar() {
    texto = "Olá"; // Inicialização
  }

  void mostrar() {
    iniciar(); // Inicializa antes de usar
    print(texto);
  }
}
```

---

- ### *SE QUISER VERIFICAR O TEMPO DA APLICAÇÃO PARA FINS DIDÀTICOS , UTILIZE O CÓDIGO ABAIXO*

```dart 

import time

inicio = time.time()

# Seu código aqui
for i in range(1000000):
  pass

fim = time.time()

tempo_total = fim - inicio

print(f"Tempo de execução: {tempo_total} segundos")

```

---


## Sobre a diferença entre Final e Const

- Mesmo parecendo que os dois métodos possuem a mesma função , o `final` e o `const` tem peculariedades que os diferem um do outro e para essa diferença ficar mais visível , vai ser utilizado uma planilha  que se encontra abaixo do texto , que contém as principais contraposições entre os dois : 

|Tempo de inicialização	| Tempo de execução	| Tempo de compilação| 
| ------- | ------  | ------ |
|`Imutabilidade`|	Superficial	|Profunda|
|`Flexibilidade`	| Mais flexível |	Menos flexível | 
|`Otimização`	| Menos otimizado | 	Mais otimizado |

----

- ### `OBS`

*Imutabilidade superficial* : `se você declarar uma variável final atribuida com um método ou função , o valor dentro do método ou função pode mudar e consequentemente o valor da variável támbem `. Mas por que isso acontece ? O `final` é colocado quando se quer que a variável seja atribuida somente uma vez , ou seja , ele não está realmente preucupado com o valor , mas sim , se atribuição está acontecendo apenas uma vez.

*Menos Otimizado* : Como o `final` não está realmente preucupado com o valor da variável , ele não conhece o valor posto para ele em tempo de compilação , na verdade , o valor fica desconhecido durante quase toda a aplicação. Entretanto , todavia , o `const` reconhece os valores em tempo de compilação , isso faz ele ser mais otimizado 


----

## Sobre o glossário de métodos do tipo objeto String 

| Métodos para manipulação básica       | Descrição                                                                 |
|---------------|---------------------------------------------------------------------------|
| `length`      | Retorna o comprimento da string.                                          |
| `isEmpty`     | Retorna `true` se a string estiver vazia.                                 |
| `isNotEmpty`  | Retorna `true` se a string não estiver vazia.                              |
| `trim`        | Remove espaços em branco do início e do final da string.                 |
| `trimLeft`    | Remove espaços em branco do início da string.                               |
| `trimRight`   | Remove espaços em branco do final da string.                              |
| `toLowerCase` | Converte todos os caracteres da string para minúsculas.                 |
| `toUpperCase` | Converte todos os caracteres da string para maiúsculas.                 |




| Métodos para busca e substituição       | Descrição                                                                                                                                                                                                                                 |
|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `contains`    | Retorna `true` se a string contém o padrão especificado.                                                                                                                                                                                    |
| `startsWith`  | Retorna `true` se a string começa com o padrão especificado.                                                                                                                                                                                 |
| `endsWith`    | Retorna `true` se a string termina com o padrão especificado.                                                                                                                                                                                 |
| `indexOf`     | Retorna o índice da primeira ocorrência do padrão na string.                                                                                                                                                                                |
| `lastIndexOf` | Retorna o índice da última ocorrência do padrão na string.                                                                                                                                                                                 |
| `replaceAll`  | Substitui todas as ocorrências do padrão por uma nova string.                                                                                                                                                                               |
| `replaceFirst`| Substitui a primeira ocorrência do padrão por uma nova string.                                                                                                                                                                              |
| `substring`   | Retorna uma parte da string, começando no índice inicial e terminando no índice final (opcional).                                                                                                                                         |
| `split`       | Divide a string em uma lista de substrings, usando o padrão como delimitador.                                                                                                                                                              |


| Métodos para formatação   | Descrição                                                                      |
|-----------|---------------------------------------------------------------------------------|
| `padLeft` | Preenche o início da string com um caractere de preenchimento até a largura desejada. |
| `padRight`| Preenche o final da string com um caractere de preenchimento até a largura desejada. |


----

 ## Sobre o glossário de métodos do tipo objeto int

 | Método            | Descrição                                                                                                                                                                                                                                                                                                                                                                          |
|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `isEven`          | Retorna `true` se o inteiro for par.                                                                                                                                                                                                                                                                                                                                               |
| `isOdd`           | Retorna `true` se o inteiro for ímpar.                                                                                                                                                                                                                                                                                                                                              |
| `sign`            | Retorna o sinal do inteiro (-1, 0 ou 1).                                                                                                                                                                                                                                                                                                                                            |
| `abs`             | Retorna o valor absoluto do inteiro.                                                                                                                                                                                                                                                                                                                                              |
| `ceil`            | Retorna o menor inteiro não menor que o número. Como já é um inteiro, retorna o próprio valor.                                                                                                                                                                                                                                                                                      |
| `floor`           | Retorna o maior inteiro não maior que o número. Como já é um inteiro, retorna o próprio valor.                                                                                                                                                                                                                                                                                      |
| `round`           | Retorna o valor do inteiro arredondado, como já é um inteiro, retorna o próprio valor.                                                                                                                                                                                                                                                                                             |
| `toDouble`        | Retorna o valor do inteiro como um `double`.                                                                                                                                                                                                                                                                                                                                      |
| `toString`        | Retorna uma representação de string do inteiro.                                                                                                                                                                                                                                                                                                                                  |
| `clamp`           | Retorna o valor do inteiro dentro dos limites definidos. Caso o valor seja menor que o limite inferior, retorna o limite inferior. Caso seja maior que o limite superior, retorna o limite superior.                                                                                                                                                                             |
| `compareTo`       | Compara o inteiro com outro número (inteiro ou `double`). Retorna: -1 se o inteiro for menor que other. 0 se o inteiro for igual a other. 1 se o inteiro for maior que other.                                                                                                                                                                                                        |
| `remainder`       | Retorna o resto da divisão do inteiro por outro inteiro.                                                                                                                                                                                                                                                                                                                         |
| `toRadixString`   | Retorna uma representação de string do inteiro na base numérica especificada (radix).                                                                                                                                                                                                                                                                                               |