#
# ~/.bashrc
# vim: filetype=sh
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=2000
HISTTIMEFORMAT='%FT%T '
# Ignore rm -rf
HISTIGNORE="rm -rf \*"

if [[ "$_UNIX_TYPE" = "" ]]; then
    export _UNIX_TYPE=$(uname)
fi

# import aliases
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

if [[ -f ~/.bash_profile && "$_GUARD_BASH_PROFILE_" -ne 1 ]]; then
    . ~/.bash_profile
fi

# (cat ~/.cache/wal/sequences &)
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

declare -A ps1colors

#PS1='[\u@\h \w]\$ '
ps1colors[COLOR1]='\[\033[01;32;46m\]'
ps1colors[COLOR2]='\[\033[00;30;46m\]'
ps1colors[COLOR3]='\[\033[00;34;46m\]'
ps1colors[COLOR4]='\[\033[00;34m\]'
ps1colors[COLOR5]='\[\033[00;32m\]'
ps1colors[COLOR6]='\[\033[01;37m\]'
ps1colors[COLOR7]='\[\033[01;32m\]'
ps1colors[COLOR8]='\[\033[00;37m\]'
ps1colors[txtblk]='\[\e[0;30m\]' # Black - Regular
ps1colors[txtred]='\[\e[0;31m\]' # Red
ps1colors[txtgrn]='\[\e[0;32m\]' # Green
ps1colors[txtylw]='\[\e[0;33m\]' # Yellow
ps1colors[txtblu]='\[\e[0;34m\]' # Blue
ps1colors[txtpur]='\[\e[0;35m\]' # Purple
ps1colors[txtcyn]='\[\e[0;36m\]' # Cyan
ps1colors[txtwht]='\[\e[0;37m\]' # White
ps1colors[bldblk]='\[\e[1;30m\]' # Black - Bold
ps1colors[bldred]='\[\e[1;31m\]' # Red
ps1colors[bldgrn]='\[\e[1;32m\]' # Green
ps1colors[bldylw]='\[\e[1;33m\]' # Yellow
ps1colors[bldblu]='\[\e[1;34m\]' # Blue
ps1colors[bldpur]='\[\e[1;35m\]' # Purple
ps1colors[bldcyn]='\[\e[1;36m\]' # Cyan
ps1colors[bldwht]='\[\e[1;37m\]' # White
ps1colors[unkblk]='\[\e[4;30m\]' # Black - Underline
ps1colors[undred]='\[\e[4;31m\]' # Red
ps1colors[undgrn]='\[\e[4;32m\]' # Green
ps1colors[undylw]='\[\e[4;33m\]' # Yellow
ps1colors[undblu]='\[\e[4;34m\]' # Blue
ps1colors[undpur]='\[\e[4;35m\]' # Purple
ps1colors[undcyn]='\[\e[4;36m\]' # Cyan
ps1colors[undwht]='\[\e[4;37m\]' # White
ps1colors[bakblk]='\[\e[40m\]'   # Black - Background
ps1colors[bakred]='\[\e[41m\]'   # Red
ps1colors[bakgrn]='\[\e[42m\]'   # Green
ps1colors[bakylw]='\[\e[43m\]'   # Yellow
ps1colors[bakblu]='\[\e[44m\]'   # Blue
ps1colors[bakpur]='\[\e[45m\]'   # Purple
ps1colors[bakcyn]='\[\e[46m\]'   # Cyan
ps1colors[bakwht]='\[\e[47m\]'   # White

txtrst='\[\e[0m\]'    # Text Reset
# hostname color
# colors Evan find easily readable
colors=(
	29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45  46  47  48
	49  50  51  62  63  64  65  66  67  68  69  70  71  72  73  74  75  76  77  78
	79  80  81  82  83  84  85  86  87  99 105 106 107 108 109 110 111 112 113 114
	115 116 117 118 119 120 121 122 123 129 130 131 132 133 134 135 136 137 138 139
	140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
	165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184
	185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204
	205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224
	225 226 227 228 229 230 231
)
hncol=${HOSTNAME//[^[:alnum:]]}
hncol=${hncol,,}
hncol=$((36#$hncol ** 2 % ${#colors[@]}))
hncol=$(tput setaf "${colors[hncol]}")

PS1="${ps1colors[bldwht]}\t $hncol[\h] ${ps1colors[txtylw]}\w$txtrst\$(git-radar --bash --fetch)\n"
# Second line
if [[ "$(id -u)" -eq 0 ]]; then
	# Change root's username color
    PS1="$PS1${ps1colors[txtred]}\u"
else
    PS1="$PS1${ps1colors[txtgrn]}\u"
fi
PS1="$PS1${ps1colors[txtwht]}:\$${ps1colors[txtwht]}\[\e[m\] "
# END Second line
PS2="${ps1colors[txtgrn]}>${ps1colors[txtwht]} "
