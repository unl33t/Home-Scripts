# .bashrc

PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/sw/bin:/Library/MySQL/bin:/usr/local/mysql-5.0.37-osx10.4-powerpc/bin/:/opt/local/bin:/opt/local/sbin:"

export PATH
export DISPLAY=:0.0

# User specific aliases and functions
#
# e-travel
#
alias starwars='telnet towel.blinkenlights.nl'
#
# shortcuts
#
alias bobb="ssh -L 8123:172.22.1.199:8123 game.minecrap.net"
alias minecrap="ssh -L 8123:172.22.1.199:8123 minecrap@game.minecrap.net"
alias moviefix="~/Home-Scripts/movie-scripts/movienamefix.pl"
alias check="~/Home-Scripts/check.sh"
alias sc="screen -dr"
alias mc-map="overviewer.py --conf="/home/g33k/Home-Scripts/minecraft/minecraft-overviewer-config.py""

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
