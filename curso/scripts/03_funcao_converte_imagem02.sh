#!bin/bash

# Esse script faz a conversao de jpg para png de todas as imagens existentes em um diretorio especifico
# salvando-as em um diretório 'png'.
# Atenção: necessário criar o diretório 'png' caso não exista.
# Toda função emite um comando de saída, que pode variar de 0 a 255, onde 0 significa que houve sucesso.
# Dessa forma podemos verificar se uma função foi executada com sucesso da seguinte forma: 'if [ $? -eq 0 ]'

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

func_converte_imagem
if [ $? -eq 0 ]; then
	echo "Conversão realizada com sucesso"
else
	echo "Houve uma falha no processo"
fi
