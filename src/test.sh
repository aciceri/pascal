#!/bin/bash
#Questo script permette di compilare programmi pascal,
#di eseguirli e infine di rimuovere il file eseguito
#Creato da Andrea Ciceri in data 13-12-12

if [ $# -ne 1 ]; then
	echo "Devi inserire una roba del tipo:"
	echo "./test.sh programma.pas"
	exit 1

else
	if [ -f $1 ]; then
		tmp=${1:0:-4}

		if fpc $tmp.pas; then
			./$tmp
			rm $tmp $tmp.o
			exit 0

		else
			exit 1

		fi

	else
		echo "Errore: il file non esiste!"
		exit 1
	fi	
fi

