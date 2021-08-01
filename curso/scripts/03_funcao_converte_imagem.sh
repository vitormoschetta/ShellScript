#!bin/bash

# Esse script faz a conversao de jpg para png de todas as imagens existentes em um diretorio especifico
# salvando-as em um diretório 'png'.
# Atenção: necessário criar o diretório 'png' caso não exista.
# Veja que agora encapsulamos a conversão em uma função
# Outra observação é o modificador 'local' que impede que a variavel 'imagem_sem_extensao' seja acessada de fora do escopo/função

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
