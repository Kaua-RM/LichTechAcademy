import 'dart:io';

void main(){

  // pedindo para o usuario informar o ano
  print("Informe o ano : ");
  int InformarAno = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  // invocando a função que verifica se o ano é bissexto
  ehAnoBissexto(InformarAno);

}

// criando a função que verifica se o ano é bissexto
void ehAnoBissexto(int ano){

  // utilizando o operador de fluxo para verificar o ano
  if(ano % 4 == 0 || ano % 400 == 0 && ano % 100 != 0 ){
    print("O ano $ano eh bissexto ");
  }else{
    print("O ano $ano não eh bissexto ");
  }
  
  
}