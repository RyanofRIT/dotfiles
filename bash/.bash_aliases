#!/bin/bash
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias lls='ls -lah --color=auto'
alias du='du -h'
alias df='df -h'
alias weather='~/bin/weather'
alias tree='tree -I "node_modules"'

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

# Openvpn docker to run other containers through
alias opendocker='docker build -t vpn ~/Documents/dockerfiles/openvpn/; sudo docker run --rm -it -m 4G --cap-add=NET_ADMIN --device /dev/net/tun --name vpn -v /home/mainuser/Documents/dockerfiles/openvpn-configs/ovpn_tcp:/vpn vpn'

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
