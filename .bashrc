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
alias size=" du -h -d 1; df -h ."
alias vi="vim"

# functions
ssh-top(){
    ssh $1 -t htop
}

#PS1='$PWD	#legacy prompt for the fun of it
#you are here ->'

#PS1="\[\033[0;34m\][\[\033[0;31m\]\h\[\033[0;34m\]]\[\033[0;37m\]\[\033[0;34m\][\[\033[0;37m\]\[\033[0;1m\]\u\[\033[0;31m\]@\[\033[0;37m\]\w\[\033[0;34m\]]\[\033[0;37m\] \[\033[0;31m\]\[\033[0;1m\]: \[\033[0;0m\]"

#export PS1="\[\033[38;5;27m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\A\[$(tput sgr0)\]\[\033[38;5;27m\]][\[$(tput sgr0)\]\[\033[38;5;1m\]\h\[$(tput sgr0)\]\[\033[38;5;27m\]][\[$(tput sgr0)\]\[\033[38;5;2m\]\u\[$(tput sgr0)\]\[\033[38;5;27m\]][\[$(tput sgr0)\]\[\033[38;5;15m\]\w\[$(tput sgr0)\]\[\033[38;5;27m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;2m\]->\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
else
    PS1='┌──[\u@\h]─[\w]\n└──╼ \$ '
fi


export EDITOR=vi

if [ -f /opt/local/etc/bash_completion ]; then
        . /opt/local/etc/bash_completion
    fi
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

if [ -f /usr/bin/colortail ]; then
    alias tail="colortail"
fi

PERL_MB_OPT="--install_base \"/Users/g33k/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/g33k/perl5"; export PERL_MM_OPT;
