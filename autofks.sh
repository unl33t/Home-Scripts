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
echo "[F]ucks"
echo "[K]eeping"
echo "[S]ystem"
echo -e "\n"
maxfks="100"
fks=$RANDOM
let "fks %= maxfks"
let fks-=1
echo -e "fks alotted:    $fks\n"
if [ $fks -eq 0 ] ; then
    echo -e "No fks given\n"
elif [ $fks -lt 0 ] ; then
    echo -e "Whoa, a negagive amount of fks!  RUN!\n"
else
    while [ $fks -gt 0 ] ; do
        if [ ! -z "$rt" ]
        then
            echo -e "  (that Fuck lasted $rt seconds!)\n"
        fi
        
        drop=$RANDOM
        let "drop %= maxfks"
        if [ fks == drop ]
        then
            echo "Dropped a fks, don't care."
            rt="0"
        else
            rt=$RANDOM
            let "rt %= 60"
            echo "$fks    fks left, use them wisely"
            let fks-=1
            sleep $rt
        fi
    done
    echo -e "  (that Fuck lasted $rt seconds!)\n"
    echo "All out of fks, oh well."
fi
