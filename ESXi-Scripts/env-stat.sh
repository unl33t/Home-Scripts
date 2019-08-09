#!/bin/bash

host="fridge"

if $(nc -z $host 22); then # Port 22 reachable?
    echo "Host $host Online     :)"
    echo "VM Status:"
    ssh $host vim-cmd vmsvc/getallvms
    vms=`ssh $host vim-cmd vmsvc/getallvms | cut -d " " -f 1`
    for vm in $vms
    do
        if [[ $vm =~ "Vmid" ]]
        then
            echo " "
        else
            
            status=$(ssh $host vim-cmd vmsvc/power.getstate $vm | tail -n 1)
            echo "$vm $status"
        fi
    done
    echo " "
    echo "Storage Status:"
    ssh $host esxcli storage nfs list
else
    echo "Host $host Offline    :("
fi


