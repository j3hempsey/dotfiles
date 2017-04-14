function contssh() 
{
	while :; do sleep 1; ssh $1; done
}

function workflow()
{
	source workspace.sh $1
}

function badussh()
{
	ssh -o "StrictHostKeyChecking no" -i ~/.ssh/badu_we_id_rsa root@"$1"
}

alias  baduscp='scp -i ~/.ssh/badu_we_id_rsa'

function flushdns()
{
	sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
	sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
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
    curl -s wttr.in/$(echo "$1" | sed 's/ /%20/g')
}

### From: https://hackercodex.com/guide/python-development-environment-on-mac-osx/
gpip(){
	   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
alias newport_weather="weather \"Newport Beach\""
alias irvine_weather="weather \"Irvine\""

alias find_file="find . -type f | grep $1"
alias find_in_file="find . -type f | xargs grep $1"
alias update_vim="vim +PluginInstall +qall"
alias ls="ls -G"
alias licmerge="pushd ~/workspace/support; git pull; git checkout master; git merge origin/development; git push"
alias grep="grep --color=auto"
#Activate a virtualenv
alias activate="source bin/activate"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)
%C(bold blue)<%an>%Creset' --abbrev-commit --stat"
alias pxssh="ssh -o ProxyCommand='nc -x localhost:1080 %h %p'"

