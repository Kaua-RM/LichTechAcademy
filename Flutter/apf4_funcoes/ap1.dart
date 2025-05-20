import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class colorChoice {
  final String cor;
  colorChoice(this.cor);
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => columnColors(),
        colorPage.rotaNomeada: (context) => colorPage(),
      },
    );
  }
}

class columnColors extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Escolha a cor ", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed:
                    () => Navigator.pushNamed(
                      context,
                      "/choicheColor",
                      arguments: colorChoice("cyan"),
                    ),
                child: Text(
                  "Acessar a cor Ciano",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed:
                    () => Navigator.pushNamed(
                      context,
                      "/choicheColor",
                      arguments: colorChoice("amber"),
                    ),
                child: Text(
                  "Acessar a cor Amber",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed:
                    () => Navigator.pushNamed(
                      context,
                      "/choicheColor",
                      arguments: colorChoice("purple"),
                    ),
                child: Text(
                  "Acessar a cor Roxo",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class colorPage extends StatefulWidget {
  static const rotaNomeada = "/choicheColor";

  @override
  State<colorPage> createState() => _colorPageState();
}

class _colorPageState extends State<colorPage> {
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as colorChoice;

    return MaterialApp(
      home:
      Scaffold(
        backgroundColor: corEscolhida(argumentos.cor),
        body:Center(child:Container(
          color: corEscolhida(argumentos.cor),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Voltar para a tela de escolha"),
          ),
        ),
      )
      ),
    );
  }
}

Color corEscolhida(String color) {
  Color cores = Colors.white;

  switch (color) {
    case "amber":
      cores = Colors.amber;
      break;
    case "purple":
      cores = Colors.purple;
      break;
    case "cyan":
      cores = Colors.cyan;
  }

  return cores;
}
