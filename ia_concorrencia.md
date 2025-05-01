## O que é um Future em Dart e como ele me ajuda a lidar com tarefas que levam tempo? 
##### Em Dart, um Future representa o resultado de uma operação assíncrona que pode não ter sido concluída ainda. Pense nele como uma promessa de que, em algum momento no futuro, você terá um valor ou um erro.

#### Como ele ajuda com tarefas que levam tempo?

##### Quando você tem uma tarefa que pode demorar (como ler um arquivo, fazer uma requisição de rede ou interagir com um banco de dados), usar um Future permite que seu programa continue executando outras coisas enquanto essa tarefa está em andamento. Sem Futures, o programa ficaria "travado" esperando a tarefa terminar, o que resultaria em uma experiência ruim para o usuário.

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### Nas atividades , foi interresante ver a utilização do future , principalmente se utilizando `delay` , como na atividade que se teve que se criar uma contagem de 10 a 0 para o lançamento de uma foguete 


---

## O que significam os termos 'assíncrono' e 'síncrono'? 
#### `Síncrono`: 
##### Em uma operação síncrona, as tarefas são executadas em sequência. Cada tarefa precisa ser concluída antes que a próxima possa começar. É como uma fila única onde todos esperam sua vez.

#### `Assíncrono`: 
##### Em uma operação assíncrona, uma tarefa pode ser iniciada e o programa continua a executar outras tarefas sem esperar que a primeira termine. Quando a tarefa assíncrona é concluída, o programa é notificado e pode lidar com o resultado. Imagine enviar uma carta: você a coloca no correio e continua fazendo outras coisas, sem esperar que ela chegue ao destino naquele instante.

----
<span style="color:#33b3b6">

### Observações

</span>

+ #### O dart possui como base o loop de eventos , ou seja , cada novo evento que acontece no código , o mesmo é colocado na chamada fila de eventos e é realizado quando chega a sua vez , entretanto , com a linguagem assicrona , podemos deixar a tarefa executando , enquanto passamos para a próxima , isso é muito importante para requisições http , que podem levar um tempo para serem realizadas.  

---

## O que acontece se um Future falhar e como posso lidar com esse erro?
##### Se uma operação assíncrona representada por um Future encontrar um erro, o Future é concluído com esse erro. Para lidar com essa falha, você pode usar o método .catchError() no seu Future. Este método permite especificar uma função que será executada se o Future falhar, dando a você a chance de tratar o erro, tentar novamente a operação ou tomar outras ações necessárias.Você também pode usar um bloco try...catch dentro de uma função async (que retorna um Future) para capturar erros que ocorram durante a execução da tarefa assíncrona.

----
<span style="color:#33b3b6">

### Observações

</span>

+ ####  Em versões anteriores , se era utilizado os métodos `then` e `cathErro` , funcionando como o bloco try-cath.  

---

## Existe uma forma de executar várias tarefas assíncronas em paralelo?
##### Sim! O Dart oferece o método Future.wait() para executar múltiplas Futures simultaneamente e esperar que todas elas sejam concluídas (com sucesso ou com erro). Future.wait() recebe uma lista de Futures e retorna um novo Future que é concluído quando todos os Futures da lista original terminam. O resultado do Future.wait() será uma lista com os resultados de cada Future original (na mesma ordem), ou um erro se algum dos Futures na lista falhar.

----
<span style="color:#33b3b6">

### Observações

</span>

+ ####  Mesmo funcionamento do await , só que focado para o Future.  

---

## Em quais situações devo usar Futures em meu código Dart?

##### Você deve usar Futures em situações onde uma operação pode levar um tempo considerável para ser concluída e você não quer que a execução do seu programa fique bloqueada. Alguns exemplos comuns incluem:

#### Operações de I/O (Input/Output): Ler ou escrever arquivos.
#### Requisições de rede:  Fazer chamadas a APIs web.
#### Interação com bancos de dados: Consultar ou modificar dados.
#### Cálculos complexos: Processar grandes quantidades de dados (embora, para tarefas muito intensas na CPU, pode ser melhor usar Isolates para evitar bloquear a thread principal).

#### Timers e delays: Esperar por um período de tempo.

----
<span style="color:#33b3b6">

### Observações

</span>

+ ####  Ali se comentou sobre a parte de operações IO(Input e output) , e se for analisar a biblioteca dart:io , o método stdin.readSync  é um método sicrono , mas que poderia ser assicrono

---

## Quais cuidados devo tomar não usando await em funções Future?
##### Quando você não usa a palavra-chave await dentro de uma função async ao lidar com um Future, algumas coisas importantes acontecem:

- #### A função async retorna imediatamente um Future: Em vez de esperar a conclusão do Future interno, a função async retorna um Future que eventualmente terá o resultado da operação assíncrona.

- #### Você precisa usar os métodos .then() e .catchError() para lidar com o resultado ou erro do Future: Como a função não espera a conclusão, você precisa encadear esses métodos ao Future retornado para executar código quando a operação assíncrona for concluída com sucesso ou falhar.

- #### Pode haver confusão no fluxo de execução: Sem await, o código que segue a chamada da função async será executado imediatamente, antes que a operação assíncrona termine. Isso pode levar a comportamentos inesperados se você depender do resultado dessa operação em código subsequente.
- #### Gerenciamento de erros pode ser mais complexo: Sem o try...catch que o await permite, você precisa garantir que todos os possíveis erros sejam tratados nos métodos .catchError() dos Futures envolvidos.

##### Em geral, usar await torna o código assíncrono mais parecido com código síncrono, facilitando a leitura e o entendimento do fluxo de execução. No entanto, em cenários onde você precisa iniciar várias operações assíncronas e não precisa do resultado imediato de cada uma para prosseguir, ou quando você está construindo abstrações de mais baixo nível, trabalhar diretamente com os métodos .then() e .catchError() pode ser mais apropriado.
----
<span style="color:#33b3b6">

### Observações

</span>

+ ####  Usar o await é uma parte fundamental quando o resultado depende do future , mas mesmo se não quiser utilizar , pode substituir o await pelo then e o cathErro , que tem a mesma utilidade do try..cath 

---

## Como lidar com erros usando Future?
##### Existem principalmente duas formas de lidar com erros em Futures:

- #### Usando o método .catchError(): Você pode encadear o método .catchError() ao seu Future. Este método recebe uma função que será chamada se o Future for concluído com um erro. Você pode usar essa função para registrar o erro, tentar uma ação de fallback ou transformar o erro em um valor.

``` Dart

Future<String> fetchData() {
  // ... alguma operação assíncrona que pode falhar
  return Future.delayed(Duration(seconds: 2), () {
    if (DateTime.now().millisecond % 2 == 0) {
      return "Dados recebidos com sucesso!";
    } else {
      throw Exception("Falha ao buscar dados!");
    }
  });
}

void main() {
  fetchData()
      .then((data) => print("Sucesso: $data"))
      .catchError((error) => print("Erro: $error"));

  print("Aguardando dados...");
}
```

- #### Usando async e await com try...catch: Dentro de uma função marcada como async, você pode usar a palavra-chave await para pausar a execução até que um Future seja concluído. Isso permite que você use blocos try...catch para capturar quaisquer erros que ocorram durante a execução da operação assíncrona.

``` Dart

Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    if (DateTime.now().millisecond % 2 == 0) {
      return "Dados recebidos com sucesso!";
    } else {
      throw Exception("Falha ao buscar dados!");
    }
  });
}

Future<void> main() async {
  print("Iniciando busca de dados...");
  try {
    String data = await fetchData();
    print("Sucesso: $data");
  } catch (e) {
    print("Erro capturado: $e");
  }
  print("Tarefa concluída.");
}
```
##### Ambas as abordagens são válidas e a escolha entre elas pode depender do contexto e da sua preferência pessoal. O async/await geralmente torna o código mais fácil de ler e entender para fluxos de controle mais complexos, enquanto .catchError() pode ser mais conciso para tratamento de erros simples.

### Observações

</span>

+ ####  Eu prefiro utilizar o async com await no try cath , pois é mais fácil de entender e utilizar , além desse método escolhido pelo professor do curso.  

---