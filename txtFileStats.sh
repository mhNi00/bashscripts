#!/bin/bash
#3.0-1
file --mime-encoding $1
#3.0-2
wc -l $1
#3.0-3
wc -m $1
#3.0-4
du --human-readable $1
#3.0-5
grep $2 $1 | wc -l 
#3.0-6
grep -v $2 $1 | wc -l
#3.0-7
cat $1 | head --lines=5 | tail --lines=1


