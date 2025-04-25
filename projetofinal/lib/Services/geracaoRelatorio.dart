
import 'ler_arquivos.dart';
import '../Models/ClasseDados.dart';
import 'package:projetofinal/Utils/FuncoesAuxiliares.dart';

 // lista model que recebe a future lerArquivos()
Future<void> criarRelatorio(int opcao) async {
  List<Listas> arquivos = await lerArquivos();

    // map que recebe como chave uma string e valor : List<Models>
  var linhas = <String, List<Listas>>{};

  for (var dado in arquivos) {
    try{
          // linhas recebera como dados as chaves  estados e a lista vinculada
    linhas.update(
      dado.estado,
          (lista) => lista..add(dado),
      ifAbsent: () => [dado],
    );} catch(e){
      print("Erro : Não foi possivel adicionar os dados");
    }
  }
  // for que pega a chave de linhas
  for (var chave in linhas.keys) {
       // dados recebera a lista vinculada ao indice chave
    var dados = linhas[chave]!;

    print("\nEstado: $chave");
    // operador de fluxo que invoca as funções por meio do parametro opcao
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
