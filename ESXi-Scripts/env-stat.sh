#!/bin/bash
echo "VM Status:"
ssh fridge vim-cmd vmsvc/getallvms
vms=`ssh fridge vim-cmd vmsvc/getallvms | cut -d " " -f 1`
for vm in $vms
do
    if [[ $vm =~ "Vmid" ]]
    then
        echo " "
    else
        echo "Fetching $vm"
        ssh fridge vim-cmd vmsvc/power.getstate $vm
        echo " "
    fi
done
echo "Storage Status:"
ssh fridge esxcli storage nfs list
