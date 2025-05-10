import 'dart:io';

void main(){

  late  String NomeFigura;
  late  int   Codigo;

  final pacoteFiguras = PacoteFigurinhas();

  for(int indice = 3 ; indice < 20 ; indice++ ){
    pacoteFiguras.pacoteFiguras.add(figurinhas(nome: "Nome$indice", codigo: indice));
  }


  print("\n --- Figurinhas Repetidas ---\n");
  pacoteFiguras.verificarFiguras();

  print("\n --- Coleção de Figurinhas ---\n");
  pacoteFiguras.imprimirPacote();


}

class figurinhas{
  final String nome;
  final int    codigo;

  figurinhas({required this.nome , required this.codigo});


}



class PacoteFigurinhas {
  final pacoteFiguras = <figurinhas>[
    figurinhas(nome: "super", codigo: 01),
    figurinhas(nome: "bat", codigo: 12),
    figurinhas(nome: "flash", codigo: 06),
    figurinhas(nome: "lanter", codigo: 04),
  ];


  void imprimirPacote() {
    pacoteFiguras.sort((a, b) => a.codigo.compareTo(b.codigo));

    for (final indice in pacoteFiguras) {
      print("Nome : ${indice.nome} , Codigo : ${indice.codigo}");
    }
  }

  void verificarFiguras() {
    pacoteFiguras.sort((a, b) => a.codigo.compareTo(b.codigo));

    final figurasRepetidas = <figurinhas>[];
    int cont = 0;

    for (int indice = 0; indice < pacoteFiguras.length; indice++) {
      cont = 0;
      for (int indice2 = 1; indice2 < pacoteFiguras.length; indice2++) {
        if (pacoteFiguras[indice].codigo == pacoteFiguras[indice2].codigo) {
          cont++;
          if (cont > 1) {
            figurasRepetidas.add(pacoteFiguras[indice2]);
            pacoteFiguras.remove(pacoteFiguras[indice2]);
          }
        }
      }
    }


    for (final indice in figurasRepetidas) {
      print("${indice.nome} - ${indice.codigo}");
    }
  }
}


