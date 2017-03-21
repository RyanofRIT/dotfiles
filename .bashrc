# This hack may or may not be needed
# export $(dbus-launch)

# Set the prompt.
export PS1="$USER \w \[$(tput setaf 5)\]>\[$(tput sgr0)\]"

# Set nvim as editor.
export EDITOR="nvim"

# Add ~/bin to path
PATH="$PATH:$HOME/bin"

# Set XDG_CONFIG_HOME
export XDG_CONFIG_HOME="${HOME}/.config"

# History completion.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Don't log duplicate commands.
export HISTCONTROL=ignoredups

# ALIASES
alias sxiv="sxiv -b -s f"
alias handbrake="ghb"

# Import colorscheme from 'wal'
[[ -z "$VTE_VERSION" ]] && (wal -r &)

# Auto start X.
#[[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec startx -- vt1 &> /dev/null

# Source git autocompletions
source /usr/share/bash-completion/completions/git
