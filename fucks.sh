#!/bin/bash
echo "Pless enter the number of Fucks available: "
read fucks
if [ $fucks -eq 0 ] ; then
    echo "No fucks given"
elif [ $fucks -lt 0 ] ; then
    echo "Whoa, a negagive amount of Fucks!  RUN!"
else
    while [ $fucks -gt 0 ] ; do
        if [ ! -z "$rt" ]
        then
            echo "  (that Fuck lasted $rt seconds!)"
        fi
        rt=$RANDOM
	    let "rt %= 60"
        echo "$fucks    Fucks left, use them wisely"
        let fucks-=1
        sleep $rt
    done
    echo "  (that Fuck lasted $rt seconds!)"
    echo "All out of fucks, oh well."
fi