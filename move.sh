#!/bin/bash
#
#	Begin
#
cp -pv --remove-destination $1 $2
ls $2 | grep $1
origf=$(md5sum $1 | cut -d " " -f 1)
newf=$(md5sum $2$1 | cut -d " " -f 1)
if [ "$origf" = "$newf" ]
	then
		echo "Old: $origf";
		echo "New: $newf";
		echo "erase the orig: rm $1";
		rm $1;
	else
		echo "Old: $origf"
                echo "New: $newf";
                echo "Something Went Wrong (there was probably an error before this, go look for it)";
fi		
