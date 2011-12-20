#!/bin/bash
projpath="/media/Media/pending";		# temp holding area for files
pendpath="/media/Media/Movies/Pending";		# final bulk resting place
for i in `ls *.m4v *.mov *.avi *.mp4`
do
	if [[ $i =~ CONVERTED ]]
		then
			echo "********** $i already converted **********";
		else
			newname=$(echo $i | cut -d . -f 1);
			if [ -a $projpath/$newname.m4v ]
				then
					rm $projpath/$newname.m4v
			fi
			HandBrakeCLI -Z AppleTV 2 -i $i -o $projpath/$newname.m4v;
			mv -v $projpath/$newname.m4v $pendpath/$newname.m4v
			mv -v $i CONVERTED-$i
	fi
done
