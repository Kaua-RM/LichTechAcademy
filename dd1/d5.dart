import 'dart:math';


void main(){

   Random random = new Random();

   String nomes = "Ana, Francisco, Joao, Pedro, Gabriel, Rafaela, Marcio, Jose, Carlos, Patricia, Helena, Camila, Mateus, Gabriel, Maria, Samuel, Karina, Antonio, Daniel, Joel, Cristiana, Sebastião, Paula";

   String sobrenome = "Silva, Ferreira, Almeida, Azevedo, Braga, Barros, Campos, Cardoso, Teixeira, Costa, Santos, Rodrigues, Souza, Alves, Pereira, Lima, Gomes, Ribeiro, Carvalho, Lopes, Barbosa";

   List<String> nome = nomes.split(",");
   List<String> sobreNome = sobrenome.split(",");

   int nomeAleatorio = random.nextInt(nome.length) - 1;
   int sobrenomeAletorio = random.nextInt(sobreNome.length) - 1;


   print("${nome[nomeAleatorio]} ${sobreNome[sobrenomeAletorio]}");



}