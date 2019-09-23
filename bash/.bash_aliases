#!/bin/bash
alias grep='grep --color=auto --exclude-dir=node_modules --exclude-dir=.git'
alias ls='ls --color=auto'
alias lls='ls -lah --color=auto'
alias du='du -h'
alias df='df -h'
alias exi='exit'
alias weather='~/bin/weather'
alias tree='tree -I "node_modules"'

dkps() { docker ps --format "table {{.Names}}\t{{.Ports}}" "$@"; }
dkst() { docker stats; }
dkup() { docker-compose up -d "$@"; }
dkdown() { docker-compose down "$@"; }

alias cpg="rsync --partial --progress --append --rsh=ssh -r -h "
alias mvg="rsync --partial --progress --append --rsh=ssh -r -h --remove-sent-files"

alias pacaur='pikaur'

# Use neovim instead of vim
alias vim='nvim'

# Git wrapper from the github team that adds some nice features
# See: https://github.com/github/hub
alias git='hub'

# Kill all orphaned packages
alias anakin="pikaur -Rns \$(pikaur -Qtdq)"

# Quick movement
alias ..='cd ..'
alias sl='ls'

# Create directory paths and cd into them in one command
chdir(){
	# -- following will not get parsed as options
	mkdir -p -- "$1" &&
	# -P resolved symbolic links
	cd -P "$1"
}

# poor way of trying to correct some command git command mistypes (gi tstatus)
gi() {
	if [[ $@ == "tpull" ]]; then
		command git pull
	elif [[ $@ == "tstatus" ]]; then
		command git status
	elif [[ $@ == "tpush" ]]; then
		command git push
	else
		echo "what man?"
	fi
}

f() {
	fff "$@"
	cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
