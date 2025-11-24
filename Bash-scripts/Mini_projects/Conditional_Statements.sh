#!/bin/bash


: 'Conditional Statements - Write a script that checks if a file exists and prints a message indicating whether it exists or not. If it exists, the script should also check if the file is readable, writable, or executable
'


conditional_stament(){

local file="$1"
echo " the file path to check:$file "

if [[ -e $file  ]]

then 
   echo "file $file exists"
   
   if [[ -x $file  ]]
      then 
      echo " file is exautble "
      fi
   if [[ -r $file  ]]
      then 
         echo "file is readable "
         fi

   if [[ -w $file  ]]
       then 
         echo "file is writable "
         fi    
      
else
      echo "file : $file: does not exist "
      exit 1
   fi   

}
conditional_stament test1.txt
