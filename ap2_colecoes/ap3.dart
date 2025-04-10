
import 'dart:math';

void main(){

  // instanciando a classe Randow
  var random = new Random();

  // Criando a lista valoresAleatorios , que contera 50 valores
  List<int> valoresAleatorios = List.generate(50, (_) =>  random.nextInt(11) + 10);

  //Printando a lista original antes dos valores repetidos serem excluidos
  print("---- Lista original ----");
  print(valoresAleatorios.toString());

  //Invocando o Set valoresSemDuplicata , que recebera os valores e excluira os dados iguais
  Set<int> valoresSemDuplicata = {};

 // Adicionando o List ao Set , por meio do método addAll
  valoresSemDuplicata.addAll(valoresAleatorios);

  //Printando a lista modificada já com valores repetidos excluidos
  print("\n---- Lista original ----");
  print(valoresSemDuplicata.toString());

}