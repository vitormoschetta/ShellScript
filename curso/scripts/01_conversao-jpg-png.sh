#!bin/bash
# Esse arquivo faz a conversao de jpg para png de todas as imagens informadas nos parametros da execução do arquivo bash
# o simbolo '$@' traz consigo a lista de argumentos passados na execução do arquivo bash

CAMINHO_IMAGENS=$(pwd)

for imagem in $@; do
	convert $CAMINHO_IMAGENS/$imagem.jpeg $CAMINHO_IMAGENS/$imagem.png
done
