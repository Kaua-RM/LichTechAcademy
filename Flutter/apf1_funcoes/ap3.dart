import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: MyWidget())),
    );
  }
}

enum EstadoDoJogo { emAndamento, ganhou, perdeu }

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  var vitorias = 0;
  var derrotas = 0;
  var botaoCorreto = 0;
  var clicks = 0;
  var estadoDoJogo = EstadoDoJogo.emAndamento;


  void tentativa(int opcao) {
    setState(() {

      if (opcao == botaoCorreto) {
        estadoDoJogo = EstadoDoJogo.ganhou;
        vitorias++;
      } else {
        clicks++;
      }


      if (clicks == 2 && estadoDoJogo != EstadoDoJogo.ganhou) {
        estadoDoJogo = EstadoDoJogo.perdeu;
        derrotas++;
      }
    });
  }

  void iniciarJogo() {
    setState(() {
      clicks = 0;

      botaoCorreto = Random().nextInt(3);

      estadoDoJogo = EstadoDoJogo.emAndamento;
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch (estadoDoJogo) {

      EstadoDoJogo.ganhou => GanhouJogo(iniciarJogo),


      EstadoDoJogo.perdeu => PerdeuJogo(iniciarJogo),


      EstadoDoJogo.emAndamento => JogoEmAndamento(
        vitorias,
        derrotas,
        tentativa,
      ),
    };
  }
}

class PerdeuJogo extends StatelessWidget {
  const PerdeuJogo(this.reiniciar);


  final void Function() reiniciar;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Text(
            "Você Perdeu",
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.red,
              fontSize: 20,
            ),
          ),
          TextButton(
            onPressed: () => reiniciar(),
            child: Text(
              "Reiniciar",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class GanhouJogo extends StatelessWidget {
  const GanhouJogo(this.reiniciar);

  // Essa função sera chamada no state para reiniciar o jogo
  final void Function() reiniciar;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Text(
            "Você Venceu",
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.green,
              fontSize: 20,
            ),
          ),
          TextButton(
            onPressed: () => reiniciar(),
            child: Text(
              "Reiniciar",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class JogoEmAndamento extends StatelessWidget {

  const JogoEmAndamento(this.vitorias, this.derrotas, this.tentativa);


  final int vitorias;
  final int derrotas;


  final void Function(int) tentativa;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Quantidade de Vitorias : $vitorias'),
        Text('Quantidade de Derrotas : $derrotas'),
        TextButton(
          onPressed: () => tentativa(0),
          child: Text("A", style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => tentativa(1),
          child: Text("B", style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => tentativa(2),
          child: Text("C", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
