void main(){

  // instanciando a classe programador
Programador programador = Programador();

// chamando os métodos do programador
  programador.dirigir();
  programador.analisarRequisitos();

}



// CLasse  que implementa as classes Programar e Pessoa
class Programador implements  Programar , Pessoa{

// sobreescrevendo os métodos das classes implementadas
  @override
  void dormir() => print("pessoa está dormindo");
  @override
  void dirigir() => print("pessoa está dirigindo");

  @override
  void analisarRequisitos() => print("Programador está analisando requisitos");
  @override
  void reuniaoDiaria() => print("Programador está em uma reunião diaria");
  @override
  void programarCodigo() => print("Programador está programando o código");
}


// CLasse abstrata que implementa os métodos que envolvem pessoa
abstract class Pessoa{
  void dormir() => print("pessoa está dormindo");
  void dirigir() => print("pessoa está dirigindo");
}

// CLasse abstrata que implementa os métodos que envolvem programar
abstract class Programar{

  void analisarRequisitos() => print("Programador está analisando requisitos");
  void reuniaoDiaria() => print("Programador está em uma reunião diaria");
  void programarCodigo() => print("Programador está programando o código");
}