import 'dart:math';

void main(){

  // valores gerados aleatoriamente para se colocar no metodo set dos atributos
  final int idadeAleatoria = Random().nextInt(99)+1;
  final double alturaAleatoria = Random().nextDouble()+1;

  // instanciando a classe Pessoa
  Pessoa pessoa = Pessoa();

  // utilizando o método set dos atributos
  pessoa.setNome("Kaua");
  pessoa.setIdade(idadeAleatoria);
  pessoa.setAltura(alturaAleatoria);

  // printando as informações utilizando o get
  print("Nome: ${pessoa.getNome} \n Idade : ${pessoa.getIdade} \n Altura : ${pessoa.getAltura.toStringAsFixed(2)}");

}

// classe que possui os métodos set e get dos atributos privados _nome , _idade e _altura
class Pessoa{

  String _nome = "";
  int _idade = 0;
  double _altura = 0.0;

// métodos Get

String get getNome => this._nome;

int get getIdade => this._idade;

double get getAltura => this._altura;

// métodos set

 void setNome(String nome) => this._nome = nome;

  void setIdade(int idade){
   verificarIdade(idade);
    this._idade = idade;}

void setAltura(double altura) => this._altura = altura;


}

// função que verifica se a idade é menor igual a zero

int verificarIdade(int idade){
  Random idadeAleatorio = Random();
  while(idade <= 0){
    idade = idadeAleatorio.nextInt(99)+1;
  }
  return idade;
}