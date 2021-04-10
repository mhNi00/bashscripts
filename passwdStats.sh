#!/bin/bash
#Z3.1-1
mkdir $1
#Z3.1-2
cat /etc/passwd | grep $(whoami)
#Z3.1-3
cat /etc/passwd | cut -d ':' -f 1,6,7 | sort -r > $1/F1.csv
#Z3.1-4
cat /etc/passwd | cut -d ':' -f 7 | rev | sort | uniq | rev > $1/F2.csv
#Z3.1-5
cat /etc/passwd | cut -d ':' -f 1 | tr qwertyuiopasdfghjklzxcvbnm QWERTYUIOPASDFGHJKLZXCVBNM > $1/F3.txt
#Z3.1-6
cat /etc/passwd | grep --after-context=4 --before-context=4 $(whoami) | grep -v $(whoami) > $1/F4.txt
#Z3.1-7
diff --side-by-side /etc/passwd $1/F4.txt > $1/differences.txt



