import 'dart:math';

void main(){

  // Instanciando a Classe Randow
  final Random random = new Random();

  // Criando as duas listas de valores numéricos aleatórios
  final List<int> numerosAleatorios1 = List.generate(5, (_) => random.nextInt(100));
  final List<int> numerosAleatorios2 = List.generate(5, (_) => random.nextInt(100));

  //Invocando as funções DemonstrarListaNumeros e somarListaNumeros
  demonstrarListaNumeros(numerosAleatorios1);
  demonstrarListaNumeros(numerosAleatorios2);
  somarListaNumeros(numerosAleatorios1, numerosAleatorios2);
}


// Função que verifica se a lista é nula e printa o resultado
void demonstrarListaNumeros(List<int> parametro ){

  if(parametro.isEmpty != false){
    print("Lista Vazia");
  }else{
    print("Lista : ${parametro.join(",")}");
  }

}

// Função que Soma As duas listas que vem como parâmetros , além de verificar se as duas possuim os mesmo tamanho
  void somarListaNumeros(List<int> valorLista1 , List<int> valorLista2){

    final List<int> valorSomado = [];

    if(valorLista1.length < valorLista2.length || valorLista2.length < valorLista1.length){
      print("Uma das listas é menor do que a outra , \n retorno : Lista Vazia ");
    }else{
    for(int indice = 0 ; indice < valorLista1.length ; indice++){
      print("${valorLista1[indice]} + ${valorLista2[indice]}");
      valorSomado.add(valorLista1[indice] + valorLista2[indice]);
    }
    print("Lista Com os Valores Somados: ${valorSomado.join(",")}");
    }

  }

