---
layout: lesson
root: ../..
title: Uma Melhor Solução de Backup
---
<div class="objectives" markdown="1">

#### Objetivos
*   Explicar os passos de inicialização e configuração necessários para
    cada máquina e aqueles necessários para cada repositório.
*   Passa pelo ciclo de modificação, adição e commit para um ou mais arquivos e
    explicar onde a informação é salva em cada estágio.
*   Identificar e utilizar o número de versão atribuído pelo Git.
*   Comparar o arquivo atual com versões antigas.
*   Restaurar versões antigas de arquivos.
*   Configurar Git para ignorar arquivos específicos, e explicar porque em
*   alguns casos é útil fazer isso.

</div>

Nós vamos começar explorando como o controle de versão pode ser utilizado para
manter o registro do que e de quando uma pessoa fez algo. Mesmo se você não
estiver colaborando com outros, controle de versão é muito melhor que:

<div>
  <a href="http://www.phdcomics.com"><img src="img/phd101212s.gif" alt="Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com" /></a>
  <p>"Piled Higher and Deeper" by Jorge Cham, http://www.phdcomics.com</p>
</div>

### Configurando

Na primeira vez que utilizamos Git em uma máquina, precisamos configurar algumas
coisas. A seguir encontra-se o que Drácula fez para configurar seu novo
notebook:

~~~
$ git config --global user.name "Vlad Dracula"
$ git config --global user.email "vlad@tran.sylvan.ia"
$ git config --global color.ui "auto"
$ git config --global core.editor "nano"
~~~
{:class="in"}

(Por favor, utilize seu nome e endereço de email ao invés do de Drácula e por
favor certifique-se que você escolheu um editor disponível no seu sistema, como
o `notepad` se estiver utilizando Windows).

Os commandos do Git são escritos como `git verbo`, onde `verbo` é o que
desejamos fazer. No caso anterior, estamos dizendo para o Git:

*   nosso nome e endereço de email,
*   para colorir a saída,
*   qual o nosso editor de texto favorito, e
*   que queremos utilizar essas informações globalmente (i.e., para todo
*   projeto).

Os quatro comandos anteriores só precisam ser executados uma vez: a opção (em
inglês denominada de *flag*) ``--global`` diz para o Git utilizar as
configurações para todo projeto na máquina atual.

### Criando um repositório

Uma vez que Git está configurado, podemos começar a utilizá-lo.
Vamos criar um diretório para nosso trabalho:

~~~
$ mkdir planetas
$ cd planetas
~~~
{:class="in"}

e dizemos para fazer do diretório um 
[repositório](../../gloss.html#repository)&mdash;um lugar onde Git irá
armazenar as versões anteriores de nossos arquivos:

~~~
$ git init
~~~
{:class="in"}

Se utilizarmos `ls` para mostrar o conteúdo do diretório irá parecer que nada
foi feito:

~~~
$ ls
~~~
{:class="in"}

Mas se adicionarmos a opção `-a` para mostrar todos os arquivos, iremos ver que
Git criou um diretório oculto denominado `.git`:

~~~
$ ls -a
~~~
{:class="in"}
~~~
.	..	.git
~~~
{:class="out"}

Git armazena informações sobre o projeto nesse subdiretório especial. Se
deletarmos ele iremos perder o histórico do projeto.

Podemos verificar que a configuração foi feita com sucesso requisitando o estado
do nosso projeto para o Git:

~~~
$ git status
~~~
{:class="in"}
~~~
# On branch master
#
# Initial commit
#
nothing to commit (create/copy files and use "git add" to track)
~~~
{:class="out"}

### Monitorando Alterações nos Arquivos

Vamos criar um arquivo chamado `marte.txt` que contém algumas notas sobre a
sustentabilidade de uma base no planeta vermelho. (Iremos utilizar um editor
chamado `nano` para editar o arquivo mas você pode utilizar o editor de sua
preferência. Em particular, ele não precisa ser o mesmo editor informado para o
Git).

~~~
$ nano marte.txt
~~~
{:class="in"}

Escreva o texto abaixo no arquivo `marte.txt`:

~~~
Frio e seco, mas tudo é da minha cor favorita.
~~~
{:class="in"}

`marte.txt` agora contem a seguinte linha:

~~~
$ ls
~~~
{:class="in"}
~~~
marte.txt
~~~
{:class="out"}
~~~
$ cat marte.txt
~~~
{:class="in"}
~~~
Frio e seco, mas tudo é da minha cor favorita.
~~~
{:class="out"}

Se verificarmos o estado do nosso projeto novamente, Git irá informar que ele
encontrou um novo arquivo:

~~~
$ git status
~~~
{:class="in"}
~~~
# On branch master
#
# Initial commit
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	marte.txt
nothing added to commit but untracked files present (use "git add" to track)
~~~
{:class="out"}

A mensagem "untracked files" significa que existe um arquivo no diretório que
Git não está monitorando. Iremos dizer para o Git que ele deve fazê-lo
utilizando `git add`:

~~~
$ git add marte.txt
~~~
{:class="in"}

e então verificamos alteração na mensagem de estado:

~~~
$ git status
~~~
{:class="in"}
~~~
# On branch master
#
# Initial commit
#
# Changes to be committed:
#   (use "git rm --cached <file>..." to unstage)
#
#	new file:   marte.txt
#
~~~
{:class="out"}

Git agora sabe que ele deve monitorar o arquivo `marte.txt` mas ele ainda não
salvou nenhuma mudança para a posterioridade como um commit. Para fazer isso
precisamos executar mais um comando:

~~~
$ git commit -m "Começando a pensar em Marte"
~~~
{:class="in"}
~~~
[master (root-commit) f22b25e] Começando a pensar em Marte
 1 file changed, 1 insertion(+)
 create mode 100644 marte.txt
~~~
{:class="out"}

Quando executamos `git commit`, Git pega todas as mudanças que informamos
precisar ser salvas quando utilizamos `git add` e armazena uma cópia permanente
dentro do diretório especial `.git`. Essa cópia permanente é denominada
[revisão](../../gloss.html#revision) é brevemente identificada por `f22b25e`.
(Sua revisão pode ter um identificador diferente.)

Utilizamos a opção `-m` (de "mensagem") para salvar um comentário que irá nos
ajudar a lembrar depois o que fizemos e porque. Se apenas executarmos `git
commit` sem a opção `-m`, Git irá iniciar `nano` (ou o editor que tivermos
configurado no início) para que possamos escrever um comentário longo.

Se executarmos `git status` agora:

~~~
$ git status
~~~
{:class="in"}
~~~
# On branch master
nothing to commit, working directory clean
~~~
{:class="out"}

Git está dizendo que tudo está atualizado. Se desejarmos saber o que foi feito
recentemente podemos pedir ao Git que mostre o histórico do projeto utilizando
`git log`:

~~~
$ git log
~~~
{:class="in"}
~~~
commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 09:51:46 2013 -0400

    Começando a pensar em Marte
~~~
{:class="out"}

`git log` lista todas as revisões salvas em um repositório na ordem cronológica
reversa. Essa lista inclui, para cada revisão, o identificador completo da
revisão (que inicia com os mesmos caracteres que o identificador curto impresso
pelo comando `git commit` anteriormente), o autor da revisão, quando ela foi
criada e o comentário dado à revisão quando ela foi criada.

> #### Onde estão minhas mudanças?
>
> Se executarmos `ls` agora continuamos a encontrar apenas um arquivo chamado
> `marte.txt`. Isso deve-se ao fato do Git salvar as informações com
> histórico dos arquivos no diretório especial denominado `.git` mencionado
> anteriormente tal que nosso sitema de arquivos não fique cheio (e nós
> acidentalmente editemos ou removemos uma versão anterior.

### Changing a File

Now suppose Dracula adds more information to the file.
(Again, we'll edit with `nano` and then `cat` the file to show its contents;
you may use a different editor, and don't need to `cat`.)

~~~
$ nano marte.txt
$ cat marte.txt
~~~
{:class="in"}
~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
~~~
{:class="out"}

When we run `git status` now,
it tells us that a file it already knows about has been modified:

~~~
$ git status
~~~
{:class="in"}
~~~
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   marte.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
~~~
{:class="out"}

The last line is the key phrase:
"no changes added to commit".
We have changed this file,
but we haven't told Git we will want to save those changes
(which we do with `git add`)
much less actually saved them.
Let's double-check our work using `git diff`,
which shows us the differences between
the current state of the file
and the most recently saved version:

~~~
$ git diff
~~~
{:class="in"}
~~~
diff --git a/marte.txt b/mars.txt
index df0654a..315bf3a 100644
--- a/marte.txt
+++ b/marte.txt
@@ -1 +1,2 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
~~~
{:class="out"}

The output is cryptic because
it is actually a series of commands for tools like editors and `patch`
telling them how to reconstruct one file given the other.
If we can break it down into pieces:

1.  The first line tells us that Git is using the Unix `diff` command
    to compare the old and new versions of the file.
2.  The second line tells exactly which [revisions](../../gloss.html#revision) of the file
    Git is comparing;
    `df0654a` and `315bf3a` are unique computer-generated labels for those revisions.
3.  The remaining lines show us the actual differences
    and the lines on which they occur.
    In particular,
    the `+` markers in the first column show where we are adding lines.

Let's commit our change:

~~~
$ git commit -m "Concerns about Mars's moons on my furry friend"
~~~
{:class="in"}
~~~
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   marte.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
~~~
{:class="out"}

Whoops:
Git won't commit because we didn't use `git add` first.
Let's fix that:

~~~
$ git add marte.txt
$ git commit -m "Concerns about Mars's moons on my furry friend"
~~~
{:class="in"}
~~~
[master 34961b1] Concerns about Mars's moons on my furry friend
 1 file changed, 1 insertion(+)
~~~
{:class="out"}

Git insists that we add files to the set we want to commit
before actually committing anything
because we may not want to commit everything at once.
For example,
suppose we're adding a few citations to our supervisor's work
to our thesis.
We might want to commit those additions,
and the corresponding addition to the bibliography,
but *not* commit the work we're doing on the conclusion
(which we haven't finished yet).

To allow for this,
Git has a special staging area
where it keeps track of things that have been added to
the current [change set](../../gloss.html#change-set)
but not yet committed.
`git add` puts things in this area,
and `git commit` then copies them to long-term storage (as a commit):

<img src="img/git-staging-area.svg" alt="The Git Staging Area" />

Let's watch as our changes to a file move from our editor
to the staging area
and into long-term storage.
First,
we'll add another line to the file:

~~~
$ nano marte.txt
$ cat marte.txt
~~~
{:class="in"}
~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
~~~
{:class="out"}
~~~
$ git diff
~~~
{:class="in"}
~~~
diff --git a/marte.txt b/mars.txt
index 315bf3a..b36abfd 100644
--- a/marte.txt
+++ b/marte.txt
@@ -1,2 +1,3 @@
 Cold and dry, but everything is my favorite color
 The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~
{:class="out"}

So far, so good:
we've added one line to the end of the file
(shown with a `+` in the first column).
Now let's put that change in the staging area
and see what `git diff` reports:

~~~
$ git add marte.txt
$ git diff
~~~
{:class="in"}

There is no output:
as far as Git can tell,
there's no difference between what it's been asked to save permanently
and what's currently in the directory.
However,
if we do this:

~~~
$ git diff --staged
~~~
{:class="in"}
~~~
diff --git a/marte.txt b/mars.txt
index 315bf3a..b36abfd 100644
--- a/marte.txt
+++ b/marte.txt
@@ -1,2 +1,3 @@
 Cold and dry, but everything is my favorite color
 The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~
{:class="out"}

it shows us the difference between
the last committed change
and what's in the staging area.
Let's save our changes:

~~~
$ git commit -m "Thoughts about the climate"
~~~
{:class="in"}
~~~
[master 005937f] Thoughts about the climate
 1 file changed, 1 insertion(+)
~~~
{:class="out"}

check our status:

~~~
$ git status
~~~
{:class="in"}
~~~
# On branch master
nothing to commit, working directory clean
~~~
{:class="out"}

and look at the history of what we've done so far:

~~~
$ git log
~~~
{:class="in"}
~~~
commit 005937fbe2a98fb83f0ade869025dc2636b4dad5
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 10:14:07 2013 -0400

    Thoughts about the climate

commit 34961b159c27df3b475cfe4415d94a6d1fcd064d
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 10:07:21 2013 -0400

    Concerns about Mars's moons on my furry friend

commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 09:51:46 2013 -0400

    Starting to think about Mars
~~~
{:class="out"}

### Exploring History

If we want to see what we changed when,
we use `git diff` again,
but refer to old versions
using the notation `HEAD~1`, `HEAD~2`, and so on:

~~~
$ git diff HEAD~1 marte.txt
~~~
{:class="in"}
~~~
diff --git a/marte.txt b/mars.txt
index 315bf3a..b36abfd 100644
--- a/marte.txt
+++ b/marte.txt
@@ -1,2 +1,3 @@
 Cold and dry, but everything is my favorite color
 The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~
{:class="out"}
~~~
$ git diff HEAD~2 marte.txt
~~~
{:class="in"}
~~~
diff --git a/marte.txt b/mars.txt
index df0654a..b36abfd 100644
--- a/marte.txt
+++ b/marte.txt
@@ -1 +1,3 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~
{:class="out"}

In this way,
we build up a chain of revisions.
The most recent end of the chain is referred to as `HEAD`;
we can refer to previous revisions using the `~` notation,
so `HEAD~1` (pronounced "head minus one")
means "the previous revision",
while `HEAD~123` goes back 123 revisions from where we are now.

We can also refer to revisions using
those long strings of digits and letters
that `git log` displays.
These are unique IDs for the changes,
and "unique" really does mean unique:
every change to any set of files on any machine
has a unique 40-character identifier.
Our first commit was given the ID
f22b25e3233b4645dabd0d81e651fe074bd8e73b,
so let's try this:

~~~
$ git diff f22b25e3233b4645dabd0d81e651fe074bd8e73b marte.txt
~~~
{:class="in"}
~~~
diff --git a/marte.txt b/mars.txt
index df0654a..b36abfd 100644
--- a/marte.txt
+++ b/marte.txt
@@ -1 +1,3 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~
{:class="out"}

That's the right answer,
but typing random 40-character strings is annoying,
so Git lets us use just the first few:

~~~
$ git diff f22b25e marte.txt
~~~
{:class="in"}
~~~
diff --git a/marte.txt b/mars.txt
index df0654a..b36abfd 100644
--- a/marte.txt
+++ b/marte.txt
@@ -1 +1,3 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~
{:class="out"}

### Recovering Old Versions

All right:
we can save changes to files and see what we've changed---how
can we restore older versions of things?
Let's suppose we accidentally overwrite our file:

~~~
$ nano marte.txt
$ cat marte.txt
~~~
{:class="in"}
~~~
We will need to manufacture our own oxygen
~~~
{:class="out"}

`git status` now tells us that the file has been changed,
but those changes haven't been staged:

~~~
$ git status
~~~
{:class="in"}
~~~
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   marte.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
~~~
{:class="out"}

We can put things back the way they were
by using `git checkout`:

~~~
$ git checkout HEAD marte.txt
$ cat marte.txt
~~~
{:class="in"}
~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
~~~
{:class="out"}

As you might guess from its name,
`git checkout` checks out (i.e., restores) an old version of a file.
In this case,
we're telling Git that we want to recover the version of the file recorded in `HEAD`,
which is the last saved revision.
If we want to go back even further,
we can use a revision identifier instead:

~~~
$ git checkout f22b25e marte.txt
~~~
{:class="in"}

It's important to remember that
we must use the revision number that identifies the state of the repository
*before* the change we're trying to undo.
A common mistake is to use the revision number of
the commit in which we made the change we're trying to get rid of:

<img src="img/git-when-revisions-updated.svg" alt="When Git Updates Revision Numbers" />

> #### Simplifying the Common Case
>
> If you read the output of `git status` carefully,
> you'll see that it includes this hint:
>
> ~~~
> (use "git checkout -- <file>..." to discard changes in working directory)
> ~~~
> {:class="in"}
>
> As it says,
> `git checkout` without a version identifier restores files to the state saved in `HEAD`.
> The double dash `--` is needed to separate the names of the files being recovered
> from the command itself:
> without it,
> Git would try to use the name of the file as the revision identifier.

The fact that files can be reverted one by one
tends to change the way people organize their work.
If everything is in one large document,
it's hard (but not impossible) to undo changes to the introduction
without also undoing changes made later to the conclusion.
If the introduction and conclusion are stored in separate files,
on the other hand,
moving backward and forward in time becomes much easier.

### Ignoring Things

What if we have files that we do not want Git to track for us,
like backup files created by our editor
or intermediate files created during data analysis.
Let's create a few dummy files:

~~~
$ mkdir results
$ touch a.dat b.dat c.dat results/a.out results/b.out
~~~
{:class="in"}

and see what Git says:

~~~
$ git status
~~~
{:class="in"}
~~~
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	a.dat
#	b.dat
#	c.dat
#	results/
nothing added to commit but untracked files present (use "git add" to track)
~~~
{:class="out"}

Putting these files under version control would be a waste of disk space.
What's worse,
having them all listed could distract us from changes that actually matter,
so let's tell Git to ignore them.

We do this by creating a file in the root directory of our project called `.gitignore`.

~~~
$ nano .gitignore
$ cat .gitignore
~~~
{:class="in"}
~~~
*.dat
results/
~~~
{:class="out"}

These patterns tell Git to ignore any file whose name ends in `.dat`
and everything in the `results` directory.
(If any of these files were already being tracked,
Git would continue to track them.)

Once we have created this file,
the output of `git status` is much cleaner:

~~~
$ git status
~~~
{:class="in"}
~~~
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	.gitignore
nothing added to commit but untracked files present (use "git add" to track)
~~~
{:class="out"}

The only thing Git notices now is the newly-created `.gitignore` file.
You might think we wouldn't want to track it,
but everyone we're sharing our repository with will probably want to ignore
the same things that we're ignoring.
Let's add and commit `.gitignore`:

~~~
$ git add .gitignore
$ git commit -m "Add the ignore file"
$ git status
~~~
{:class="in"}
~~~
# On branch master
nothing to commit, working directory clean
~~~
{:class="out"}

As a bonus,
using `.gitignore` helps us avoid accidentally adding files to the repository that we don't want.

~~~
$ git add a.dat
~~~
{:class="in"}
~~~
The following paths are ignored by one of your .gitignore files:
a.dat
Use -f if you really want to add them.
fatal: no files added
~~~
{:class="out"}

If we really want to override our ignore settings,
we can use `git add -f` to force Git to add something.
We can also always see the status of ignored files if we want:

~~~
$ git status --ignored
~~~
{:class="in"}
~~~
# On branch master
# Ignored files:
#  (use "git add -f <file>..." to include in what will be committed)
#
#        a.dat
#        b.dat
#        c.dat
#        results/

nothing to commit, working directory clean
~~~
{:class="out"}

<div class="keypoints" markdown="1">

#### Key Points
*   Use `git config` to configure a user name, email address, editor, and other preferences once per machine.
*   `git init` initializes a repository.
*   `git status` shows the status of a repository.
*   Files can be stored in a project's working directory (which users see),
    the staging area (where the next commit is being built up)
    and the local repository (where snapshots are permanently recorded).
*   `git add` puts files in the staging area.
*   `git commit` creates a snapshot of the staging area in the local repository.
*   Always write a log message when committing changes.
*   `git diff` displays differences between revisions.
*   `git checkout` recovers old versions of files.
*   The `.gitignore` file tells Git what files to ignore.

</div>

<div class="challenge" markdown="1">
Create a new Git repository on your computer called `bio`.
Write a three-line biography for yourself in a file called `me.txt`,
commit your changes,
then modify one line and add a fourth and display the differences
between its updated state and its original state.
</div>

<div class="challenge" markdown="1">
The following sequence of commands creates one Git repository inside another:

~~~
cd           # return to home directory
mkdir alpha  # make a new directory alpha
cd alpha     # go into alpha
git init     # make the alpha directory a Git repository
mkdir beta   # make a sub-directory alpha/beta
cd beta      # go into alpha/beta
git init     # make the beta sub-directory a Git repository
~~~
{:class="in"}

Why is it a bad idea to do this?
</div>
