export GIT_ASKPASS=./.gitpass
export EDITOR="vim"
unset  SSH_ASKPASS

if [[ "$(uname)" == "Linux" ]]; then
    # Linux specifics
    export PATH="$PATH:~/bin/"
    export PATH="$PATH:/usr/bin/gradle-2.7/bin"
elif [[ "$(uname)" == "Darwin" ]]; then
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

    ### From: https://hackercodex.com/guide/mac-osx-mavericks-10.9-configuration/
    # Set architecture flags
    export ARCHFLAGS="-arch x86_64"
    # Ensure user-installed binaries take precedence
    export PATH=/usr/local/bin:$PATH:~/bin/
    # Load .bashrc if it exists
    test -f ~/.bashrc && source ~/.bashrc

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
fi
export GRADLE_HOME=/opt/gradle
export GROOVY_HOME=/opt/groovy

[[ -r ~/.bashrc ]] &&  source ~/.bashrc

