#!/bin/bash


: 'Level 7: File Sorting Script

Mission: Write a script that sorts all .txt files in a directory by their size, from smallest to largest, and displays the sorted list."
'


A="Arena"
echo " A=:$A"
dir="Arena"
if [[ -d "$dir" ]]
then 

find $dir -name "*.txt" -exec ls -l {} + | sort  -k 5 | awk '{ print "Size", $5  ,"respektive File name", $9 }'
else 
echo "arena do not  exit "
fi
