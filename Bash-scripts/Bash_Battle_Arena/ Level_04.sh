#!/bin/bash

: 'Level 4: File Manipulation

Mission: Create a script that copies all .txt files from the Arena directory to a new directory called Backup.
'

backup_files() {
dir=$(pwd)
echo $dir
if [ -d $dir"/Arena" ]
then 
mkdir $dir"/Backup"
cp $dir"/Arena"/*.txt  $dir"/Backup"
else 
    echo "Arena directory does not exist."
fi


    

}
backup_files
