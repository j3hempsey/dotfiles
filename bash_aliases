# vim: filetype=sh
# Aliases for all OSes
contssh()
{
	while :; do sleep 1; ssh "$1"; done
}

workflow()
{
	source workspace.sh "$1"
}

badussh()
{
	ssh -o "StrictHostKeyChecking no" -xYi ~/.ssh/badu_we_id_rsa root@"$1"
}

baduscp()
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
find_file()
{
    find . -type f | grep "$1"
}

find_in_file()
{
    #find . -type f | xargs grep -n --color "$1"
    find . -type f -not \( -path ./.git -prune \) -exec grep -Iq . {} \; -and -print | xargs grep -n --color "$@"
    # Don't include binary files
    #find . -type f -not \( -path ./.git -prune \) -exec grep -Iq . {} \; -and -print | xargs grep -n --color "$1";
    #find . -type f | xargs grep -n --color "$1"
}

jview()
{
    jira view GBXOS-"$1"
}

macformat()
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

gtp_wireshark_filter()
{
	if [ "$1" = "teid" ]; then
		teid=$2
		teidmacformat=$(macformat $teid)
		printf '((s1ap.gTP_TEID == %s) or (gtp.teid == 0x%08x))\n' $teidmacformat $((0x$teid))
    else
        echo "ERROR: invalid op. [teid <id>]"
	fi
}

cheat() {
    curl cht.sh/$1
}

regen_cscope() {
	find . \
		-path "tmp*" -prune -o                                      \
		-path "documentation*" -prune -o							\
		-path "*/usr/include/linux" -prune -o                       \
		-path lib/modules -prune -o                                 \
		-path "*/.pkg" -prune -o                                    \
		-name "*.[chxss]"											\
		-o -name "*.cpp"											\
		-o -name "*.cc"												\
		-o -name "*.go"										        \
		> cscope.files
		# The -b flag tells Cscope to just build the database, and not launch the Cscope GUI.
		# The -q causes an additional, 'inverted index' file to be created, which makes
		# searches run much faster for large databases. Finally, -k sets Cscope's 'kernel' mode
		# it will not look in /usr/include for any header files that are #included in your source files
		# JH: -q seems to cause some issues when using vim to jump to symbol
		if cscope -b -k; then
			echo "Created cscope db"
		else
			echo "Failed to create cscope db"
		fi
}

regen_go_cscope() {
	find . \
		-path "tmp*" -prune -o                                      \
		-path "documentation*" -prune -o							\
		-path "*/usr/include/linux" -prune -o                       \
		-path lib/modules -prune -o                                 \
		-path "*/.pkg" -prune                                       \
		-o -name "*.go"										        \
		> cscope.files
		# The -b flag tells Cscope to just build the database, and not launch the Cscope GUI.
		# The -q causes an additional, 'inverted index' file to be created, which makes
		# searches run much faster for large databases. Finally, -k sets Cscope's 'kernel' mode
		# it will not look in /usr/include for any header files that are #included in your source files
		# JH: -q seems to cause some issues when using vim to jump to symbol
		if cscope -b -k; then
			echo "Created cscope db"
		else
			echo "Failed to create cscope db"
		fi
}

regen_cscope_devvm() {
   KERNEL_DIR="Kernel"
   find /root/mount/wtcp/ -path */Framework-CRunnable -prune -o   \
      -path "*/$KERNEL_DIR/centos*" -prune -o                     \
      -path "tmp*" -prune -o                                      \
	   -path "*/$KERNEL_DIR/Documentation*" -prune -o              \
      -path "*/$KERNEL_DIR/scripts*" -prune -o                    \
	   -path "*/$KERNEL_DIR/drivers*" -prune -o                    \
      -path "*/usr/include/linux" -prune -o                       \
      -path lib/modules -prune -o                                 \
      -path "*/.pkg" -prune -o                                    \
      -name "*.[chxsS]" -o -name "*.cpp" -o -name "*.cc"          \
      > /root/mount/wtcp/cscope.files
   pushd /root/mount/wtcp/
   # The -b flag tells Cscope to just build the database, and not launch the Cscope GUI.
   # The -q causes an additional, 'inverted index' file to be created, which makes
   # searches run much faster for large databases. Finally, -k sets Cscope's 'kernel' mode
   # it will not look in /usr/include for any header files that are #included in your source files
   # JH: -q seems to cause some issues when using vim to jump to symbol
   cscope -b -k
   export CSCOPE_DB=/root/mount/wtcp/cscope.out;
   popd
}

ix ()
{
    curl -F 'f:1=<-' http://ix.io
}

twoscomplement()
{
	echo $((-((~$1 + 1) & 0xffff)))
}

set-date-ssh()
{
	ssh $1 sudo date -Isec -s "$(date -Isec)"
}

alias vi="vim"
alias vimwiki="vim -c VimwikiIndex"
alias update_vim="vim +PluginInstall +qall"
alias less="less -r" # support coloring
alias grep="grep -n --color=auto"
#Activate a virtualenv
alias activate="source bin/activate"
alias pxssh="ssh -o ProxyCommand='nc -x localhost:1080 %h %p'"
alias pxscp="scp -o ProxyCommand='nc -x localhost:1080 %h %p'"
alias dmake="make CC=\"distcc x86_64-redhat-linux-gcc\" CXX=\"distcc x86_64-redhat-linux-g++\""
alias dcmake="make CC=\"ccache distcc x86_64-redhat-linux-gcc\" CXX=\"ccache distcc x86_64-redhat-linux-g++\""
alias poky="cd ~/workspace/gbxv2/ && TEMPLATECONT=./meta-gbxv2/conf/ source poky/oe-init-build-env"
# Git aliases
alias glogoneline="git log --oneline --no-merges"
alias glog1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)'"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --stat"
alias gsize="git rev-list --objects --all \
| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
| sed -n 's/^blob //p' \
| sort --numeric-sort --key=2 \
| cut -c 1-12,41- \
| $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest"
alias ip="ip -color=auto"

glogbranchonly()
{
   if [[ -z "$1" || "$1" == "" ]]; then
       echo "ERROR: Must supply branch name."
       return
   fi
   glog $1 --not $(git for-each-ref --format='%(refname)' refs/heads/ | grep -v "refs/heads/$1")
}
ttyusb()
{
    cu -s 115200 -l "/dev/ttyUSB$1"
}
#alias ack="ack --pager=\"less -r\""
# OS specific
if [[ "$_UNIX_TYPE" == "Linux" ]]; then
    # Linux specifics
    alias grep="grep --color=auto"
    alias gcc11="scl enable devtoolset-2 bash"
    alias ls="ls -G --color"
elif [[ "$_UNIX_TYPE" == "Darwin" ]]; then
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
    flushdns()
    {
        sudo killall -HUP mDNSResponder
    #    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    #	sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    }

    run_on_mgrnodes()
    {
        if [[ -z "$1" ]]; then
            echo "ERROR: Must supply a command to run."
        else
            for i in 1 2 3; do
                ssh mgrnode$i "$1"
            done
        fi
    }

    weather()
    {
        curl -s "wttr.in/${1/ /%20}"
    }
    eval $(thefuck --alias)
    alias ping="prettyping"
    alias cat="bat"
    alias diff="diff-so-fancy"
    alias devvm="bash -x $HOME/workspace/proxy_scripts/set_date.sh && ssh devvm"
    alias vmdates="$HOME/workspace/proxy_scripts/set_date.sh vmclient; $HOME/workspace/proxy_scripts/set_date.sh vmproxy; $HOME/workspace/proxy_scripts/set_date.sh vmserver"
    alias unmount_unlocker="sudo diskutil unmount /Volumes/UNLOCKER"
fi

