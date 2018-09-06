#!/bin/bash

#
#   Setting up bashrc
#
echo "Backing up old .bashrc and linking new"
if [ ! -L ~/.bashrc ]
then
    mv ~/.bashrc ~/.bashrc.old
    ln -s ~/Home-Scripts/dot_files/bashrc ~/.bashrc
fi
#
#   Setting up tmux env
#
echo "Setting up tmux env"
if [ ! -L ~/.tmux.conf ]
then
    mv ~/.tmux.conf ~/.tmux.conf.old
    ln -s ~/Home-Scripts/dotr_files/tmux.conf ~/.tmux.conf
    if [ -f ~/.tmux ]
    then
        mv ~/.tmux ~/.tmux.old
    fi
fi
if [ -d ~/.tmux/plugins/tpm ]
then
    cd ~/.tmux/plugins/tpm
    git pull
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
echo "Run 'Ctrl-B Shft-I' from withing tmux to enable plugins"
#
#   Setting up vimrc
#
echo "Setting up awesome vimrc"
if [ -f ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc.old
fi
if [ -d ~/.vim_runtime ]
then
    cd ~/.vim_runtime
    git pull
else
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
fi
sh ~/.vim_runtime/install_awesome_vimrc.sh
#
#   Refresh Env (might require a logout)
#
source ~/.bashrc
