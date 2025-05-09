import 'package:flutter/material.dart';
import 'dart:math';



void main(){
runApp(escolher());
}

class escolher extends StatefulWidget{

  @override
  State<escolher> createState() => _escolherState();
}

class _escolherState extends State<escolher> {

  bool respostaCorreta = false;
  bool respostaIncorreta = false;
  int numeroCorreto =  Random().nextInt(3);

  int clicks = 0;







  void escolha( int numero ){

setState(() {
  if(numero == numeroCorreto){
    respostaCorreta = true;
  }else {
    clicks++;
  }


  if(clicks == 2){
    respostaIncorreta = true;

  }
});

  }




  @override
  Widget build(BuildContext context) {



    if(respostaCorreta == true){
      return MaterialApp(
          home:  Center(
            child: Text("Resposta Correta" , style: TextStyle(backgroundColor: Colors.green , color: Colors.white),),
          )
      );
    }

    if(respostaIncorreta == true){
      return MaterialApp(
          home:  Center(
            child: Text("Resposta Incorreta" , style: TextStyle(backgroundColor: Colors.red , color: Colors.white),),
          )
      );
    }



    return MaterialApp(
      home: Center(
      child: Column(
        children: [
          TextButton(onPressed: () {
            escolha(0);
          }, child: Text("A")),
          TextButton(onPressed: () {
            escolha(1);
          }, child: Text("B")),
          TextButton(onPressed: () {
            escolha(2);
          }, child: Text("C")),
        ],
      ),
      ),
    );

  }
}



