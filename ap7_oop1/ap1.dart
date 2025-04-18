/*Crie uma classe chamada ContaBancaria com os atributos saldo e titular
Adicione métodos para depositar e sacar dinheiro da conta
E imprima no console conforme exemplo a baixo: Saldo atual: 9999.99*/

import 'dart:io';


void main() {


  print("_____ Sistema Bancario Lince _____");

  // bloco de codigo que verica se o usuario quer sacar ou depositar
  try {

    //informando os valores iniciais
    print("Informe o nome do titular :");
    final String titular = stdin.readLineSync() ?? "";
    erroTitular(titular);
    print("Informe o saldo inicial : ");
    final double saldoInicial =
        double.tryParse(stdin.readLineSync() ?? "0") ?? 0;

    String DesejaContinuar = "sim";
    late String saquarDepositar;

    // invocando / instanciando a classe que possui os metodos saquar e depositar
    ContaBancaria contaBancaria = ContaBancaria(titular, saldoInicial);

    // operador de repeticão que verifica se o usuario quer saquar ou depositar
    while (DesejaContinuar == "sim") {
      print(
        "Informe se deseja saquar ou depositar (coloque saquar ou depositar)",
      );
      saquarDepositar = stdin.readLineSync() ?? "";

      // verificando qual açaõ seguir
      switch (saquarDepositar) {
        case "saquar":
          print("Informe o valor que deseja saquar : ");
          final double saquar = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
          contaBancaria.sacar(saquar);
          break;
        case "depositar":
          print("Informe o valor que deseja depositar : ");
          final double depositar =
              double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
          contaBancaria.depositar(depositar);
          break;
        default:
          throw "Erro , coloque se deseja saquar ou depositar";
      }

      print("Deseja Continuar (sim ou nao): ");
      DesejaContinuar = stdin.readLineSync() ?? "nao";
    }
  } catch (e) {
    print(e);
  }
}


// Classe que contem os métodos saquar e depositar
class ContaBancaria {
  late double saldo;
  late final String titular;

  // Construtor da classe
  ContaBancaria(this.titular, this.saldo);


  // Método de saque do saldo
  void sacar(double saquarValor) {
    erroSaque(saquarValor, this.saldo);

    this.saldo -= saquarValor;

    print(
      "Titular : ${this.titular}  \n  Ação : Saquar \n "
      " Valor Do Saque : $saquarValor \n  Saldo Atual : ${this.saldo}",
    );
  }

  // Método de depositar para aumentar o saldo
  void depositar(double depositar) {
    erroDeposito(depositar);

    this.saldo += depositar;

    print(
      "Titular : ${this.titular} \n Ação : Depositar \n "
      "Valor Do Deposito : $depositar \n Valor Atual : ${this.saldo}",
    );
  }
}

// funções para verificar a excessão do usuario.
void erroSaque(double saquarvalor, double saldo) {
  if (saquarvalor > saldo) {
    throw "Erro : Saldo Insuficiente";
  }
}

void erroDeposito(double depositar) {
  if (depositar <= 0) {
    throw "Erro : Valor de deposito deve ser maior do que 0";
  }
}

void erroTitular(String titular) {
  if (titular == "" || titular.length == 1)
    throw "Erro: Informe o nome com mais de uma letra";
}
