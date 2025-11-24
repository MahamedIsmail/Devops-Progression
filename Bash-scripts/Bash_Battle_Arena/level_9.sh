#!/bin/bash

: ' Mission: Write a script that monitors a directory for any changes (file creation, modification, or deletion) and logs the changes with a timestamp.
   '
mymap=$HOME"/Bash_Battle_Arena/testmap_forlevel_9"


monitor () {

local log_file="$1"
if [[ -d $mymap  ]]; then 
echo "mappen exits"
 
else 
exit 1
fi

 fswatch -r $mymap  | while read event ; #-r recusly whatches the sub folders and things inside folder , fswatch is filesystem listerner 
 do 

if [ -e "$event"  ]; then 
 echo " $(date +'%Y-%m-%d %H:%M:%S')  File  modified/created: $event " >> "$log_file"

  else 
  echo " $(date +'%Y-%m-%d %H:%M:%S' ) File  deleted: $event "  >>  "$log_file" 
  fi

 done

 }




monitor "Log_dir.log"