#!/bin/bash

MAIN_DIR=~/shell-scripting/imagens-novos-livros

convert_image() {
	local file_dir=$1
	local filename=$(ls $file_dir | awk -F. '{ print $1 }')
	convert $file_dir $filename.png
}

convert_images() {
	cd $1

	for file in *
	do
		local file_dir=$(find $MAIN_DIR -name $file)
		if [ -d $file_dir ]
		then
			convert_images $file_dir
		else
			convert_image $file_dir
		fi
	done
}

convert_images $MAIN_DIR
if [ $? -eq 0 ]
then
	echo "Conversão realizada com sucesso"
else
	echo "Houve um problema na conversão"
fi
