
import 'dart:io';



void main(){

// Instanciando a classe Pessoa

  var pessoa = new Pessoa();

  // Invocando o método formulario

  pessoa.formulario();

  // Printando a chamada do método ImprimirPessoa

  print(pessoa.ImprimirPessoa());


}

class Pessoa{

  // Criando as variaveis
  // elas possuem o modificador late para terem sua atribuição colocada em outro momento
  // Elas possuem o modificador final para poderem só ter sua atribuição apenas uma vez

  late final String  nome ;
  late final String sobrenome;
  late final int idade;
  late final int altura;
  late final bool ativo;
  late final double peso;

  // Criando o método formulario , que servira como forma de o usuário informar suas informações

  void formulario(){
    print("Informe o nome : ");
    this.nome = stdin.readLineSync() ?? "Não informado";
    print("Informe o sobrenome : ");
    this.sobrenome = stdin.readLineSync() ?? "Não informado";
    print("Informe a idade : ");
    this.idade = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
    print("Informe a altura (com 3 digitos , exemplo :  170): ");
    this.altura = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
    print("Informe o peso : ");
    this.peso = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
    print("Informe se a pessoa esta ativa : (true ou false)");
    this.ativo = bool.tryParse(stdin.readLineSync() ?? "false") ?? false;
  }


  // Criando o método ImprimirPessoa , que servira para demonstrar as informações colocadas no método formulario


  String ImprimirPessoa(){

    String  imprimerUsuario = "";

    return imprimerUsuario += "\n---- Usuario $nome ----"
        "\nNome : $nome "
        "\nSobrenome : $sobrenome "
        "\nidade $idade "
        "\npeso : $peso"
        "\nIMC : ${peso / (((altura/100) * (altura/100)))}"
        "\nativo : $ativo"
        "\n-----------------";
  }

}
