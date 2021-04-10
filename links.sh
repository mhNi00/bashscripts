#!/bin/bash
#1
mkdir $1
#2
cd $1
mkdir D1
mkdir D2
mkdir D3
mkdir D4
touch D2/F1.txt
touch D3/F1.txt
touch D4/F1.txt
#3
cd D1
ln -s /etc/passwd linksym
#4
readlink -f linksym
#5
cd ..
cd ..
ln $1/D3/F1.txt $1/D2/F2.txt 
#6
chmod 600 $1/D2/F2.txt
#7
sudo chown :users $1/D2/F2.txt
#8
sudo chgrp users $1/D3
#9
chmod 666 $1/D3
#10
chmod 555 $1/D2
#11
chmod 333 $1/D4
#12
chmod +t $1/D4
#13
touch $1/D1/scr1.sh
chmod 774 $1/D1/scr1.sh
#14
chmod u+s $1/D1/scr1.sh
chmod g+s $1/D1/scr1.sh






