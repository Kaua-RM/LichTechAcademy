import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(TangeForm());
}



class TangeForm extends StatefulWidget{
  @override
  State<TangeForm> createState() => _TangeFormState();
}

class _TangeFormState extends State<TangeForm> {

  String Forma = "Quadrado";
  Color cor = Colors.blue;
  Random numeroAleatorio = Random();

  
  Widget Tange(String forma , Color cor){
    
    Widget formaEscolhida =
    Container(
      color: Colors.blue,
      width: 200,
      height: 200,
    );
    
    if(forma == "Quadrado"){
      setState(() {
        formaEscolhida =   Container(
          color: cor,
          width: 200,
          height: 200,
        );
      });
    }else{
      setState(() {
       formaEscolhida =  Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: cor,
          ),
          width: 200,
          height: 200,
        );
      });
    }
    
    return formaEscolhida;
  }



  Widget build(BuildContext context){
    return MaterialApp(
      home: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () { setState(() {
            if(Forma == "Quadrado"){
              Forma = "Circulo";
            }else{
              Forma = "Quadrado";
            }
          });
          }, child: Text("Transformar para $Forma")),
          Tange(Forma , cor),
          ElevatedButton(onPressed: (){
            setState(() {
              switch(numeroAleatorio.nextInt(3)){
                case 0 : cor = Colors.green;
                break;
                case 1 : cor = Colors.purple;
                break;
                case 2 : cor = Colors.cyan;
              }
            });
          }, child: Text("Mudar para cor aleatoria")),
        ],
      ),
    );
  }
}