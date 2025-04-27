


void main() {
  DateTime data = DateTime(2022, 09, 05);
  var dataApos = data;


  for (int dias = 0; dias < 18; dias++) {
    if (dataApos.weekday == 6 || dataApos.weekday == 7) {
      dias--;
    }

    dataApos = dataApos.add(Duration(days: 1));
  }

  print("Data atual : ${data.day} / ${data.month} / ${data.year} ");
  print("Data Calculada : ${dataApos.day} / ${dataApos.month} / ${dataApos.year} ");
}





