import 'dart:io';

void main(){

  // pedindo os valores que servirão como parametros para a função
  print("Informe o preço Original : ");
  final double precoOriginal =  double.tryParse(stdin.readLineSync() ?? "1") ?? 1;
  print("Informe o preço da Venda : ");
  final double precoVenda = double.tryParse(stdin.readLineSync() ?? "1") ?? 1;

  // invocando a função
  percentualDeDesconto(precoOriginal, precoVenda);


}

// função que ira verificar o percentual de desconto em cima do valor original e da venda de um produto
void  percentualDeDesconto(double precoOriginal , double precoVenda ){

  // convertendo os valores
 final precoOriginalConvertido = precoOriginal.toInt();
 final precoVendaConvertido    = precoVenda.toInt();

 // calculando o desconto
 final int Desconto = 100 *(precoOriginalConvertido - precoVendaConvertido) ~/ precoOriginalConvertido ;

 // printando o desconto , junto com o preço original e de venda
print(" Preco Original : $precoOriginal  Preco de Venda : $precoVenda  Desconto : $Desconto%");

}