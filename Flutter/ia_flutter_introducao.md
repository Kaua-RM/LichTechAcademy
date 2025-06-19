### 🏗️ MaterialApp e seus Parâmetros

 MaterialApp: É o widget fundamental para aplicativos Flutter que seguem o Material Design. Ele configura a estrutura básica do app, como navegação, temas e localization.
#### Parâmetros importantes:
``home``: O widget inicial do seu aplicativo (geralmente um Scaffold).

``title``: O título que aparece na barra de tarefas do sistema operacional.

``theme``: Define o tema visual do aplicativo (cores, fontes, etc.).

``routes``: Mapeia nomes de rotas para widgets, permitindo navegação nomeada.

``debugShowCheckedModeBanner``: Remove o banner de "DEBUG" no canto superior direito.

---
### 🔎Observação

Aprendi o parametro  ``debugShowCheckedModeBanner`` , ele foi uma mão na roda , pois eu não gostava do banner de "Debug" na aplicação. 

---

### ⚙️Como funcionam os “imports” no Flutter?

Os imports são usados para trazer classes, funções e variáveis de outros arquivos ou pacotes para o seu código atual.
No Flutter, você importa principalmente pacotes do SDK (como package:flutter/material.dart para widgets do Material Design) ou arquivos Dart dentro do seu próprio projeto.

---
### 🔎Observação

os imports parecem como o protocolo http , acho que deve existir um protocolo de comunicação de importação dentro das SDK´S

---

### 🏗️ Material Design e sua utilização no Flutter

Material Design: É um sistema de design criado pelo Google que oferece diretrizes para a interface do usuário, animações e interações em plataformas digitais. Ele busca criar experiências de usuário intuitivas e bonitas.

Utilização no Flutter: O Flutter oferece uma vasta coleção de widgets prontos que implementam o Material Design, como AppBar, FloatingActionButton, Card, etc., facilitando a criação de interfaces com a aparência e comportamento do Material Design.

---
### 🔎Observação

O material Design facilita a implementação do design do código , e isto pode ser visto em exemplos como o FloatingActionButton , que já vem  pronto para o uso e sem precisar de muito código. 
---

#### Principais Widgets do Material Design disponíveis no Flutter

Alguns exemplos: ``Scaffold``, ``AppBar``, ``Text``, ``Image``, ``Button`` (como ElevatedButton, TextButton, OutlinedButton), ``Container``, ``Column``, ``Row``, ``ListView``, ``Card``, ``FloatingActionButton``, ``BottomNavigationBar``, ``Drawer``, ``TextField``, entre muitos outros.


---
### 🔎Observação

O ``Scaffold`` é um dos widgets que eu mais utilizo , devido ao appBar 
---

### 🔒Widgets Stateless

O que são: Widgets que não possuem estado interno mutável. Eles são imutáveis e seus dados são definidos no momento da sua construção.

Quando utilizar: Quando a parte da interface que o widget representa não precisa mudar dinamicamente após ser construída (ex: um ícone, um texto estático, uma imagem).
Ciclo de vida de um Widget Stateless

É bastante simples: o widget é construído uma única vez e desenhado na tela. Ele não tem métodos para gerenciar mudanças de estado.

---
### 🔎Observação

É o primeiro tipo de estado que eu utilizei , é muito útil quando você quer manter um informação estática na tela 
---

### 🪛Limitações dos Widgets Stateless

Não podem atualizar sua própria interface em resposta a eventos ou mudanças de dados internos. Para isso, é necessário recriar o widget.

---
### 🔎Observação
Essa parte de recriar o widget é muito trabalhoso , mesmo com hotReload , por isso , é melhor utilizar o Statefull 
---

### 🔓Widgets Stateful

O que são: Widgets que possuem estado interno mutável, o que significa que podem mudar sua aparência e comportamento em tempo de execução.
Quando utilizar: Quando a parte da interface que o widget representa precisa mudar dinamicamente em resposta a interações do usuário, dados assíncronos, etc. (ex: um contador, um checkbox, um campo de texto que permite edição).

---
### 🔎Observação
Para essa parte de mudança de estado , o Provider é uma grande arma , pois ele já notifica a aplicação , com isso é possível se utilizar ele junto ao Stateless támbem 
---

### 🌀Ciclo de vida de um Widget Stateful

``createState``(): Cria o objeto State associado ao widget.

``initState``(): Chamado uma vez quando o objeto State é criado. Ideal para inicializações.

``didChangeDependencies``(): Chamado quando uma dependência do widget muda.

``build``(): Onde a interface do usuário é construída. Chamado sempre que o widget precisa ser redesenhado.

``didUpdateWidget``(): Chamado quando o widget pai reconstrói o widget com novas configurações.

``deactivate``(): Chamado quando o widget é removido da árvore, mas pode ser reinserido.

``dispose``(): Chamado quando o widget é removido permanentemente da árvore. Ideal para liberar recursos.

---
### 🔎Observação

O dispose támbem deve ser utilizado para descartar os controllers de um formulário ao se finalizar uma aplicação. 

---

### ⚙️Gerenciamento de estado em Widgets Stateful

O estado é mantido em um objeto State separado que está associado ao StatefulWidget.
As mudanças no estado são notificadas ao Flutter através do método setState().

---
### 🔎Observação

o método setState() era bem utilizavel no inicio , mas agora pode ser substituido pelo Provider , que é até recomendado pela própria equipe do FLutter. 

---

### 🔩Como funciona o “setState” em Flutter?

setState() é um método do objeto State que informa ao Flutter que o estado interno do widget mudou.
Quando setState() é chamado, o Flutter marca o widget como "sujo" e programa uma reconstrução (build()) do widget e de seus descendentes para refletir as novas mudanças de estado.

---
### 🔎Observação

Esse comportamento se assemelha ao notifyListener , que notifica a classe Changenotifier que os dados mudaram. 

---

### ⚠️Cuidados a tomar no gerenciamento de estado

Evitar chamadas desnecessárias de setState(), pois podem impactar a performance.
Gerenciar o estado de forma eficiente, evitando estados muito grandes ou complexos em widgets individuais.
Considerar o uso de soluções de gerenciamento de estado mais robustas para aplicativos maiores (Provider, BLoC, Riverpod, GetX, etc.).
Não chamar setState() após dispose() ser chamado, pois isso pode causar erros.

---
### 🔎Observação

Nunca tinha testado chamar o setState após o dispose , isso é uma informação interessante

---

### 🔒🔓Principais diferenças entre widgets Stateless e Stateful

Stateless: Não possuem estado interno mutável. São imutáveis.

Stateful: Possuem estado interno mutável. Podem mudar sua aparência e comportamento em tempo de execução.

Reconstrução: Widgets Stateless são construídos uma vez. Widgets Stateful são reconstruídos quando seu estado muda (via setState()).

Uso: 
Stateless para UI estática.
 Stateful para UI dinâmica e interativa.

 ---
### 🔎Observação

Sem observação 
---
