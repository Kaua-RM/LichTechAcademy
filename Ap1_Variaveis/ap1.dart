void main(){

  // Criando as variavies nome  e sobrenome , além de atribuir valores

  String  nome = "Kaua", sobrenome = "Rodrigues";

  // Printando as informações

  print("Nome Completo : $nome $sobrenome");

  // Criando a variavel idade , além de atribuir o valor

  int idade = 18;

  // criando a variavel maiorMenorIdade , que decidira o fluxo do programa

  String maiorMenorIdade = idade >= 18 ? "maior de idade" : "menor de idade";

 //Printando as informações

  print("idade : $idade " + maiorMenorIdade);


  // criando a variavel ativo , além de atribuir o valor dela

  bool ativo = true;

  // criando a variavel ativoInativo , que decidira o fluxo do programa

  String ativoInativo = ativo == true ? "Situação : Ativo" : "Situação : Inativo";

  //Printando as informações

  print(ativoInativo);

  // criando a variavel peso , além de atribuir valor nela

  double peso = 60.0;

  // printando as informações

  print("Peso : $peso");

  // criando a variavel notNullSafety nacionalidade , além de atribuir valores

  String? nacionalidade = "Brasileiro";

  // criando a variavel verficarNacionalidade , que decidira o fluxo do programa

  String verficarNacionalidade = nacionalidade != null ? "Nacionalidade: $nacionalidade" : "Nacionalidade: Não informada";

  // printando as informações

  print(verficarNacionalidade);


}