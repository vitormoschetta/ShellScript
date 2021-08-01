#!/bin/bash

texto="Nome:Vitor; Idade:32; Nacionalidade:Brasileiro"

IFS=";" read -a array <<< $texto

echo "${array[@]}"
echo "Numbero de elementos no meu array: ${#array[@]}"

