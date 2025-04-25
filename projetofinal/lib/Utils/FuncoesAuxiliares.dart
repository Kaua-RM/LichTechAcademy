import 'package:projetofinal/Models/ClasseDados.dart';
import 'Conversores.dart';
import 'package:yaansi/yaansi.dart';

// Numero de casas depois da virgula
const valorCasas = 2;

// função que gera um relatorio sobre a temperatura anual e mensal
 void gerarRelatorioTemperatura(String chave, List<Listas> dados) {
  try{
  print("Relatório de Temperaturas no estado $chave: ");
  print(
   "Média no ano de 2024: ${red(calcularMedia(dados, (d) => d.temperatura).toStringAsFixed(valorCasas))} C"
       "||"
       " ${yellow(Fahrenheit(calcularMedia(dados, (d) => d.temperatura)).toStringAsFixed(valorCasas))} F "
       "||"
       " ${blue(Kelvin(calcularMedia(dados, (d) => d.temperatura)).toStringAsFixed(valorCasas))} K",
  );
  print(
   "Máxima do ano de 2024: ${red(calcularMaximo(dados, (d) => d.temperatura).toStringAsFixed(valorCasas) )} C"
       "||"
       " ${yellow(Fahrenheit(calcularMaximo(dados, (d) => d.temperatura)).toStringAsFixed(valorCasas))} F"
       "||"
           " ${blue(Kelvin(calcularMaximo(dados, (d) => d.temperatura)).toStringAsFixed(valorCasas))} K",
  );
  print(
   "Mínima do ano de 2024: ${red(calcularMinimo(dados, (d) => d.temperatura).toStringAsFixed(valorCasas))}C"
       "||"
       " ${yellow(Fahrenheit(calcularMinimo(dados, (d) => d.temperatura)).toStringAsFixed(valorCasas))} F"
       "||"
           " ${blue(Kelvin(calcularMinimo(dados, (d) => d.temperatura)).toStringAsFixed(valorCasas))} K",
  );

  print("\n\nMédias dos meses de $chave:");
     // map Mes , que atrela o atributo month de models como chave e valor lista que atrela a lista ao mês
  var Mes = <int, List<Listas>>{};
  for (var dados in dados) {
   Mes.update(
    dados.dataHora.month,
        (lista) => lista..add(dados),
    ifAbsent: () => [dados],
   );
  }

  Mes.forEach((mes, lista) {
   double media = calcularMedia<Listas>(lista, (d) => d.temperatura);
   print(
    " - Mês $mes: ${red(media.toStringAsFixed(valorCasas))} C"
        "||"
        " ${yellow(Fahrenheit(media).toStringAsFixed(valorCasas))} F"
        "||"
        " ${blue(Kelvin(media).toStringAsFixed(valorCasas))} K",
   );
  });



  print("\nTemperatura média por horário no estado:");
      // map porhora , que atrela o atributo hour de models como chave e valor lista que atrela a lista ao mês
  var porHora = <int, List<Listas>>{};
  for (var d in dados) {
   porHora.update(
    d.dataHora.hour,
        (lista) => lista..add(d),
    ifAbsent: () => [d],
   );
  }
     // transformando a chaves do map porhora em uma lista e ordenando a mesma
  var horas = porHora.keys.toList()..sort();
  for (var h in horas) {
      // variavel que pega o par chave valor por meio do indice h
   var lista = porHora[h]!;
   double mediaHora = calcularMedia<Listas>(lista, (d) => d.temperatura);
   // Printando as informações
   print(
    " - ${h.toString().padLeft(valorCasas, '0')}:00 => ${red(mediaHora.toStringAsFixed(valorCasas))} "
        "C || ${yellow(Fahrenheit(mediaHora).toStringAsFixed(valorCasas))} "
        "F || ${blue(Kelvin(mediaHora).toStringAsFixed(valorCasas))} K",
   );
  }}catch(e){
   print("Erro : $e");
  }
}

// função que gera um relatorio sobre a Umidade anual e mensal
void gerarRelatorioUmidade( String chave , List<Listas> dados){
 print("Relatório da Umidade : $chave");
 //variaveis que recebem como valor as funções calcularMeida , calcularMaximo , calcularMinimo
 double mediaUmidade =   calcularMedia<Listas>(dados, (d) => d.umidade) * 100;
 double umidadeMaxima =  calcularMaximo<Listas>(dados, (d) => d.umidade);
 double umidadeMinima =  calcularMinimo<Listas>(dados, (d) => d.umidade);
 // printando as informações
 print("Umidade média do ano 2024: ${green(mediaUmidade.toStringAsFixed(valorCasas))}%");
 print("Umidade máxima do ano 2024: ${red(umidadeMaxima.toStringAsFixed(valorCasas))}%");
 print("Umidade mínima do ano 2024: ${blue(umidadeMinima.toStringAsFixed(valorCasas))}%");
}

// função que gera um relatorio sobre a direção do vento anual e mensal
void gerarRelatorioVento(String chave , List<Listas> dados){
 print("Relatório do Vento $chave");

 // Direção mais frequente no ano todo
 Map<double, int> frequenciaAnual = {};
 for (var d in dados) {
  frequenciaAnual[d.direcaoVento] = (frequenciaAnual[d.direcaoVento] ?? 0) + 1;
 }
 var dirMaisFreqAno = frequenciaAnual.entries.reduce(
      (a, b) => a.value > b.value ? a : b,
 );
  // Printando as informações de direção do vento por ano
 print(
  "Maior frequencia de direção do vento no ano: ${blue("${dirMaisFreqAno.key}º")}\n",
 );

 // Direção mais frequente por mês
 print("Maior frequencia de direção do vento por mês:");
 var Mes = <int, List<Listas>>{};
 for (var d in dados) {
  Mes.update(
   d.dataHora.month,
       (lista) => lista..add(d),
   ifAbsent: () => [d],
  );
 }

 Mes.forEach((mes, lista) {
  Map<double, int> frequenciaMes = {};
    // for que pega o mapa frequencia mes e por meio da chave direçãoVento e conta os valores que se repetem
  for (var d in lista) {
   frequenciaMes.update(d.direcaoVento, (valor) => valor + 1, ifAbsent: () => 1);
  }
    // Pega a chave mes e valor e verifica se não tem um valor maior
  var MaisFrequete = frequenciaMes.entries.reduce(
       (a, b) => a.value > b.value ? a : b,
  );
  print(
   " - Mês $mes: ${yellow(MaisFrequete.key.toString()) } º | ${yellow(Radianos(MaisFrequete.key).toStringAsFixed(valorCasas))} Rad (${MaisFrequete.value} ocorrências) ",
  );
 });
}








