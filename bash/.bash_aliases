#!/bin/bash

alias lls='ls -la'

# Use neovim instead of vim
alias vim='nvim'

# One letter command for a simple to-do list from Steve Losh (makes lots of cool things)
# See: https://github.com/sjl/t
alias t='python ~/bin/t --task-dir ~/.tasks --list tasks'

# Git wrapper from the github team that adds some nice features
# See: https://github.com/github/hub
alias git='hub'

# Force vlc to use the correct audio output device and increase buffer to reduce stuttering
alias vlc='cvlc --aout=alsa --file-caching=2000 --alsa-audio-device="surround51"'

# Kill all orphaned packages
alias anakin="sudo pacman -Rns \$(pacman -Qtdq)"

alias neofetch="clear; neofetch"

# Quick movement
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias sl='ls'

# Startup rainbowstream (commandline twitter client) docker container
alias rainbowstream='docker run -it --rm -v /etc/localtime:/etc/localtime:ro -v $HOME/.rainbow_oauth:/root/.rainbow_oauth -v $HOME/.rainbow_config.json:/root/.rainbow_config.json --name rainbowstream jess/rainbowstream'
alias twitter='rainbowstream'

# Ethereum mining command
alias mine='ethminer -U --farm-recheck 200 -S u1.ethermine.org:4444 -FS us1.ethermine.org:4444 -O 7fae523edfc0a637e51a13fd3457a0a1c8219676.redar'
alias geth='geth --rpc --rpccorsdomain="http://ethertweet.net"'

# Create directory paths and cd into them in one command
chdir(){
	mkdir -p "$1"
	cd "$1"
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
