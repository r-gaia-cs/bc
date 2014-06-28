# Software Carpentry em Português

Este diretório é o ponto de partida para a tradução das lições da [Software
Carpentry](http://software-carpentry.org/) para o idioma português.

## Motivação

Software Carpentry possui como missão ensinar à pesquisadores habilidades
básicas de informática/programação aplicáveis no ambiente científico:
ferramentas e técnicas que ajudam a fazer mais coisas em menos tempo e de forma
menos dolorosa. Os instrutores e colaboradores são voluntários e ministraram
mais de uma centena de workshops nos do início de 2013 até o final do primeiro
semestre de 2014 atendendo um público superior à mil pesquisadores. Todo o
material das lições podem ser livremente reutilizados sob uma licença [Creative
Commons](http://creativecommons.org/licenses/by/3.0/es/deed.pt_BR).

O objetivo dessa tradução é facilitar os primeiros passos para aqueles que
querem começar a aprender pois muitas vezes o idioma é uma grande barreira.
**NÃO é nosso objetivo traduzir todo o conteúdo e manter a tradução
atualizada.**

## Sobre

Tradução não é uma tarefa simples e torna-se altamente complexa quando o
documento original é constantemente alterado (*tradução contínua*) e em um
formato não amigável para ferramentas populares de tradução (as lições da
Software Carpentry são escritas em mais de um desses formatos). Com base em
experiências anteriores optou-se por utilizar um branch para isso e utilizar o
GitHub para coordenar a tradução.

## Contribuindo

Antes de começar a traduzir verifique os *issues* marcados como `pt-BR` em
https://github.com/r-gaia-cs/bc/issues?labels=pt-BR&page=1&state=open. Se não
existir um issue para o arquivo que você quer traduzir, (1) crie um *issue*, (2)
marque ele como sua responsabilidade e (3) quando traduzi-lo envie um *pull
request* para o branch `pt-BR`. Se já existir um *issue* criado, verifique se
ele está sob responsabilidade de alguém para entrar em contato com essa pessoa e
juntarem esforços ou marcá-lo como sua responsabilidade.

Maiores informações encontram-se a seguir.

## Começando a tradução de um arquivo

**Será utilizado o arquivo `novice/git/01-backup.md` nos exemplos e você deve
substituí-lo pelo arquivo desejado.**

1. Copiar o arquivo desejado para `translations/pt-BR` mantendo a mesma
   estrutura de diretórios e nome.

~~~
$ cp {,translations/pt-BR/}novice/git/01-backup.md
~~~

2. Adicionar o arquivo ao controle de versão

~~~
$ git add translations/pt-BR
~~~

3. Criar uma versão com o arquivo original

~~~
$ git rev-parse --short HEAD
hash
$ git commit -m '[pt-BR] Add file novice/git/01-backup.md based on hash'
~~~

4. Traduzir uma parte e salvar a tradução.

~~~
$ git add -u .
$ git log --oneline -- translations/pt_BR/novice/git/01-backup.md
* hash2 [pt-BR] Add file novice/git/01-backup.md based on hash
$ git commit -m '[pt-BR] Partial translation of novice/git/01-backup.md based on hash'
~~~

   Quando terminar de traduzir:

~~~
$ git add -u .
$ git log --oneline -- translations/pt_BR/novice/git/01-backup.md
* hash2 [pt-BR] Partial translations of novice/git/01-backup.md based on hash
$ git commit -m '[pt-BR] Finishing translation of novice/git/01-backup.md based on hash'
~~~

## Atualizando a tradução de um arquivo

1. Descobrir as alterações no arquivo original

~~~
$ git log --oneline -- translations/pt_BR/novice/git/01-backup.md
* hash2 [pt-BR] Finishing translation of novice/git/01-backup.md based on hash'
$ git diff hash -- novice/git/01-backup.md
~~~

2. Com base nas alterações no arquivo original atualizar a tradução

3. Salvar as alterações

~~~
$ git add -u .
$ git log --oneline -- novice/git/01-backup.md
* hash Some changes at git lesson
$ git commit -m '[pt-BR] Upgrade translation of novice/git/01-backup.md based on hash'
~~~

## Enviando traduções realizadas

Traduções/contribuições devem ser enviadas para
https://github.com/r-gaia-cs/bc como *pull request* para no branch `pt-BR`.

## Agradecimentos

Agradecimentos ao time da Software Carpentry e em especial, por essa tradução, à

- Raniere Silva (@r-gaia-cs), coordenador (2014-????)

## Contato

Envie um email para [Raniere Silva](mailto:raniere@ime.unicamp.br) ou crie um
issue em https://github.com/r-gaia-cs/bc.
