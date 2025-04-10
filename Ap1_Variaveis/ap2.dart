
import 'dart:io';
import 'dart:core';

void main(){

  // Pedindo para o usuário informar a quantidade de notas

  print("Informe a quantidade de notas : ");

  // criando a variável qtdNotas que recebera do usuário a informação  que servira para demilitar a Lista de Notas

  final int qtdNotas  = int.tryParse(stdin.readLineSync() ?? "") ?? 0 ;

  // Criando a Lista Notas , que é demilitada pela variável acima

  final notas = List.filled(qtdNotas, 0);

  // variável que servira como a soma das notas

  int somanotas = 0;

 // Utilizando o For para receber todas as notas

  for(int i = 0 ; i < qtdNotas ; i++) {
    print("Informe a ${i+1}º das ${qtdNotas} notas : ");
    notas[i] = int.tryParse(stdin.readLineSync() ?? "") ?? 0 ;
    somanotas += notas[i];
  }

  // tornando a lista em String , para demonstrar os valores

  final String visualizarNotas = notas.toString();

  // Printando as informações

  print("A média dos valores $visualizarNotas é : ${somanotas/qtdNotas}");

}