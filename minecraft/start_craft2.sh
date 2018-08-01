#!/bin/bash

#function
start_tmux(){

}

#variables
got_pid="0"     # body
got_session="0" # brain

#work

# is there a body?
if [ -f minecraft_server.pid ]; then
    echo "It's running, go find a session";
    got_pid="1"
fi

# is there a brain?
tsession=$(tmux ls)
if [[ $tsession = "Spigot"  ]]; then
    echo "Session Found"
    got_session="1"
fi

# if there's a body, but no brain.  Dispose of the body and start new
if [ $got_pid -eq "1" ] && [ $got_session -eq "0" ]; then
    rm -f minecraft_server.pid
    start_tmux
fi

# if there's a body and a brain, see if it's alive
if [ $got_pid -eq "1" ] && [ $got_session -eq "1" ]; then
    tmux a -t Spigot
fi

# if there's no body, but a brain, call an exercist
if [ $got_pid -eq "0" ] && [ $got_session -eq "1" ]; then
    tmux kill-session -t Spigot
fi

# if there's no body and no brain, create a new monster
if [ $got_pid -eq "0"  ] && [ $got_session -eq "0"  ]; then
    start_tmux
fi

