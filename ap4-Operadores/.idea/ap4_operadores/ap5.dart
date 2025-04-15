void main(){

  // mapa que contem nome e idade
  final  pessoaIdade = {
    "Nelson": null,
    "Jane": null,
    "Jake": 16,
    "Rupert": 37,
    "Andy": 13,
    "Kim": 27,
    "Robert": 31,
  } ;

  // verificando se algum valor é nulo
  pessoaIdade.forEach((key , valor) {
   final String verificar = valor == null ? "$key - Idade não informada"  : "$key - $valor";

   // printando a verificação
   print(verificar);

  });




}