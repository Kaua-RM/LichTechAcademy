import 'dart:io';
import 'package:untitled3/View/Menu.dart';


void main() async{
  try {
    criarRelatorios();
  }catch(e){
    print("Erro: $e");
  }
}