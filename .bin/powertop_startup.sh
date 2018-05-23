#!/bin/bash
echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs';
echo 'auto' > '/sys/bus/pci/devices/0000:01:00.0/power/control';
