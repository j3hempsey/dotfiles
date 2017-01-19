#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# import aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH=/usr/local/opt/openssl/bin:$PATH:~/bin

#Activate a virtualenv
alias activate="source bin/activate"

### From: https://hackercodex.com/guide/python-development-environment-on-mac-osx/
gpip(){
	   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
#######

alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)
%C(bold blue)<%an>%Creset' --abbrev-commit --stat"


#PS1='[\u@\h \w]\$ '
COLOR1='\[\033[01;32;46m\]'
COLOR2='\[\033[00;30;46m\]'
COLOR3='\[\033[00;34;46m\]'
COLOR4='\[\033[00;34m\]'
COLOR5='\[\033[00;32m\]'
COLOR6='\[\033[01;37m\]'
COLOR7='\[\033[01;32m\]'
COLOR8='\[\033[00;37m\]'
PS1="$COLOR4$COLOR6 \t $COLOR2[\h \w]\n\
$COLOR5\u$COLOR8:$COLOR7$COLOR8\$ "
PS2="$COLOR1$GRAD1$COLOR3$GRAD2$COLOR4$GRAD1$COLOR5> "
