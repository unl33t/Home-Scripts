#!/bin/bash
# get line
IFS=$'\n'
line=($(sort -R ~/cowsay.csv | head -n 1))
unset IFS

# turn it into an array by splitting on ","
IFS=';' read -r -a parts <<< "$line"

# run our new and improved randomized cow!
if [[ "${parts[2]}" == "fortune"  ]]; then
    /usr/games/fortune computers magic science miscellaneous zippy wisdom work | ${parts[0]}
else
    ${parts[0]} ${parts[1]} -W21 ${parts[2]}
fi
