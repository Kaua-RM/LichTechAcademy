void main(){
  List<double> celsius = [0.0, 4.2, 15.0, 18.1, 21.7, 32.0, 40.0, 41.0];

  for(final indice in celsius){
    print("Celsius: $indice, "
        "Fah: ${ fah(indice).toStringAsFixed(2) }"
        ", Kelvin: ${kelvin(indice).toStringAsFixed(2) }.");
  }

}


double fah(double celsius) => (celsius * 9 / 5) + 32;

double kelvin(double celsius) => celsius + 273.15;