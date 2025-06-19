### 🕒 O que é programação assíncrona em Flutter e por que ela é importante?

Programação Assíncrona: É a capacidade de executar operações que podem levar tempo (como requisições de rede, leitura de arquivos) sem bloquear a interface do usuário (UI) do aplicativo. Ela é crucial no Flutter para manter a UI responsiva e fluida, evitando que o aplicativo "congele" enquanto espera por uma operação demorada.

---
### 🔎Observação

algo que descobri foi que no flutter foi que ao invés de fetch para se chamar uma API , e sim o .get da biblioteca http 

---

### ⚠️ Quais cuidados devo ter usando programação assíncrona?
``Evitar Bloqueio da UI``: Certificar-se de que operações longas realmente rodem em segundo plano e não no thread principal.

``Gerenciamento de Estado``: Saber quando atualizar a UI após uma operação assíncrona, usando setState (em StatefulWidgets) ou soluções de gerenciamento de estado.

``Tratamento de Erros``: Implementar try-catch para lidar com falhas nas operações assíncronas.

``Cancelamento``: Em cenários complexos (ex: requisições de rede que podem não ser mais necessárias), considerar o cancelamento de operações para evitar uso desnecessário de recursos.

---
### 🔎Observação

O flutter foi o primeiro framework que relmente comecei a lidar com requisições http , então entender melhor sobre os cuidados que devo tomar é muito bom para programar de uma forma melhor 

---

### ⚙️ O que são isolates em Flutter?
Isolates: São threads Dart separadas, leves e independentes, que não compartilham a mesma memória. Cada isolate tem seu próprio "event loop" e memória, o que os torna ideais para executar cálculos intensivos que poderiam bloquear o thread principal da UI. A comunicação entre isolates é feita via mensagens (portas).

---
### 🔎Observação

Para entender melhor busquei exemplos como esse : 


``` dart 
import 'dart:isolate'; // Para usar Isolates
import 'package:flutter/material.dart'; // Para a UI

// --- A TAREFA PESADA (EXECUTADA NO ISOLATE SEPARADO) ---
// Precisa ser uma função top-level (fora de classes) ou estática.
void countToTenBillion(SendPort sendPort) {
  int count = 0;
  // Simula um cálculo demorado (você pode aumentar esse número)
  for (int i = 0; i < 1000000000; i++) { // Contagem de 1 bilhão
    count++;
  }
  // Envia o resultado de volta para o Isolate principal
  sendPort.send(count);
}

// --- A INTERFACE DO USUÁRIO (EXECUTADA NO ISOLATE PRINCIPAL) ---
class SimpleIsolateExample extends StatefulWidget {
  const SimpleIsolateExample({super.key});

  @override
  State<SimpleIsolateExample> createState() => _SimpleIsolateExampleState();
}

class _SimpleIsolateExampleState extends State<SimpleIsolateExample> {
  String _message = 'Pressione o botão para iniciar a contagem.';

  // Função para iniciar a contagem no Isolate separado
  Future<void> _startCountingInIsolate() async {
    setState(() {
      _message = 'Contando... (A UI DEVE continuar responsiva!)';
    });

    // 1. Criar uma "porta" para receber o resultado do Isolate
    final ReceivePort receivePort = ReceivePort();

    // 2. Iniciar o novo Isolate
    // spawn: cria o Isolate e diz qual função ele vai executar
    // O 'sendPort' permite que o Isolate novo nos envie mensagens de volta
    final Isolate newIsolate = await Isolate.spawn(
      countToTenBillion,
      receivePort.sendPort,
    );

    // 3. Escutar a mensagem de volta do Isolate
    receivePort.listen((data) {
      if (data is int) { // O Isolate enviou o número da contagem
        setState(() {
          _message = 'Contagem finalizada: $data!';
        });
        // 4. Matar o Isolate quando terminar para liberar recursos
        newIsolate.kill();
        receivePort.close(); // Fechar a porta
      }
    });

    // Esta mensagem aparecerá no console logo após o Isolate ser iniciado,
    // mostrando que a UI não travou.
    print('Isolate principal: Contagem iniciada no fundo.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isolates: Sem Congelamento da UI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _startCountingInIsolate,
              child: const Text('Iniciar Contagem Demorada'),
            ),
            const SizedBox(height: 20),
            // Este botão prova que a UI não está travada!
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('A UI está viva e responsiva!')),
                );
              },
              child: const Text('Aperte-me para testar a UI!'),
            ),
          ],
        ),
      ),
    );
  }
}

// Para rodar este exemplo, use como a função principal do seu app:
void main() {
  runApp(const MaterialApp(home: SimpleIsolateExample()));
}

```


---

### ⚠️ Quais cuidados devo ter ao usar isolates em Flutter?

``Complexidade``: Adicionar isolates aumenta a complexidade do código, pois a comunicação é baseada em mensagens.

``Serialização de Dados``: Dados precisam ser serializados para serem enviados entre isolates, o que pode ter um custo.

``Overhead``: Há um pequeno overhead na criação e comunicação de isolates, então use-os apenas para tarefas realmente intensivas.`

``Evitar Isolar Demais``: Não use isolates para tarefas que async/await já resolvem bem, pois eles são mais complexos.

---
### 🔎Observação

Acho que devido a essa complexidade , o professor não chegou a explicar muito bem sobre este tema 

---

### 🔁 Qual o conceito do Loop de Eventos em Flutter?
O Loop de Eventos (Event Loop) é o mecanismo central do Dart/Flutter que permite a programação assíncrona. Ele continuamente verifica duas filas:

``Fila de Microtarefas (Microtask Queue)``: Para eventos de alta prioridade (ex: callbacks de Future.then).

``Fila de Eventos (Event Queue)``: Para eventos externos (ex: clique do usuário, resposta HTTP, temporizadores). O Loop de Eventos processa primeiro todas as microtarefas e, em seguida, um evento da fila de eventos, um por vez, garantindo que o thread principal permaneça responsivo.

---
### 🔎Observação

Eu já tinha visto este conceito de fila de eventos , ele está na documentação do Dart. 

---

### 🔮 O que é um 'Future' em Dart e como ele funciona?

Um Future em Dart é um objeto que representa o resultado de uma operação assíncrona que pode não estar disponível imediatamente. Ele pode estar em um de três estados:

``Incompleto``: A operação ainda está em andamento.

``Completo com valor``: A operação terminou com sucesso e produziu um valor.

``Completo com erro``: A operação falhou com um erro.
Ele funciona como uma promessa de que um valor estará disponível no futuro.

---
### 🔎Observação

Eu entendo o Future como uma promessa que um valor vai ser aplicado , mas sem erro. 

---

### ⏳ Como posso usar 'async' e 'await' para trabalhar com 'Futures'?
``async``: Usada em uma função para indicar que ela contém operações assíncronas e que poderá await por Futures. A função async sempre retorna um Future.

``await``: Usada dentro de uma função async para pausar a execução do código até que um Future seja concluído. O valor resultante do Future é então atribuído à variável.

Exemplo:

```Dart

Future<String> fetchData() async {
  // Simula uma operação de rede
  await Future.delayed(Duration(seconds: 2));
  return 'Dados carregados!';
}

void main() async {
  print('Iniciando...');
  String data = await fetchData(); // Pausa aqui até fetchData() completar
  print(data);
  print('Finalizado.');
}
```

---
### 🔎Observação

O async é colocado na classe para referenciar que ela é assicrona , enquanto que o await é uma função que faz o código esperar as informações.

---

### ❌ Como posso lidar com erros em operações assíncronas usando 'try-catch'?

Você pode envolver o código que contém a operação await dentro de um bloco try-catch. Se o Future lançar um erro, ele será capturado pelo bloco catch.

Exemplo:

```Dart

Future<String> fetchWithError() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception('Falha ao carregar dados!');
}

void processData() async {
  try {
    String data = await fetchWithError();
    print(data);
  } catch (e) {
    print('Erro: $e');
  }
}
```

---
### 🔎Observação

Daria para criar um exception personalizavel em relação ao problema de dados assicronos 

---

### 🌐 Traga a explicação dos métodos HTTP.
Os métodos HTTP (também chamados de verbos HTTP) indicam a ação que se deseja realizar em um recurso no servidor:

``GET``: Solicita uma representação de um recurso especificado. Deve ser usado apenas para recuperar dados.`

``POST``: Envia dados para o servidor para criar um novo recurso.

``PUT``: Envia dados para o servidor para atualizar ou substituir um recurso existente.

``DELETE``: Remove um recurso especificado do servidor.

``PATCH``: Aplica modificações parciais a um recurso.

---
### 🔎Observação

Não tinha muito conhecimento sobre o patch , então pesquisei um pouco , o patch nada mais é do que um filtro de atualizações , pois ele modifica somente as informações que dejesa serem modificadas. 

---

### 🔢 Como posso lidar com diferentes códigos de resposta HTTP (200, 404, 500)?

Após fazer uma requisição HTTP, você verifica a propriedade statusCode da resposta.

``200 OK``: Sucesso. O recurso foi recuperado ou a operação foi bem-sucedida.

``400 Bad Request``: Requisição inválida (geralmente problema no cliente).

``401 Unauthorized``: Autenticação necessária ou falhou.

``403 Forbidden``: Acesso negado.

``404 Not Found``: O recurso solicitado não existe no servidor.

``500 Internal Server Error``: Erro no servidor.
Você usa condicionais (if/else ou switch) para tratar cada caso:

```Dart

if (response.statusCode == 200) {
  // Sucesso, processar dados
} else if (response.statusCode == 404) {
  // Recurso não encontrado
} else {
  // Lidar com outros erros
}

```

---
### 🔎Observação

Os erros que mais vejo são 400 e 404 

---

### 📄 O que é JSON e como ele é usado em Flutter?

JSON (JavaScript Object Notation): É um formato leve e baseado em texto para troca de dados. É amplamente utilizado na comunicação entre APIs web e aplicativos móveis devido à sua simplicidade e facilidade de leitura por humanos e máquinas.

No Flutter, o JSON é usado para enviar e receber dados de APIs RESTful. O pacote dart:convert (especialmente json.decode e json.encode) é usado para converter Strings JSON em objetos Dart (Map, List) e vice-versa.

---
### 🔎Observação

O formato em que json chega quando é utilizado o decode é um list de Map , geralmente o Map vai ser um Map(String, dynamic)

---

### 🔍 Como posso acessar valores específicos em um objeto JSON?

Após decodificar uma String JSON para um Map<String, dynamic> (usando json.decode), você acessa os valores usando chaves (strings), como em um mapa Dart.

Exemplo:

```Dart

String jsonString = '{"nome": "Maria", "idade": 30}';
Map<String, dynamic> data = json.decode(jsonString);

String nome = data['nome'];    // "Maria"
int idade = data['idade'];     // 30

```

---
### 🔎Observação

Como já citado anteriormente , ele é um Map de <String,dynamic> , aonde precisar ter uma chave para recuperar um valor. 

---

### 🔄 Como posso lidar com arrays (listas) em JSON em Flutter?
Arrays JSON são decodificados para List<dynamic> em Dart. Você pode então iterar sobre essa lista e, se os elementos forem objetos JSON, convertê-los para Map<String, dynamic> individualmente.

Exemplo:

```Dart

String jsonArrayString = '[{"id": 1, "item": "Banana"}, {"id": 2, "item": "Maçã"}]';
List<dynamic> itemList = json.decode(jsonArrayString);

// itemList agora é uma List (de Map<String, dynamic>)
```

---
### 🔎Observação

Já se teve que fazer isso em um desafio , como o projeto de sábado.

---

### 🔁 Como posso iterar sobre os elementos de um array JSON?

Você pode usar um loop for ou métodos como forEach ou map em uma List<dynamic> obtida da decodificação do JSON.

Exemplo (continuando do anterior):

```Dart
for (var itemMap in itemList) {
  print('ID: ${itemMap['id']}, Item: ${itemMap['item']}');
}

// Usando map para criar uma nova lista de objetos Dart:
List<MyItem> myObjects = itemList.map((itemMap) => MyItem.fromJson(itemMap)).toList();
```

---
### 🔎Observação

Ainda não tinha utilizado o fromJson , já havia ouvido falar mas realmente utilizar ou ver um exemplo foi a primeira vez 

---

### 📊 Por que é útil mapear JSON para classes Dart?

Mapear JSON para classes Dart (modelos) é uma boa prática porque:

``Segurança de Tipo``: Garante que você está trabalhando com tipos de dados corretos, reduzindo erros de tempo de execução.

``Legibilidade e Manutenção``: Torna o código mais legível e fácil de manter, pois você lida com objetos Dart com propriedades nomeadas.

``Autocompletar``: Melhora a experiência de desenvolvimento com autocompletar na IDE.

``Validação``: Facilita a validação de dados recebidos da API.

---
### 🔎Observação

Para mim acho que os dois pontos pontos mais importantes são a segurança e a validação , partes muitos importantes na hora de interagir com as informações. 

---

### 🏭 Como posso usar 'factory' para criar objetos Dart a partir de JSON?

Você pode usar um construtor factory na sua classe Dart para criar uma instância da classe a partir de um Map<String, dynamic> (que é o resultado da decodificação do JSON).

Exemplo:

```Dart

class Produto {
  final int id;
  final String nome;

  Produto({required this.id, required this.nome});

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'] as int,
      nome: json['nome'] as String,
    );
  }
}

// Uso:
Map<String, dynamic> produtoJson = {'id': 1, 'nome': 'Notebook'};
Produto meuProduto = Produto.fromJson(produtoJson);

```

---
### 🔎Observação

Utilizei o factory no código do projeto de sábado , ele deixa o código mais legivel e me ajuda na hora de adicionar algum dado novo 

---

### 🔄 Como posso usar 'toJson()' para converter objetos Dart em JSON?

Você pode adicionar um método toJson() à sua classe Dart que converte a instância da classe de volta para um Map<String, dynamic>. Este Map pode então ser codificado para uma String JSON usando json.encode().

Exemplo (continuando a classe Produto):

```Dart

class Produto {
  final int id;
  final String nome;

  Produto({required this.id, required this.nome});

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'] as int,
      nome: json['nome'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
    };
  }
}

// Uso:
Produto novoProduto = Produto(id: 3, nome: 'Mouse');
String produtoJsonString = json.encode(novoProduto.toJson());
// Resultado: '{"id":3,"nome":"Mouse"}'
```

---
### 🔎Observação

Ainda não precisei realizar esta operação , mas quando precisar já sei o caminho que devo seguir 
---

### 🧩 Como organizar minhas requisições no meu código Flutter?
Boas práticas para organizar requisições:

``Camada de Serviço/Repositório``: Crie classes ou arquivos dedicados para suas requisições HTTP (ApiService ou ProductRepository). Isso separa a lógica de rede da lógica da UI.

``Modelos de Dados``: Defina classes Dart (modelos) para representar os dados JSON que você envia e recebe.

``Tratamento de Erros Centralizado``: Implemente uma forma consistente de lidar com erros de rede em sua camada de serviço.

``Injeção de Dependência``: Use um sistema de injeção de dependência (como Provider, GetIt, ou Riverpod) para fornecer instâncias dos seus serviços de API aos widgets ou outras camadas.

``Pacotes HTTP``: Use pacotes como http ou Dio para as requisições HTTP em si.

``Constantes``: Defina URLs base e endpoints como constantes.


---
### 🔎Observação

Este era um ponto que eu estava muito interessado para aprender , pois o código estava ficando meio confuso , vou tentar aplicar da melhor forma estas boas práticas , mas terei que pesquisar melhor sobre , pois ficou muito superficial. 

---