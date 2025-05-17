import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}



class Home extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          blocs(),
          blockingBackground(),
          blocsBackgroundBlack(),
        ],
      ) ,
    );
  }
}


class blocs extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
     home: Container(
       width: 300,
       child:Row(

         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Container(height: 50, width: 50, color: Colors.red,),
           Container(height: 50, width: 50, color: Colors.green,),
           Container(height: 50, width: 50, color: Colors.blue,),
         ],
       ),
     )
    );
  }
}


class blockingBackground extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home:
      Container(
        width: 300,
        height: 200,
        color: Colors.yellow,
        child:  Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(height: 100, width: 50, color: Colors.cyan,),
                Container(height: 100, width: 50, color: Colors.purple,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 50, width: 50, color: Colors.cyan,),
                    Container(height: 50, width: 50, color: Colors.purple,),
                  ],
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}

class blocsBackgroundBlack extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      height: 100,
      width:  100,
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(height: 50, width: 50, color: Colors.black,),
      ],)
    );
  }
}