#!bin/bash

func_converte_imagem() {	
	imagem_sem_extensao=$(ls $1 | awk -F. '{ print $1 }')
	convert $imagem_sem_extensao.jpeg $imagem_sem_extensao.png
}

func_varrer_diretorio() {
	cd $1

	for arquivo in *; do
		local caminho_arquivo=$(find -name $arquivo)
		if [ -d $caminho_arquivo ]; then
			func_varrer_diretorio $caminho_arquivo
		else
			func_converte_imagem $arquivo
		fi
	done
}

diretorio_inicial="$(pwd)/scripts/images"

func_varrer_diretorio $diretorio_inicial 2>erros_conversao.txt
if [ $? -eq 0 ]; then
	echo "Conversão realizada com sucesso"
else
	echo "Houve uma falha no processo"
fi
