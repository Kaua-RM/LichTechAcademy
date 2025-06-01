import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atividade6/main.dart';

class editar extends StatefulWidget {
  @override
  State<editar> createState() => _editarState();
}

class _editarState extends State<editar> {
  final _FormKey = GlobalKey<FormState>();

  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var telefoneController = TextEditingController();
  var githubController = TextEditingController();

  late TipoSanguineo selecionarTipo = TipoSanguineo.abPositivo;

  Widget build(BuildContext context) {
    return Consumer<EstadoListaDePessoas>(
      builder:
          (context, estadopessoa, child) => Scaffold(
            appBar: AppBar(title: Text("Listagem"), centerTitle: true),
            body: SingleChildScrollView(
              child: Form(
                key: _FormKey,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    spacing: 20,
                    children: [
                      TextFormField(
                        controller: nomeController,
                        decoration: InputDecoration(
                          labelText: "Nome da Pessoa para Buscar", // Mudou para labelText
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            // Adiciona um ícone de busca
                            icon: Icon(Icons.search),
                            onPressed: () {
                              final pessoaEncontrada =
                                  Provider.of<EstadoListaDePessoas>(
                                    context,
                                    listen: false,
                                  ).buscarPessoaPorNome(nomeController.text);
                              if (pessoaEncontrada != null) {
                                setState(() {
                                  nomeController.text =
                                      pessoaEncontrada
                                          .nome;
                                  emailController.text = pessoaEncontrada.email;
                                  telefoneController.text =
                                      pessoaEncontrada.telefone;
                                  githubController.text =
                                      pessoaEncontrada.github;
                                  selecionarTipo =
                                      pessoaEncontrada.tipoSanguineo;
                                });
                              }
                            },
                          ),
                        ),
                      ),

                      TextFormField(
                        controller: emailController,
                        validator: (String? email) {
                          if (email!.isEmpty) {
                            return "Erro , não pode ser vazio";
                          }
                          if (!email.contains("@")) {
                            return "Erro , retorne um email valido";
                          }
                          return null;
                        },
                        decoration: InputDecoration(label: Text("Email")),
                        keyboardType: TextInputType.text,
                      ),
                      TextFormField(
                        controller: telefoneController,
                        validator: (String? telefone) {
                          if (telefone!.isEmpty) {
                            return "Erro , não pode ser vazio";
                          }
                          return null;
                        },
                        decoration: InputDecoration(label: Text("Telefone")),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: githubController,
                        validator: (String? github) {
                          if (github!.isEmpty) {
                            return "Erro , não pode ser vazio";
                          }
                          if (!github.contains("github.com")) {
                            return "Erro , digite um git valido";
                          }
                          return null;
                        },
                        decoration: InputDecoration(label: Text("Github")),
                        keyboardType: TextInputType.text,
                      ),
                      DropdownButton<TipoSanguineo>(
                        hint: Text("${selecionarTipo}"),
                        items:
                            TipoSanguineo.values
                                .map(
                                  (op) => DropdownMenuItem(
                                    value: op,
                                    child: Text("${op}"),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            selecionarTipo = value!;
                          });
                        },
                      ),

                      ElevatedButton(
                        onPressed:
                            () => setState(() {
                              if (_FormKey.currentState!.validate() == true) {
                                estadopessoa.atualizarPessoa(
                                  Pessoa(
                                    nome: nomeController.text,
                                    email: emailController.text,
                                    telefone: telefoneController.text,
                                    github: githubController.text,
                                    tipoSanguineo: selecionarTipo,
                                  ),
                                );
                                nomeController.clear();
                                emailController.clear();
                                telefoneController.clear();
                                githubController.clear();
                              }
                            }),
                        child: Text("Enviar"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
