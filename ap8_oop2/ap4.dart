import 'dart:math';

void main(){

  // gerando um numero aleatório entre 0 a 2000
  int numeroAleatorio = Random().nextInt(2000);

  // Chamando o método calcularDobro que recebe a variavel numeroAleatorio
  Calculadora.calcularDobro(numeroAleatorio);

}

// classe que possui o método estatico que calcula o dobro de um numero
class Calculadora{
  static void calcularDobro(int numero){
    print("O dobro de $numero é ${numero*2}");
  }
}