Future<void> main() async {
  List<String> urls = [
    'https://example.com/imagem1.jpg',
    'https://example.com/imagem2.jpg',
    'https://example.com/imagem3.jpg',
  ];

// dizendo para esperar a conclusão da Future baixarImagens 
   await baixarImagens(urls);
}

//  Future que informa que as imagens foram baixadas com sucesso 
Future<void> baixarImagens(List<String> lista)  async {

  print("Baixando imagens...");

// forEach que printa o valor com a frase Imagem $valor baixada com sucesso!
   lista.forEach((valor) => {
   print("Imagem $valor baixada com sucesso!  ")
  });
  
  print("Download concluído!");


}