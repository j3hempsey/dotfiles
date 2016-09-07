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

export PATH=$PATH:~/bin

### From: https://hackercodex.com/guide/python-development-environment-on-mac-osx/
gpip(){
	PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
#######


PS1='[\u@\h \w]\$ '
