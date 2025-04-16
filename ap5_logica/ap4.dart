void main(){
  final listaNomes = [
    "Joao",
    "Maria",
    "Pedro",
    "Maria",
    "Ana",
    "Joao",
    "Maria",
    "Fernanda",
    "Carlos",
    "Maria"
  ];

  final nome = "Ana";
  final quantidade = contarNome(listaNomes, nome);

  if (quantidade == 1) {
    print('O nome $nome foi encontrado 1 vez');
  } else if (quantidade > 0) {
    print('O nome $nome foi encontrado $quantidade vezes');
  } else {
    print('O nome nao foi encontrado');
  }
}

// função que verifica a qauntidade de nomes na lista
int contarNome(List<String> parametroLista , String parametroBusca){

  int contarNomes = 0;

  // se o nome for igual parametro , adiciona +1 no contaNome
  for( final indice in parametroLista){
    if(indice == parametroBusca){contarNomes++;}
  }

  // Retornando a soma
  return contarNomes;

}