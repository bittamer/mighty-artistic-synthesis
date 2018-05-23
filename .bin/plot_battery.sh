#!/bin/bash
echo -n $(acpi | grep "Battery 0" | awk '{ print $4 }' | sed 's/%//g') >> /home/hubbi/Misc/battery_charge
echo $(date +%s) >> /home/hubbi/Misc/battery_charge
