## O que significa 'sobrescrever' um método em dart e por que eu faria isso?
##### Sobrescrever um método em Dart significa fornecer uma nova implementação para um método que já existe na classe pai (superclasse). Quando você chama um método em um objeto de uma classe filha, o Dart primeiro procura por esse método na própria classe filha. Se ele for encontrado, a implementação da classe filha (o método sobrescrito) é executada. Caso contrário, o Dart procura na hierarquia de classes pai até encontrar uma implementação.

#### Por que você faria isso?

##### A principal razão para sobrescrever um método é modificar ou estender o comportamento herdado da classe pai para atender às necessidades específicas da classe filha. Isso permite o polimorfismo, onde objetos de diferentes classes podem responder à mesma mensagem (chamada de método) de maneiras distintas.

Exemplo:

```Dart

class Animal {
  void fazerSom() {
    print("Som genérico de animal");
  }
}

class Cachorro extends Animal {
  @override
  void fazerSom() {
    print("Au au!"); // Implementação específica para Cachorro
  }
}

class Gato extends Animal {
  @override
  void fazerSom() {
    print("Miau!"); // Implementação específica para Gato
  }
}

void main() {
  Cachorro meuCachorro = Cachorro();
  Gato meuGato = Gato();

  meuCachorro.fazerSom(); // Saída: Au au!
  meuGato.fazerSom();    // Saída: Miau!
}
```
----
<span style="color:#33b3b6">

### Observações

</span>

+ #### O polimorfismo tem como base a sobreescrita dos métodos nas classes filhas , pois diferente da herança , o polimorfismo é um tipo de contrato entre a classe mãe e filha , onde a classe filha deve possuir todos os métodos da mãe. 


---


## Como posso chamar o método original de uma classe pai em um método sobrescrito? 
##### Dentro de um método sobrescrito, você pode chamar a implementação original da classe pai usando a palavra-chave super. Isso é útil quando você quer adicionar um comportamento específico à classe filha, mas ainda precisa executar a lógica básica definida na classe pai.

Exemplo:

```Dart

class SerVivo {
  void respirar() {
    print("Respirando...");
  }
}

class Pessoa extends SerVivo {
  @override
  void respirar() {
    super.respirar(); // Chama a implementação de respirar da classe pai
    print("Inspirando e expirando conscientemente.");
  }
}

void main() {
  Pessoa pessoa = Pessoa();
  pessoa.respirar();
  // Saída:
  // Respirando...
  // Inspirando e expirando conscientemente.
}
```
----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Esse método tem uma utilização muito especifica , cheguei a utilizar ele umas 3 vezes no Java.


---

## Como posso criar um getter para acessar um atributo privado de uma classe? 

##### Em Dart, atributos privados são definidos prefixando seus nomes com um underscore (_). Para acessar o valor de um atributo privado fora da classe, você pode criar um getter. Um getter é um método especial que permite ler o valor de uma propriedade.

Exemplo:

```Dart

class MinhaClasse {
  String _nomePrivado = "Valor Inicial";

  // Getter para acessar _nomePrivado
  String get nome => _nomePrivado;
}

void main() {
  MinhaClasse minhaInstancia = MinhaClasse();
  print(minhaInstancia.nome); // Saída: Valor Inicial
  // minhaInstancia._nomePrivado = "Novo Valor"; // Isso geraria um erro, pois é privado
}

```
----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Achei interresante o dart ter a palavra reservada get , para referenciar os metódos get , isso torna a legibilidade mais fácil para outra pessoal que vai ver o código . 


---

## Em quais situações é melhor usar getters e setters em vez de acessar atributos diretamente? 
##### Em muitas linguagens, getters e setters são usados extensivamente para controlar o acesso aos atributos. Em Dart, o acesso direto aos atributos é comum e geralmente preferível por ser mais conciso. No entanto, existem situações onde getters e setters se tornam vantajosos:

+ #### Encapsulamento e Controle: Se você precisa executar alguma lógica (validação, formatação, notificação de mudanças, etc.) ao ler ou escrever um atributo, getters e setters são a maneira ideal de fazer isso.
+ #### Atributos Computados: Getters podem ser usados para criar propriedades que não são armazenadas diretamente, mas são calculadas dinamicamente com base em outros atributos.
+ #### API Fluida: Em alguns casos, setters podem ser encadeados para fornecer uma API mais fluida.
Exemplo de Getter para Atributo Computado:

```Dart

class Circulo {
  double _raio;

  Circulo(this._raio);

  double get area => 3.14159 * _raio * _raio; // Área é calculada sob demanda
}

void main() {
  Circulo meuCirculo = Circulo(5);
  print("A área do círculo é: ${meuCirculo.area}"); // Saída: A área do círculo é: 78.53975
}

```

Exemplo de Setter para Validação:

```Dart

class Pessoa {
  String _nome;

  Pessoa(this._nome);

  set nome(String novoNome) {
    if (novoNome.isNotEmpty) {
      _nome = novoNome;
    } else {
      print("O nome não pode ser vazio.");
    }
  }

  String get nome => _nome;
}

void main() {
  Pessoa pessoa = Pessoa("João");
  pessoa.nome = "Maria";
  print(pessoa.nome); // Saída: Maria
  pessoa.nome = "";   // Saída: O nome não pode ser vazio.
  print(pessoa.nome); // Saída: Maria (o nome não foi alterado)
}
```
----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Sou acostumado com a utilização dos get e set para atribuitos privados , achei interresante essa parte de variaveis computadas e api fluida.


---

## O que é uma 'classe abstrata' e como ela difere de uma classe normal? 
##### Uma classe abstrata é uma classe que não pode ser instanciada diretamente. Ela serve como um modelo ou um contrato para outras classes. Classes abstratas podem conter métodos abstratos (métodos sem implementação) e métodos concretos (métodos com implementação).

#### Como difere de uma classe normal?

+ #### Instanciação: Classes normais podem ser instanciadas (você pode criar objetos delas usando new ou o construtor diretamente). Classes abstratas não podem. Tentar instanciar uma classe abstrata resultará em um erro.
+ #### Métodos Abstratos: Classes abstratas podem declarar métodos abstratos. Métodos abstratos não têm corpo (apenas a assinatura) e devem ser implementados por qualquer classe concreta que estenda a classe abstrata. Classes normais não podem ter métodos abstratos.

Exemplo:

```Dart

abstract class Forma {
  double calcularArea(); // Método abstrato

  void exibirInformacao() {
    print("Esta é uma forma geométrica."); // Método concreto
  }
}

class Retangulo extends Forma {
  double largura;
  double altura;

  Retangulo(this.largura, this.altura);

  @override
  double calcularArea() {
    return largura * altura; // Implementação do método abstrato
  }
}

class Circulo extends Forma {
  double raio;

  Circulo(this.raio);

  @override
  double calcularArea() {
    return 3.14159 * raio * raio; // Implementação do método abstrato
  }
}

void main() {
  // Forma forma = Forma(); // Isso geraria um erro, pois Forma é abstrata
  Retangulo retangulo = Retangulo(5, 10);
  Circulo circulo = Circulo(7);

  print("Área do retângulo: ${retangulo.calcularArea()}"); // Saída: Área do retângulo: 50.0
  retangulo.exibirInformacao(); // Saída: Esta é uma forma geométrica.

  print("Área do círculo: ${circulo.calcularArea()}");   // Saída: Área do círculo: 153.93791
  circulo.exibirInformacao();   // Saída: Esta é uma forma geométrica.
}
```
----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Essa parte de classe abstrata é um pouco mais desafiador , mas com prática e estudo se torna uma ótima ferramenta para o dia a dia.  


---

## Quando devo usar classes abstratas em vez de classes concretas? 

#### Use classes abstratas quando você quer:

+ #### Definir uma estrutura comum: Fornecer uma base para várias classes relacionadas, garantindo que elas compartilhem certos métodos e propriedades.
+ #### Impor um contrato: Declarar métodos que as subclasses devem implementar, garantindo um comportamento consistente entre elas.
+ #### Evitar instanciação: Impedir que a classe base seja instanciada diretamente, pois ela é apenas um conceito genérico.

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Eu faço analogia com os jogos de luta , que devem possuir alguns métodos como : bater , correr e pular iguais para todos os personagem , ou seja , precisam ter a mesma assinatura do método.  


---


## O que é 'herança' em Dart e como ela funciona? 
##### Herança é um mecanismo fundamental da programação orientada a objetos que permite que uma classe (a classe filha ou subclasse) herde propriedades e métodos de outra classe (a classe pai ou superclasse). A classe filha pode então adicionar novos membros ou sobrescrever os membros herdados.

#### Como funciona?

##### Em Dart, a herança é implementada usando a palavra-chave extends. Quando uma classe estende outra, ela automaticamente ganha acesso aos membros não privados da classe pai.

Exemplo:

```Dart

class Veiculo {
  String modelo;

  Veiculo(this.modelo);

  void acelerar() {
    print("Veículo acelerando.");
  }
}

class Carro extends Veiculo {
  int numeroPortas;

  Carro(String modelo, this.numeroPortas) : super(modelo);

  void buzinar() {
    print("Buzinando!");
  }

  @override
  void acelerar() {
    super.acelerar(); // Chama a implementação de acelerar da classe pai
    print("Carro ganhando velocidade.");
  }
}

void main() {
  Carro meuCarro = Carro("Sedan", 4);
  print("Modelo do carro: ${meuCarro.modelo}"); // Acessa propriedade herdada
  meuCarro.acelerar();                      // Chama método sobrescrito
  meuCarro.buzinar();                       // Chama método específico de Carro
}
```
----
<span style="color:#33b3b6">

### Observações

</span>

+ #### É como a genetica , herdamos caracteristicas especificas de nossos pais , assim como as classes filhas possuem caracteristicas especificas herdadas de sua classe mãe.


---

## Qual a diferença entre herança e composição? 
#### `Herança`: Representa uma relação "é-um". Um Carro é um Veiculo. A classe filha herda o comportamento e os atributos da classe pai. Geralmente, a herança é usada quando existe uma forte relação de especialização entre as classes. No entanto, o uso excessivo de herança pode levar a hierarquias complexas e engessadas.
#### `Composição` : Representa uma relação "tem-um". Uma classe contém instâncias de outras classes como seus membros. Em vez de herdar comportamento, a classe delega tarefas para seus objetos compostos. A composição geralmente promove maior flexibilidade e menor acoplamento entre as classes.
Exemplo de Composição:

```Dart

class Motor {
  void ligar() {
    print("Motor ligado.");
  }
}

class CarroComposto {
  String modelo;
  Motor motor = Motor(); // Carro TEM UM Motor

  CarroComposto(this.modelo);

  void iniciar() {
    print("Iniciando o carro $modelo.");
    motor.ligar(); // Delega a ação de ligar para o objeto Motor
  }
}

void main() {
  CarroComposto meuCarro = CarroComposto("Hatch");
  meuCarro.iniciar();
  // Saída:
  // Iniciando o carro Hatch.
  // Motor ligado.
}
```
##### Em muitos casos, a composição é preferível à herança porque promove um design mais flexível e evita os problemas de acoplamento rígido que podem surgir com hierarquias de herança profundas.

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Acho que já ouvir falar de composição , mas foi algo muito breve , só que esse assunto parece ser muito interessante , vou dar uma olhada mais aprofundada neste assunto.  


---

## O que é uma 'interface' em Dart e como ela define um contrato de comportamento?
##### Em Dart, uma interface é um contrato que define um conjunto de métodos que uma classe deve implementar. Diferentemente de outras linguagens, Dart não tem uma palavra-chave interface explícita. Qualquer classe em Dart pode servir como uma interface.

#### Como define um contrato de comportamento?

##### Quando uma classe "implementa" outra classe, ela se compromete a fornecer sua própria implementação para todos os métodos públicos da classe que está sendo implementada. Isso garante que objetos de diferentes classes que implementam a mesma interface possam ser tratados de forma uniforme em relação aos métodos definidos na interface.

Exemplo:

```Dart

// Qualquer classe pode servir como interface
class Barulhento {
  void fazerBarulho() {
    // Sem implementação aqui, apenas a assinatura
  }
}

class CachorroBarulhento implements Barulhento {
  @override
  void fazerBarulho() {
    print("Woof! Woof!");
  }
}

class GatoBarulhento implements Barulhento {
  @override
  void fazerBarulho() {
    print("Meow! Meow!");
  }
}

void main() {
  CachorroBarulhento dog = CachorroBarulhento();
  GatoBarulhento cat = GatoBarulhento();

  dog.fazerBarulho(); // Saída: Woof! Woof!
  cat.fazerBarulho(); // Saída: Meow! Meow!
}
```

## Como uma classe pode implementar uma interface? 
##### Uma classe implementa uma interface usando a palavra-chave implements, seguida pelo nome da classe que está sendo usada como interface. Uma classe pode implementar múltiplas interfaces separando-as por vírgulas.

Exemplo (implementando múltiplas "interfaces"):

```Dart

class Nadador {
  void nadar() {
    // ...
  }
}

class Corredor {
  void correr() {
    // ...
  }
}

class Triatleta implements Nadador, Corredor {
  @override
  void nadar() {
    print("Triatleta nadando.");
  }

  @override
  void correr() {
    print("Triatleta correndo.");
  }
}

void main() {
  Triatleta atleta = Triatleta();
  atleta.nadar();   // Saída: Triatleta nadando.
  atleta.correr();  // Saída: Triatleta correndo.
}
```
----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Essa parte de qualquer classe poder ser uma interface é bem interessante, e foi citado pelo professor do curso de Dart , aonde ele cita que toda classe possui uma interface implicita. 


---

## Qual a diferença entre herança e implementação de interfaces?

|Característica|Herança (extends)|Implementação de Interfaces (implements)|
|-----|-----|-----|
|Propósito Principal|Reutilizar código e estabelecer uma relação "é-um"|Definir um contrato de comportamento ("pode fazer")|
|Reutilização de Código|A classe filha herda a implementação da classe pai|A classe implementadora deve fornecer sua própria implementação|
|Relação|Forte acoplamento, hierarquia de classes|Acoplamento mais fraco, foco no comportamento|
|Múltipla Herança|Não suportada diretamente em Dart|Suportada (implementando múltiplas interfaces)|
|Construtores|A classe filha pode chamar construtores da classe pai|Não há relação direta com construtores|

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### A vantagem da herança é que você não precisa adicionar todos os métodos da classe pai , enquanto que na interface , a vantagem é que da para implementar mais de uma interface, esses são os pontos mais interessantes para mim . 


---



##  Quais cenários devo usar métodos estáticos em vez de métodos de instância? 
##### Métodos estáticos pertencem à classe em si, e não a uma instância específica da classe. Eles são úteis em cenários onde a funcionalidade está logicamente relacionada à classe, mas não requer acesso aos atributos de uma instância particular.

#### Cenários para usar métodos estáticos:

+ #### Funções Utilitárias: Métodos que realizam tarefas genéricas e não dependem do estado de um objeto (por exemplo, métodos para validar dados, realizar cálculos matemáticos, etc.).

+ #### Métodos de Fábrica: Métodos estáticos que criam e retornam instâncias da própria classe (ou de uma de suas subclasses), muitas vezes com alguma lógica de inicialização específica.

+ #### Constantes da Classe: Embora não sejam métodos, membros estáticos também são usados para definir constantes que pertencem à classe.
Exemplo:

```Dart

class Matematica {
  static double pi = 3.14159;

  static int somar(int a, int b) {
    return a + b;
  }

  static double calcularAreaCirculo(double raio) {
    return pi * raio * raio;
  }
}

void main() {
  print(Matematica.pi);                       // Acessa a constante estática
  int resultadoSoma = Matematica.somar(5, 3); // Chama o método estático
  print("Soma: $resultadoSoma");             // Saída: Soma: 8
  double area = Matematica.calcularAreaCirculo(2);
  print("Área do círculo: $area");           // Saída: Área do círculo: 12.56636
}
```

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### no Java , um método ou atribuito estático não vão mudar seu valor a cada nova instância , vão se manter constantes , independente da instância. 


---


## Como posso acessar um método estático sem criar uma instância da classe?
##### Você acessa um método estático diretamente através do nome da classe, seguido pelo operador ponto (.) e o nome do método, sem a necessidade de criar uma instância da classe.

Exemplo (já demonstrado acima):

```Dart

int resultado = MinhaClasseEstatica.meuMetodoEstatico();

```

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Já teve que fazer isso na atividade , esse ato de não precisar instaciar a classe para chamar o método , isso me fez lembrar bastante do Java 


---

## O que são 'enumeradores' em Dart e para que servem?
##### Enumeradores (ou enums) são um tipo especial de dado que representa um conjunto fixo de valores nomeados. Eles fornecem uma maneira mais legível e segura de trabalhar com um conjunto limitado de opções, em comparação com o uso de constantes inteiras ou strings.

#### Para que servem?


+ #### Legibilidade: Tornam o código mais expressivo, pois você usa nomes significativos em vez de valores brutos.

+ #### Segurança de Tipo: O compilador garante que você só pode usar os valores definidos no enumerador, evitando erros causados por valores inválidos.

+ #### Organização: Agrupam logicamente um conjunto de constantes relacionadas.
Exemplo:

```Dart

enum Cores {
  vermelho,
  azul,
  verde,
  amarelo,
}

void main() {
  Cores corSelecionada
  ```

  ----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Em resumo , enum é uma lista de valores constantes , que podem servir para controlar fluxos ou até manipular api´s


---

  ## Em quais situações é melhor usar enumeradores em vez de constantes? 

##### Use enumeradores (enums) em vez de constantes principalmente quando você precisa de:

+ #### Segurança de Tipo: Garantir que apenas os valores definidos no enum sejam usados, evitando erros.
+ #### Legibilidade e Expressividade: Tornar o código mais claro com nomes significativos para os valores.
+ #### Agrupamento Lógico: Organizar um conjunto fixo de valores relacionados sob um único tipo.
+ #### Facilidade de Iteração: Percorrer todos os valores definidos no enum.
+ #### Uso em switch: Facilitar a criação de estruturas condicionais claras e abrangentes.

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Acredito que o enum seja mais utilizado em controles de fluxos , mas é um ferramente que permite se ter uma lebilidade e organização apliadas . Quase não cheguei a utilizar ele , mas na atividade de oop2 se teve que utilizar e foi bem fácil e prático de se criar e utilizar.


---