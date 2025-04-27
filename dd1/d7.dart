void main(){

  List<int> numeros = [10, 35, 999, 126, 95, 7, 348, 462, 43, 109];

  somaFor(numeros);
  somaMetodoColecao(numeros);
  somaWhile(numeros);
  print(somaRercusao(numeros));

}


void somaFor(List<int> numeros){

   int soma = 0;

  for(final valor in numeros){
    soma += valor;
  }

  print(soma);

}

void somaWhile(List<int> numeros){

  int soma = 0 ;
  int contador = 0 ;

  while(contador < numeros.length ){
    soma += numeros[contador];

    contador++;
  }

  print(soma);


}

int somaRercusao(List<int> numeros){


 int indice = numeros.length;
 int soma = 0 ;

 if(numeros == 0){
   return 1;
 }else{
   return numeros.reduce((a,b) => a + b);
 }
 
 

}

void somaMetodoColecao(List<int> numeros){

  int soma = numeros.reduce((a , b) => a + b);

  print(soma);

}