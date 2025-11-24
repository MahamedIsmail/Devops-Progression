#!/bin/bash

: 'Mission: Create an interactive script that presents a menu with options for different system tasks (e.g., check disk space, show system uptime, list users), and executes the chosen task.
'
menu_display(){
echo " Please choose one of the following options:"
echo " 1. Check Disk Space"
echo " 2. Show System Uptime"
echo " 3. List Users"
echo " 4. Exit"
echo -n " Enter your choice [1-4]: "
read choice 
menu_options "$choice"

}



menu_options(){
    local option="$1"
    echo " you have selected option: $option"
    case  "$option" in 

    
    1)
       
       echo " Disk Space Information: " 
       df -h
       
       
       ;;
    2)
         echo " System Uptime: "
         uptime -p  ;;

         
   3) echo "List of Users:" ¨
    cat /etc/passwd | awk -F ":" '{print $1 }';;

   4) echo " Exiting .. " 
       exit 0;;
    
    *) echo " Invalid option, please try again. " 
    menu_display ;; 
             

      
   
  esac
}
while true ; do 
menu_display 
done 
