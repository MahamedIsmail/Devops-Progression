#!/bin/bash

 : 'Level 3: Conditional Statements

Mission: Write a script that checks if a file named hero.txt exists in the Arena directory. If it does, print Hero found!; otherwise, print Hero missing!.
'

check_hero() {
game="/home/mahamed/Bash_Battle_Arena"


if [ -d "$game/Arena" ];
then 
    #echo "Arena  exists." test prints

    if [ -f "$game/Arena/hero.txt" ]
        then 
             echo "Hero found!"

 
    else 
            echo "Hero missing!"
         fi


 else 
    echo "Arena missing" test prints
 fi
}

check_hero
