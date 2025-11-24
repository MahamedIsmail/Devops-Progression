#!/bin/bash
: 'Write a script that reads a configuration file in the format KEY=VALUE and prints each key-value pair.
   '

   read_config(){
   local file="$1"
   IFS="="
   
   while read -r key value; do 
echo "Key: $key, Value: $value" 


   done < "$file"
  

   }

read_config "./Log_dir.log"

    