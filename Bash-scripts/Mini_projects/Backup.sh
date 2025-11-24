#!/bin/bash

: 'Backup Script - Create a script that copies all .txt files from a specified directory to a backup directory.
 If the backup directory doesn’t exist, the script should create it firs'

 Backup_Script (){

    local source_dir="$1"
    if [ ! -d "$source_dir" ]; then
        echo " Source directory $source_dir does not exist."
        exit 1
    fi
    if [ ! -d "Backup_Directory" ]; then
        echo " Creating Backup_Directory ...."
        mkdir Backup_Directory
    fi
    cp "$source_dir"/*.txt Backup_Directory/
    echo " Backup completed. All .txt files from $source_dir have been copied to Backup_Directory."
 }

    Backup_Script "./source_dir"