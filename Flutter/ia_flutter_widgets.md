### 🏗️ Explique o conceito de um widget Row em Flutter.

Row: É um widget de layout que organiza seus filhos (outros widgets) em uma única linha horizontal. É útil para dispor elementos lado a lado.

---
### 🔎Observação

Eu utilizo ele junto ao Scallfold , pois o Row é bom para o layout da aplicação
---

### ⚙️ Como posso adicionar espaçamento uniforme entre os widgets em um Row?

Você pode usar o widget SizedBox com uma width específica entre os widgets, ou usar o MainAxisAlignment (ex: MainAxisAlignment.spaceAround, MainAxisAlignment.spaceBetween, MainAxisAlignment.spaceEvenly) do Row para distribuir o espaço disponível.

---
### 🔎Observação

Eu utilizo o SizedBox para espaçamentos especificos , pois os outros exemplos que utilizam MainAxisAlignment pega o espaço e reorganiza nesse espaço disponivel 

---

### 🪛 Qual a diferença entre MainAxisAlignment e CrossAxisAlignment em um Row?

MainAxisAlignment: Define como os widgets são alinhados ao longo do eixo principal do Row, que é o horizontal. Controla o espaçamento e a posição dos filhos na linha (ex: start, center, end, spaceBetween).

CrossAxisAlignment: Define como os widgets são alinhados ao longo do eixo transversal do Row, que é o vertical. Controla o alinhamento dos filhos perpendicularmente à linha (ex: start, center, end, stretch).

---
### 🔎Observação

O MainAxisAlignment parece o JustifyContext do Flex no CSS , enquanto que o CrossAxisAlignment parece o AlighmntContext do Flex támbem no CSS

---

### 🏗️ Explique o conceito de um widget Column em Flutter.

Column: É um widget de layout que organiza seus filhos (outros widgets) em uma única coluna vertical. É útil para dispor elementos um abaixo do outro.

---
### 🔎Observação
---


### 🪛 Qual a diferença entre MainAxisAlignment e CrossAxisAlignment em um Column?
MainAxisAlignment: Define como os widgets são alinhados ao longo do eixo principal do Column, que é o vertical. Controla o espaçamento e a posição dos filhos na coluna (ex: start, center, end, spaceBetween).

CrossAxisAlignment: Define como os widgets são alinhados ao longo do eixo transversal do Column, que é o horizontal. Controla o alinhamento dos filhos perpendicularmente à coluna (ex: start, center, end, stretch).

---
### 🔎Observação
---

### 🏗️ Explique o conceito de um widget Stack em Flutter.
Stack: É um widget de layout que permite sobrepor múltiplos widgets uns sobre os outros, como uma pilha de cartas. Os widgets filhos são desenhados na ordem em que aparecem na lista, do primeiro para o último.

---
### 🔎Observação

Realmente , parece um baralho de cartaz , aonde a primeira carta é sobreposta pela última carta adicionada.  

---

### 💡 Quais as vantagens de usar Stack em vez de Row ou Column?
Sobreposição: Permite que widgets sejam colocados um em cima do outro, o que Row e Column não fazem.

Posicionamento Fino: Combinado com o widget Positioned, permite um controle preciso sobre a posição de cada filho dentro da pilha.

Camadas: Ideal para criar camadas de UI, como um texto sobre uma imagem, um botão flutuante, ou indicadores de carregamento.

---
### 🔎Observação

Parece o Position do CSS , entretanto , não cheguei a utilizar  muito ele nos códigos 

---

### ⚙️ Como posso posicionar widgets específicos dentro de um Stack?
Você pode usar o widget Positioned como um filho direto do Stack. O Positioned permite especificar as distâncias do topo (top), inferior (bottom), esquerda (left) e direita (right), além de width e height para o widget que ele envolve.

---
### 🔎Observação

Pelo que eu lembre , o top , bottom , left e right são doubles que trabalham com o espaço em que estão colocados 

---

### 🖼️ Como posso exibir uma imagem de um arquivo local em Flutter?

Você deve primeiro adicionar a imagem ao diretório assets do seu projeto e referenciá-la no arquivo pubspec.yaml. Em seguida, use o widget Image.asset():

```Dart

Image.asset('assets/minha_imagem.png')
```

---
### 🔎Observação

Ainda tenho a pergunta do por que eu devo colocar o caminho da imagem no pubspec.yaml
, terei que pesquisar mais sobre isso 

---

### ✏️ Quais propriedades posso usar para controlar a aparência do texto (fonte, tamanho, cor)?

Você pode usar o widget Text e sua propriedade style que aceita um objeto TextStyle.
Exemplos de propriedades de TextStyle:

``fontSize``: Define o tamanho da fonte.
``color``: Define a cor do texto.
``fontWeight``: Define o peso da fonte (ex: FontWeight.bold).
``fontStyle``: Define o estilo da fonte (ex: FontStyle.italic).
``fontFamily``: Define a família da fonte (se carregada).

---
### 🔎Observação

Ainda não cheguei a utilizar o fontFamily , seria interresante entender como posso instalar outra fonte no aplicativo 
---

### 📝 Como posso exibir um texto em várias linhas?

O widget Text lida automaticamente com quebras de linha se o texto for muito longo para caber em uma única linha, desde que não haja restrições de largura muito apertadas ou softWrap seja true (o padrão). Você também pode inserir quebras de linha explícitas usando \n.

---
### 🔎Observação

Parece a quebra de linha utilizando a tag <p> do HTML , que serve para colocar paragrafos na tela. 

---

### 📜 Como posso criar uma lista de rolagem vertical em Flutter?

A forma mais comum é usar o widget ListView. Ele pode receber uma lista de widgets como filhos e os tornará roláveis se o conteúdo exceder o espaço disponível.

---
### 🔎Observação

Para mim , acho que o mais recomendavel é utilizar o ListView.Builder e não somente o ListView 

---

### ➕ Como posso adicionar itens dinamicamente a um ListView?

Você pode usar ListView.builder para construir itens sob demanda a partir de uma lista de dados. Para adicionar itens "dinamicamente" (em tempo de execução), você precisaria atualizar a lista de dados que alimenta o ListView.builder e chamar setState() para que o widget seja reconstruído.

---
### 🔎Observação

Ou usar o provider , eu estou falando bastante do provider por que eu acho muito interressante. 
 
---

### 🪛 Quais as diferenças entre ListView.builder e ListView.separated?

ListView.builder: Constrói itens de forma eficiente, criando-os apenas quando são necessários (quando aparecem na tela). Ideal para listas longas ou infinitas.

ListView.separated: Similar ao builder, mas permite que você especifique um separatorBuilder para criar um widget divisor entre cada item da lista. Útil para adicionar linhas, espaços ou outros elementos visuais entre os itens.`

---
### 🔎Observação

o ListView.separated parece que já tem adicionado um tipo de  SizeBox  ou algo que possibilite um espaçamento entre os widgets , pelo que eu entendi.  

---


### 📋 Como posso usar ListTile para criar itens de lista em um ListView?
ListTile é um widget do Material Design projetado especificamente para ser um único item em uma lista. Ele oferece propriedades convenientes como:

``leading``: Widget à esquerda (ex: Icon, CircleAvatar).

``title``: O widget principal do texto.

``subtitle``: Um widget de texto secundário abaixo do título.

``trailing``: Widget à direita (ex: Icon, Checkbox).

Exemplo:

```Dart

ListTile(
  leading: Icon(Icons.person),
  title: Text('Nome do Item'),
  subtitle: Text('Descrição do item'),
  trailing: Icon(Icons.arrow_forward),
)
```

---
### 🔎Observação

Só utilizei o ListTile uma vez , mas parece que ele acaba sendo muito útil 

---

### 🖱️ Como posso tornar os itens ListTile interativos (clicáveis)?
Use a propriedade onTap do ListTile. Ela aceita uma função de callback que será executada quando o item da lista for tocado.

```Dart

ListTile(
  title: Text('Item Clicável'),
  onTap: () {
    // Ação a ser executada ao clicar no item
    print('Item clicado!');
  },
)
```

---
### 🔎Observação

O onTap() parece o setState , em requisito de funcionamento 

---

### ➕ Quais as vantagens de usar ListTile em vez de widgets de texto simples?

Estrutura Padrão: Segue as diretrizes do Material Design para itens de lista, garantindo uma aparência consistente e familiar ao usuário.

Conveniência: Oferece slots pré-definidos (leading, title, subtitle, trailing) que simplificam a organização de elementos comuns de uma lista.

Acessibilidade: Já possui comportamento de toque (com onTap) e feedback visual quando pressionado, contribuindo para uma melhor experiência do usuário e acessibilidade.

Manutenção: Facilita a manutenção do código ao padronizar a estrutura dos itens da lista.

---
### 🔎Observação

Não tinha muito conhecimento sobre todas essas vantangens do ListTile , realmente tenho que implementar esse widget. 

---