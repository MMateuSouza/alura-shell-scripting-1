#!/bin/bash

convert_images() {
	cd ~/shell-scripting/imagens-livros

	if [ ! -d png ]
	then
		mkdir png
	fi

	for image in *.jpg
	do
		local image_name=$(ls $image | awk -F. '{ print $1 }')
		convert $image png/$image_name.png
	done
}

convert_images 2>errors.txt
if [ $? -eq 0 ]
then
	echo "Conversão realizada com sucesso"
else
	echo "Houve uma falha no processo"
fi
