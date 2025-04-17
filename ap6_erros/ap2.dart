import 'dart:io';

void main() {
  // tentando realizar a entrada de um numero
  try {
    print("Informe um valor : ");
    final int numero = int.tryParse(stdin.readLineSync() ?? "0") ?? -1;
    // invocando a função de validação
    validarNumero(numero);
  } catch (e) {
    // printando o erro
    print(e);
  }
}

// função que verifica se o valor é par
void validarNumero(int parametro) {
  if (parametro.isOdd) {
    throw "Entrada inválida. Insira apenas números pares.";
  }

  print("Entrada correta, você inseriu um número par.");
}
