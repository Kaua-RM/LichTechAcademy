

void main(){

  // instanciando a classe linceEuroasiatico
  final animal = linceEuroasiatico();

  // chamando os métodos da classe linceEuroasiatico
  animal.comer();
  animal.beber();
  animal.cacar();

}

// classe que  extende  animal
class linceEuroasiatico extends animal{

  void cacar() => print("Lince euroasiatico está caçando uma lebre");

}


// Classe abstrata que possui os métodos comer e beber
abstract class animal{

  void comer() => print("O animal está comendo");

  void beber() => print("O animal está bebendo");

}