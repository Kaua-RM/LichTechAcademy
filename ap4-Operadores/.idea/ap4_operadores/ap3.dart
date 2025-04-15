import 'dart:io';

void main(){

  // lista que ira possuir o retorno da função atribuida
  final List<int>? numeros = AdicionarValorLista().toList();
  // variavel utilizada para se informar o numero que quer se remover
  late int? removerNumero;

// perguntando o numero que se quer remover
print("Informe o numero que quer remover :");
removerNumero = int?.tryParse(stdin.readLineSync() ?? " ");

// invocando a função que removera o numero informado
removerDaLista(numeros , removerNumero);


}

//criando a função que removera um numero da lista
List<int>  removerDaLista(List<int>? listaParametro , [ int? parametroOpcional ]){

  // printando a lista antes de se remover o numero
  print("Lista : ${listaParametro.toString()}");

  // removendo o numero
  listaParametro?.remove(parametroOpcional);

  // printando a lista após a remoção
  print("Lista : ${listaParametro.toString()}");

  // retornando a lista
  return listaParametro ?? [];

}

//criando a lista que adicionara os valores na lista numeros
List<int> AdicionarValorLista(){

 // condicional do while
  String Continuar = "sim";

  // lista que irá ser retornada
  List <int> listaParametro = [];

  // pritando as informações do que se fazer
  print("___ Informe os numeros que devem estar na Lista ___");

  // operador de fluxo que verifica se o usuario quer continuar
  while( Continuar == "sim"){

    // adicionando o valor
    print("informe o valor : ");
   listaParametro?.add(int.tryParse(stdin.readLineSync() ?? " ") ?? 0);

   // printando a lista com o valor adicionado
   print(listaParametro.toString());

   // verificando se o usuario deseja continuar
    print("Deseja adicionar mais um numero (sim/nao) ?");
    Continuar = stdin.readLineSync() ?? "nao";

  }

  return listaParametro ?? [];

}






