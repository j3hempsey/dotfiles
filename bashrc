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


PS1='[\u@\h \w]\$ '
