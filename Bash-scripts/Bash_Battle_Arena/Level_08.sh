#!/bin/bash

: ' 
Mission: Create a script that searches for a specific word or phrase across all .log files in a directory and outputs the names of the files that contain the word or phrase.
'
set -e 



multi_file_searcher (){
    local dir="$1"
    local pharse_or_word="$2"
    
    if [[  -d $dir  ]]
    then 
    echo "yes $dir exits in current working dir"
    find "$dir"  -iname "*.log" -exec grep "$pharse_or_word" {} \;
   

    else 
    echo "no $dir do not exit"
    fi
}

multi_file_searcher "logmap" "Guts"
