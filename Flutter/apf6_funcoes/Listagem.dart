import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atividade6/main.dart'; // Certifique-se que EstadoListaDePessoas e Pessoa estão aqui

class listagem extends StatefulWidget {
  @override
  State<listagem> createState() => _listagemState();
}

class _listagemState extends State<listagem> {
  final _FormKey = GlobalKey<FormState>();
  var nomeController = TextEditingController();


  Pessoa? _pessoaEncontrada;


  @override
  Widget build(BuildContext context) {
    return Consumer<EstadoListaDePessoas>(
      builder: (context, estadopessoa, child) => Scaffold(
        appBar: AppBar(
          title: Text("Listagem de Pessoas"), // Título mais descritivo
          centerTitle: true,
        ),
        body: Padding( // Adicionei Padding para um layout melhor
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Campo de Busca (TextFormField) ---
              Form( // Mantemos o Form para validação se necessário no campo de busca
                key: _FormKey,
                child: TextFormField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: "Nome da Pessoa para Buscar",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        final pessoa = Provider.of<EstadoListaDePessoas>(
                          context,
                          listen: false,
                        ).buscarPessoaPorNome(nomeController.text);
                        setState(() {
                          _pessoaEncontrada = pessoa;
                        });

                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              if (_pessoaEncontrada != null) ...[
                Text(
                  "Detalhes da Pessoa:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Table(
                  border: TableBorder.all(color: Colors.blue),
                  columnWidths: const {
                    0: FlexColumnWidth(1.5), // Nome e rótulos um pouco maiores
                    1: FlexColumnWidth(2.5), // Dados podem ser mais longos
                  },
                  children: [
                    // Cabeçalhos
                    TableRow(
                      decoration: BoxDecoration(color: Colors.blueGrey[50]), // Fundo leve para cabeçalhos
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Campo", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Valor", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    // Dados da Pessoa Encontrada
                    Linhas("Nome", _pessoaEncontrada!.nome),
                    Linhas("Email", _pessoaEncontrada!.email),
                    Linhas("Telefone", _pessoaEncontrada!.telefone),
                    Linhas("Github", _pessoaEncontrada!.github),
                    Linhas("Tipo Sanguíneo", _pessoaEncontrada!.tipoSanguineo.toString().split('.').last), // Mostra o nome do enum
                  ],
                ),
              ] else if (nomeController.text.isNotEmpty) ...[
                // Mensagem se a busca foi feita mas nada foi encontrado
                Text(
                  "Nenhuma pessoa encontrada com este nome. Tente novamente.",
                  style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ] else ...[
                // Mensagem inicial antes de qualquer busca
                Text(
                  "Digite um nome no campo acima e clique na lupa para buscar os detalhes de uma pessoa.",
                  style: TextStyle(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ],
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Todas as Pessoas Cadastradas:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    estadopessoa.pessoas.isEmpty
                        ? Center(child: Text("Nenhuma pessoa cadastrada ainda."))
                        : Expanded(
                      child: ListView.builder(
                        itemCount: estadopessoa.pessoas.length,
                        itemBuilder: (context, indice) {
                          final pessoa = estadopessoa.pessoas[indice];
                          return ListTile(
                            title: Text(pessoa.nome),
                            subtitle: Text(pessoa.email),
                            trailing: IconButton(
                              icon: Icon(Icons.account_circle_outlined),
                              onPressed: () {
                                setState(() {
                                  _pessoaEncontrada = pessoa;
                                  nomeController.text = pessoa.nome;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow Linhas(String label, String value) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value),
          ),
        ),
      ],
    );
  }
}