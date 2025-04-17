import 'dart:io';

void main() {
  // perguntando o valor para converter
  print("Informe o valor");
  final String valorInformado = stdin.readLineSync() ?? "";

  // invocando a função de conversão
  converterLetras(valorInformado);
}

//  função que converte letras em numeros
void converterLetras(String parametro) {
  // tentanto converter uma letra em inteiro
  try {
    print("Numero Digitado : ${int.parse(parametro)}");
  } catch (e) {
    print("Entrada invalida. Digite apenas números inteiros.");
  }
}
