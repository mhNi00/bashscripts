#!/bin/bash
#Z8.0
rozdzielacz()
{
 source_file="$1"
 desired_file_1="$2"
 desired_file_2="$3"
 files_path="$4"
 if [ ! -r "$source_file" ]
 then
 	echo "Brak dostepu do odczytu pliku zrodlowego" 2>$source_file
 	exit -1
 fi
 if [ ! -e "$desired_file_1" ] 
 then
 	touch $4 plikdocelowy1
 elif [ -w "$desired_file_1" ]
 then
 	echo "Posiadasz uprawnienia zapisu do pliku docelowego 1"	
 fi
 if [ ! -e "$desired_file_2" ]
 then 
 	touch ~$4 plikdocelowy2
 elif [ -w "$desired_file_2" ]
 then
 	echo "Posiadasz uprawnienia zapisu do pliku docelowego 2 "
 fi
 cp /dev/null $desired_file_1
 cp /dev/null $desired_file_2
 cat $source_file | nl | sed -n 2~2p > $desired_file_1
 cat $source_file | nl | sed -n 1~2p > $desired_file_2
}
#Z8.1
struktura()
{
 source_path="$1"
 file_path="$2"
 if [ ! -d "$source_path" ] 
 then
 	echo "Sciezka nie wskazuje na katalog" 2>$source_path
 	exit -1
 fi
 if [ ! -w "$source_path" ]
 then
 	echo "Brak praw zapisu do katalogu" 2>$source_path
 	exit -1
 fi
 if [ ! -r "$file_path" ]
 then
 	echo "Brak uprawnien do odczytywania pliku" 2>$source_path
 	exit -1
 fi
 n=1
 firstletter="x"
 desiredpath="y"
 while read line; do
 firstletter=${line:0:1}
 desiredpath=${line:2}
 if [ $firstletter == "D" ]
 then
 	mkdir "$desiredpath"
 elif [ $firstletter == "F" ]
 then
 	touch "$desiredpath"
 fi 
 echo "$line $firstletter $desiredpath"
 n=$((n+1))
 done < $file_path
 
}
rozdzielacz $1/pliktestowy $1/plikdocelowy1 $1/plikdocelowy2 $1
struktura $1 $2
