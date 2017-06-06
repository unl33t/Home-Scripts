#!/bin/bash
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
