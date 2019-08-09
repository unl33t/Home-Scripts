#! /bin/sh
ssh fridge vim-cmd vmsvc/getallvms
echo "Which VM would you like to power on? "
read vmnum
ssh fridge vim-cmd vmsvc/power.on $vmnum
