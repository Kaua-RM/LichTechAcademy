import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: Forms());
  }
}

class Forms extends StatefulWidget {
  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  String nome = "";
  int idade = 0;
  bool verificarAtividade = false;

  final _FormKey = GlobalKey<FormState>();

  var nomeController = TextEditingController();
  var idadeController = TextEditingController();

  Widget Informations() {
    Widget information = Column(
      children: [Text("Seu nome é : $nome "), Text("Sua idade é : $idade")],
    );

    if (!verificarAtividade) {
      information = Container(
        decoration: BoxDecoration(color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          children: [Text("Seu nome é : $nome "), Text("Sua idade é : $idade")],
        ),
      );
    } else {
      information = Container(
        decoration: BoxDecoration(color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          children: [Text("Seu nome é : $nome "), Text("Sua idade é : $idade")],
        ),
      );
    }

    return information;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pagina de Cadastro",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Form(
        key: _FormKey,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Informe seu Cadastro", style: TextStyle(fontSize: 17)),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Nome"),
                controller: nomeController,
                validator: (String? text) {
                  if (text!.length < 3) {
                    return "Nome curto demais";
                  }

                  List<String> verificarLetra = text.split("");

                  if (verificarLetra[0] != verificarLetra[0].toUpperCase()) {
                    return "A primeira letra deve ser maiuscula";
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Idade"),
                controller: idadeController,
                validator: (String? text) {
                  int idadeInformada = int.tryParse(text ?? "0") ?? 0;
                  if (idadeInformada < 18) {
                    return "Idade insuficiente";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed:
                    () => setState(() {
                      if (_FormKey.currentState!.validate() == true) {
                        nome = nomeController.text;
                        idade = int.parse(idadeController.text);
                      }
                      ;
                    }),
                child: Text("Enviar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: verificarAtividade,
                    onChanged: (value) {
                      setState(() {
                        verificarAtividade = value!;
                      });
                    },
                  ),
                  Text(" Usuario está ativo ?"),
                ],
              ),
              Informations(),
            ],
          ),
        ),
      ),
    );
  }
}
