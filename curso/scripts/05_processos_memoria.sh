#!/bin/bash

# Imprime o nome dos 10 processo que estão com a maior quantidade de memória alocada

processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for processo in $processos; do
    echo $(ps -p $processo -o comm=)
done
