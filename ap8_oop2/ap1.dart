import 'dart:math';

// lista de valores constantes
enum generoMusical{
  Rock,
  Trap,
  Pop,
  Classica,
  Pagode,
  Sertaneja,
  HipHop,
}

void main(){
  // gerando número aleátorio
  int generoAleatorio = Random().nextInt(8);

  // printando o genero musical da lista de valores no Enum
  print(generoMusical.values[generoAleatorio]);
}