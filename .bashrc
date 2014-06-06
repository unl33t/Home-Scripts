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
alias minecrap="ssh -L 8123:172.22.1.199:8123 minecrap@mc.ultimatefail.net"
alias moviefix="~/Home-Scripts/movie-scripts/movienamefix.pl"
alias check="~/Home-Scripts/check.sh"
alias sc="screen -dr"
alias mv="mv -v"

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

SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}
   
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
