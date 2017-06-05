# .bashrc

PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/sw/bin:/Library/MySQL/bin:/usr/local/mysql-5.0.37-osx10.4-powerpc/bin/:/opt/local/bin:/opt/local/sbin:"

export PATH
export DISPLAY=:0.0

# User specific aliases and functions
#
# e-travel
#
alias starwars='telnet towel.blinkenlights.nl'
alias wtf='ssh wtfwasithinking.org'
#
# shortcuts
#
alias moviefix="~/Home-Scripts/movie-scripts/movienamefix.pl"
alias ping="mtr"
alias check="~/Home-Scripts/check.sh"
alias sc="screen -dr"
alias mv="mv -v"
alias sshtop=ssh-top
alias sizeme="sudo df -h /"
alias tree="tree -I @ea*"

# functions
ssh-top(){
    ssh $1 -t htop
}

#PS1='$PWD	#legacy prompt for the fun of it
#you are here ->'

PS1="\[\033[0;34m\][\[\033[0;31m\]\h\[\033[0;34m\]]\[\033[0;37m\]\[\033[0;34m\][\[\033[0;37m\]\[\033[0;1m\]\u\[\033[0;31m\]@\[\033[0;37m\]\w\[\033[0;34m\]]\[\033[0;37m\] \[\033[0;31m\]\[\033[0;1m\]: \[\033[0;0m\]"

export EDITOR=vi

if [ -f /opt/local/etc/bash_completion ]; then
        . /opt/local/etc/bash_completion
    fi
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

PERL_MB_OPT="--install_base \"/Users/g33k/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/g33k/perl5"; export PERL_MM_OPT;
