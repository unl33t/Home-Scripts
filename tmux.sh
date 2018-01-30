#!/bin/bash
if tmux ls | grep : -q
then
    echo "Available Sessions:"
    tmux ls
    echo "or enter a new name"
    read -p "-> " choice
    if tmux ls | grep $choice
    then
        tmux a -t $choice
    else
        tmux new-session -d -s $choice -n work 'htop'
        tmux split-window -v -p 75
        tmux -2 attach-session -d
    fi
else
    read -p "New Session Name: " choice
    tmux new-session -d -s $choice -n work 'htop'
    tmux split-window -v -p 75
    tmux -2 attach-session -d
fi
