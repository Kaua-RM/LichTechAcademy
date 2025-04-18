/*Crie uma classe chamada Produto com os atributos nome e preco
A classe deve ter um método chamado desconto que recebe um valor percentual de desconto e retorna o preço do produto com o desconto aplicado
Repetir a criação da classe criando uma lista com no mínimo 5 produtos e retorne impresso na tela o resultado dos descontos conforme exemplo: Novo preço do produto XXXXXXXXXXXXXX (com desconto) 999.99*/

import 'dart:math';

void main(){

  // Invocando / instanciando  a classe Produto que recebe os dados pelo construtor
  Produto("Fone" , valorProduto()).Desconto(valorDesconto());
  Produto("Gabinete" , valorProduto()).Desconto(valorDesconto());
  Produto("Teclado" , valorProduto()).Desconto(valorDesconto());
  Produto("Mouse" , valorProduto()).Desconto(valorDesconto());
  Produto("Monitor" , valorProduto()).Desconto(valorDesconto());
}


// Classe que possui o método que calcula o desconto no produto
class Produto{

  late final String nome;
  late final  double preco;

  Produto(this.nome , this.preco);

void Desconto(double desconto) {

   final double descontoProduto = this.preco - (this.preco * (desconto / 100));

   print("Novo preço do produto ${this.nome}  (com desconto) ${descontoProduto.toStringAsFixed(2)}");

 }

}

// função que retorna um valor aleatorio para o produto
double valorProduto(){
  Random valorProduto = Random();
  return  valorProduto.nextDouble()*999;
}

// função que retorna um valor aleatorio para o desconto
double valorDesconto(){
  Random valorDesconto = Random();
  return valorDesconto.nextDouble()*90;
}