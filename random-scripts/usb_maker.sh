#!/bin/bash
Echo "Do you need to convert an iso to img? (y/n)"
read convert
if [ "$convert" == "y" ]
    then
        echo "What is the source file/path?"
        read getiso
        echo "What is the name for the converted image? (do not include extention)"
        read getimg
        hdiutil convert -format UDRW -o ~/Desktop/$getimg $getiso
        echo "$getimg saved to ~/Desktop/$getimg"
    fi
echo "fetching list of devices, find the one you want to write to"
diskutil list
echo "what is the disk number? (just the number)"
read diskno
if [ "$convert" == "y" ]
    then
        echo "I see you also converted a file, using ~/Desktop/$getimg.dmg"
    else
        echo "What is the path and file name of the img/dmg file?"
        read ifpath
    fi
echo "Unmounting /dev/$diskno"
diskutil unmountDisk /dev/disk$diskno
echo "Writing to /dev/disk$diskno this may take a while, so be patient... (sudo will prompt for a password)"
if [ "$convert" == "y" ]
    then
        sudo dd if=~/Desktop/$getimg.dmg of=/dev/disk$diskno bs=1m
    else
        sudo dd if=$ifpath of=/dev/disk$diskno bs=1m
    fi
echo "Done, ejecting USB device"
diskutil eject /dev/disk$diskno
