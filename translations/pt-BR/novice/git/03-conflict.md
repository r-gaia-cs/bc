---
layout: lesson
root: ../..
title: Conflitos
---
<div class="objectives" markdown="1">

#### Objetivos
*   Explicar o que são conflitos e quando eles ocorrem.
*   Resolver conflitos ocorridos durante um merge.

</div>

Logo que pessoas começam a trabalhar em paralelo alguém irá pisar no pé de outra
pessoa. Isso também pode acontecer com uma única pessoa: se trabalharmos no
mesmo arquivo do nosso notebook e do computador no laboratório, pode ser que
façamos mudanças diferentes em cada uma das cópias. Controle de versão ajuda a
gerenciarmos esses [conflitos](../../gloss.html#conflict) ao fornecer uma
ferramenta para [resolver](../../gloss.html#resolve) a sobreposição de mudanças.

Para que possamos aprender como resolver conflitos precisamos, primeiro, criar
um. Atualmente o arquivo `marte.txt` corresponde, em todas as nossas cópias do
repositório `planeta`, a

~~~
$ cat marte.txt
~~~
{:class="in"}
~~~
Frio e seco, mas tudo é da minha cor favorita.
Duas luas pode ser um problema para o Lobisomem.
Mas a Múmia irá apreciar a falta de humidade.
~~~
{:class="out"}

Vamos adicionar uma linha na cópia no nosso diretório de usuário:

~~~
$ nano marte.txt
$ cat marte.txt
~~~
{:class="in"}
~~~
Frio e seco, mas tudo é da minha cor favorita.
Duas luas pode ser um problema para o Lobisomem.
Mas a Múmia irá apreciar a falta de humidade.
Essa linha foi adiciona na cópia presente no nosso diretório de usuário.
~~~
{:class="out"}

e enviar essa mudança para o GitHub:

~~~
$ git add marte.txt
$ git commit -m "Adicionado linha em $HOME/planetas/marte.txt"
~~~
{:class="in"}
~~~
[master 5ae9631] Adicionado linha em $HOME/planetas/marte.txt
 1 file changed, 1 insertion(+)
~~~
{:class="out"}
~~~
$ git push origin master
~~~
{:class="in"}
~~~
Counting objects: 5, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 352 bytes, done.
Total 3 (delta 1), reused 0 (delta 0)
To https://github.com/vlad/planetas
   29aba7c..dabb4c8  master -> master
~~~
{:class="out"}

Nossos repositórios agora estão no seguinte estado:

<img src="img/git-after-first-conflicting-change.svg" alt="Depois de realizar primeira mudança" />

Agora vamos mudar para nossa cópia em `/tmp` e realizar uma mudança diferente
**sem** enviar para o GitHub:

~~~
$ cd /tmp/planetas
$ nano marte.txt
$ cat marte.txt
~~~
{:class="in"}
~~~
Frio e seco, mas tudo é da minha cor favorita.
Duas luas pode ser um problema para o Lobisomem.
Mas a Múmia irá apreciar a falta de humidade.
Adicionado linha diferente no cópia temporária.
~~~
{:class="out"}

Podemos salvar a alteração localmente:

~~~
$ git add marte.txt
$ git commit -m "Adicionado linha em /tmp/planetas/marte.txt"
~~~
{:class="in"}
~~~
[master 07ebc69] Adicionado linha em /tmp/planetas/marte.txt
 1 file changed, 1 insertion(+)
~~~
{:class="out"}

que leva-nos para o seguinte estado dos repositórios locais:

<img src="img/git-after-second-conflicting-change.svg" alt="Depois de fazer segunda alteração (conflitante)" />

Se você tentar enviar as alteração no repositório temporário para o GitHub, o
Git não irá deixá-lo fazer isso:

~~~
$ git push origin master
~~~
{:class="in"}
~~~
To https://github.com/vlad/planetas.git
 ! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'https://github.com/vlad/planetas.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Merge the remote changes (e.g. 'git pull')
hint: before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
~~~
{:class="out"}

Git detecta que as alterações em uma cópia local sobrepõe aquelas feitas em
outra cópia e previne de nós bagunçarmos nosso trabalho anterior. O que
precisamos fazer é pegar as mudanças no GitHub, fazer um
[merge](../../gloss.html#repository-merge) delas na cópia que estamos
trabalhando atualmente e depois enviá-las novamente. Vamos começar por baixar as
mudanças:

~~~
$ git pull origin master
~~~
{:class="in"}
~~~
remote: Counting objects: 5, done.        
remote: Compressing objects: 100% (2/2), done.        
remote: Total 3 (delta 1), reused 3 (delta 1)        
Unpacking objects: 100% (3/3), done.
From https://github.com/vlad/planetas
 * branch            master     -> FETCH_HEAD
Auto-merging marte.txt
CONFLICT (content): Merge conflict in marte.txt
Automatic merge failed; fix conflicts and then commit the result.
~~~
{:class="out"}

`git pull` informa que existe um conflito e marca os conflitos nas linhas
afetadas:

~~~
$ cat marte.txt
~~~
{:class="in"}
~~~
Frio e seco, mas tudo é da minha cor favorita.
Duas luas pode ser um problema para o Lobisomem.
Mas a Múmia irá apreciar a falta de humidade.
<<<<<<< HEAD
Adicionado linha diferente no cópia temporária.
=======
Essa linha foi adiciona na cópia presente no nosso diretório de usuário.
>>>>>>> dabb4c8c450e8475aee9b14b4383acc99f42af1d
~~~
{:class="out"}

Nossas mudanças---aquelas em `HEAD`---é precedido por `<<<<<<<`.
Depois das nossas mudanças conflitantes, Git adiciona `=======` como um
separador das mudanças e maca o fim das alterações conflitantes baixadas do
GitHub com `>>>>>>>`. (O conjunto de letras e dígitos depois desse marcador
identifica a versão que acabamos de baixar.)

Agora depende de nós editar o arquivo para remover os marcadores e reconciliar
as alterações. Podemos fazer o que desejarmos: manter as alterações feitas nessa
cópia, manter as alterações feitas na outra cópia, escrever algo novo para
substituir ambas alterações ou removê-las. Vamos substituir ambas de modo que o
arquivo fique como:

~~~
$ cat marte.txt
~~~
{:class="in"}
~~~
Frio e seco, mas tudo é da minha cor favorita.
Duas luas pode ser um problema para o Lobisomem.
Mas a Múmia irá apreciar a falta de humidade.
Removemos o conflito nessa linha.
~~~
{:class="out"}

Para finalizar o merge, nos adicionamos o arquivo `marte.txt` e criamos uma
nova revisão:

~~~
$ git add marte.txt
$ git status
~~~
{:class="in"}
~~~
# On branch master
# All conflicts fixed but you are still merging.
#   (use "git commit" to conclude merge)
#
# Changes to be committed:
#
#	modified:   marte.txt
#
~~~
{:class="out"}
~~~
$ git commit -m "Merge alterações provenientes do GitHub"
~~~
{:class="in"}
~~~
[master 2abf2b1] Merge alterações provenientes do GitHub
~~~
{:class="out"}

Nossos repositórios agora assemelham-se a:

<img src="img/git-after-merging.svg" alt="Depois de realizar o merge" />

e podemos enviar nossas alterações para o GitHub:

~~~
$ git push origin master
~~~
{:class="in"}
~~~
Counting objects: 10, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 697 bytes, done.
Total 6 (delta 2), reused 0 (delta 0)
To https://github.com/vlad/planetas.git
   dabb4c8..2abf2b1  master -> master
~~~
{:class="out"}

para obtermos:

<img src="img/git-after-pushing-merge.svg" alt="Depois de enviar merge para o GitHub" />

Git mantem o registro de quando realizamos um merge e desse modo não precisamos
corrigir novamente esse conflito se voltarmos para o repositório no nosso
diretório de usuário e baixar as alterações do GitHub:

~~~
$ cd ~/planetas
$ git pull origin master
~~~
{:class="in"}
~~~
remote: Counting objects: 10, done.        
remote: Compressing objects: 100% (4/4), done.        
remote: Total 6 (delta 2), reused 6 (delta 2)        
Unpacking objects: 100% (6/6), done.
From https://github.com/vlad/planetas
 * branch            master     -> FETCH_HEAD
Updating dabb4c8..2abf2b1
Fast-forward
 marte.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
~~~
{:class="out"}

Como podemos verificar o arquivo `marte.txt` encontra na forma que salvamos após
o merge:

~~~
$ cat marte.txt 
~~~
{:class="in"}
~~~
Frio e seco, mas tudo é da minha cor favorita.
Duas luas pode ser um problema para o Lobisomem.
Mas a Múmia irá apreciar a falta de humidade.
Removemos o conflito nessa linha.
~~~
{:class="out"}

A habilidade de sistemas de controle de versão em resolver conflitos é uma das
razões pela qual vários usuários tendem a dividir seus programas e artigos em
vários arquivos ao invés de armazená-los em um único grande arquivo. Existe um
outro benefício: quando conflitos em um arquivo ocorrem com frequência isso é
uma indicação de que as responsabilidades não estão claras ou o trabalho precisa
ser melhor dividido.

<div class="keypoints" markdown="1">

#### Pontos Chaves
*   Conflitos ocorrem quando duas pessoas alteram o mesmo arquivo no mesmo
    momento.
*   Sistemas de controle de versão não permitem que alguém sobrescreva,
    cegamente, as mudanças de outra pessoa. Ao invés disso, ele marca os
    conflitos que precisam ser resolvidos.

</div>

<div class="challenge" markdown="1">
1. Clone o repositório criado pelo seu instrutor.
2. Adicione um novo arquivo nele e altere um arquivo existente (seu instrutor
   irá informar qual arquivo).
3. Quando requisitado pelo seu instrutor, baixe as mudanças do repositório para
   criar um conflito e resolva-o.
</div>

<div class="challenge" markdown="1">
O que o Git faz quando existe um conflito em uma imagem ou em um arquivo não
texto que está armazenado no controle de versão?
</div>
