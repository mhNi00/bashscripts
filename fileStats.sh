#!/bin/bash
#Z9.0
statystyka_znakow()
{
 source_file="$1"
 output_file="$2"
 declare -A tablica
 
 if [ ! -e "$source_file" ]
 then
 	echo "Plik zrodlowy nie istnieje"
 	exit -1
 fi
 if [ ! -r "$source_file" ]
 then
 	echo "Brak dostepu do oczytu pliku"
 	exit -1
 fi
 if [ ! -e "$output_file" ]
 then
 	test=$( ( echo $output_file | sed 's|\(.*\)/.*|\1|' ) )
 	echo $test 
 	if [ ! -w $test ]
 	then
 		echo "Plik docelowy nie istnieje i nie da sie go stworzyc"
 		exit -1
 	fi
 	touch $output_file
 fi
 while read line; do
    for word in $line; 
    do
        (( tablica[$word]++ ))
    done
 done < $source_file
 
 for key in "${!tablica[@]}"; do
    echo "Key:   $key" >> $output_file
    echo "Value: ${tablica[$key]}" >> $output_file
 done

}


statystyka_znakow $1 $2

