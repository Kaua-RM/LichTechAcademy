import 'dart:math';

void main(){

  // instanciando a classe Randow
  var random = new Random();

  // Criando a lista valoresAleatorios , que contera 10 valores
  List<int> valoresAleatorios = List.generate(10, (_) => random.nextInt(100));


 // Criando a estrutura de repetição for , que printa a variavel indice e o elemento em que o indice esta
 for(int indice = 0 ; indice < valoresAleatorios.length ; indice++){
   print("Posicao : ${indice+1} , valor : ${valoresAleatorios[indice]}");
 }
}