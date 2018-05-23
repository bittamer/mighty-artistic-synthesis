#!/bin/bash
while true
do
    battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
    if [ $battery_level -ge 80 ]; then
       notify-send "Battery is above 80%!" "Charging: ${battery_level}%";
    elif [ $battery_level -le 25 ]; then
       notify-send "Battery is below 25%!" "Charging: ${battery_level}%";
    fi

    sleep 1200 # 1200 seconds or 20 minutes
done
