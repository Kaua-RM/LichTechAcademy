### 🏗️ O que é um widget TextField em Flutter e para que ele serve?
TextField: É um widget do Material Design que permite ao usuário inserir texto através de um teclado. Ele é usado para coletar informações textuais, como nomes, e-mails, senhas, em formulários ou áreas de entrada de texto.

---
### 🔎Observação

Mas para haver um coleta correta dos dados é possivel definir o keyboard que o textField aceita para o usúario digitar
---

### ⚙️ Como posso obter o valor digitado pelo usuário em um TextField?
A forma mais comum é utilizando um TextEditingController. Você o associa ao TextField e pode acessar o texto digitado através da propriedade .text do controller.

Exemplo:

```Dart

final TextEditingController _controller = TextEditingController();

// No seu widget:
TextField(
  controller: _controller,
);

// Para obter o valor:
String valorDigitado = _controller.text;
```

---
### 🔎Observação

Quando não tinha conhecimento do controller , eu utilizava variaveis atráves do parametro : OnChange()
---

### 🪛 Qual a diferença entre um TextField e um TextFormField?
TextField: É o widget base para entrada de texto, sem funcionalidades de validação ou integração direta com Form.

TextFormField: É uma versão do TextField projetada para formulários, incluindo a propriedade validator para validação e integração com o Form widget. É o ideal para campos que precisam ser validados.

---
### 🔎Observação

Na atividade de textField , eu não sabia que o mesmo não possui validação , por isso tive que recorrer a informações no youtube 
---

### 📄 Quais parâmetros importantes do TextField?

Alguns parâmetros chave são:

``controller``: Para gerenciar o texto.

``decoration``: Um InputDecoration para personalizar a aparência (rótulo, dicas, bordas, ícones, mensagens de erro).

``keyboardType``: Define o tipo de teclado que deve aparecer (ex: TextInputType.emailAddress, TextInputType.number).

``obscureText``: Se true, esconde o texto digitado (ótimo para senhas).

``readOnly``: Impede que o usuário edite o texto.

``onChanged``: Um callback que é chamado toda vez que o texto muda.`

``onSubmitted``: Um callback que é chamado quando o usuário finaliza a edição (pressiona "Enter" ou "Concluído").

---
### 🔎Observação
Não tinha conhecimento do parâmetro ``onSubmitted`` , vou pesquisar como ele funciona e se existe no TextFormField
---

### ✅ O que significa validar um campo de texto em Flutter?
Validar um campo de texto significa verificar se o valor inserido pelo usuário atende a critérios específicos. Por exemplo, checar se um campo não está vazio, se um e-mail tem o formato correto, ou se uma senha tem o número mínimo de caracteres. Isso ajuda a garantir dados corretos e a dar feedback ao usuário.

---
### 🔎Observação

Isso mesmo , por isso utilizar o validator é muito importante , além de trazer confiabilidade nas informações inseridas 
---

### ↔️ Qual a diferença entre validação síncrona e assíncrona?
Validação Síncrona: Acontece imediatamente e não depende de operações demoradas (ex: verificar se um campo está vazio ou o formato de um e-mail). O validator do TextFormField é síncrono.

Validação Assíncrona: Envolve uma operação que leva tempo, como uma consulta a um banco de dados para verificar a disponibilidade de um nome de usuário. Não é suportada diretamente pelo validator padrão, exigindo lógicas adicionais.

---
### 🔎Observação

Interresante , vou ter que pesquisar mais sobre validação assícrona , pois vou utilizar em um projeto com sqlite

---

### 🔲 O que é um widget CheckBox em Flutter e para que ele serve?

CheckBox: É um widget que permite ao usuário selecionar ou desmarcar uma opção. Ele é usado para escolhas booleanas (sim/não) ou quando se pode selecionar múltiplas opções em um grupo.

---
### 🔎Observação

Não cheguei a utilizar muito , mas vou tentar implementar mais em aplicações

---


### 🎨 Como posso alterar a cor e a forma de um CheckBox?
``Cor``: Use as propriedades activeColor (cor quando marcado) e checkColor (cor da marca de seleção).

``Forma``: A forma padrão é um quadrado e não é diretamente personalizável por uma propriedade simples.

 Para mudar a forma, você geralmente precisaria criar um widget personalizado.

---
### 🔎Observação

O widget deve ser o container utilizando decoration 

---

### 🔘 O que é um widget Radio em Flutter e qual sua aplicabilidade?

Radio: É um widget que permite ao usuário selecionar apenas uma opção de um grupo de opções mutuamente exclusivas. Sua aplicabilidade é em cenários onde só uma escolha é permitida (ex: gênero, estado civil).

---
### 🔎Observação

Ele é muito utilizado em partes como a escolha de gênero , como exemplo disso , tem-se a atividade de forms 

---

### 🎨 Como posso alterar a cor e a forma de um Rádio?
``Cor``: Use a propriedade activeColor para a cor quando selecionado.
``Forma``: A forma padrão é um círculo. Assim como o CheckBox, a personalização da forma não é feita por uma propriedade direta e exigiria um widget customizado para modificações significativas.

---
### 🔎Observação

Não cheguei a utilizar o activeColor , vou testar em uma aplicação junto com o checkBox

---