# Aliases for all OSes
function contssh() 
{
	while :; do sleep 1; ssh "$1"; done
}

function workflow()
{
	source workspace.sh "$1"
}

function badussh()
{
	ssh -o "StrictHostKeyChecking no" -xYi ~/.ssh/badu_we_id_rsa root@"$1"
}

function baduscp()
{
    scp -o "StrictHostKeyChecking no" -i ~/.ssh/badu_we_id_rsa "$@"
}

gpip(){
### From: https://hackercodex.com/guide/python-development-environment-on-mac-osx/
    PIP_REQUIRE_VIRTUALENV="" pip2.7 "$@"
}

gpip3(){
### From: https://hackercodex.com/guide/python-development-environment-on-mac-osx/
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}
function find_file()
{
    find . -type f | grep "$1"
}
function find_in_file() 
{
    find . -type f | xargs grep -n --color -- "$1"
}

function jview()
{
    jira view WTCP-"$1"
}

function macformat()
{
	local teid=$1
	result=""
	count=0
	while [ $count -lt 4 ];
	do
		t=$(printf "%02x" $((0x$teid & 0xff)))
		teid=$(printf "%08x" $((0x$teid >> 8)))
		if [ $count -eq 0 ]; then
		result="$t"
		else
		result="$t:$result"
		fi
		count=$(($count + 1))
	done
	echo "$result"
}

function gtp_wireshark_filter()
{
	if [ "$1" = "teid" ]; then
		teid=$2
		teidmacformat=$(macformat $teid)
		printf '((s1ap.gTP_TEID == %s) or (gtp.teid == 0x%08x))\n' $teidmacformat $((0x$teid))
    else 
        echo "ERROR: invalid op. [teid <id>]"
	fi
}

function cheat() {
    curl cht.sh/$1
}

function gtp_wireshark_filter()
{
	if [ "$1" = "teid" ]; then
		teid=$2
		teidmacformat=$(macformat $teid)
		printf '((s1ap.gTP_TEID == %s) or (gtp.teid == 0x%08x))\n' $teidmacformat $((0x$teid))
    else 
        echo "ERROR: invalid op. [teid <id>]"
	fi
}

alias update_vim="vim +PluginInstall +qall"
alias less="less -r" # support coloring
alias grep="grep -n --color=auto"
#Activate a virtualenv
alias activate="source bin/activate"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)
%C(bold blue)<%an>%Creset' --abbrev-commit --stat"
alias glogoneline="git log --oneline --no-merges"
alias glog1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)'"
alias pxssh="ssh -o ProxyCommand='nc -x localhost:1080 %h %p'"
alias pxscp="scp -o ProxyCommand='nc -x localhost:1080 %h %p'"
alias regen_cscope="find /root/mount/wtcp/ -name \"*.c\" -o -name \"*.h\" -o -name \"*.cpp\" -o -name \"*.cc\" > /root/mount/wtcp/cscope.files && pushd /root/mount/wtcp/; cscope -b; export CSCOPE_DB=/roout/mount/wtcp/cscope.out; popd;"
alias vi=vim
alias unmount_unlocker="sudo diskutil unmount /Volumes/UNLOCKER"
# OS specific
if [[ "$(uname)" == "Linux" ]]; then
    # Linux specifics
    alias grep="grep --color=auto"
    alias gcc11="scl enable devtoolset-2 bash"
    alias ls="ls -G --color"
elif [[ "$(uname)" == "Darwin" ]]; then
    # Mac specifics
    alias killcassandra="kill -9 $(ps aux  | grep cassandra | grep java | awk '{ print $2 }'); sleep 1; ps aux | grep cassandra"
    ### Mac show hidden files aliases ###
    alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;' 
    alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO;'
    ### END ###
    alias newport_weather="weather \"Newport Beach\""
    alias irvine_weather="weather \"Irvine\""
    alias ls="ls -G"

    alias licmerge="pushd ~/workspace/support; git pull; git checkout master; git merge origin/development; git push"
    function flushdns()
    {
        sudo killall -HUP mDNSResponder
    #    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    #	sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    }

    function run_on_mgrnodes()
    {
        if [[ -z "$1" ]]; then 
            echo "ERROR: Must supply a command to run."
        else
            for i in 1 2 3; do 
                ssh mgrnode$i "$1"
            done
        fi
    }

    function weather()
    {
        curl -s "wttr.in/${1/ /%20}"
    }
    eval $(thefuck --alias)
    alias ping="prettyping"
    alias cat="bat"
    alias diff="diff-so-fancy"
    alias devvm="bash -x $HOME/workspace/proxy_scripts/set_date.sh && ssh devvm"
fi

