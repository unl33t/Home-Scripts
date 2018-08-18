#! /bin/sh
ssh root@fridge vim-cmd vmsvc/getallvms
echo "Which VM would you like to turn on? "
read vmnum
ssh root@fridge vim-cmd vmsvc/power.on $vmnum

