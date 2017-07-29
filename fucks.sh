#!/bin/bash
echo "Pless enter the number of Fucks available: "
read fucks
if [ $fucks -eq 0 ] ; then
    echo "No fucks given"
elif [ $fucks -lt 0 ] ; then
    echo "Whoa, a negagive amount of Fucks!  RUN!"
else
    while [ $fucks -gt 0 ] ; do
        echo "$fucks    Fucks left, use them wisely"
        let fucks-=1
        sleep $(( ( RANDOM % 30 )  + 1 ))
    done
    echo "All out of fucks, oh well."
fi
