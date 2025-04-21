import 'dart:io';
import 'package:untitled3/Services/geracaoRelatorio.dart';

void criarRelatorios() async {

  try{
  print('OLÁ, LEANDRO. QUE RELATÓRIO VOCÊ PRECISA?');
  print('  1 – TEMPERATURA');
  print('  2 – UMIDADE');
  print('  3 – DIREÇÃO DO VENTO');
  stdout.write('DIGITE O NÚMERO DA OPÇÃO DESEJADA: ');

  int opcao = int.tryParse(stdin.readLineSync()?? "")?? 0;

  await criarRelatorio(opcao);

  } catch (e){
    print("erro ao gerar relatório : $e");
  }
}