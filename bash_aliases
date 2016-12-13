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
