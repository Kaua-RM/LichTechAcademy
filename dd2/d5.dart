import 'dart:math';


void main() {



  final listaProdutos = controleLista();

  listaProdutos.cadastrarProduto(lista("Ameixa", 2));
  listaProdutos.cadastrarProduto(lista("abacate", 4));
  listaProdutos.cadastrarProduto(lista("peixe", 12));
  listaProdutos.cadastrarProduto(lista("figado", 0));
  listaProdutos.cadastrarProduto(lista("abacaxi", 0));

  for(final indice in listaProdutos.ComprarItens("Ameixa", 2)){
    print(" Produto : ${ indice.nomeProduto} , quantidade : ${indice.quantidade}");
  }

  print("Produtos sem estoque : ");
  for(final indice in listaProdutos.semEstoque()) {
    print(" Produto : ${ indice.nomeProduto} , quantidade : ${indice
        .quantidade}");
  }



  print("Produtos desejados : ");
  for(final indice in listaProdutos.imprimirDocumentos()){
    print(" Produto : ${ indice.nomeProduto} , quantidade : ${indice.quantidade}");
  }

  print("Produto Aleatorio");
  for(final indice in listaProdutos.itemAleatorio()){
    print(" Produto : ${ indice.nomeProduto} , quantidade : ${indice.quantidade}");
  }





}



class lista{
   String nomeProduto;
   int quantidade;

  lista(this.nomeProduto , this.quantidade);

}



class controleLista {

  final listaProdutos = <lista>[];

  void cadastrarProduto(lista listaproduto) => listaProdutos.add(listaproduto);

  List<lista> imprimirDocumentos(){return listaProdutos;}

  List<lista> semEstoque(){

   var listaSemEstoque = <lista>[];

    listaSemEstoque = listaProdutos.where((valor) => valor.quantidade == 0).toList();
   listaProdutos.removeWhere((valor) => valor.quantidade == 0);

    return listaSemEstoque;

  }

  List<lista> itemAleatorio(){
    Random random = Random();
    final item = <lista>[];
    item.add(listaProdutos[random.nextInt(listaProdutos.length)]);
    return item;
  }
  
  
  List<lista> ComprarItens(String produto , int quantidade){

   var compras = <lista>[];


   for(int indice = 0 ; indice < listaProdutos.length ; indice++ ){
     if(listaProdutos[indice].quantidade == quantidade && listaProdutos[indice].nomeProduto == produto){
       compras.add(listaProdutos[indice]);
     }
   }



   listaProdutos.removeWhere((valor) => valor.quantidade == quantidade && valor.nomeProduto == produto);


    print("Indicador de compras : ${compras.length} / ${listaProdutos.length}");
    
    return compras;
  }





}