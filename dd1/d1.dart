import 'dart:math';

void main(){

  List<double> raio = [5, 8, 12, 7.3, 18, 2, 25];

  for(final indice in raio){
    print("Raio: $indice, "
        "area: ${ calcularArea(indice).toStringAsFixed(2) }"
        ", perímetro: ${calcularPerimetro(indice).toStringAsFixed(2) }.");
  }
  
  
}


  double calcularArea(double raio) =>  pi * (raio*raio);
  double calcularPerimetro(double raio) => pi * 2 * raio;


  




