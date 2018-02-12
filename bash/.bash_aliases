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

# Openvpn docker to run other containers through
# TODO: currently needs NordVPN DNS servers set in /etc/resolv.conf but this is not automatic
alias opendocker='docker build -t vpn ~/Documents/dockerfiles/openvpn/; sudo docker run --rm -it -m 4G --cap-add=NET_ADMIN --device /dev/net/tun --name vpn -v /home/mainuser/Documents/openvpn/ovpn_tcp:/vpn vpn'

# Firefox through vpn
alias firefoxdocker='docker run --rm -it -m 4G --net container:vpn -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY=unix:0 --name firefox jess/firefox'

# Run transmission through vpn container network
# Local connection through vpn ip (via docker inspect)
alias transmission='docker run -it -m 4G --net container:vpn --name transmission -e PUID=1000 -e PGID=1000 -v ~/.local/share/transmission:/var/lib/transmission-daemon -d dperson/transmission'

# PlexPy monitoring
alias plexpy='docker run -d --rm --name plexpy -m 4G -v ~/.local/share/plexpy/:/data -p 8181:8181 r.j3ss.co/plexpy'

# Open spotify app
alias spotify='docker run --rm -d -m 4G -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=:0 --device /dev/snd:/dev/snd -v /home/mainuser/.config/.spotify/config:/home/spotify/.config/spotify -v /home/mainuser/.cache/.spotify/cache:/home/spotify/spotify --name spotify jess/spotify'

# Ethereum mining command
alias mine='ethminer -U --farm-recheck 200 -S u1.ethermine.org:4444 -FS us1.ethermine.org:4444 -O 7fae523edfc0a637e51a13fd3457a0a1c8219676.redar'
alias geth='geth --rpc --rpccorsdomain="http://ethertweet.net"'


# Open plex as app
alias plex='chromium --app="https://app.plex.tv" &>/dev/null'

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
