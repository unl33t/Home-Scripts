#!/bin/bash
#################################################################
#	This script is here to keep me from losing more		        #
#	movie files between drive shuffles.  0 byte movies	        #
#	are no ones friend.					                        #
#################################################################
if [[ "$1" =~ "/" ]]
	then
		echo "Only run this while IN the same dir as the files to be moved!";
	elif [ "$1" ] && [ "$2" ]
		then
#		cp -pv --remove-destination "$1" "$2"		#comment this out when testing
		rsync -avzhP "$1" $2"$1"
		echo "code returned: $?"
		#origf=$(md5sum "$1" | cut -d " " -f 1)
		#newf=$(md5sum "$2$1" | cut -d " " -f 1)
		#if [ $origf ] && [ "$origf" = "$newf" ]
		if [ $? == 0 ]
			then
				echo "Old: $origf";
				echo "New: $newf";
				echo "File moved, erase the orig: rm $1";
				#rm "$1";			#comment this out when testing
			else
				#echo "Old: $origf"
		                #echo "New: $newf";
		                echo "Something Went Wrong (there was probably an error before this, go look for it)";
		fi
	else
		echo "Source or Dest was empty";
fi
