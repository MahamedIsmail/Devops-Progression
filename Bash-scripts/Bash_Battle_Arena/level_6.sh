#!/bin/bash
: ' Level 6: Argument Parsing

Mission: Write a script that accepts a filename as an argument and prints the number of lines in that file. If no filename is provided, display a message saying 'No file provided'.'

check_lines (){
local arg=$1
if [[ -f $arg ]]
then 
echo " this file $arg exits in current dir $(pwd) "
num=$( wc -l $arg)
echo " number of lines is :$num "
else 
echo " no  $arg file provided "

fi 


}

arg=$1
check_lines "$arg"