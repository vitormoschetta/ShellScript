#!bin/bash

# Esse script faz a conversao de jpg para png de todas as imagens existentes em um diretorio especifico
# salvando-as em um diretório 'png'.
# Atenção: necessário criar o diretório 'png' caso não exista.

cd "$(pwd)/images"

if [ ! -d png ]; then
	mkdir png
fi

for imagem in *.jpeg; do
	imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
	convert $imagem_sem_extensao.jpeg png/$imagem_sem_extensao.png
done
