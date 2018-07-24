#!/bin/bash

mv ~/.bashrc ~/.bashrc.old
ln -s ~/Home-Scripts/dot_files/bashrc ~/.bashrc
ln -s ~/Home-Scripts/dot_files/tmux ~/.tmux
ln -s ~/Home-Scripts/dot_files/tmux.conf ~/.tmux.conf
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
. ~/.bashrc
