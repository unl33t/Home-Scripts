#! /bin/sh
ssh fridge vim-cmd vmsvc/getallvms
vms=`ssh fridge vim-cmd vmsvc/getallvms | cut -d " " -f 1`
sed 1d "$vms" > $vms
for vm in $vms
do
    if [[ $vm == *"Vmid"* ]]; then
        echo "Vmid"
    else
        echo "Fetching $vm"
        ssh fridge vim-cmd vmsvc/power.getstate $vm
        echo " "
    fi
done
