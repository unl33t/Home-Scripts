#!/bin/bash

echo "Backing up old .bashrc and linking new"
mv ~/.bashrc ~/.bashrc.old
ln -s ~/Home-Scripts/dot_files/bashrc ~/.bashrc

echo "Setting up tmux env"
ln -s ~/Home-Scripts/dot_files/tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Run 'Ctrl-B Shft-I' from withing tmux to enable plugins"

echo "Setting up awesome vimrc"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
. ~/.bashrc
