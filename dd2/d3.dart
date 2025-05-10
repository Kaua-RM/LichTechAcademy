import 'dart:io';

void main(){

  bibliotecaMusica().imprimirDados();

 // bibliotecaMusica().buscarInformacao(3);


}





 class bibliotecaMusica {

   Map<String, List<String>> Dados = {

     "Adventure of lifetime": ["Coldplay", "Adventure of lifetime", "3.40"],
     "Paradise": ["Coldplay", "Mylo Xyloto", "4.38"],
     "Eye Of The Tiger": ["Survivor", "Eye Of The Tiger", "4.04"],
   };


   void imprimirDados() {

     int quantidade = 0 ;
     double horas = 0 ;

     print("Musicas Cadastradas : ");
     Dados.forEach((key , value) {
       print("Musica : $key - Dados : ${value.join(" , ")}");
       horas += double.parse(value[2]);
       quantidade++;
     });

     print("Quantidade de musicas : $quantidade  - Horas totais : ${(horas/60).toStringAsFixed(2)} horas");

   }


   void buscarInformacao(int escolha){

     switch(escolha){
       case 1 :
         print("Informe o nome da musica : ");
         String nome = stdin.readLineSync() ?? "";
         Dados.forEach((key, value) {
           if (key.toLowerCase() == nome) {
             print("$key : $value");
           }
         });
         break;
       case 2 :
         print("Informe o nome do artista: ");
         String artista = stdin.readLineSync() ?? "";
         Dados.forEach((key, value) {
           if (value[0].toLowerCase()  == artista) {
             print("$key : $value");
           }
         });
         break;
       case 3 :
         print("Informe o nome do album: ");
         String album = stdin.readLineSync() ?? "";
         Dados.forEach((key, value) {
           if (value[1].toLowerCase()  == album) {
             print("$key : $value");
           }
         });
     }

   }


 }




