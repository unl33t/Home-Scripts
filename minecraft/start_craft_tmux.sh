#!/bin/bash

#function
start_tmux(){
    # java -Xmx12G -Xms8G -mar spigot.jar
    tmux new-session -s Spigot "java -Xmx12G -Xms8G -jar spigot.jar"

}

#variables
got_pid="0"     # body
got_session="0" # brain

#work

# is there a body?
got_pid=$(ps -ef | grep spigot | grep java | wc -l)

# is there a brain?
tsession=$(tmux ls | cut -d ":" -f 1)
if [[ $tsession = "Spigot"  ]]; then
    echo "Session Found"
    got_session="1"
fi

echo "pid = $got_pid / session = $got_session"
# if there's a body, but no brain.  Dispose of the body and start new
if [ $got_pid -eq "1" ] && [ $got_session -eq "0" ]; then
    echo "Disposing of the body, and finding a new one"
    pkill -f java
    start_tmux
fi

# if there's a body and a brain, see if it's alive
if [ $got_pid -eq "1" ] && [ $got_session -eq "1" ]; then
    echo "Found a body with a brain, checking if it's alive"
    tmux a -t Spigot
fi

# if there's no body, but a brain, call an exercist
if [ $got_pid -eq "0" ] && [ $got_session -eq "1" ]; then
    echo "No body, but there is a brain, calling an exercist"
    tmux kill-session -t Spigot
    start_tmux
fi

# if there's no body and no brain, create a new monster
if [ $got_pid -eq "0"  ] && [ $got_session -eq "0"  ]; then
    echo "Nothing found, creating new"
    start_tmux
fi

