#!/bin/bash
echo $(date +%Y-%m-%d) >> /home/hubbi/Misc/battery_condition
echo "$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep \
  --color=never -A 2 time)" >> /home/hubbi/Misc/battery_condition
echo >> /home/hubbi/Misc/battery_condition
