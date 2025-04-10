import 'dart:math';

void main(){

  // Instanciando a Classe Randow
  Random random = new Random();

  // Lista com valores numéricos aleatórios
  final List<int> valoresAleatorios = List.generate(15, (_) => random.nextInt(4999) + 1 );
  
  // Laço de repetição que servira para printar os resultados das funções ConversaoBinaria , ConversaoOctal , ConversaDecimal , ConversaoHexadecimal
for(final valAleatorios in valoresAleatorios){
  final Binario = ConversaoBinaria(valAleatorios);
  final Octal = ConversaoOctal(valAleatorios);
  final Decimal = ConversaDecimal(valAleatorios);
  final Hexadecimal = ConversaoHexadecimal(valAleatorios);
  print("Valor : $valAleatorios  ValorBinario : $Binario  ValorOctal : $Octal  ValorDecimal : $Decimal  ValorHexadecimal : $Hexadecimal");
}

}

// Função que converte o parametro para binário
String ConversaoBinaria(int parametro) => parametro.toRadixString(2);

// Função que converte o parametro para octal
String ConversaoOctal(int parametro) => parametro.toRadixString(8);

// Função que converte o parametro para decimal
String ConversaDecimal(int parametro) => parametro.toRadixString(10);

// Função que converte o parametro para hexadecimal
String ConversaoHexadecimal(int parametro) => parametro.toRadixString(16);
