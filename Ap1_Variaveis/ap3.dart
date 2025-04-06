
import 'dart:math';

void main(){

  // Instanciando a Classe Random

   final random = Random();

   // criando as varáveis
   // as primeiras receberam os valores
   //  enquanto que a terceira servira para mudar o valor da 1 variável

   int valorAleatorio1 = random.nextInt(100);
   int valorAleatorio2 = random.nextInt(100);
   late final int variavelparatroca;

   // imprimindo as informações

  print("----- Valores antes da Troca -----");
  
  print("valor aleatorio n1 : $valorAleatorio1 ");
  print("valor aleatorio n2 : $valorAleatorio2");

  // a variavelparatroca recebe o valorAletorio1
   // enquanto que o valorAleatorio1 recebe o valorAleatorio2
   // e o valorAleatorio2 recebe variavelparatroca

  variavelparatroca = valorAleatorio1;

  valorAleatorio1 = valorAleatorio2;

  valorAleatorio2 = variavelparatroca;

  // Printando os valores trocados

  print("----- Valores depois da Troca -----");

  print("valor aleatorio n1 : $valorAleatorio1 \nvalor aleatorio n2 : $valorAleatorio2");




}