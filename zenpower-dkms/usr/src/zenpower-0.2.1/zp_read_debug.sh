#!/bin/bash

hwmon="/sys/class/hwmon"
mdevs=`ls $hwmon`
zenmon=""
ok=0

for dev in $mdevs; do
    path="$hwmon/$dev"
    devname=`cat $path/name`
    if [ "$devname" == "zenpower" ]; then
        cat $path/debug_data
        ok=1
    fi
done

if [ $ok -ne 1 ]; then
    echo "Zenpower not found"
    exit
fi