# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/jack/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
setopt notify
unsetopt appendhistory autocd beep extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

PROMPT='[%n %~%b] %# '

if [ -z "$TMUX" ]; then export TERM='xterm-256color'; fi

if [ "$TMUX" ]; then alias emacs='emacs -nw'; fi 

export EDITOR='vim'

export PATH=$PATH:/opt/android-studio/sdk/platform-tools:$(ruby -rubygems -e "puts Gem.user_dir")/bin
