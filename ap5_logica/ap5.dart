import 'dart:math';

void main(){
  final random = Random();
  final opcao = random.nextInt(6);

  //  fazendo a 1 verificação do valor
  String Primeriaverificacao =  opcao == 0 || opcao > 5 ? "Opcão Invalida" : "Encontrado $opcao";

  // fazendo a 2 verificação
  String Segundaverificacao =  opcao == 5 ? "Encontrado Final" : Primeriaverificacao;

  // pritando as informações
  print(Segundaverificacao);
}