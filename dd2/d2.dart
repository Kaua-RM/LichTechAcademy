import 'dart:math';






void main() {
  final pessoa = Pessoa();

  int numeroAleatorio = Random().nextInt(5);
  int contadorRefeicoes = 0;


  pessoa.NecessitaRefeicao();

  switch (numeroAleatorio) {
    case 0:
      for (var i = 0; i < 5; i++) {
        pessoa.refeicao(FornecedorDeBebidas().fornecer());
        contadorRefeicoes++;
      }
      break;
    case 1:
      for (var i = 0; i < 3; i++) {
        pessoa.refeicao(FornecedorDeSanduiches().fornecer());
        contadorRefeicoes++;
      }
      break;
    case 2:
      for (var i = 0; i < 3; i++) {
        pessoa.refeicao(FornecedorDeBolo().fornecer());
        contadorRefeicoes++;
      }
      break;
    case 3:
      for (var i = 0; i < 2; i++) {
        pessoa.refeicao(FornecedorDeSaladas().fornecer());
        contadorRefeicoes++;
      }
      break;
    case 4:
      for (var i = 0; i < 2; i++) {
        pessoa.refeicao(FornecedorDePetiscos().fornecer());
        contadorRefeicoes++;
      }
      break;
  }


  pessoa.informacoes();
  print("Quantidade de refeicoes : $contadorRefeicoes");
  pessoa.Status();
}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}



enum nivelCalorias{
  DeficitExtremo,
  Deficit,
  Satisfeito,
  Excesso;
}





class FornecedorDeBebidas {
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

class FornecedorDeSanduiches {
  final _random = Random();
  final _SanduichesDisponiveis = <Produto>[
    Produto('Frango com requeijão', 400),
    Produto('Alface e Tomate', 290),
    Produto('Bacon e Cheddar', 600),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _SanduichesDisponiveis[_random.nextInt(
      _SanduichesDisponiveis.length,
    )];
  }
}

class FornecedorDeBolo {
  final _random = Random();
  final _BolosDisponiveis = <Produto>[
    Produto('Frutas', 600),
    Produto('Caramelo Salgado', 1290),
    Produto('Morango e Chantili', 600),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _BolosDisponiveis[_random.nextInt(_BolosDisponiveis.length)];
  }
}

class FornecedorDeSaladas {
  final _random = Random();
  final _SaladaDisponiveis = <Produto>[
    Produto('Cesar', 220),
    Produto('Frango', 490),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _SaladaDisponiveis[_random.nextInt(_SaladaDisponiveis.length)];
  }
}

class FornecedorDePetiscos {
  final _random = Random();
  final _PetiscosDisponiveis = <Produto>[
    Produto('Azeitona', 120),
    Produto('Cubo de Queijo', 310),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _PetiscosDisponiveis[_random.nextInt(_PetiscosDisponiveis.length)];
  }
}

class Pessoa {
  final random = Random();

  // Acumulador de calorias
  int _caloriasConsumidas = 0;

  Pessoa() {
    _caloriasConsumidas = random.nextInt(700);
  }

  /// Imprime as informacoes desse consumidor
  void informacoes() {
    print('Calorias consumidas: $_caloriasConsumidas');
  }

  void NecessitaRefeicao(){
    if(_caloriasConsumidas < 500){
      print(nivelCalorias.DeficitExtremo);
      print("A pessoa necessita se alimentar ");
    }
  }

  void Status(){

    if(_caloriasConsumidas <= 500){
      print(nivelCalorias.DeficitExtremo);
    }else if(500 > _caloriasConsumidas && _caloriasConsumidas <= 1800){
      print(nivelCalorias.Deficit);
    }else if(1800 > _caloriasConsumidas && _caloriasConsumidas <= 2500){
      print(nivelCalorias.Satisfeito);
    }else{
      print(nivelCalorias.Excesso);
    }

  }

  /// Consome um produto e aumenta o número de calorias
  void refeicao(Produto fornecedor) {
    print('Consumindo ${fornecedor.nome} (${fornecedor.calorias} calorias)');

    _caloriasConsumidas += fornecedor.calorias;
  }
}
