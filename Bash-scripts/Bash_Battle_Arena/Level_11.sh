#!/bin/bash

: ' Mission: Create a script that checks the disk space usage of a specified directory and sends an alert if the usage exceeds a given threshold 
   '

check_disk_usage(){
local dir="$1"
local threshold="$2"

usage=$(du -sh "$dir" | awk '{print $1}')
echo "Disk usage of $dir is $usage"
number=$(numfmt --from=iec $usage ) #linux utility to convert numbers units to diffrint formats, my case human readbals k mb gb to  sizes to bytes 1024 etc to later compare with threshold
echo "$number"
if [ "$number" -gt "$threshold" ]; then
echo "Alert: Disk usage of $dir exceeds threshold of $threshold"
else 
echo "Disk usage of $dir is within acceptable limits : $number : $usage"
fi

}

check_disk_usage "Arena_Boss" 300