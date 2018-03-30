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
	ssh -o "StrictHostKeyChecking no" -i ~/.ssh/badu_we_id_rsa root@"$1"
}

function baduscp()
{
    scp -o "StrictHostKeyChecking no" -i ~/.ssh/badu_we_id_rsa "$@"
}

### From: https://hackercodex.com/guide/python-development-environment-on-mac-osx/
gpip(){
	   PIP_REQUIRE_VIRTUALENV="" pip2.7 "$@"
}

function find_file()
{
    "find . -type f | grep $1"
}
function find_in_file() 
{
    "find . -type f | xargs grep $1"
}
alias update_vim="vim +PluginInstall +qall"
alias ls="ls -G --color"
alias less="less -r" # support coloring
alias grep="grep --color=auto"
#Activate a virtualenv
alias activate="source bin/activate"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)
%C(bold blue)<%an>%Creset' --abbrev-commit --stat"
alias glogoneline="git log --oneline --no-merges"
alias glog1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)'"
alias pxssh="ssh -o ProxyCommand='nc -x localhost:1080 %h %p'"
alias pxscp="scp -o ProxyCommand='nc -x localhost:1080 %h %p'"

# OS specific
if [[ "$(uname)" == "Linux" ]]; then
    # Linux specifics
    alias grep="grep --color=auto"
    alias gcc11="scl enable devtoolset-2 bash"
elif [[ "$(uname)" == "Darwin" ]]; then
    # Mac specifics
    alias killcassandra="kill -9 $(ps aux  | grep cassandra | grep java | awk '{ print $2 }'); sleep 1; ps aux | grep cassandra"
    ### Mac show hidden files aliases ###
    alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;' 
    alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO;'
    ### END ###
    alias newport_weather="weather \"Newport Beach\""
    alias irvine_weather="weather \"Irvine\""

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
fi

