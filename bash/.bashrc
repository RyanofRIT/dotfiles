#!/bin/bash

# vi mode over emacs mode
set -o vi
bind '"jk":vi-movement-mode'

# Set the prompt.
export PS1="[\A] \w >\[$(tput sgr0)\] "

# Force steam scaling (undo hidpi correction)
export GDK_SCALE=1

# Set nvim as editor.
export EDITOR="nvim"

# Set XDG_CONFIG_HOME
export XDG_CONFIG_HOME="${HOME}/.config"

# Set XDG_CACHE_HOME
export XDG_CACHE_HOME="${HOME}/.cache"

# Force nvidia shader disk cache location
export __GL_SHADER_DISK_CACHE_PATH=XDG_CACHE_HOME

# History completion.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Don't log duplicate commands.
export HISTCONTROL=ignoredups

# Check window size after every command
shopt -s checkwinsize

# Enable extended globbing allowing composite patterns
shopt -s extglob

# cd only autocompletes directories
complete -d cd

# ALIASES
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# git hub autocompletions
if [ -f ~/dotfiles/git/.hub.bash_completion ]; then
  source ~/dotfiles/git/.hub.bash_completion
fi

# Source git autocompletions
source /usr/share/bash-completion/completions/git

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;202m' # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;161m' # begin underline

umask 027
