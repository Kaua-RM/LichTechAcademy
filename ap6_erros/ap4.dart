import 'dart:io';

void main() {
  // tentando realizar o treço do código que implementa um valor em ArquivoTexto
  try {
    print("Informe o nome do arquivo:  ");
    final String nomeArbitrario = stdin.readLineSync() ?? "";

    // Instanciando a classe ArquivoTexto
    ArquivoTexto arquivoTexto = new ArquivoTexto(nomeArbitrario);
    // chamando o método abrir
    arquivoTexto.abrir();
  } catch (e) {
    // Printando um possível erro
    print(e);
  }
}

// classe que implementa a classe abstrata arquivo
class ArquivoTexto implements arquivo {
  late final String _nomeArquivo;

  // invocando o construtor
  ArquivoTexto(String nomeArquivo) {
    setNome(nomeArquivo);
  }

  // criando os métodos get e set
  String getNome() {
    return this._nomeArquivo;
  }

  void setNome(String nome) {
    this._nomeArquivo = nome;
  }

  // implementando o método já existente abrir
  @override
  void abrir() {
    // se a validação der erro , vá para o cath e imprima e reimprima o erro
    try {
      if (getNome() == null || getNome() == "") {
        throw "Entrada invalida. Digite um nome valido.";
      }
      print("Abrindo ${getNome()}");
    } catch (e) {
      print(e);
      print("relançando erro");
      rethrow;
    }
  }
}

// Classe abstrata arquivo
abstract class arquivo {
  void abrir() {}
}
