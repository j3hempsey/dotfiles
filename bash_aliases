# Aliases
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
