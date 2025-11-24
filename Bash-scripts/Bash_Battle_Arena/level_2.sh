#!/bin/bash

: ' Level 2: Variables and Loops

Mission: Create a script that outputs the numbers 1 to 10, one number per line.
'


i=1
echo "Numbers from 1 to 10"
while [ $i -le 10 ]

do 

echo " $i"
((i++))

done 