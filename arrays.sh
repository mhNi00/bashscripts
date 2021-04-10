#!/bin/bash
#Z7.1
sorting()
{
   temp=0	
   tablica=( "$@" )
   for ((i=0; i<${#tablica[@]}; i++))
   do
      for ((j=i; j<${#tablica[@]}; j++))
      do	
      if (( $(echo "${tablica[i]} > ${tablica[j]}" | bc -l ) )); then
         temp=${tablica[j]}
         tablica[j]=${tablica[i]}
         tablica[i]=$temp
      fi
      done
   done
   echo ${tablica[@]}
   
}
#Z7.2
dwuwymiarowetablice()
{
   if [ $1 -le 0 ]; then
      exit
   fi 
   if [ $2 -le 0 ]; then
      exit
   fi     
   declare -A tablica   
   rzad=$1
   kolumna=$2
   for (( i=1; i<=rzad; i++ ))
   do
      for ((j=1; j<=kolumna; j++ ))
      do
         tablica[$i,$j]=$(echo  "$RANDOM%20" | bc )
      done
   done  
   
   for (( j=1; j<=kolumna; j++ )) do
    for ((i=1; i<=rzad; i++)) do
        printf "${tablica[$i,$j]} "
    done
    echo
done   
}
 
dwuwymiarowetablice 3 5
sorting 2 5 9 1 4 3.5 19 23.14 15 23.13
