#!/bin/bash
echo "Get ready to type the root password for fridge... A LOT"
for i in 13 6
do
    if ssh root@fridge vim-cmd vmsvc/power.getstate $i | grep -i "Powered off"
    then
        ssh root@fridge vim-cmd vmsvc/power.on $i
    fi
done
