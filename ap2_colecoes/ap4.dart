void main(){


 // Criando o mapa estadoCidade , que contém a chave estado e o valor cidade
 var  estadoCidade = {
   "SC" : ["Gaspar","Blumenau" , "Florianopolis"],
   "PR" : ["Curitiba","Cascavel","Foz do Iguaçu"],
   "SP" : ["Sao Paulo", "Guarulhos", "Campinas"],
   "MG" : ["Belo Horizonte","Juiz de Fora","Berlinda"],
 };

 //Printando as siglas dos estados
print("Estados : ${estadoCidade.keys.join(";")}");

//Printando as cidades do estado de SC
print("Cidades de SC : ${estadoCidade["SC"]!..sort()}");

//Printando as cidades e suas siglas correspondentes
estadoCidade.forEach((key , value) =>print("${(value!..sort()).join(" - $key\n")}" + " - $key" ));


}