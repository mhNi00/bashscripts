#!/bin/bash
#Z6.1
equation()
{
 test=$(echo "($1+$2)" | bc -l)
 if [ $test -eq 0 ]; then 
    echo "Mianownik jest rowny 0"
    exit -1
 else
 c=$(echo "($1-$2)/($1+$2)" | bc -l)
 echo $c
 fi
}
#Z6.2
fibbonaccirq()
{
 if [ "$#" -ne 1 ]; then
 echo "Podano za duzo argumentow" 
 exit -1
 elif [ $1 -le 0 ]; then
    echo 0
 elif [ $1 -eq 1 ]; then
    echo 1 
 else 
    echo $[ `fibbonaccirq $[$1 - 2]` + `fibbonaccirq $[$1 - 1]` ] 
 fi  
 
}
#Z6.3
fibbonacciit()
{
if [ "$#" -ne 1 ]; then
 echo "Podano za duzo argumentow" 
 exit -1
fi
a=0
b=1
if [ $1 -eq 0 ]; then
   echo $1
elif [ $1 -eq 1 ]; then
   echo $1 
fi
for ((i=0; i<$1-1; i++ ))
do
   fib=$((a+b))
   a=$b
   b=$fib
done
echo $fib

}
#Z6.4
maximum()
{
   max=$1
   tablica=( "$@" )
   for ((i=0; i<${#tablica[@]}; i++))
   do
      if [[ ${tablica[i]} > $max ]]; then
         max=${tablica[i]}
      fi
   done
   echo $max
   
}
equation $1 $2
fibbonaccirq $3
fibbonacciit $3 
maximum 3.4 2.5 3.9
