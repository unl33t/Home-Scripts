#!/bin/bash
echo "Welcome to"
echo "FFFFFFFFFFFFFFFFFFFFFFKKKKKKKKK    KKKKKKK   SSSSSSSSSSSSSSS "
echo "F::::::::::::::::::::FK:::::::K    K:::::K SS:::::::::::::::S"
echo "F::::::::::::::::::::FK:::::::K    K:::::KS:::::SSSSSS::::::S"
echo "FF::::::FFFFFFFFF::::FK:::::::K   K::::::KS:::::S     SSSSSSS"
echo "  F:::::F       FFFFFFKK::::::K  K:::::KKKS:::::S            "
echo "  F:::::F               K:::::K K:::::K   S:::::S            "
echo "  F::::::FFFFFFFFFF     K::::::K:::::K     S::::SSSS         "
echo "  F:::::::::::::::F     K:::::::::::K       SS::::::SSSSS    "
echo "  F:::::::::::::::F     K:::::::::::K         SSS::::::::SS  "
echo "  F::::::FFFFFFFFFF     K::::::K:::::K           SSSSSS::::S "
echo "  F:::::F               K:::::K K:::::K               S:::::S"
echo "  F:::::F             KK::::::K  K:::::KKK            S:::::S"
echo "FF:::::::FF           K:::::::K   K::::::KSSSSSSS     S:::::S"
echo "F::::::::FF           K:::::::K    K:::::KS::::::SSSSSS:::::S"
echo "F::::::::FF           K:::::::K    K:::::KS:::::::::::::::SS "
echo "FFFFFFFFFFF           KKKKKKKKK    KKKKKKK SSSSSSSSSSSSSSS   "
echo -e "\n"
echo "The"
echo "  [F]ucks"
echo "  [K]eeping"
echo "  [S]ystem"
echo -e "\n"
#  maxfucks, the maximum number of fucks the script will generate.
maxfucks="100"
fucks=$RANDOM
let "fucks %= maxfucks"
let fucks-=1
echo -e "Fucks alotted:    $fucks\n"
if [ $fucks -eq 0 ] ; then
    echo -e "     No fucks given\n"
elif [ $fucks -lt 0 ] ; then
    echo -e "Whoa, a negagive amount of fucks!  RUN!\n"
else
    while [ $fucks -gt 0 ] ; do

        drop=$RANDOM
        let "drop %= maxfucks"
        if [ $fucks == $drop ]
        then
            echo -e "Dropped a fuck, don't care.\n"
            let fucks-=1
            rt="0"
        else
            rt=$RANDOM
            let "rt %= 60"
            if [ $fucks -eq 1 ] ; then
                plural="fuck"
            else
                plural="fucks"
            fi
            echo -e "$fucks $plural left.\n"
            let fucks-=1
            sleep $rt
        fi
        case $rt in
             [0]) echo -e "   Did you hear something? nah. ($rt seconds!)\n";;
             [1-9]) echo -e "   Yikes! That fuck went fast! ($rt seconds!)\n";;
             [1][0-9]) echo -e "  Careful, that fuck went kinda quick. ($rt seconds)\n";;
             [2-3][0-9]) echo -e "   An average fuck was given. ($rt seconds)\n";;
             [4-5][0-9]) echo -e "   A fuck, with patience. ($rt seconds, lucky.)\n";;
             [60]) echo -e "   A Golden fuck! (It lasts a whole minute!)\n";;
         esac
    done
    echo "All out of fucks, oh well."
fi
