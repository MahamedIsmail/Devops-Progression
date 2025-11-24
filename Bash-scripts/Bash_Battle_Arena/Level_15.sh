#!/bin/bash

: ' 1. Presents a menu to the user with the following options:

- Check disk space
- Show system uptime
- Backup the Arena directory and keep the last 3 backups
- Parse a configuration file settings.conf and display the values

2. Execute the chosen task.
 '
display_menu(){
echo " Please choose one of the following options:"
echo " 1. Check Disk Space"
echo " 2. Show System Uptime"
echo " 3. Backup Arena_Boss Directory"
echo " 4. Parse settings.conf File"
echo " 5. Exit"
echo -n " Enter your choice [1-5]: "
read choice 

perform_task "$choice"

}


perform_task(){
    local op="$1"

case "$op" in 
1) 
  echo " Disk Space Information: " 
  df -h ;;
       
2)    echo " System Uptime: "
      uptime -p  ;;
 
3) 

 local src_dir="Arena_Boss"
 mkdir -p "$src_dir"_backups
 cd "$src_dir"_backups
 
     tar -czf "backup_$(date +'%Y-%m-%d-%H-%M-%S').tar.gz" ../"$src_dir"
    local count=0
    find . -name "backup*" -exec ls -lt {} +| awk '{print $9}' | while read -r line;do 
    echo "$line"
    if [[ $count -ge 3 ]]; then 
         rm -f "$line"
         echo " removed old backup file: $line"
     fi 

    ((count++))
     done ;;

4) IFS='=' 
cat Log_dir.log | while read -r key value ;do echo "Key: $key, Value: $value" ; done 


;;
5) echo " Exiting .. "
    exit 0
;;
*) echo  " Invalid option, please try again. " 
   display_menu
;;



esac

}

display_menu