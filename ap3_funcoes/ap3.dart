import 'dart:math';

void main(){

  // Instanciando a Classe Randow
  Random valorAleatorio = new Random();

  // Lista com valores numéricos aleatórios , que servirão como o valor do raio
  final List<double> valorRaio = List.generate(10, (_) => (valorAleatorio.nextInt(99)+1).toDouble());
  
// Laço de repetição que servira para printar os resultados das funções CalcularArea e CalcularPerimetro
  for( final raio in valorRaio){
    final double Area = CalcularArea(raio);
    final double Perimetro = CalcularPerimetro(raio);
    print("Raio : ${raio} cm  Area : ${Area.toStringAsFixed(2)} cm²  Perimetro : ${Perimetro.toStringAsFixed(2)} cm");
  }

}


// Função que calcula aréa 
double CalcularArea(double raio) => pi * pow(raio, 2);

// Função que calcula o perimetro
double CalcularPerimetro(double raio) =>  pi * 2 * raio;

