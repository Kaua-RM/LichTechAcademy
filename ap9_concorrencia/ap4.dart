void main() {
buscarDados("arquivo.txt");
}

// future que simula a busca de um arquivo 
Future<void> buscarDados(String dados) async{
  
  //printando a frase : Buscando $dados
  print("Buscando $dados ");
  // delay de 4 segundos 
  await Future.delayed(Duration(seconds: 4));
  //printando a frase : Arquivo $dados foi achado
  print("Arquivo $dados foi achado");
  // delay de 2 segundos 
  await Future.delayed(Duration(seconds: 2));
  //printando a frase : Abrindo Arquivo $dados
  print("Abrindo Arquivo $dados ");
}