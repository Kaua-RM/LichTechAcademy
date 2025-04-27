void main(){
  String paragrafo = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
      "Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.";

print("Numero de palavras: ${calcularPalavras(paragrafo)}\n"
    "Tamanho do texto: ${calcularTamanhoTexto(paragrafo)}\n"
    "Numero de frases: ${calcularFrases(paragrafo)}\n"
    "Numero de vogais: ${calcularVogais(paragrafo)}\n"
    "Consoantes encontradas: ${ calcularConsoantes(paragrafo)}\n");
}


int calcularPalavras(String paragrafo){

  List<String> textos = paragrafo.split(" ");
  int numeroPalavras = 0;

  textos.forEach((valor) => numeroPalavras++);

  return numeroPalavras;

}

int calcularTamanhoTexto(String paragrafo){

  List<String> textos = paragrafo.split("");
  int numeroPalavras = 0;

  for(final indice in textos){

    numeroPalavras++;

  }

  return numeroPalavras;

}

int calcularFrases(String paragrafo){

  List<String> textos = paragrafo.split(".");
  int numeroPalavras = 0;

  for(final indice in textos) {
    if (indice == "") {
      continue;
    }
    numeroPalavras++;
  }

  return numeroPalavras;

}

int calcularVogais(String paragrafo){

  List<String> textos = paragrafo.split("");
  int numeroPalavras = 0;

  for(final indice in textos){
    indice.toLowerCase();

    if(indice == "a" || indice == "e" || indice == "i" || indice == "o" || indice == "u"){
      numeroPalavras++;
    }
    
  }

  return numeroPalavras;

}

Set<String> calcularConsoantes(String paragrafo){

  List<String> textos = paragrafo.split("");
  List<String> consoantes = [];
  int numeroPalavras = 0;



  for(final indice in textos){
    indice.toLowerCase();

    if(indice == "a" || indice == "e" || indice == "i" || indice == "o" || indice == "u" || indice == "," || indice == " " || indice == "."){
    continue;
    }

    if(indice.toUpperCase() == indice){
      continue;
    }

    consoantes.add(indice);

  }

  consoantes.sort();
  consoantes.join("");


  return consoantes.toSet();

}

