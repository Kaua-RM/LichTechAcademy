
import 'ler_arquivos.dart';
import '../Models/ClasseDados.dart';
import 'package:untitled3/Utils/FuncoesAuxiliares.dart';

Future<void> criarRelatorio(int opcao) async {
  List<Listas> arquivos = await lerArquivos();

  var linhas = <String, List<Listas>>{};

  for (var dado in arquivos) {
    try{
    linhas.update(
      dado.estado,
          (lista) => lista..add(dado),
      ifAbsent: () => [dado],
    );} catch(e){
      print("Erro : Não foi possivel adicionar os dados");
    }
  }

  for (var chave in linhas.keys) {
    var dados = linhas[chave]!;

    print("\nEstado: $chave");

    switch (opcao) {
      case 1:

        gerarRelatorioTemperatura(chave, dados);

        break;

      case 2:

        gerarRelatorioUmidade(chave, dados);

        break;

      case 3:

        gerarRelatorioVento(chave, dados);

        break;
      default:
        throw "Erro : Opção Invalida";
    }
  }
}
