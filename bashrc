
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
# Ignore rm -rf 
HISTIGNORE="rm -rf \*"

if [[ "$_UNIX_TYPE" = "" ]]; then 
    export _UNIX_TYPE=$(uname)
fi

# import aliases
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi
# if [[ -f ~/.bash_profile ]]; then
#     . ~/.bash_profile
# fi
if [[ -f ~/.bash_profile && "$_UNIX_TYPE" == "Darwin"  && -z "$_GUARD_BASH_PROFILE_" ]]; then
    . ~/.bash_profile
fi

export PATH=$PATH:/usr/local/opt/openssl/bin:~/bin
export PATH=$PATH:$HOME/.git-radar

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

#PS1='[\u@\h \w]\$ '
COLOR1='\[\033[01;32;46m\]'
COLOR2='\[\033[00;30;46m\]'
COLOR3='\[\033[00;34;46m\]'
COLOR4='\[\033[00;34m\]'
COLOR5='\[\033[00;32m\]'
COLOR6='\[\033[01;37m\]'
COLOR7='\[\033[01;32m\]'
COLOR8='\[\033[00;37m\]'

txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
bakgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset
#if [[ "$_UNIX_TYPE" == "Linux" ]]; then
## Linux specifics
#PS1="$bldwht\t $undylw[\h \w]$txtrst\n\
#$txtgrn\u$txtwht:\$$txtrst "
#PS2="$txtgrn>$txtrst "
#elif [[ "$_UNIX_TYPE" == "Darwin" ]]; then

PS1="$bldwht\t $undylw[\h \w]$txtrst\$(git-radar --bash --fetch)\n"
if [[ "$(id -u)" -eq 0 ]]; then
    PS1="$PS1$txtred\u$txtwht:\$$txtwht\[\e[m\] "
else
    PS1="$PS1$txtgrn\u$txtwht:\$$txtwht\[\e[m\] "
fi
PS2="$txtgrn>$txtwht "
#fi
#OLD
#echo -e "$COLOR1 Color1 $COLOR2 Color2 $COLOR3 Color3 $COLOR4 Color4"
#echo -e "$COLOR5 Color5 $COLOR6 Color6 $COLOR7 Color7 $COLOR8 Color8"
#PS1="$COLOR4$COLOR6 \t $COLOR2[\h \w]$txtrst\$(git-radar --bash --fetch)\n\
#$COLOR5\u$COLOR8:$COLOR7$COLOR8\$ "
#PS2="$COLOR1$GRAD1$COLOR3$GRAD2$COLOR4$GRAD1$COLOR5> "
