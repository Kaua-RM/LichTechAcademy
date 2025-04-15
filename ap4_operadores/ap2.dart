void main(){

  // lista de palavras
  final List<String> Palavras = ["10", "2XXL7", "JOJ0", "99", "381", "AD44", "47", "2B", "123", "78"];

  // invocando a função que converte as palavras em numeros
  ConverterPalavras(Palavras);
  
}

// criando a função que converte as palavras em numeros
void ConverterPalavras(List<String> Palavras){

  //laço de repetição que verificas os valores
for(final indice in Palavras){
  print("${(int.tryParse(indice) ?? 0).}");
}

}