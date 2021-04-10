#!/bin/bash
#Z1.1
mkdir $1
#Z1.2
cd $1
#Z1.3
mkdir d1
cd d1
mkdir d1.1
touch t1.txt
cd ..
mkdir d2
cd d2
mkdir d2.1
cd d2.1
touch f1.csv
cd ..
cd ..
mkdir d3
cd d3
mkdir d3.1
mkdir d3.2
cd d3.2
touch f2.csv
cd ..
cd ..
mkdir Aa
mkdir Bb
mkdir Cc
#Z1.4
mv d1/t1.txt d1/d1.1
#Z1.5
cp d2/d2.1/f1.csv d1
#Z1.6
mv Aa Aa1
#Z1.7
ls *[12]
#Z1.8
du --max-depth=1


