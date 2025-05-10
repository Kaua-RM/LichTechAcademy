import 'dart:collection';
import 'dart:math';

void main(){

  print("Fila para ser atendido \n");

   final filaMercado = FilaMercado();
   final pessoas = Pessoas();

   for(int indice = 0 ; indice < 10 ; indice++) {
     filaMercado.adicionarPessoaFila(pessoas.gerarNomeAleatorio());
   }
   print("--------------------------\n");
   print("Atendimento\n");
   filaMercado.Atendimento();






}

class FilaMercado{

  final FilaDoMercado = Queue<String>();


  void adicionarPessoaFila(String pessoa){

      print("$pessoa entrou na fila");
      FilaDoMercado.add(pessoa);

  }

  void Atendimento(){

    final atender = FilaDoMercado.toList();

    for(int indice = 0 ; indice < atender.length ; indice++){
      print("${atender[indice]} foi atendida");
      FilaDoMercado.remove(atender[indice]);
    }

  }
}


class Pessoas{

Random random = new Random();

final nome = ["Joao" , "Gustavo" ,"Kaua" , "Rafael", "Miguel","Antonieta","Ana"];
final sobrenome = ["Da Vint" , "Estein","Solo","Player","Flores","Ouro","Valk"];


String gerarNomeAleatorio(){

  String Nome = nome[random.nextInt(nome.length)];
  String Sobrenome =  sobrenome[random.nextInt(sobrenome.length)];

  return (Nome+" "+Sobrenome);

}


}