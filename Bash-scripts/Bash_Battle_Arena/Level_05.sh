#!/bin/bash
: ' Creates a directory names 'Battlefield'
2. Inside Battlefield, create files named knight.txt, sorcerer.txt, and rogue.txt.
3. Check if knight.txt exists; if it does, move it to a new directory called Archive.
4. List the contents of both Battlefield and Archive.'


Battlefield_setup () {
mkdir Battlefield
cd Battlefield
touch knight.txt sorcerer.txt rogue.txt
if [ -f "knight.txt" ]
then 
   echo "knight.txt exists. Moving to Archive directory." 
   mkdir ../Archive #creating archive directory as the sibling of Battlefield
   mv ./knight.txt  ../Archive/knight.txt
fi
cd .. 
list_battlefield=$(ls Battlefield)
list_archive=$(ls Archive)

echo "Contents of Battlefield: $list_battlefield"
echo "Contents of Archive: $list_archive"
}

Battlefield_setup
