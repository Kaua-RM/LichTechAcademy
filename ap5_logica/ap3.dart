import 'dart:math';

void main(){

  Random random = new Random();

  // lista gerada com 5 valores aleatórios
  final List<int> numero = List.generate(5, (_) => random.nextInt(900)+100);

  // Pritando as informações
  print(" A soma dos números pares entre 0 e 100 e 1000 : ${somaDosPares(numero)} ");

}

// Função que soma os valores Pares
int somaDosPares(List<int> parametroLista){

  int soma = 0;

  // verificar os valores pares e somar eles
  for(final indice in parametroLista ){

    if(indice.isOdd){continue;}

    soma +=  indice;
    
  }

  // retornando os valores
  return soma;

}