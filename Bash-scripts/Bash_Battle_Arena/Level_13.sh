#!/bin/bash
: 'Mission: Create a script that backs up a directory to a specified location and keeps only the last 5 backups
  '
backup_directory(){

    local src_dir="$1"

if [[  -d $src_dir  ]]
    then
         echo  "this the sorce dir $src_dir"
         
        if [[ ! -d "$src_dir"_backups ]]
        then

             mkdir  "$src_dir"_backups
             cd "$src_dir"_backups 

            echo "Backup directory created."

           
        else
         echo "Backup directory exists."
            cd "$src_dir"_backups 
            fi

            mdate=$(date +"%Y-%m-%d-%H-%M-%S")
            echo " current date: $mdate"
             
       
             tar -czf "backup_$(date +'%Y-%m-%d-%H-%M-%S').tar.gz" ../"$src_dir"
           local count=0
           find . -name "backup*" -exec ls -lt {} +| awk '{print $9}' | while read -r line;do 
           
           echo "$line"
           if [[ $count -ge 5 ]]; then 
                 rm -f "$line"
                 echo " removed old backup file: $line"
            fi 

            ((count++))
           done
        

    else
        echo "Source directory does not exist!"
        exit 1 
    fi 
}    

backup_directory "Arena_Boss"