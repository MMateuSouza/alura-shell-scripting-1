#!/bin/bash

if [ ! -d log ]
then
	mkdir log
fi

memory_process() {
	pids=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

	for pid in $pids:
	do
		process_name=$(ps -p $pid -o comm=)
		if [ $? -eq 0 ]
		then
			echo -n $(date +%F,%H:%M:%S,) >> log/$process_name.log
			process_size=$(ps -p $pid -o size | grep [0-9])
			echo "$(bc <<< "scale=2;$process_size/1024") MB" >> log/$process_name.log
		else
			echo "Processo PID=$pid encerrado"
		fi
	done
}

memory_process
if [ $? -eq 0 ]
then
	echo "Os arquivos foram salvos com sucesso"
else
	echo "Houve um problema para salvar os arquivos"
fi
