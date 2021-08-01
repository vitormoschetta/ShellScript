#!bin/bash

# Esse script faz a conversao de jpg para png de todas as imagens existentes em um diretorio especifico
# salvando-as em um diretório 'png'.
# Atenção: necessário criar o diretório 'png' caso não exista.
# Como vimos no exemplo anterior toda função emite comandos de saída, onde o 0 significa sucesso e o 2 significa erro.
# O que vamos fazer aqui é jogar os logs de erro para um arquivo específico: 'erros_conversao.txt'

func_converte_imagem() {

	cd "$(pwd)/images"

	if [ ! -d png ]; then
		mkdir png
	fi

	for imagem in *.jpeg; do
		local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
		convert $imagem_sem_extensao.jpeg png/$imagem_sem_extensao.png
	done
}

func_converte_imagem 2>erros_conversao.txt
if [ $? -eq 0 ]; then
	echo "Conversão realizada com sucesso"
else
	echo "Houve uma falha no processo"
fi
