alias emacs=/usr/local/Cellar/emacs/24.4/bin/emacs
alias emc="emacsclient -t -a \"\""
export EDITOR=emc

export ANDROID_HOME="/Applications/android-sdk"
export ANDROID_NDK_HOME="/Applications/android-ndk"
export MAVEN_HOME=/Users/guotianqi/bin/apache-maven-3.2.2
export PYTHON_HOME=/opt/local/Library/Frameworks/Python.framework/Versions/3.4
export PATH=$PYTHON_HOME/bin:$MAVEN_HOME/bin:$ANDROID_NDK_HOME:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:~/bin:$PATH

# color
export CLICOLOR=1
#export LSCOLORS=gxfxcxdxbxegedabagacad
#export PS1='\u@\h:\w\$ '
# export TERM=xterm-256color

# git
source ~/bin/git-completion.bash
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
source ~/bin/git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
# export PS1='\u@\h:\w$(__git_ps1 " (%s)")\$ '

# android source
function mountAndroid { 
    hdiutil attach /Volumes/ShareZone/android.dmg.sparseimage -mountpoint /Volumes/android; 
}

# unmount the android file image
function umountAndroid() { hdiutil detach /Volumes/android; }

ulimit -S -n 1024

export PATH=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home/bin:$PATH

export USE_CCACHE=1
export CCACHE_DIR=/Volumes/DevZone/Android/.ccache

# go
export GOPATH=$HOME/Go
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:/Applications/go_appengine

export PATH=/Volumes/DevZone/Android/git-repo:$PATH
