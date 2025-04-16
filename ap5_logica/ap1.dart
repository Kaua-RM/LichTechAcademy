import 'dart:io';

void main(){
  // pedindo o numero máximo que a lista vai percorrer
  print("Informe o numero máximo que a lista irá percorrer : ");
 final int valorlimite = int.tryParse(stdin.readLineSync() ?? "1") ?? 1 ;

 //pritando as informações
 print("Impar: ${verficarImpar(valorlimite).join("\nImpar: ")}");

}

// Criando a lista que vai verificar se o valor é impar
 List<int> verficarImpar(int parametro){
  //Lista que contera os numeros impares
  List<int> numerosImpares = [];
  //for que verifica os valores
  for(int indice = 0 ; indice <= parametro ; indice++){
    if(indice.isEven){continue;}
    numerosImpares.add(indice);
  }
  return numerosImpares;
}