#4.0-1
mkdir $2
#4.0-2
find $1 -type f -name "*.txt"
#4.0-3
find $1 -type l
#4.0-4
find $1 -type f -perm -111 -name "*.sh"
#4.0-5
find $1 -type d -name "[AaDd]*"
#4.0-6
find $1 -type f -empty -user $(whoami)
#4.0-7
find $1 -type f -group $(whoami) -size +1M
#4.0-8
find $1 -type f -mmin -60
#4.0-9
find $1 -type d -perm -1000
#4.0-10
find $1 -type f \( -perm /2000 -o -perm /4000 \)
#4.0-11
find /dev -type b -o -type c
#4.0-12
find $1 -type d -empty -exec rm -rf {} \;
#4.0-13
find $1 -type f -size +10M -exec mv {} $2 \;
#4.0-14
find $1 -type d -name "[Z]*" -exec cp -r {} $2 \;
