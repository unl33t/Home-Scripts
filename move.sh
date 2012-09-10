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
		rsync -avzhP "$1" "$2$1" --chmod=ugo=rwx 
		echo "code returned: $?"
		if [ $? == 0 ]
			then
				echo "File moved, erase the orig: $1";
				rm "$1";			#comment this out when testing
			else
		                echo "Something Went Wrong (there was probably an error before this, go look for it)";
		fi
	else
		echo "Source or Dest was empty";
fi
