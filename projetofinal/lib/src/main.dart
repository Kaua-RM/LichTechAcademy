import 'dart:io';
import 'package:projetofinal/View/Menu.dart';


void main() async{
  try {
    criarRelatorios();
  }catch(e){
    print("Erro: $e");
  }
}