#!/bin/bash
if [ -d '/Volumes/Videos/Movies/Pending' ]; then
    echo "NAS Mounted, start moving stuff!"
    SRC=$(ls /Users/g33k/Desktop/Archived\ Movies/Prepped/ | wc -l)
    DST=$(ls /Volumes/Videos/Movies/Pending/ | wc -l)
    until [ $SRC -eq $DST ]
        do
            echo $SRC
            echo $DST
            rsync -avzh --progress --include='*.m4v' --exclude="*" Desktop/Archived\ Movies/Prepped/ /Volumes/Videos/Movies/Pending/
            SRC=$(ls /Users/g33k/Desktop/Archived\ Movies/Prepped/ | wc -l)
            DST=$(ls /Volumes/Videos/Movies/Pending/ | wc -l)
        done
        echo "All done, do you have to clean up the source Directory?"
else
    echo "make sure nas share is mounted"
fi
