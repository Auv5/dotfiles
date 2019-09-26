## First up, automatically generated stuff.
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
setopt notify
unsetopt appendhistory autocd beep extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/jack/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Customize the prompt
PROMPT='[%n@%m %~%b] %# '

## Color aliases
alias ls="ls -lG ";

fd() {
    find . -name "*$1*";
}

## Utility aliases
alias proxy="ssh -D 1337 jackmc@ccss.carleton.ca -p 222"
alias vim="nvim"

p() {
    cd "$HOME/sources/$1"
}

## Tmux
# Makes sure that tmux supports 256 colors
if [ -z "$TMUX" ]; then export TERM='screen-256color'; fi
# Emacs within tmux session is command line only
if [ "$TMUX" ]; then alias emacs='emacs -nw'; fi 

export EDITOR='vim'

## PATH
# Conditionally add things to the path if they exist

# Gems, for Ruby
if command -v ruby > /dev/null 2>&1; then
    gempath="$(ruby -rubygems -e "puts Gem.user_dir")/bin"

    if [ -d "$gempath" ]; then
        export PATH="$PATH:$gempath"
    fi
fi


if command -v brew > /dev/null 2>&1; then
    export PATH="/usr/local/sbin:$PATH"
fi

go_mac_path="/usr/local/opt/go/libexec/bin"
if [ -d "$go_mac_path" ]; then
    export PATH="$PATH:$go_mac_path"
fi

adb_mac_path="$HOME/Library/Android/sdk"
if [ -d "$adb_mac_path" ]; then
    export PATH="$PATH:$adb_mac_path/platform:$adb_mac_path/platform-tools"
    export PATH="$PATH:$adb_mac_path/platform:$adb_mac_path/tools"
fi

# Android platform tools.
android_path="/opt/android-studio/sdk/platform-tools"
if [ -d "$android_path" ]; then
    export PATH="$PATH:$android_path"
fi

# Pkgfile, not necessarily PATH but close enough.
# This gives suggetions as to which packages to install if a command
# is missing.
pkgfile_script="/usr/share/doc/pkgfile/command-not-found.zsh"
if [ -e "$pkgfile_script" ]; then
    source $pkgfile_script
fi

# KDE commands (makes KDE5 work)
kde5_path="/opt/kf5/bin"
if [ -d $kde5_path ]; then
    export PATH="$PATH:$kde5_path"
fi

# RVM (Ruby Version Management)
rvm_path="$HOME/.rvm/bin"
if [ -d "$rvm_path" ]; then
    export PATH="$PATH:$rvm_path"
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
fi

# Cabal - Haskell packages
cabal_bin="$HOME/.cabal/bin"
if [ -d "$cabal_bin" ]; then
    export PATH="$PATH:$cabal_bin"
fi

# /usr/local/sbin - this doesn't go on the PATH by default in OS X
usr_local_sbin="/usr/local/sbin"
if [ -d "$usr_local_sbin" ]; then
    export PATH="$PATH:$usr_local_sbin"
fi

# Generic ~/bin directory, for user-specific binaries.
user_bin="$HOME/bin"
if [ -d $user_bin ]; then
    export PATH="$user_bin:$PATH"
fi

# BasicTex
tex_location="/usr/local/texlive/2015basic/bin"
if [ -d "$tex_location" ]; then
    export PATH="$tex_location:$PATH"
fi

## Aliases
# Conditional, so if it doesn't exist then we don't addd it
# (Otherwise Git wouldn't work on machines w/o hub)
# Hub is a wrapper around Git for GitHub.
if command -v hub > /dev/null 2>&1; then
    alias git=hub
fi

usr_local_lib="/usr/local/lib"
if [ -d $usr_local_lib ]; then
    export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
fi

# An alias so that GitHub and the school servers are updated when I push my schoolwork
alias school_push="git push origin master:master; git push github origin master:master"

# For Android builds, cache.
export USE_CCACHE=1

export PYTHONPATH="$PYTHONPATH:$HOME/sources"

if command -v docker-machine > /dev/null 2>&1; then
    eval "$(docker-machine env default)" > /dev/null 2>&1
fi

if command -v docker > /dev/null 2>&1; then
    stopdocker() {
        echo "Stopping containers matching $1..."
        count=$(docker stop $(docker ps -a | egrep "$1" | tr -s ' ' | cut -f1 -d ' ') | wc -l)
        echo "Stopped $count containers"
    }
    rmdocker() {
        echo "Removing containers matching $1..."
        count=$(docker rm $(docker ps -a | egrep "$1" | tr -s ' ' | cut -f1 -d ' ') | wc -l)
        echo "Removed $count containers"
    }
    clsdocker() {
        stopdocker "$1"
        rmdocker "$1"
    }
fi

if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh/site-functions/ /usr/local/share/zsh-completions $fpath)
fi

if [ -e ~/virtualenvs ]; then
    venv() { 
        if [ $# -ne 1 ]; then
            echo "Please give one argument, the name of the virtualenv to source." > /dev/stderr
        else
            echo "Sourcing $1..."
            source "$HOME/virtualenvs/$1/bin/activate"
        fi
    }
    mkvenv() {
        if [ $# -eq 1 ] || [ $# -eq 2 ]; then
            pushd ~/virtualenvs
            python=$2
            if [ ! $python ]; then
                python=python2
            fi
            virtualenv -p $python $1
            venv $1
            popd
        else
            echo "Please give either 1 or 2 arguments, in the form mkvenv <name> <python to use>" > /dev/stderr
        fi
    }
    mkvenv3() {
        mkvenv $1 python3
    }
fi

export NVM_DIR="/Users/jackmc/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# Virtualenvmanager
VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
venv_managerpath="/usr/local/bin/virtualenvwrapper.sh"
[ -e $venv_managerpath ] && source $venv_managerpath

export EJSON_KEYDIR="$HOME/Keys/ejson"
fpath=(/usr/local/share/zsh-completions $fpath)

PATH="/Users/jackmccracken/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/jackmccracken/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/jackmccracken/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/jackmccracken/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jackmccracken/perl5"; export PERL_MM_OPT;

alias rubo="bundle exec rubocop -a "

export GOPATH=$HOME

export PATH=$PATH:$HOME/bin

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/src/google.com/depot_tools"
if command -v dev > /dev/null 2>&1; then
  alias dcd="dev cd"
else
  dcd() {
          cd $(find ~/src -mindepth 3 -maxdepth 3 -type d | fzf --filter "$1" | tail -1)
  }
fi


alias be="bundle exec"
alias dti="dev test --include-branch-commits"

# Added by Krypton
export GPG_TTY=$(tty)

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/jackmc/.kube/config:/Users/jackmccracken/.kube/config.shopify.cloudplatform

source /usr/local/bin/virtualenvwrapper.sh
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

zipedit(){
    echo "Usage: zipedit archive.zip file.txt"
    unzip "$1" "$2" -d /tmp 
    vim /tmp/$2 && zip -j --update "$1"  "/tmp/$2" 
}

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

clone() {
        dir=$HOME/src/github.com/$1
        mkdir -p $dir
        git clone "git@github.com:$1" $dir
        cd $dir
}
clonetool() {
        clone $1
        dir=~/tools/$(cut -d'/' -f2 <<< $1)
    
        ln -s `pwd` $path
        cd $path
}
