import 'dart:io';

 void main(){

   // Pedindo para informar os valores que irão para o construtir da classe Retangulo
  print("Informe a Altura : ");
  final double altura = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
  print("Informe a Largura : ");
  final double largura = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  // Invocando / Instanciando a classe Retangulo
  Retangulo retangulo = new  Retangulo(altura, largura);

  // Printando o resultado do metodo CalcularArea
  print("Area do retângulo: ${retangulo.CalcularArea()}");

}

// Classe que calcular a area de um retangulo
class Retangulo{
  late final double altura;
  late final double largura;

  Retangulo(this.altura , this.largura);

  double CalcularArea() => altura * largura;
}