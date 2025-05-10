import 'dart:collection';
import 'dart:io';



void main(){

  final baralhos = baralho();

  try {
    baralhos.adicionarCarta("ouros");
    baralhos.adicionarCarta("espadas");
    baralhos.adicionarCarta("copas");
    baralhos.adicionarCarta("paus");

    do {
      baralhos.imprimirCartas();
      baralhos.removerCarta();
      print("--------");
      if (baralhos.adcionarBaralho.length == 0) {
        print("Não há mais cartas");
      }
    } while (baralhos.adcionarBaralho.length != 0);
  }catch(e){
    print("$e");
  }

}


class baralho{
 final adcionarBaralho =  Queue<String>();

 void adicionarCarta(String carta){
   if(carta == "ouros" || carta == "paus" || carta == "copas" || carta == "espadas") {
     adcionarBaralho.addFirst(carta);
   }else{
     throw "Erro , tipo de carta invalida";
   }
 }

 void removerCarta(){
   adcionarBaralho.removeFirst();
 }


 void imprimirCartas(){
   for(final indice in adcionarBaralho){
     print(indice);
   }
 }


}



