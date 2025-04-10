
import 'dart:math';

void main(){

  // Instanciando a Classe Random

  final random = Random();

  // criando as variáveis
  // elas receberam valores aleatórios , por causa da Classe Random

  double valorAleatorio1 = random.nextDouble();
  double valorAleatorio2 = random.nextDouble();

  // a variável resultado , tera como atribuição a divisão entre valorAleatorio1 e valorAleatorio2

  final resultado = valorAleatorio1 / valorAleatorio2;

  // a variável parteInteira , está recebendo a variável resultado
  // na variável resultado está sendo utilizado o método toInt , que torna o double no valor inteiro

  final parteInteira = resultado.toInt();

  // a variável parteInteira , está recebendo a variável resultado - parteInteira
  // essa subtração resulta na atribuição da parte decimal do valor resultado

  final parteDecimal = (resultado - parteInteira).abs();

  // Printando as informações

  print("----- Valores recebidos -----");

  print("valor  n1 : $valorAleatorio1 ");
  print("valor  n2 : $valorAleatorio2");

  print("----- Resultado da Divisão -----");

  print("Resultado da divisão : $resultado ");

  print("----- Resultado da retirada da parte inteira do resultado -----");

  print("Parte inteira : $parteInteira");

  print("----- Resultado da retirada da parte decimal do resultado -----");

  print("Parte decimal: $parteDecimal");


}