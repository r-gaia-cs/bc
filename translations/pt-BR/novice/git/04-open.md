---
layout: lesson
root: ../..
title: Open Science
---
<div class="objectives" markdown="1">

#### Objetivo
*   Explicar como a Licença Pública Geral (GPL) GNU difere das outras populares
    licenças de código aberto.
*   Explicar como os quatro tipos de restrições podem ser combinados nas
    licenças Creative Commons.
*   Como adicionar corretamente informações de licença e citação no seu projeto.
*   Enunciar os pontos gerais sobre hospedagem de códigos e dados e os pros e
    contras de cada uma das opções.

</div>

<blockquote>
O oposto de "aberto" não é "fechado".
O oposto de "aberto" é "quebrado".
<br/>
&mdash; John Wilbanks (tradução literal)
</blockquote>

O compartilhamento livre de informações deve ser o objetivo em ciência, mas a
realidade é um pouco mais complicada. A prática padrão na atualidade parece algo
como:

*   Uma pesquisadora coleta alguns dados e armazena eles em uma máquina que
    ocasionalmente ganha uma cópia de backup por parte do departamento ao qual
    pertence.
*   Ela então escreve ou modifica alguns pequenos programas (que também existe
    apenas na sua máquina) para analisar os dados.
*   Uma vez que ela possua alguns resultados, ela escreve sobre eles e submete
    seu artigo. Ela talvez inclua seus dados---um número crescente de jornais
    requer isso---mas ela provavelmente não incluirá seus códigos.
*   Algum tempo passa.
*   O jornal envia-lhe comentários anônimos de alguns outros pesquisadores do
    seu campo de pesquisa. Ela revisa seu paper para satisfazer os comentários
    feitos e reenvia o artigo, sendo que nesse meio tempo ela alterou os
    scripts.
*   Mais tempo se passa.
*   O artigo é eventualmente publicado. Ele talvez inclua um link para uma cópia
    online dos dados utilizados, mas o artigo em si estará atrás de uma
    subscrição paga: apenas pessoas que possuam uma assinatura pessoal ou
    institucional poderão ler o artigo.

Entretanto, para um número crescente de pesquisadores, 
o processo parece mais com:

*   Os dados coletados pela pesquisadora são armazenados em um repositório de
    acesso aberto como [figshare](http://figshare.com/) ou
    [Dryad](http://datadryad.org/) logo que els são coletados e eles recebem seu
    próprio DOI.
*   A pesquisadora cria um novo repositório no GitHub para guardar seu trabalho.
*   Durante o processo de análise, ela envia as alterações feitas em seus
    scripts (e possivelmente os arquivos de saída) para o repositório no GitHub.
*   Ela também utiliza o repositório para seu artigo sendo que o repositório
    funciona como um hub para a colaboração com seus colegas.
*   Quando ela está satisfeita com o estado do seu artigo, ela disponibiliza uma
    versão no [arXiv](http://arxiv.org/) ou em outro servidor de preprints e
    convida outros colegas para comentarem o trabalho.
*   Baseado nesses comentários, ela provavelmente disponibiliza várias outras
    versões antes de finalmente submeter seu artigo ao jornal.
*   O artigo publicado inclui links para o preprint, para seu código e para os
    dados de modo que será muito mais fácil para outros pesquisadores utilizar
    seu trabalho como ponto de partida para suas próprias pesquisas.

Esse modelo aberto acelera descobertas: quanto mais aberto o trabalho é, mais
citado e reutilizado ele é. Entretanto, pessoas que querem trabalhar dessa forma
precisam tomar algumas decisões sobre o que exatamente "aberto" significa na
prática.

### Licenciamento

A primeira pergunta é o licenciamento. Falando vagamente, existe dois tipos de
licenças abertas para software e meia dúzia para dados e publicações. Para
software, pessoas podem escolher entre a [Licença Pública Geral
GNU](http://opensource.org/licenses/GPL-3.0) (GPL) de um lado, e licenças como a
[MIT](http://opensource.org/licenses/MIT) e
[BSD](http://opensource.org/licenses/BSD-2-Clause) do outro lado.  Todas essas
licenças permitem acesso e modificação irrestrita ao programa mas a GPL é
[viral](../../gloss.html#infective-license): alguém que distribui um código
baseado em um código GPL deve fazê-lo licenciando sob a GPL.

Os defensores da GPL argumentam que esse requerimento é necessário para garantir
que pessoas que se beneficiam do código livremente disponível irão contribuir de
volta para a comunidade. Opositores da GPL enumeram vários projetos de código
aberto que existem por bastante tempo e são bem sucedidos sem fazer uso dessa
condição e que a GPL torna mais difícil combinar códigos de fontes diferentes.
No fim das contas, o que importa mais é que:

1.   todo projeto deve ter um arquivo denominado `LICENSE` ou `LICENSE.txt` que
     claramente informe a licença utilizada, e
2.   pessoas utilizem licenças já existentes ao invés de criar novas.

O segundo ponto é tão importante quanto o primeiro: a maioria dos pesquisadores
não são advogados de modo que palavras que pareçam fazer sentido para um leigo
podem ter falhas e consequências inesperadas. A [Open Source
Initiative](http://opensource.org/) mantem uma lista de licenças de código
aberto e [tl;drLegal](http://www.tldrlegal.com/) explica muitas delas.

Quando trata-se de dados, publicações e outros conteúdos, pesquisadores possuem
inúmeras opções para escolher. A boa notícia é que uma organização denominada
[Creative Commons](http://creativecommons.org/) tem preparado um conjunto de
licenças utilizando a combinação de quatro restrições básicas:

*   Atribuição: trabalhos derivados devem dar créditos ao autor original pelo
    seu trabalho.
*   Sem Derivações: pessoas podem copiar o trabalho mas devem fazê-lo sem
    alterá-lo.
*   Compartilha Igual: trabalhos derivados devem ser licenciados sob os mesmos
    termos que o trabalho original.
*   Não Comercial: uso gratuito é permito mas não o uso comercial.

Essas quatro restrições são abreviadas por "BY", "ND", "SA" e "NC",
respectivamente, de modo que "CC-BY-ND" significa que "Pessoas podem reusar o
trabalho tanto gratuitamente como comercialmente mas não podem alterá-lo e devem
citar o trabalho original." Existe uma [pequena
descrição](http://creativecommons.org/licenses/) sumarizando as seis licenças CC
em uma linguagem fácil e com links para a versão legal.

Existe uma outra licença importante que não enquadra-se nas categorias
anteriores. Pesquisadores (e outras pessoas) podem optar por colocar o material
em domínio público, que é abreviado por "PD". Nesse caso, qualquer pessoa pode
fazer o que desejar com o material, até mesmo sem citar o trabalho original ou
restringir outros usos. A tabela abaixo mostra como as seis licenças Creative
Commons e PD relacionam-se entre si:

<table border="1">
  <tr>
    <td></td>
    <td colspan="7" align="center">Licenças que podem ser utilizadas para trabalhos adaptados e adaptações</td>
  </tr>
  <tr>
    <td>Trabalho original</td> <td>by</td> <td>by-nc</td> <td>by-nc-nd</td> <td>by-nc-sa</td> <td>by-nd</td> <td>by-sa</td> <td>pd</td>
  </tr>
  <tr>
    <td>by</td>       <td>X</td> <td>X</td> <td>X</td> <td>X</td> <td>X</td> <td>X</td> <td> </td>
  </tr>
  <tr>
    <td>by-nc</td>    <td> </td> <td>X</td> <td>X</td> <td>X</td> <td> </td> <td> </td> <td> </td>
  </tr>
  <tr>
    <td>by-nc-nd</td> <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td> </td>
  </tr>
  <tr>
    <td>by-nc-sa</td> <td> </td> <td> </td> <td> </td> <td>X</td> <td> </td> <td> </td> <td> </td>
  </tr>
  <tr>
    <td>by-nd</td>    <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td> </td>
  </tr>
  <tr>
    <td>by-sa</td>    <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td>X</td> <td> </td>
  </tr>
  <tr>
    <td>pd</td>       <td>X</td> <td>X</td> <td>X</td> <td>X</td> <td>X</td> <td>X</td> <td>X</td>
  </tr>
</table>

[Software Carpentry](http://software-carpentry.org/license.html)
utiliza CC-BY para suas lições e a licença MIT para os códigos com o objetivo de
encorajar os mais variados reusos. Novamente, o mais importante no arquivo
`LICENSE` na raiz do seu projeto é declarar de forma clara a licença utilizada.
Você também deveria incluir um arquivo `CITATION` ou `CITATION.txt` que descreva
como referenciar seu projeto. O arquivo `CITATION` utilizado por Software
Carpentry contem:

<div class="file" markdown="1">
~~~
To reference Software Carpentry in publications, please cite both of the following:

Greg Wilson: "Software Carpentry: Lessons Learned". arXiv:1307.5448, July 2013.

@online{wilson-software-carpentry-2013,
  author      = {Greg Wilson},
  title       = {Software Carpentry: Lessons Learned},
  version     = {1},
  date        = {2013-07-20},
  eprinttype  = {arxiv},
  eprint      = {1307.5448}
}
~~~
</div>

### Hospedagem

A segunda grande pergunta para equipes que desejam abrir seu trabalho é onde
hospedar seus códigos e dados. Uma opção é o laboratório, o departamento ou a
universidade providenciar um servidor, gerenciar contas, cópias de segurança,
... O benefício dessa abordagem é que deixa claro quem é dono do que, o que é
particularmente importante se algum dos materiais é sensível (i.e., relacionado
com experimentos envolvendo experimentos em seres humanos ou que serão
utilizados para na aplicação por uma patente). O lado negativo dessa abordagem é
o custo de manter o serviço e sua longevidade: um pesquisador que passou os
últimos dez anos coletando dados deseja ter certeza que os dados coletados irão
estar disponíveis pelos próximos dez anos mas, infelizmente, os financiamentos
para infraestruturas acadêmicas não duram mais que alguns anos.

Outra opção é comprar um domínio e pagar um
Internet service provider (ISP) para hospedar o conteúdo.
Essa abordagem permite maior controle por parte do indivíduo e do grupo mas pode
criar problemas quando mudando de instituição e necessitará de mais tempo e
esforço do que as outras opções listadas nessa página.

A terceira opção é utilizar um serviço de hospedagem gratuito como
[GitHub](http://github.com),
[BitBucket](http://bitbucket.org),
[Google Code](http://code.google.com),
ou [SourceForge](http://sourceforge.net).
Todas esses serviços permitem pessoas criar repositórios através de uma
interface web, listas de email e outras formas de manter registro de quem está
fazendo o que.
Esses serviços se beneficiam da economia de escala e efeito de rede: é mais
fácil manter funcionando um grande serviço do que vários pequenos serviços nos
mesmos padrões. Além disso é mais fácil para pessoas colaborarem se elas
estiverem utilizando o mesmo serviço por vários motivos, inclusive por reduzir o
número de senhas que elas precisa memorizar.

Entretanto, todos esses serviços impõe algumas restrições em quais trabalho
podem ser hospedados. Em particular, a grande maioria oferece a seguinte opção:
se o trabalho for disponível para qualquer usuário da internet então não será
cobrado taxas pelo serviço mas se o usuário desejar manter o projeto acessível
para apenas alguns contribuidores então será necessário pagar pelo serviço.
Compartilhar pode parecer a única opção válida para a ciência mas muitas
instituições podem impedir seus pesquisadores de fazer isso tanto pelo fato de
quererem se proteger para futuras aplicações de patentes ou simplesmente porque
novidades costumam ser assustadoras.

<div class="keypoints" markdown="1">

#### Pontos Chaves
*   Trabalhos científicos abertos são cada vez mais utilizados e citados que
    os fechados.
*   Pessoas que incorporam código GPL no seu trabalho devem liberar seu código
    utilizando a mesma licença, GPL. Outras licenças abertas não possuem restrição
    similar.
*   A família de licenças Creative Commons permite pessoas selecionarem
    restrições de atribuição, modificação, compartilhamento e comercialização a
    serem aplicadas no trabalho compartilhado.
*   Pessoas que não são advogados não devem tentar escrever novas licenças ou
    modificar as existentes.
*   Projetos podem ser hospedados em servidores da universidade, domínios
    próprios ou serviços gratuitos.
*   Regras relacionas com propriedade intelectual e armazenamento de informações
    sensíveis continuam valendo não importa onde códigos e dados estão
    armazenados.

</div>

<div class="challenge" markdown="1">
Encontre em que parte do seu trabalho você pode aplicar uma licença de código
aberta. Você pode fazer isso unilateralmente ou você precisa da permissão de
alguém na sua instituição? Se precisa de permissão, quem é essa pessoa?
</div>

<div class="challenge" markdown="1">
Descubra se você pode hospedar seu trabalho em um serviço gratuito. Você pode
fazer isso unilateralmente ou você precisa da permissão de alguém na sua
instituição? Se precisa de permissão, quem é essa pessoa?
</div>
