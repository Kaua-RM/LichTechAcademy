void main(){
  List<int> numero = [3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];
  transformarNumero(numero);
}


void transformarNumero(List<int> numero){

  numero.sort();

  numero.forEach((valor) => print("decimal: $valor,"
      " binário: ${valor.toRadixString(2)},"
      " octal: ${valor.toRadixString(8)},"
      " hexadecimal: ${valor.toRadixString(16)}" ));

}