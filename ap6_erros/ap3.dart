import 'dart:io';
import 'dart:math';

void main() {
  try {
    Random random = new Random();
    //  Informando os valores que irão para a classe
    final double base = random.nextDouble() * 99;
    final double altura = random.nextDouble() * 99;
    // Chamando a classe com o método
    Retangulo(base, altura).CalcularArea();
  } catch (e) {
    // Printando um possível erro
    print(e);
  }
}

// classe que implementa a classe abstrata forma
class Retangulo implements forma {
  late final double _base;
  late final double _altura;

  // adicionando o construtor
  Retangulo(double valorBase, double valorAltura) {
    // verificando os valores Base e ALtura
    if (valorBase <= 0 || valorAltura <= 0) {
      throw "Exception: Dimensões inválidas, informe apenas valores positivos maiores que zero";
    }
    // Implementando esses valores dentro das variáveis privadas base e altura
    setBase(valorBase);
    setAltura(valorAltura);
  }

  // implementando o método já existente CalcularArea
  @override
  void CalcularArea() {
    final double AreaRetangulo = getBase() * getAltura();
    print("Area do Retangulo : $AreaRetangulo");
  }

  // Metodos get e Set de Base e Altura
  double getBase() {
    return this._base;
  }

  void setBase(double base) {
    this._base = base;
  }

  double getAltura() {
    return this._altura;
  }

  void setAltura(double altura) {
    this._altura = altura;
  }
}

// Classe abstrata forma
abstract class forma {
  void CalcularArea() {}
}
