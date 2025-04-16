import 'dart:math';

void main(){

  Random random = new Random();

  // lista abastecida com 5 valores aleatórios
  final List<int> numero = List.generate(5, (_) => random.nextInt(25));
  // for que printa os valores
  for(final indice in numero){
    print(" Numero ${indice+1} -> Letra ${SequenciaAlfabeto(indice)}");
  }
}


// Criando a função que  retorna a letra que o parametro representa
String SequenciaAlfabeto(int parametro){


  String Alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  // atribuindo as letras a Lista
  List<String> Sequencia = Alfabeto.split("");

  // retornando a letra
  return  Sequencia[parametro];

}

