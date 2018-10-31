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
    ln -s ~/Home-Scripts/dot_files/tmux.conf ~/.tmux.conf
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
#   Grab gotop (because it's darn pretty)
#
if [ ! -f /usr/local/bin/gotop ]; then
    git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
    /tmp/gotop/scripts/download.sh
    sudo mv gotop /usr/local/bin/gotop
    rm -rf /tmp/gotop
fi
#
#   Installing ccat
#
if [ ! -x "$(command -v ccat)" ]; then
    echo "Installing ccat"
    if [ -x "$(command -v apt)" ]; then
        sudo apt install golang-go
        go get -u github.com/jingweno/ccat
        sudo cp ~/go/bin/ccat /usr/local/bin/ccat
    elif [ -x "$(command -v brew)" ]; then
        brew install ccat
    fi
else
    echo "ccat installed"
fi
#
#   Refresh Env (might require a logout)
#
if [ -f ~/.profile ]; then
    source ~/.profile
elif [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
else
    source ~/.bashrc
fi
