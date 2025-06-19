### 💾 O que é persistência de dados em aplicativos Flutter e por que é importante?

Persistência de Dados: É a capacidade de um aplicativo de armazenar informações de forma que elas permaneçam disponíveis mesmo depois que o aplicativo é fechado e reaberto, ou quando o dispositivo é reiniciado. É fundamental para:

``Experiência do Usuário``: Salvar preferências, configurações, estado de login, dados do usuário para uma experiência contínua.

``Offline First``: Permitir que o aplicativo funcione sem conexão com a internet, exibindo dados previamente armazenados.

``Otimização``: Evitar a necessidade de recarregar todos os dados da rede a cada inicialização do aplicativo.

---
### 🔎Observação

São variás as finalidades da persistência de dados , mas a que eu acho mais interessante é a  Experiência do Usuário. 

---

### 🗂️ Quais são os diferentes tipos de dados que podem ser persistidos em um aplicativo Flutter?

Os tipos de dados mais comuns que podem ser persistidos incluem:

``Pares chave-valor simples``: Preferências do usuário (tema, idioma), tokens de autenticação (usando SharedPreferences).

``Dados estruturados``: Listas de objetos complexos, registros (usando bancos de dados locais como SQLite, Hive, Isar).

``Arquivos``: Imagens, vídeos, documentos (salvos diretamente no sistema de arquivos do dispositivo).

``Criptografados``: Dados sensíveis que precisam de segurança adicional.

---
### 🔎Observação

Hive e Isar são dois bancos de dados NoSQL embarcados populares, super rápidos e otimizados para aplicações Flutter e Dart, usados para armazenar dados localmente no dispositivo. Ambos foram criados pelo mesmo autor (Simon Lightfoot)

---

### 🔑 O que é o pacote SharedPreferences em Flutter e como ele funciona?

O pacote SharedPreferences é uma forma simples e leve de persistir pares chave-valor de dados primitivos. Ele funciona armazenando os dados em arquivos XML (no Android) ou arquivos UserDefaults (no iOS), que são mecanismos nativos de armazenamento de preferências. É ideal para pequenos volumes de dados.

---
### 🔎Observação

Pesquisando um pouco mais afundo : Para o Básico e Preferências é simples, ideal para guardar pequenos dados primitivos como bool, String, int (por exemplo, isDarkMode: true ou userName: 'Josef'). Pense nele como o local para as preferências e configurações do usuário. Não serve para grandes volumes ou dados complexos.

---

### 🤏 Quais são as limitações do SharedPreferences em termos de armazenamento de dados?

As limitações incluem:

``Dados Primitivos``: Só pode armazenar tipos de dados primitivos (String, int, bool, double, List<>;String>). Não pode armazenar objetos Dart diretamente sem antes serializá-los para String (geralmente JSON).

``Pequeno Volume``: Não é projetado para grandes volumes de dados ou dados complexos e relacionais.

``Síncrono (Leitura)``: Embora a escrita seja assíncrona, a leitura pode ser síncrona, o que, em excesso, pode impactar a performance se muitos dados forem lidos no thread principal.

``Não Relacional``: Não possui recursos de consulta ou relacionamento como um banco de dados.

``Não Criptografado``: Os dados são armazenados sem criptografia por padrão, não sendo adequado para informações sensíveis.

---
### 🔎Observação

Ou seja , ele funciona como um tipo de mini banco de dados não relacional , ele se parece um pouco com o Sqlite que é um  banco relacional mais simples e mais limitado. 

---

### 🤔 Quando devo usar SharedPreferences em vez de outras opções de persistência de dados?

Use SharedPreferences quando:

Você precisa armazenar pequenos volumes de dados simples.
Os dados são principalmente preferências do usuário ou configurações.

Os dados não são sensíveis e não precisam de criptografia.
Você precisa de um armazenamento rápido e fácil de implementar para pares chave-valor.

Exemplos: tema claro/escuro, lembrança de login (apenas um flag), estado da primeira inicialização do app.

---
### 🔎Observação

Como o exemplo já citado , a parte de tematica do sistema é um bom exemplo de quando se deve utilizar o SharedPreferences

---

### ⚠️ Como posso lidar com erros ao usar SharedPreferences?
SharedPreferences é geralmente robusto e não lança muitos erros em operações normais de leitura/escrita. No entanto, você pode:

``Tratamento Básico de Future``: As operações de escrita retornam um Future<bool>, indicando sucesso ou falha. Você pode usar await e verificar o resultado, ou usar .then().catchError().

``try-catch``: Envolva as chamadas a SharedPreferences em blocos try-catch para capturar exceções inesperadas, embora sejam raras.

``Fornecer Valores Padrão``: Ao ler dados, sempre forneça um valor padrão caso a chave não exista, para evitar null e garantir a robustez do seu código.

Exemplo de tratamento de escrita:

```Dart

Future<void> saveSetting(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  bool success = await prefs.setBool(key, value);
  if (!success) {
    print('Erro ao salvar configuração: $key');
  }
}

```

Exemplo de tratamento de leitura com padrão:

```Dart

Future<bool> getSetting(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? false; // Retorna false se a chave não existir
}
```

---
### 🔎Observação

Acho que uma das melhores formas de tratar um erro no Shared seria o await que iria esperar o Future<Bool>.

---

### ✅ Quais são as melhores práticas para usar SharedPreferences de forma eficiente?
``Evite Bloqueios``: Chame SharedPreferences.getInstance() apenas uma vez (ou o mínimo possível), pois é uma operação de E/S assíncrona.

``Constantes para Chaves``: Defina as chaves como constantes (static const String) para evitar erros de digitação e facilitar a refatoração.

``Serialização/Deserialização``: Para objetos complexos, serialize-os para JSON (String) antes de salvar e deserialize-os ao ler.

``Não para Grandes Volumes``: Não use para armazenar listas longas ou objetos complexos em grande quantidade. Opte por bancos de dados para isso.

``Segurança``: Nunca armazene dados sensíveis (senhas, informações financeiras) diretamente no SharedPreferences, pois eles não são criptografados. Use soluções mais seguras para isso (ex: flutter_secure_storage).

``Contexto Correto``: Se a persistência for uma responsabilidade de um serviço, encapsule o uso de SharedPreferences em uma classe de serviço/repositório dedicada, separando a lógica da UI.

---
### 🔎Observação

Estou usando o sharedPreferences no meu código e acho que essas dicas irão ajudar a eu conseguir tirar o melhor proveito dele.

---