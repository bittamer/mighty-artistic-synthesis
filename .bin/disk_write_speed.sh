#!/bin/bash
echo "$(date +%Y-%m-%d):" >> /home/hubbi/Misc/disk_write_speed
dd if=/dev/zero of=/home/hubbi/Misc/dws_temp_file bs=1M \
  count=5120 oflag=direct 2>> /home/hubbi/Misc/disk_write_speed
echo "" >> /home/hubbi/Misc/disk_write_speed
rm /home/hubbi/Misc/dws_temp_file
