import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
     blockBackgroundGray(),
          blockBackgroundBlack(),
          blockBackgroundTrasperet(),
          blockBackgroundWhite(),
        ],
      ) ,
    );
  }
}


class blockBackgroundGray extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: Container(
        height: 100,
        width: 100,
        color: Colors.grey,
        child: Stack(
          children: [
           Positioned(
               top: 15,
               left: 15,
               child:
           Container(height: 50, width: 50, color: Colors.red,)),
            Positioned(
              top: 25,
                left: 25,
                child:Container(height: 50, width: 50, color: Colors.green,)),
            Positioned(
                top: 35,
                left: 35,
                child:Container(height: 50, width: 50, color: Colors.blue,)),
          ],
        ),
      )
    );
  }
}

class blockBackgroundBlack extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
        home: Container(
          height: 100,
          width: 100,
          color: Colors.black,
          child: Stack(
            children: [
              Positioned(
                  top: 15,
                  left: 15,
                  child:
                  Container(height: 50, width: 50, color: Colors.cyan,)),
              Positioned(
                  top: 25,
                  left: 25,
                  child:Container(height: 50, width: 50, color: Colors.purple,)),
              Positioned(
                  top: 35,
                  left: 35,
                  child:Container(height: 50, width: 50, color: Colors.yellow,)),
            ],
          ),
        )
    );
  }
}

class blockBackgroundTrasperet extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
        home: Container(
          height: 100,
          width: 100,
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                  top: 15,
                  left: 15,
                  child:
                  Container(height: 50, width: 50, color: Colors.red,)),
              Positioned(
                  top: 25,
                  left: 25,
                  child:Container(height: 50, width: 50, color: Colors.yellow,)),
              Positioned(
                  top: 35,
                  left: 35,
                  child:Container(height: 50, width: 50, color: Colors.blue,)),
            ],
          ),
        )
    );
  }
}

class blockBackgroundWhite extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
        home: Container(
          height: 100,
          width: 100,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                  top: 15,
                  left: 15,
                  child:
                  Container(height: 50, width: 50, color: Colors.purpleAccent,)),
              Positioned(
                  top: 25,
                  left: 25,
                  child:Container(height: 50, width: 50, color: Colors.deepOrange,)),
              Positioned(
                  top: 35,
                  left: 35,
                  child:Container(height: 50, width: 50, color: Colors.yellow,)),
              Positioned(
                  top: 45,
                  left: 45,
                  child:Container(height: 50, width: 50, color: Colors.lightGreenAccent,)),
            ],
          ),
        )
    );
  }
}



