#!/bin/bash
#
#   Getting system info
#
systype=$(uname -a);
mycp="cp"
case $systype in
    *Ubuntu*)
        system="Ubuntu"
        InsCmd="apt install"
        ;;
    *Darwin*)
        system="MacOS"
        if [ -x "$(command -v brew)"  ]; then
            InsCmd="brew install"
        else
            echo "Install Homebrew first (https://brew.sh/)"
            exit
        fi
        ;;
    *)
        echo "I don't know what OS this is, so I won't install anything."
        ;;
esac
if [ "$(whoami)" != "root"   ]; then
    mycp="sudo cp"
    InsCmd="sudo "InsCmd
fi
#
#   General Announcements
#
echo "Settin up your $system environment"
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
    $mycp gotop /usr/local/bin/gotop
    rm -rf /tmp/gotop gotop
fi
#
#   Installing ccat
#
if [ ! -x "$(command -v ccat)" ]; then
    echo "Installing ccat"
    echo "Using $InsCmd"
    case $system in
        MacOS)
            $InsCmd ccat
            ;;
        Ubuntu)
            $InsCmd golang-go
            go get -u github.com/jingweno/ccat
            $mycp ~/go/bin/ccat /usr/local/bin/ccat
            ;;
    esac
    echo "ccat installed"
#    if [ -x $system = "MacOS" ]; then
#        $InsCmd ccat
#    fi
#    if [ $system = "Ubuntu" ]; then
#        $InsCmd golang-go
#        go get -u github.com/jingweno/ccat
#        $mycp ~/go/bin/ccat /usr/local/bin/ccat
#    fi
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
