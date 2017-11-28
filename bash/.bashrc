# Set the prompt.
export PS1="$USER \w \[$(tput setaf 5)\]>\[$(tput sgr0)\]"

# Set nvim as editor.
export EDITOR="nvim"

# Add ~/bin to path
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/bin/npm-global/bin"

# Set XDG_CONFIG_HOME
export XDG_CONFIG_HOME="${HOME}/.config"

# History completion.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Don't log duplicate commands.
export HISTCONTROL=ignoredups

# Check window size after every command
shopt -s checkwinsize
shopt -s extglob

# ALIASES
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

#git hub autocompletions
if [ -f ~/dotfiles/git/.hub.bash_completion ]; then
  . ~/dotfiles/git/.hub.bash_completion
fi

# Source colors generated by wal
source "$HOME/.cache/wal/colors.sh"

# Import colorscheme from 'wal'
[[ -z "$VTE_VERSION" ]] && (wal -r &)

# Auto start X.
# [[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec startx -- vt1 &> /dev/null

# Source git autocompletions
source /usr/share/bash-completion/completions/git

umask 027

# neofetch
