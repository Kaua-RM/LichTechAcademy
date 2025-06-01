import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atividade6/main.dart';

class adicionar extends StatefulWidget {
  @override
  State<adicionar> createState() => _adicionarState();
}

class _adicionarState extends State<adicionar> {


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
                        validator: (String? name) {
                          if(name!.isEmpty){
                            return "Erro , não pode ser vazio";
                          }
                          return null;
                        },
                        decoration: InputDecoration(label: Text("Nome")),
                        keyboardType: TextInputType.text,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (String? email) {
                          if(email!.isEmpty){
                            return "Erro , não pode ser vazio";
                          }
                          if(!email.contains("@")){
                            return "Erro , retorne um email valido";
                          }
                          return null;
                        },
                        decoration: InputDecoration(label: Text("Email")),
                        keyboardType: TextInputType.text,
                      ),
                      TextFormField(
                        controller:  telefoneController,
                        validator: (String? telefone) {
                          if(telefone!.isEmpty){
                            return "Erro , não pode ser vazio";
                          }
                          return null;
                        },
                        decoration: InputDecoration(label: Text("Telefone")),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller:  githubController,
                        validator: (String? github) {
                          if(github!.isEmpty){
                            return "Erro , não pode ser vazio";
                          }
                          if(!github.contains("github.com")){
                            return "Erro , digite um git valido";
                          }
                          return null;
                        },
                        decoration: InputDecoration(label: Text("Github")),
                        keyboardType: TextInputType.text,
                      ),
                      DropdownButton<TipoSanguineo>(
                        hint: Text("${selecionarTipo}"),
                        items: TipoSanguineo.values.map((op) =>  DropdownMenuItem( value: op, child: Text("${op}"))).toList(),
                        onChanged: (value){
                          setState(() {
                            selecionarTipo = value!;
                          });
                        }
                      ),
              
                      ElevatedButton(
                        onPressed:
                            () =>
                                setState(() {
                                  if(_FormKey.currentState!.validate() == true){
                                    estadopessoa.incluir(
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
