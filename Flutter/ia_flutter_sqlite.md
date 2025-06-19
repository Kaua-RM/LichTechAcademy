### 🗄️ O que é um banco de dados SQLite e como ele funciona em Flutter?

SQLite: É um sistema de gerenciamento de banco de dados relacional (SQL) embarcado, leve e sem servidor. Isso significa que ele não requer um processo de servidor separado e armazena os dados em um único arquivo no dispositivo.
Em Flutter, você interage com o SQLite usando pacotes como sqflite (o mais popular) ou abstrações mais robustas como drift (anteriormente moor), floor, isar ou hive. Ele funciona permitindo que seu aplicativo execute comandos SQL para criar tabelas, inserir, consultar, atualizar e excluir dados diretamente no arquivo do banco de dados local.


---
### 🔎Observação

Ou seja , um SGBD que armazena dados dentro de um arquivo. 


---

### 🌟 Quais são as vantagens de usar SQLite em aplicativos Flutter?
``Offline First``: Permite que o aplicativo funcione sem conexão com a internet, armazenando dados localmente.

``Performance``: Acesso rápido aos dados, pois eles estão no dispositivo, não dependendo da rede.

``Estrutura Relacional``: Permite organizar dados de forma estruturada com tabelas, chaves primárias/estrangeiras e relacionamentos.

``Flexibilidade SQL``: Oferece o poder e a flexibilidade da linguagem SQL para consultas complexas.

``Leve``: Não adiciona muito peso ao tamanho do aplicativo, ideal para dispositivos móveis.

``Sem Servidor``: Não exige configuração de servidor, simplificando o desenvolvimento para dados locais.

---
### 🔎Observação

Realmente , o SQLITE é mais rápido e leve que o SQL normal , ao utilizar consegui perceber a diferença de performace de busca de dados , mesmo não sendo muitos. 

---

### 🔢 Quais são os tipos de dados básicos que posso armazenar em um banco de dados SQLite?

SQLite é flexível com tipos, mas os mais comuns são:

``INTEGER``: Números inteiros.
``REAL``: Números de ponto flutuante (decimais).
``TEXT``: Cadeias de caracteres (strings).
``BLOB``: Dados binários (como imagens, arquivos).
``NULL``: Representa um valor nulo.

SQLite permite armazenar outros tipos como BOOLEAN ou DATE/DATETIME, mas eles são geralmente armazenados como INTEGER (0 ou 1) ou TEXT (formato ISO 8601).

---
### 🔎Observação

Achei muito interessante que ele permita guardar valores nulos e que ainda mesmo sendo mais leve , ele possui o tipo DATETIME. 

---

### ➕ Como posso inserir novos registros em uma tabela SQLite usando Flutter?

Usando o pacote sqflite, você abre o banco de dados e utiliza o método insert() do objeto Database. Você passa o nome da tabela e um Map<String, dynamic> onde as chaves são os nomes das colunas e os valores são os dados a serem inseridos.

Exemplo:

```Dart

import 'package:sqflite/sqflite.dart';

Future<void> insertProduto(Database db, Map<String, dynamic> produto) async {
  await db.insert(
    'produtos', // nome da tabela
    produto,    // Map com os dados
    conflictAlgorithm: ConflictAlgorithm.replace, // estratégia em caso de conflito
  );
}

```

---
### 🔎Observação

ConflictAlgorithm.replace é uma instrução que você dá a um banco de dados (ou a uma biblioteca que interage com ele, como o sqflite no Flutter para SQLite) para dizer o que fazer quando há um conflito durante uma operação de inserção (INSERT) ou atualização (UPDATE).

---

### 🔢 Como posso inserir vários registros de uma vez em uma tabela SQLite?

Você pode usar um loop e chamar insert() várias vezes dentro de uma transação para garantir atomicidade e melhor performance. Alternativamente, algumas implementações ou pacotes (como drift) oferecem métodos para inserção em lote.

Exemplo com transação:

```Dart

Future<void> insertProdutosBatch(Database db, List<Map<String, dynamic>> produtos) async {
  await db.transaction((txn) async {
    for (var produto in produtos) {
      await txn.insert('produtos', produto);
    }
  });
}

```

---
### 🔎Observação

Pesquisando um pouco melhor sobre drift: O Drift é um builder de consultas reativo para SQLite e um ORM (Object-Relational Mapper) tipo-seguro para Dart e Flutter. Essencialmente, ele permite que você interaja com seu banco de dados SQLite de forma muito mais segura, mais idiomática para Dart e com um monte de recursos que simplificam o desenvolvimento.

exemplo : 

```dart
// Exemplo de definição de tabela em Dart
import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
  TextColumn get email => text().unique()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

```

---

### 🆔 Como posso obter o ID do último registro inserido em uma tabela SQLite?

O método insert() do sqflite retorna o id (chave primária) do registro inserido, se a coluna da chave primária for um INTEGER PRIMARY KEY AUTOINCREMENT.

Exemplo:

```Dart

Future<int> insertAndGetId(Database db, Map<String, dynamic> produto) async {
  int id = await db.insert('produtos', produto);
  return id;
}
```

---
### 🔎Observação

Isso é uma ótima informação para realizar buscas , pois poderia ser criado um list que conteria o id de todas as informações cadastradas. 

---

### 🔍 Como posso filtrar os resultados de uma consulta usando a cláusula WHERE?

Você usa o método query() (ou rawQuery() para SQL puro) e as propriedades where e whereArgs. O where define a condição e o whereArgs fornece os valores para evitar injeção de SQL.

Exemplo:

```Dart

Future<List<Map<String, dynamic>>> getProdutosPorCategoria(Database db, String categoria) async {
  return await db.query(
    'produtos',
    where: 'categoria = ?',
    whereArgs: [categoria],
  );
}
```

---
### 🔎Observação

Achei interessante poder usar o where dentro do Flutter , isso mostra a facilidade do Flutter. 

---

### 📊 Como posso agrupar os resultados de uma consulta usando a cláusula GROUP BY?

Você usa a propriedade groupBy no método query().

Exemplo:

```Dart

Future<List<Map<String, dynamic>>> getContagemPorCategoria(Database db) async {
  return await db.query(
    'produtos',
    columns: ['categoria', 'COUNT(*) as total'], // Colunas que você quer
    groupBy: 'categoria', // Coluna para agrupar
  );
}
```

---
### 🔎Observação

Achei interessante poder usar o comando groupBy dentro do Flutter , isso demonstra uma simplicidade dentro da produção do código. 

---

### 🗑️ Como posso excluir registros de uma tabela SQLite usando Flutter?

Você usa o método delete() do objeto Database, passando o nome da tabela e, opcionalmente, uma cláusula where e whereArgs para especificar quais registros excluir.

Exemplo:

```Dart
Future<int> deleteProduto(Database db, int idProduto) async {
  return await db.delete(
    'produtos',
    where: 'id = ?',
    whereArgs: [idProduto],
  );
}
```

---
### 🔎Observação

Estou cada vez mais interessado em implementar um código que utilize um banco de dados , são muitas funcionalidade que facilitam o programador 

---`

### ⚠️ Quais os cuidados necessários ao usar UPDATE, INSERT e DELETE?
``Parâmetros Seguros``: Sempre use whereArgs com a cláusula where para passar valores dinâmicos. Isso evita injeção de SQL, um grande risco de segurança.

``Transações``: Para operações que envolvem múltiplas modificações (inserções, atualizações, exclusões) que precisam ser atômicas (tudo ou nada), use transações para garantir a integridade dos dados.

``Tratamento de Erros``: Implemente try-catch para lidar com possíveis erros durante as operações de banco de dados.
Performance: Para grandes volumes de dados, considere operações em lote ou transações para melhorar a performance.

``Backup e Restauração``: Pense em estratégias para backup e restauração dos dados, especialmente para dados críticos.

---
### 🔎Observação

A parte mais importante seria a parte de Backup e Restauração , pois ele atuam em muitas partes do código. 

---

### 🔗 Como posso criar tabelas relacionadas em um banco de dados SQLite?

Você cria tabelas separadas e define chaves estrangeiras em uma tabela que referenciam as chaves primárias de outra tabela.

Exemplo de SQL para criar tabelas relacionadas:

```SQL

CREATE TABLE categorias (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT NOT NULL
);

CREATE TABLE produtos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT NOT NULL,
  preco REAL,
  categoria_id INTEGER,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE
);
```

O ON DELETE CASCADE significa que se uma categoria for excluída, todos os produtos associados a ela também serão excluídos.

---
### 🔎Observação

Quase não se difere do SQL normal , só não tem alguns tipos de dados. 

---

🤝 Como posso consultar dados de tabelas relacionadas usando JOIN?

Você usa a cláusula JOIN em suas consultas SQL para combinar linhas de duas ou mais tabelas com base em uma coluna relacionada (geralmente a chave estrangeira).

Exemplo de rawQuery com JOIN:

```Dart
Future<List<Map<String, dynamic>>> getProdutosComCategorias(Database db) async {
  return await db.rawQuery('''
    SELECT
      p.id AS produto_id,
      p.nome AS produto_nome,
      p.preco,
      c.nome AS categoria_nome
    FROM
      produtos p
    JOIN
      categorias c ON p.categoria_id = c.id
  ''');
}
```

---
### 🔎Observação

Exite o Join , LeftJoin , Right Join , entre outros , cada um para uma pesquisa mais filtrada. 

---

### 📦 O que são transações em um banco de dados SQLite e por que são importantes?
Transações: São sequências de uma ou mais operações de banco de dados tratadas como uma única unidade atômica. Isso significa que ou todas as operações dentro da transação são concluídas com sucesso (commit), ou nenhuma delas é aplicada (rollback) se ocorrer um erro.
São importantes para garantir a integridade dos dados em operações complexas, onde múltiplas etapas devem ser executadas juntas. Se uma etapa falhar, toda a transação é desfeita, evitando estados inconsistentes no banco de dados.

---
### 🔎Observação

Ao estudar SQL normal , ouvi falar sobre commit e rollback , no SQL é possivel até desativar o commit. 

---

### 🔙 Como posso reverter uma transação em caso de erro?

No sqflite, quando você usa db.transaction((txn) async { ... }), se qualquer erro for lançado dentro do bloco async { ... }, a transação é automaticamente revertida (rollback). Você não precisa chamar rollback explicitamente. Se tudo ocorrer bem, a transação é automaticamente confirmada (commit).

Exemplo:

```Dart
await db.transaction((txn) async {
  await txn.insert('tabelaA', {'col': 1});
  // Se esta linha falhar, tudo é desfeito:
  await txn.insert('tabelaB', {'col': 'inválido'});
  // Se chegar aqui, tudo é salvo.
});
```

---
### 🔎Observação

Seria que não teria uma forma de controlar o commit assim como no SQL ? Mas acredito que não seja muito interessante isso , pois pode levar a alguns problemas em relação ao commit. 

---

### ✅ Quais são as vantagens de usar transações para garantir a integridade dos dados?

``Atomicidade (All or Nothing)``: Garante que todas as operações dentro da transação sejam tratadas como uma única unidade. Se uma falha ocorrer, o banco de dados retorna ao estado original.

``Consistência``: Previne que o banco de dados entre em um estado inconsistente devido a falhas parciais de operações.

``Isolamento``: As mudanças feitas dentro de uma transação não são visíveis para outras transações até que a transação atual seja confirmada.

``Durabilidade``: Uma vez que a transação é confirmada, as mudanças são permanentes e resistem a falhas do sistema.

``Performance``: Para múltiplas operações de escrita, agrupar em uma transação pode ser mais rápido do que executá-las individualmente, pois o overhead de E/S é reduzido.

---
### 🔎Observação

exemplo de transação : 

``` dart 

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Função para abrir o banco de dados e criar a tabela 'logs'
Future<Database> openSimpleDatabase() async {
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'simple_db.db');

  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE logs(id INTEGER PRIMARY KEY AUTOINCREMENT, message TEXT NOT NULL)',
      );
    },
  );
}

// --- Função para adicionar logs em uma transação ---
Future<void> addLogsInTransaction(Database db) async {
  // Inicia a transação
  await db.transaction((txn) async {
    print('Iniciando transação para adicionar logs...');

    // Primeira operação: Inserir um log
    await txn.insert('logs', {'message': 'Evento 1: Usuário logou.'});
    print('Log 1 inserido.');

    // --- Ponto de possível falha (descomente para testar o rollback) ---
    // throw Exception('Erro simulado ao inserir o segundo log!');

    // Segunda operação: Inserir outro log
    await txn.insert('logs', {'message': 'Evento 2: Página principal acessada.'});
    print('Log 2 inserido.');

    print('Transação concluída com sucesso!');
  }); // O commit acontece automaticamente aqui se não houver exceção
}

// Função para contar os logs na tabela
Future<int> countLogs(Database db) async {
  final List<Map<String, dynamic>> result = await db.query('logs');
  return result.length;
}

// --- Exemplo de Uso ---
void main() async {
  // Garante que os bindings do Flutter estejam inicializados para usar plugins
  // (necessário ao rodar em ambiente Dart puro ou fora de um widget)
  WidgetsFlutterBinding.ensureInitialized();

  final db = await openSimpleDatabase();

  // Limpa os logs para um teste limpo
  await db.delete('logs');
  print('Logs limpos. Total de logs antes da transação: ${await countLogs(db)}');

  print('\n--- Tentando adicionar logs com transação (sucesso esperado) ---');
  try {
    await addLogsInTransaction(db);
    print('Logs adicionados com sucesso. Total de logs agora: ${await countLogs(db)}');
  } catch (e) {
    print('Erro na transação: $e. Total de logs: ${await countLogs(db)} (deveria ser 0)');
  }

  // Limpa novamente para testar o rollback
  await db.delete('logs');
  print('\nLogs limpos. Total de logs antes do teste de rollback: ${await countLogs(db)}');

  print('\n--- Tentando adicionar logs com transação (erro simulado) ---');
  try {
    // Descomente a linha 'throw Exception...' na função addLogsInTransaction para ver o rollback
    await addLogsInTransaction(db);
    print('Logs adicionados com sucesso. Total de logs agora: ${await countLogs(db)}');
  } catch (e) {
    print('Erro na transação (rollback esperado): $e. Total de logs: ${await countLogs(db)} (deveria ser 0)');
  }

  await db.close();
}

``` 

---