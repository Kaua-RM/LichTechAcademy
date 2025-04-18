## Principais Conceitos da Orientação a Objetos em Dart
#### Abstração
##### Simplifica a realidade, modelando apenas os aspectos relevantes de um objeto.
##### Exemplo: Uma classe Carro pode abstrair características como cor e modelo, ignorando detalhes complexos do motor.
#### Encapsulamento
###### Agrupa dados (atributos) e métodos (comportamentos) em uma classe.Protege os dados, controlando o acesso com atributos privados.

Exemplo:

```Dart

class Carro {
  String _modelo; // Atributo privado

  Carro(this._modelo);

  String getModelo() {
    return _modelo;
  }
}
```
#### Herança
##### Permite criar subclasses que herdam atributos e métodos de superclasses.Promove a reutilização de código.

Exemplo:

```Dart

class Veiculo {
  String marca;

  Veiculo(this.marca);
}

class Carro extends Veiculo {
  String modelo;

  Carro(String marca, this.modelo) : super(marca);
}

```

#### Polimorfismo
##### Objetos de diferentes classes respondem ao mesmo método de maneiras distintas.Aumenta a flexibilidade do código.

Exemplo:

```Dart

abstract class Animal {
  void fazerSom();
}

class Cachorro implements Animal {
  void fazerSom() {
    print('Au au!');
  }
}

class Gato implements Animal {
  void fazerSom() {
    print('Miau!');
  }
}
```

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Todos esses conceitos eu já possuo dominio mais elevado , pois fiquei 2 anos estudanto sobre o Java , programação que é 100% focada em orientação a objetos


---

## Quais as vantagens de usar orientação a objetos em comparação com outras formas de programação? 
+ #### Reutilização de código (herança, polimorfismo).
+ #### Modularidade (classes independentes).
+ #### Manutenibilidade (encapsulamento, abstração).
+ #### Flexibilidade (polimorfismo).

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### A parte de manutabilidade , pode ser encaixado a parte de herança e polimorfismo , além da segurança no código . 


---

## O que é uma 'classe' e como ela se relaciona com 'objetos'? 

+ #### Classe: Modelo que define a estrutura e o comportamento de objetos.

+ #### Objeto: Instância de uma classe.

Exemplo:

```Dart

class Carro {
  String modelo;
  String cor;

  Carro(this.modelo, this.cor);

  void acelerar() {
    print('O carro $modelo acelerou!');
  }
}

void main() {
  Carro meuCarro = Carro('X', 'vermelho');
  meuCarro.acelerar();
}
```

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Classe pode ser considerada como uma ideia , algo abstrato que define o produto final ou como normalmente chamado objeto.  


---

## O que são 'métodos' e como eles funcionam dentro de uma classe?
##### Funções dentro de uma classe que descrevem o comportamento dos objetos.
exemplo
``` dart
class Cachorro {
  String nome;
  String raca;

  // Construtor para inicializar o nome e a raça
  Cachorro(this.nome, this.raca);

  // Método para latir
  void latir() {
    print('$nome (um $raca) está latindo: Au au!');
  }

  // Método para mostrar as informações do cachorro
  void mostrarInfo() {
    print('Nome: $nome, Raça: $raca');
  }

  // Método que recebe um parâmetro
  void brincarCom(String brinquedo) {
    print('$nome está brincando com $brinquedo.');
  }
}

void main() {
  // Criando objetos da classe Cachorro
  Cachorro dog1 = Cachorro('Rex', 'Pastor Alemão');
  Cachorro dog2 = Cachorro('Bolinha', 'Poodle');

  // Chamando os métodos nos objetos
  dog1.latir();       // Saída: Rex (um Pastor Alemão) está latindo: Au au!
  dog1.mostrarInfo();  // Saída: Nome: Rex, Raça: Pastor Alemão
  dog1.brincarCom('a bolinha'); // Saída: Rex está brincando com a bolinha.

  dog2.latir();       // Saída: Bolinha (um Poodle) está latindo: Au au!
  dog2.mostrarInfo();  // Saída: Nome: Bolinha, Raça: Poodle
  dog2.brincarCom('o osso');    // Saída: Bolinha está brincando com o osso.
}

```
----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Os m[etodos são os comportamentos que a classe possui , além disso, para mim a diferença entre método e função , é que o método é uma função ligada a alguma classe , enquanto que uma função é um bloco de código sem nenhuma relação com a classe .  


---

## Como posso acessar os métodos de um objeto em Dart?

##### Para acessar os métodos de um objeto em Dart, você utiliza a notação de ponto (.). Primeiro, você precisa ter criado uma instância do objeto. Em seguida, você escreve o nome da variável do objeto, seguido por um ponto e o nome do método que deseja chamar, incluindo os parênteses () para indicar a chamada do método. Por exemplo, se você tem um objeto pessoa com um método falar(), você o chamaria como pessoa.falar(). 
Exemplo:
``` dart 
meuCarro.acelerar();
```
----
<span style="color:#33b3b6">

### Observações

</span>

+ #### toda essa explicação eu já tinha conhecimento , e na verdade , acaba sendo mais fácil demonstrar essa parte por um exemplo enxuto como o demonstrado. 


---
## Qual a diferença entre atributos 'públicos' e 'privados'? 
+ #### Públicos: Acessíveis de qualquer lugar.
+ #### Privados: Acessíveis apenas dentro da classe (prefixados com _).

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### No dart , o atributo privado , só pode ser acessado no arquivo em que foi declarado. 


---

## Qual a diferença entre um construtor padrão e um construtor nomeado? 

|Construtor|Caracteristica|
|------|-------|
|Padrão:| Sem parâmetros, gerado automaticamente.|
|Nomeados:| Com nome e parâmetros, permitem criar objetos de diferentes formas.|

Exemplo:
```Dart

class Ponto {
  double x, y;

  Ponto(this.x, this.y);

  Ponto.origem() {
    x = 0;
    y = 0;
  }
}
```

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Pelo oque eu lembro , construtores já estão implementados dentro de uma classe só que estão implicitos se a gente não invoca , isso acontece no Java e no Dart. 


---

## O que são 'factories' em Dart e quando devo usá-las? 

##### Construtores especiais que podem retornar um novo objeto ou um objeto existente.Úteis para criar objetos de forma complexa ou garantir a unicidade de objetos (Singleton).

Exemplo:
```Dart

class Logger {
  static Logger? _instance;

  Logger._();

  factory Logger() {
    if (_instance == null) {
      _instance = Logger._();
    }
    return _instance!;
  }

  void log(String message) {
    print(message);
  }
}
```

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Um tipo de construtor utilizado para retornar um objeto , isso é bem interresante , não me lembro se existe no Java, mas é uma boa informação para se conhecer.


---