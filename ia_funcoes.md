##  Quais cuidados devo ter ao criar funções em dart? 
+ ### Ao criar funções em Dart, é crucial seguir algumas práticas recomendadas para garantir um código limpo, eficiente e de fácil manutenção:

##### `Nomeação Descritiva`: Escolha nomes de funções que descrevam claramente o que a função faz. Isso facilita a leitura e o entendimento do código.
##### `Responsabilidade Única`: Cada função deve ter uma única responsabilidade. Evite funções que realizam múltiplas tarefas, pois isso dificulta a depuração e a reutilização do código.
##### `Tipagem Clara`: Utilize a tipagem estática do Dart para definir os tipos de parâmetros e o tipo de retorno da função. Isso ajuda a prevenir erros em tempo de compilação e torna o código mais seguro.
##### `Documentação`: Adicione comentários e documentação às suas funções, explicando o propósito, os parâmetros e o valor de retorno. Isso facilita a colaboração e a manutenção do código.
##### `Testes Unitários`: Escreva testes unitários para suas funções para garantir que elas funcionem corretamente em diferentes cenários.

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Muitas dessas informações eu já tinha conhecimento , entretanto , a parte de responsabilidade única era um termo que não me lembrava , mas que coloco em prática sempre. 


---

## Posso chamar minha função dentro dela mesma? 
#####  Sim, você pode chamar uma função dentro dela mesma. Esse conceito é conhecido como recursão. A recursão é útil para resolver problemas que podem ser divididos em subproblemas menores e semelhantes.

Exemplo de recursão
```Dart

int fatorial(int n) {
  if (n <= 1) {
    return 1;
  }
  return n * fatorial(n - 1);
}

```

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Essa informação eu não tinha conhecimento , só ouvi ser citado na mentoria , mas não tinha conhecimento sobre ela.


---

## Existe limite de parâmetros a serem recebidos em uma função?  
##### Em Dart, o limite de parâmetros que uma função pode receber é definido pela implementação da máquina virtual Dart (Dart VM). No entanto, na prática, é recomendado evitar funções com um número excessivo de parâmetros, pois isso pode tornar o código difícil de ler e manter.

----
<span style="color:#33b3b6">

### Observações

</span>

+ ####  Eu pensava sim que tinha um limite , mas que era imposto pelo programador , e não pela própria máquina virtual, só que mesmo podendo se adicionar vários parâmetros , não é nada benefico para a legibilidade do código 


---

## É recomendado usar de dynamic nos parâmetros de uma função? 
##### Embora o tipo dynamic permita que uma variável receba qualquer tipo de valor, seu uso excessivo em parâmetros de função é geralmente desencorajado. Isso ocorre porque o dynamic remove a verificação de tipo estática do Dart, o que pode levar a erros em tempo de execução.O dynamic pode ser útil em situações em que o tipo de valor que uma função receberá é desconhecido ou pode variar. No entanto, é importante usar o dynamic com cautela e documentar claramente o comportamento da função.

----
<span style="color:#33b3b6">

### Observações

</span>

+ ####  Eu pensava sim que tinha um limite , mas que era imposto pelo programador , e não pela própria máquina virtual, só que mesmo podendo se adicionar vários parâmetros , não é nada benefico para a legibilidade do código 

---

## Quando usar os operadores de valores opcionais e valores requeridos em uma função dart? 
##### Em Dart, você pode definir parâmetros opcionais e requeridos em funções.

+ ####  Parâmetros opcionais
##### Parâmetros opcionais são definidos entre colchetes [] ou chaves {}. Eles podem ter valores padrão e podem ser omitidos na chamada da função.

+ #### Parâmetros requeridos
##### Parâmetros requeridos são definidos sem colchetes ou chaves. Eles devem ser fornecidos na chamada da função.

Exemplo
```Dart

void saudacao(String nome, [String sobrenome = '']) {
  print('Olá, $nome $sobrenome!');
}

saudacao('João'); // Olá, João!
saudacao('Maria', 'Silva'); // Olá, Maria Silva!

```

----
<span style="color:#33b3b6">

### Observações

</span>

+ ####  Acredito que nessas informações podem existir alguma inconsistência , pois para a parte de parâmentros opcionais é preciso somente  usar [] e a {} é usada para  declarar um parâmetro nomeavel , e a parte de `required` , teria sido interressante a IA citar essa expressão.  

---

## O que são parâmetros nomeados em uma função? 
##### Parâmetros nomeados são definidos entre chaves {} e podem ser passados em qualquer ordem na chamada da função. Eles são úteis quando uma função tem muitos parâmetros opcionais.

Exemplo
```Dart

void saudacao({String nome, String sobrenome}) {
  print('Olá, $nome $sobrenome!');
}

saudacao(sobrenome: 'Silva', nome: 'Maria'); // Olá, Maria Silva!

```

----
<span style="color:#33b3b6">

### Observações

</span>

+ ####  Não tive a oportunidade de testar muito bem essa parte , mas acredito que para algumas situações , seja muito útil , como a parte de integrar o front com o banco de Dados.  

---

## Quais métodos existem para variáveis do tipo Function em dart? 

##### Em Dart, variáveis do tipo Function podem ser chamadas como funções e possuem os seguintes métodos:

|Método|Funcionalidade|
|-------|-------------|
|`call():`|Chama a função.|
|`apply():`|Chama a função com uma lista de argumentos.|

----
<span style="color:#33b3b6">

### Observações

</span>

+ ####  Achei que teria mais , são até bem poucos métodos.

---


 
 
## Qual a diferença entre chamar minha função chamado olaMundo das seguintes formas “olaMundo” e “olaMundo()”. 
+ #### `olaMundo`: Retorna a referência da função.
+ #### `olaMundo()`: Chama a função e retorna o valor de retorno. Com essas informações, você estará bem equipado para criar funções eficientes e de alta qualidade em Dart.

----
<span style="color:#33b3b6">

### Observações

</span>

+ ####  Já tinha percebido isso antes das aulas de funçoes , pois em um desafio tive que passar uma função como parâmetro e descobri que eu poderia somente invocar o valor da função em si. 

---