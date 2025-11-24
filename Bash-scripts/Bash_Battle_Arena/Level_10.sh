#!/bin/bash
: '1. Creates a directory called Arena_Boss.
2. Creates 5 text files inside the directory, named file1.txt to file5.txt.
3. Generates a random number of lines (between 10 and 20) in each file.
4. Sorts these files by their size and displays the list.
5. Checks if any of the files contain the word "Victory", and if found, moves the file to a directory called Victory_Archive.'

text_genator() {

   local file="$1"
   local i=0
   num_of_lines=$((RANDOM %20 + 10))
   while [  $i -lt  $num_of_lines   ]; do 
    line=$(tr -dc  'A-Za-z' < /dev/urandom | head -c 100) 

    echo "$i: $line" >> "$file"
    (( i++ ))
    done
    

}

check_Victory (){

local file="$1"

if [ ! -d "Victory_Archive" ]; then
echo " creat Victory_Archive directory ...."
mkdir Victory_Archive
fi 

grep "Victory" "$file"
res=$?
echo "exit code for grep is $res"
if [ $res -eq 0 ]; then
echo " Victory found in file $file  moving to Victory_Archive directory ...."
mv "$file" Victory_Archive/

fi 
if [ $res -ne 0 ]; then
echo " Victory not found in file $file "

fi

}

main (){

if [ ! -d "Arena_Boss" ]; then 
echo " creat directory ...."
mkdir Arena_Boss
fi 


cd Arena_Boss
local i=1
while [ $i -le 5 ]; do
text_genator bosefile"$i".txt

(( i++ ))
done 
echo " Sorting files by size ...."


find . -name "*.txt" -exec ls -lh {} \;| sort -h -k 5,5

for file in ./*.txt;
do 
check_Victory "$file"

done 

}

main 
