#! /bin/sh
ssh fridge vim-cmd vmsvc/getallvms
echo "which VM would you like to check the status of? "
read vmnum
ssh fridge vim-cmd vmsvc/power.getstate $vmnum
