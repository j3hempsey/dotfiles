# vim: filetype=sh
_GUARD_BASH_PROFILE_=1
export GIT_ASKPASS=./.gitpass
export VISUAL=vim
export EDITOR="$VISUAL"
unset  SSH_ASKPASS

export GRADLE_HOME=/opt/gradle
export GROOVY_HOME=/opt/groovy
export CSCOPE_DB="./cscope.out"

if [[ "$_UNIX_TYPE" == "Linux" ]]; then
    # Linux specifics
    export PATH="${PATH}:~/bin/"
    # if which scl_source > /dev/null 2>&1; then
    #     source scl_source enable devtoolset-7
    # fi
    # export CSCOPE_DB=/root/mount/wtcp/cscope.out
	# Key repeat settings
	# exec --no-startup-id xset r rate 300 35 # Set initial delay 300ms, repeat 35ms
elif [[ "$_UNIX_TYPE" == "Darwin" ]]; then
    # Mac specifics
    export ANDROID_HOME=/opt/android
    export ANDROID_NDK=/opt/android-ndk
    export DYLD_FALLBACK_LIBRARY_PATH=${DYLD_FALLBACK_LIBRARY_PATH}:/usr/local/mysql/lib
    export BADU_NDK_VERSION=4.9
    export CASSANDRA_HOME="/opt/cassandra"
    export CQLSH_NO_BUNDLED=TRUE
    export PATH="${PATH}:/usr/local/mysql/bin:/opt/bin:/usr/local/maven/bin:/opt/cassandra/bin"
    export PATH="${PATH}:${GRADLE_HOME}/bin:${GROOVY_HOME}/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_NDK}"
    export PATH="${PATH}:${CASSANDRA_HOME}/bin:~/Library/Python/2.7/bin/"
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/"
    #ddgr browser setting 
    export BROWSER=w3m
    # Disable JS compression when compiling Admin
    export BADU_SKIP_JS=true

    ### From: https://hackercodex.com/guide/mac-osx-mavericks-10.9-configuration/
    # Set architecture flags
    export ARCHFLAGS="-arch x86_64"
    # Ensure user-installed binaries take precedence
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/bin/

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
            source $(brew --prefix)/etc/bash_completion
    fi
    #####

    # MacPorts Installer addition on 2016-07-21_at_16:37:38: adding an appropriate PATH variable for use with MacPorts.
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    # Finished adapting your PATH environment variable for use with MacPorts.
    ### Mac show hidden files aliases ###
    alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;' 
    alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO;'
    ### END ###
    # run date script
    ~/workspace/proxy_scripts/set_date.sh
fi
[[ -f "${HOME}/dotfiles/tmux/tmux_scripts" ]] && source "${HOME}/dotfiles/tmux/tmux_scripts"

export PATH="${PATH}:/usr/local/opt/openssl/bin:${HOME}/bin:${HOME}/dotfiles/bin"
export PATH="${PATH}:${HOME}/.git-radar"
export PATH="${PATH}:$HOME/go/bin/:$HOME/.cargo/bin"
export PATH="${PATH}:${HOME}/.local/bin/"

# Always last - allow entry from .bashrc or .bash_profile 
if [[ -f "${HOME}/.bashrc" ]]; then
    source "${HOME}/.bashrc"
fi
