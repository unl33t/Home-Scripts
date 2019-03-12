#!/bin/bash
#
#   Functions
#
function make_it_live(){
    #
    #   Refresh Env (might require a logout)
    #
    if [ $SHELL = "*bash*" ];then
        if [ -e ~/.profile ]; then
            source ~/.profile
        fi
        if [ -e ~/.bash_profile ]; then
            source ~/.bash_profile
        fi
        if [ -e ~/.bashrc ]:then
            source ~/.bashrc
        fi
    fi
    if [ $SHELL = "*zsh*" ];then
        if [ -e ~/.profile ]; then
            source ~/.profile
        fi
        if [ -e ~/.zsh_profile ]; then
            source ~/.zsh_profile
        fi
        if [ -e ~/.zshrc ]:then
            source ~/.zshrc
        fi    
    fi
}
#
#   Getting system info
#
systype=$(uname -a);
mycp="cp -v"
case $systype in
    *Ubuntu*)
        system="Ubuntu"
        InsCmd="apt install"
        if [ "$(whoami)" != "root"   ]; then
            InsCmd="sudo "$InsCmd
            mycp="sudo cp"
        fi
        ;;
    *Microsoft*)
        system="Ubuntu"
        InsCmd="apt install"
        if [ "$(whoami)" != "root"   ]; then
             InsCmd="sudo "$InsCmd
             mycp="sudo cp"
        fi
        ;;
    *Darwin*)
        system="MacOS"
        if [ -x "$(command -v brew)"  ]; then
            InsCmd="brew install"
        else
            echo "Install Homebrew first (https://brew.sh/)"
            exit
        fi
        if [ "$(whoami)" != "root"   ]; then
             mycp="sudo cp"
         fi
        ;;
    *)
        echo "I don't know what OS this is, so I won't install anything."
        ;;
esac
#
#   General Announcements
#
echo "Settin up your $system environment"
#
#   Setting up bashrc
#
echo "Backing up old .bashrc and linking new"
if [ ! -L ~/.bashrc ];then
    mv ~/.bashrc ~/.bashrc.old
    ln -s ~/Home-Scripts/dot_files/bashrc ~/.bashrc
fi
make_it_live
#
#   Setting up zsh
#
if [ -x "$(command -v zsh)" ];then
    if [ ! -d ~/.oh-my-zsh ];then
        echo "Setting up oh-my-zsh"
        if [ -x "$(command -v curl)" ];then
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        elif [ -x "$(command -v wget)" ];then
            sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
        fi
        echo "oh-my-zsh set up"
    fi
    if [ ! -L ~/.zshrc ];then
        mv ~/.zshrc ~/.zshrc.bak
        ln -s ~/Home-Scripts/dot_files/zshrc ~/.zshrc
    fi
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
echo "Run 'Ctrl-B Shft-I' from withing tmux to enable plugins (or just restart your tmux session)"
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
if [ -f /usr/local/bin/gotop ]; then
    echo "gotop installed"
else
    echo "Installing gotop"
    eval "git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop"
    /tmp/gotop/scripts/download.sh
    $mycp gotop /usr/local/bin/gotop
    rm -rf /tmp/gotop gotop
fi
#
#   Installing ccat
#
if [[ -x "$(command -v ccat)" || -f /usr/local/bin/ccat ]]; then
    echo "ccat installed"
else
    echo "Installing ccat"
    case $system in
        MacOS)
            $InsCmd ccat
            ;;
        Ubuntu)
            $InsCmd -y golang-go
            go get -u github.com/jingweno/ccat
            $mycp ~/go/bin/ccat /usr/local/bin/ccat
            ;;
    esac
fi
#
#   Installing colortail
#
if [ -x "$(command -v colortail)"  ]; then
    echo "colortail installed"
else
    echo "Installing colortail"
    $InsCmd colortail
fi
#
#   Almost there
#
make_it_live
#
#   All done
#