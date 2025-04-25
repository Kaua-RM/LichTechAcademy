import 'dart:async';

void main() async{
  print('Iniciando lançamento');

// chamando o future 
 await contador(10);


  print('Foguete lançado!');
}


// Future que retorna uma contagem regressiva a partir do indice 
Future<void> contador(int indice) async{

// for que diminui o valor do indice até 0
   for(int indice = 10 ; indice > 0 ; indice--) {
    // printando o indice 
    print("$indice");
    // delay de 2 segundos 
    await Future.delayed(Duration(seconds: 2));
  }



}