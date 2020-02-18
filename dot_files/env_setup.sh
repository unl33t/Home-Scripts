#!/bin/bash
#
#   Functions
#
function need_sudo(){
    if [ "$(whoami)" != "root"   ]; then
        InsCmd="sudo "$InsCmd
        mycp="sudo cp"
    fi
}

function install_it(){
    if [ -x "$(command -v $1)"  ]; then
    echo "$1 installed"
else
    echo "Installing $1"
    $InsCmd $1
fi
}
function make_it_live(){    # re-source the .xrc files as needed
    echo "Refreshing Environment"
    if [ $SHELL = "*bash*" ];then
        if [ -e ~/.bashrc ];then
            source ~/.bashrc
        fi
    fi
    if [ $SHELL = "*zsh*" ];then
        if [ -e ~/.zshrc ];then
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
        InsCmd="apt install -y"
        need_sudo
        ;;
    *Microsoft*)
        system="Ubuntu"
        InsCmd="apt install -y"
        need_sudo
        ;;
    *microsoft*)
        system="Ubuntu"
        InsCmd="apt install -y"
        need_sudo
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
    make_it_live
fi
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
        make_it_live
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
    echo "Updating Tmux Plugin Manager"
    cd ~/.tmux/plugins/tpm
    git pull
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
echo "Run 'Ctrl-B Shft-I' from withing tmux to enable plugins (or just restart your tmux session)"
#
#   Setting up vimrc
#
if [ -f ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc.old
fi
if [ -d ~/.vim_runtime ]
then
    echo "Updating Awesome VIMrc"
    cd ~/.vim_runtime
    git pull
else
    echo "Setting up awesome vimrc"
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
fi
sh ~/.vim_runtime/install_awesome_vimrc.sh
#
#   Grab gotop (because it's darn pretty)
#
if [[ $(find /usr/local/bin/gotop -mtime -30 -print) ]]; then
    echo "gotop is current $(gotop --version)"
else
    echo "Updating gotop"
    echo "Current:  $(gotop --version)"
    eval "git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop"
    /tmp/gotop/scripts/download.sh
    $mycp gotop /usr/local/bin/gotop
    rm -rf /tmp/gotop gotop
    echo "New:      $(gotop --version)"
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
#   Installing additional apps
#
install_it "colortail"
install_it "htop"
install_it "tree"
install_it "cowsay"
install_it "fortune"
install_it "fortune-mod fortunes-bofh-excuses fortunes-it fortunes-it-off fortunes-min fortunes-min fortunes-off"
#
#   Almost there
#
make_it_live
#
#   All done
#
