#!/bin/bash
if [ -d '/Volumes/Videos/Movies/Pending' ]; then
    if find /Volumes/Videos/Movies/Pending -mindepth 1 | cut -d "/" -f 6 | grep -v .DS_Store; then
        echo "Destination not empty!"
        read -p "Do you want to continue? (Y/N)" -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "Continuding on!"
        else
            echo "Okay, bailing"
            exit 1
        fi
    fi
    echo "NAS Mounted, start moving stuff!"
    SRC=$(find /Users/g33k/Desktop/Archived\ Movies/Prepped/ -mindepth 1 | cut -d "/" -f 8 | grep -v .DS_Store)
    DST=$(find /Volumes/Videos/Movies/Pending -mindepth 1 | cut -d "/" -f 6 | grep -v .DS_Store)
    # echo $SRC
    # echo $DST
    until [ "$SRC" == "$DST" ]
        do
            rsync -avzh --progress --include='*.m4v' --exclude="*" Desktop/Archived\ Movies/Prepped/ /Volumes/Videos/Movies/Pending/
            SRC=$(find /Users/g33k/Desktop/Archived\ Movies/Prepped/ -mindepth 1 | cut -d "/" -f 8 | grep -v .DS_Store)
            DST=$(find /Volumes/Videos/Movies/Pending -mindepth 1 | cut -d "/" -f 6 | grep -v .DS_Store)
            echo "Is $SRC equal to $DST yet?"
        done
        echo "All things being equal (Src/Dest =  $SRC / $DST), we're done here."
else
    echo "Make sure nas share is mounted and try again"
fi
