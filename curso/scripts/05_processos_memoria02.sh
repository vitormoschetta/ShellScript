#!/bin/bash

# Imprime o nome dos 10 processo que estão com a maior quantidade de memória alocada
# '>' cria um log porem sobrescrevendo
# '>>' cria novos logs sem sobrescrever
# '-n' seria para não quebrar a linha

processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

if [ ! -d logs ]; then
    mkdir logs
fi

cd logs

for processo in $processos; do
    nome_processo=$(ps -p $processo -o comm=)
    echo -n $(date +%F*%H:%M:%S*) >>$nome_processo.log
done
