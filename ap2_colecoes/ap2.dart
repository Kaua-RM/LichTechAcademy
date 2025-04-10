import 'dart:math';

void main(){

  // instanciando a classe Randow
  var random = new Random();

  // Criando a lista valoresAleatorios , que contera 50 valores
  List<int> valoresAleatorios = List.generate(50, (_) => random.nextInt(15));


  //Printando a lista original  por meio do toString
  print("------ Valores antes de se retirar os numeros pares -------");
  print(valoresAleatorios.toString()+"\n");

  // removendo todos os numeros que divididos por 2  tem resto zero da lista
  valoresAleatorios.removeWhere((int valor) => valor % 2 == 0);


  //Printando a lista modificada  por meio do toString
  print("------ Valores após a retirada dos numeros pares -------");
  print(valoresAleatorios.toString());



}