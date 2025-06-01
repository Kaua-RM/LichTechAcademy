import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atividade6/Listagem.dart';
import 'package:atividade6/Adicionar.dart';
import 'package:atividade6/Editar.dart';
import 'package:flutter/foundation.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(ChangeNotifierProvider(create: (_) => EstadoListaDePessoas(), child: MyApp()));
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    final Pessoa otherPessoa = other as Pessoa;

    // AQUI: Compara pelo nome!
    return nome == otherPessoa.nome;
  }

  // IMPLEMENTAÇÃO DO GETTER hashCode - AGORA LIGADO AO NOME
  @override
  int get hashCode {
    // AQUI: O hashCode é gerado a partir do nome!
    return Object.hash(nome, Pessoa);
  }
}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];

  Map<String , Pessoa> buscarPessoa = {};

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    buscarPessoa[pessoa.nome] = pessoa;
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    buscarPessoa.remove(pessoa.nome);
    notifyListeners();
  }

  Pessoa? buscarPessoaPorNome(String valor){
    return buscarPessoa[valor];
  }

  void atualizarPessoa(Pessoa valor){
    excluir(valor);
    incluir(valor);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/lista": (context) => listagem(),
        "/ad": (context) => adicionar(),
        "/ed": (context) => editar(),
      },

      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title: Text("Main"), centerTitle: true,),
          body: Center(child: MyWidget())),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/lista" ),
          child: Text("Listagem"),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/ad"),
          child: Text("Adicionar"),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/ed"),
          child: Text("Editar"),
        ),
      ],
    );
  }
}
