---
layout: lesson
root: ../..
title: Introdução ao Controle de Versão
---
Lobisomem e Drácula foram contratados pelo Universal Missions
(uma agência de serviços espaciais da Euphoric State University)
para descobrir onde a companhia deveria enviar sue próximo robô explorador.
Eles desejam trabalhar nos planos ao mesmo tempo
mas tiveram problemas ao fazer isso no passado.
Se eles trabalharem em turnos,
cada um deles irá gastar muito tempo esperando o outro terminar
mas se eles trabalharem em sua cópia e trocarem emails com as mudanças
alguma coisa acabará se perdendo, sendo reescrita ou duplicada.

A solução é eles utilizarem [controle de versão](../../gloss.html#version-control)
para gerenciar o trabalho.
Controle de versão é melhor que trocar arquivos por email pois:

*   Nada que é salva no controle de versão pode ser perdido.
    Isso significa que ele pode ser utilizado como a ferramenta "desfazer" de um
    editor de texto e como todas as versões anteriores dos arquivos estão salvas
    sempre é possível voltar no tempo para saber quem escreveu o que em um dia
    particular ou que versão de um programa foi utilizado para gerar um
    resultado.
*   Ele mantem um registro de quem fez cada mudança e quando ela foi feita e
    assim, se alguém tiver perguntas depois saberá a quem perguntar.
*   É difícil (mas não impossível) de acidentalmente sobrescrever as mudanças
    de alguém: o sistema de controle de versão automaticamente avisa o usuário
    quando existe um conflito entre o trabalho de duas ou mais pessoas.

Essa lição mostra como utilizar um popular sistema de controle de versão de
código aberto chamado Git. Ele é mais complexo que outras alternativas, mas é
amplamente utilizado, tanto porque é fácil de configurar e também devido a um
site de hospedagem chamado GitHub [GitHub](http://github.com). Não importa qual
sistema de controle de versão você utiliza, o mais importante para aprender não
é os detalhes dos comandos mais obscuros, mas a forma de trabalhar que ele
encoraja.
