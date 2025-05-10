import 'dart:math' as math;

void main() {
  // Definindo o comparador de formas
  final comparador = ComparadorFormasGeometricas();

  // Definindo as formas geometricas
  final circuloA = Circulo('Circulo A', 3);
  final circuloB = Circulo('Circulo B', 8);
  final retanguloA = Retangulo('Retângulo A', 4, 3);
  final retanguloB = Retangulo('Retângulo B', 19, 11);

  final circuloMaiorArea = comparador.compararArea(circuloA , circuloB);
  final retanguloMaiorArea = comparador.compararArea(retanguloA, retanguloB);

  if (circuloMaiorArea.Area > retanguloMaiorArea.Area) {
    print(
      'A maior area e ${circuloMaiorArea.Area.toStringAsFixed(2)} '
          'e pertence a ${circuloMaiorArea.nome}',
    );
  } else {
    print(
      'A maior area e ${retanguloMaiorArea.Area.toStringAsFixed(2)} '
          'e pertence a ${retanguloMaiorArea.nome}',
    );
  }

  final circuloaiorPerimetro = comparador.compararPerimetro(circuloA, circuloB) ;
  final retanguloMaiorPerimetro = comparador.compararPerimetro(retanguloA, retanguloB);


  if (circuloaiorPerimetro.Area > retanguloMaiorPerimetro.Area) {
    print(
      'O maior perímetro e ${circuloaiorPerimetro.Perimetro.toStringAsFixed(2)} '
          'e pertence a ${circuloaiorPerimetro.nome}',
    );
  } else {
    print(
      'O maior perímetro e ${retanguloMaiorPerimetro.Perimetro.toStringAsFixed(2)} '
          'e pertence a ${retanguloMaiorPerimetro.nome}',
    );
  }
}

/// Representa a forma geometrica "círculo"
class Circulo  implements PerimetroArea{
  /// Construtor padrao, recebe o [raio] do círculo.
  Circulo(this.nome, this.raio);

  final String nome;
  final double raio;

  @override
  double get Area => math.pi * math.pow(raio, 2);


  @override
  double get Perimetro => 2 * math.pi * raio;

  @override
  set nome(String _nome) {
    nome =  _nome ;
  }

}

/// Representa a forma geometrica "retângulo", forma geometrica de quatro lados
/// e angulos retos (90 graus).
class Retangulo implements PerimetroArea{
  /// Construtor padrao, recebe a [altura] e [largura] do retângulo
  Retangulo(this.nome, this.altura, this.largura);

  final String nome;
  final double largura;
  final double altura;

  @override
  double get Area => altura * largura;


  @override
  double get Perimetro => (altura * 2) + (largura * 2);

  @override
  set nome(String _nome) {
    nome =  _nome ;
  }

}

/// Representa a forma geometrica "quadrado", que e um formato especial de
/// retângulo, onde todos os lados possuem o mesmo tamanho.
class Quadrado implements PerimetroArea{
  /// Construtor padrao, recebe o [lado] do quadrado
  Quadrado(this.nome, this.lado);

  final String nome;
  final double lado;

  @override
  double get Area => lado * lado;

  @override
  double get Perimetro => lado * 4;

  @override
  set nome(String _nome) {
   nome =  _nome ;
  }


}

class TrianguloEquilatero implements PerimetroArea{
  /// Construtor padrao, recebe o [lado] do quadrado
  TrianguloEquilatero(this.nome, this.lado);

  final String nome;
  final double lado;

  @override
  double get Area => math.pow(lado, 2) * math.sqrt(3) / 4  ;

  @override
  double get Perimetro => lado * 3;

  @override
  set nome(String _nome) {
    nome =  _nome ;
  }


}

class Pentagono implements PerimetroArea{
  /// Construtor padrao, recebe o [lado] do quadrado
  Pentagono(this.nome, this.apotema ,this.lados);

  final String nome;
  final double apotema;
  final double lados;
  @override
  double get Area =>  5*Perimetro*apotema;

  @override
  double get Perimetro => lados * 5;

  @override
  set nome(String _nome) {
    nome =  _nome ;
  }


}

class Hexagono implements PerimetroArea{
  /// Construtor padrao, recebe o [lado] do quadrado
  Hexagono(this.nome, this.apotema ,this.lados);

  final String nome;
  final double apotema;
  final double lados;
  @override
  double get Area =>  3 * math.pow(lados, 2) * math.sqrt(3) / 2 ;

  @override
  double get Perimetro => lados * 6;

  @override
  set nome(String _nome) {
    nome =  _nome ;
  }


}


/// Compara caracteristicas de formas geometricas
class ComparadorFormasGeometricas {
  /// Retorna o círculo com a maior area, ou [circuloA] caso as areas sejam
  /// iguais

  PerimetroArea compararArea(PerimetroArea area1 , PerimetroArea area2 ){
    if (area1.Area > area2.Area) {
     return area1;
    } else if (area2.Area > area1.Area) {
     return area2;
    }
    return area1;
  }

  PerimetroArea compararPerimetro(PerimetroArea perimetro1 , PerimetroArea perimetro2){
    if (perimetro1.Perimetro > perimetro2.Perimetro) {
      return perimetro1;
    } else if (perimetro2.Perimetro > perimetro1.Perimetro) {
      return perimetro2;
    }
    return perimetro1;
  }
}




abstract class PerimetroArea{

  String nome = "";

  double get Area;

  double get Perimetro;

}