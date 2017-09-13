#!/bin/bash
fucks=$RANDOM
let "fucks %= 100"
let fucks-=1

echo -e "Fucks alotted:    $fucks\n"
if [ $fucks -eq 0 ] ; then
    echo -e "No fucks given\n"
elif [ $fucks -lt 0 ] ; then
    echo -e "Whoa, a negagive amount of Fucks!  RUN!\n"
else
    while [ $fucks -gt 0 ] ; do
        if [ ! -z "$rt" ]
        then
            echo -e "  (that Fuck lasted $rt seconds!)\n"
        fi
        rt=$RANDOM
	    let "rt %= 60"
        echo "$fucks    Fucks left, use them wisely"
        let fucks-=1
        sleep $rt
    done
    echo -e "  (that Fuck lasted $rt seconds!)\n"
    echo "All out of fucks, oh well."
fi
