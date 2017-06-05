#!/bin/bash
#
#	Variables and fluctuations
#
srcpth="/Users/g33k/Desktop/Archived Movies";
dstpth="/Volumes/Videos/Movies/Pending";

#
#	Are there movies in the directory?
#
ls "$srcpth"/*.m4v 1>/dev/null 2>/dev/null;
if [ $? == 1 ]
	then	# nope.jpg
		echo "you forgot to move the movies into place";
	else	# yes, carry on.  lets prep and move these movies.
		rsync -avzhP "$srcpth"/ $dstpth --chmod=ugo=rwx --filter='exclude .DS_Store';
		#
		#	Start cleanup
		#
		for i in `ls "$srcpth"/ | grep .m4v`
		do	# for each movie in Prepped, check the remote server.  Is it there?
			ls "$dstpth/$i" 1>/dev/null;
			if [ $? == 0 ]
				then	# yes, kill the local copy
					echo "Remote $i found";
					#rm "$srcpth/$i";
					echo "Local $i removed";
				else	# No, just let me know it's not there.
					echo "$i not found on server";
			fi
		done
		#
		#	Final check to see if things are moved over
		#
		ls "$srcpth"/*.m4v 1>/dev/null 2>/dev/null;
		if [ $? == 1 ]	# Are there still movies local?
			then	# nope.jpg ssh over and clean files name and put in proper places.
				echo "Cleanup done, go fix names and move to appropriate directories";
				#cd "$dstpth";
				echo "Hint: cd $dstpth"
                cd $dstpth
			else	# yes, crap, something went wrong.  Check it out.
				echo "Still movies pending migration, what did you do?";
		fi		
fi
