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

# Generic ~/bin directory, for user-specific binaries.
user_bin="$HOME/bin"
if [ -d $user_bin ]; then
    export PATH="$user_bin:$PATH"
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

if command -v boot2docker > /dev/null 2>&1; then
    export DOCKER_HOST=tcp://192.168.59.103:2375
    unset DOCKER_CERT_PATH
    unset DOCKER_TLS_VERIFY
fi

if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh/site-functions/ /usr/local/share/zsh-completions $fpath)
fi
