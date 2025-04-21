import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'dart:async';
import'../Models/ClasseDados.dart';
import 'package:projetofinal/Utils/Conversores.dart';




Future<List<Listas>> lerArquivos() async {

  final diretorio = Directory('C:\\clima\\sensores');

  if (!await diretorio.exists()) {
    throw Exception("Diretório não encontrado!");
  }

  var arquivos = diretorio.
  listSync()
  .whereType()
  .where((paginas) => paginas is File && paginas.path.endsWith('.csv'));

  List<Listas> dados = [];

 for(FileSystemEntity f in arquivos){
    final lines = await File(f.path)
        .openRead()
        .transform(latin1.decoder)
        .transform(CsvToListConverter()).toList();



    for(int i = 1 ; i < lines.length ; i++){

      var indice =  lines[i];

      final mes = parseValor<int>(indice[0]);
      final dia = parseValor<int>(indice[1]);
      final hora = parseValor<int>(indice[2]);
      


      dados.add(Listas(
          estado: f.path.split('_')[0],
          dataHora: DateTime(DateTime.now().year,mes,dia,hora),
          temperatura: parseValor<double>(indice[3]),
          umidade: parseValor<double>(indice[4]),
          velocidadeVento: parseValor<double>(indice[5]),
          direcaoVento: parseValor<double>(indice[6]) ));

    }



  }
  return dados;
}


