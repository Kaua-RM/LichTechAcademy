
import 'dart:math';

void main(){

  // Variaveis que recebem a função FuncaoA_SomaFuncao com outras funções como parametro
  final resultadoFuncaoB = FuncaoA_SomaFuncao(FuncaoB_MultiplicaPor2);
  final resultadoFuncaoC = FuncaoA_SomaFuncao(FuncaoC_DivisaoPor2);

  //Printando as Informações
  print("Funcao A(B) : $resultadoFuncaoB");
  print("Funcao A(C) : $resultadoFuncaoC");

}


// Função que soma o parametro com o mesmo parametro
double FuncaoA_SomaFuncao( double Function(double valor) funcaoparametro){
  final Random valorAleatorio = new Random();
  return funcaoparametro(valorAleatorio.nextDouble()) + funcaoparametro(valorAleatorio.nextDouble());
}

// Função que multiplica um valor por 2
double FuncaoB_MultiplicaPor2(double valor) => valor * 2;

// Função que divide um valor por 2
double FuncaoC_DivisaoPor2(double valor) => valor/2;




