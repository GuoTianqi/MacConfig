# Path to your oh-my-zsh installation.
export ZSH=/Users/guotianqi/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell_fix"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump brew brew-cask adb gradle vagrant go golang wd composer emacs man pod)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# MyConfig
export LC_ALL=zh_CN.UTF-8

alias emacs=/usr/local/Cellar/emacs/24.4/bin/emacs
alias emc="emacsclient -t -a \"\""
export EDITOR='emacs -nw'

export ANDROID_HOME="/Applications/android-sdk"
export ANDROID_NDK_HOME="/Applications/android-ndk"
export ANDROID_SYSTRACE=$ANDROID_HOME/platform-tools/systrace
export MAVEN_HOME=/Users/guotianqi/bin/apache-maven-3.2.2
export PYTHON_HOME=/opt/local/Library/Frameworks/Python.framework/Versions/3.4
export PATH=$PYTHON_HOME/bin:$MAVEN_HOME/bin:$ANDROID_NDK_HOME:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_SYSTRACE:~/bin:$PATH

# color
# export CLICOLOR=1
# export LSCOLORS=gxfxcxdxbxegedabagacad
# export PS1='\u@\h:\w\$ '
# export TERM=xterm-256color

# git
# source ~/bin/git-completion.bash
# export GIT_PS1_SHOWDIRTYSTATE=1
# export GIT_PS1_SHOWCOLORHINTS=1
# source ~/bin/git-prompt.sh
# precmd () { __git_ps1 "%n" ":%~$ " "|%s" }
# PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
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

### go
export GOPATH=$HOME/Go
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin

### PHP
export PATH=~/.composer/vendor/bin:$PATH
