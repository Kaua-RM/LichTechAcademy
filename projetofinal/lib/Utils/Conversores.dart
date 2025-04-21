import 'package:projetofinal/Models/ClasseDados.dart';

//Funções de temperatura

   double Fahrenheit(double celsius) => (celsius * 9/5) + 32;

   double Kelvin(double celsius) => celsius + 273.15;



//Funções de tipos de direções

   double Radianos(double graus) => graus * (3.14 / 180);

   double Graus(double radianos) => radianos * (180 / 3.14);


Verificar parseValor<Verificar extends num>(dynamic valor) {
  final passarValor = valor is String ? num.parse(valor) : valor;

  if (Verificar == int) return (passarValor as num).toInt() as Verificar;
  if (Verificar == double) return (passarValor as num).toDouble() as Verificar;
  throw UnsupportedError('O tipo não foi suportado: $Verificar');
}



 double calcularMedia<tipoClasse>(List<tipoClasse> dados, double Function(tipoClasse) tipo) {
    if (dados.isEmpty){
      throw 'Erro : O calculo está vazio';
    }
    double somar = dados.fold(0.0, (total, item) => total + tipo(item));
    return somar / dados.length;
  }

 double calcularMaximo<tipoClasse>(List<tipoClasse> dados, double Function(tipoClasse) tipo) {
    if (dados.isEmpty) {
      throw 'Erro : O calculo está vazio';
    }
    return dados.map(tipo).reduce((a, b) => a > b ? a : b);
  }

 double calcularMinimo<tipoClasse>(List<tipoClasse> dados, double Function(tipoClasse) tipo) {
    if (dados.isEmpty){
      throw 'Erro : O calculo está vazio';
    }
    return dados.map(tipo).reduce((a, b) => a < b ? a : b);
  }




