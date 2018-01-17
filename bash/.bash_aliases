alias lls='ls -la'
alias vim='nvim'
alias t='python ~/bin/t --task-dir ~/.tasks --list tasks'
alias git='hub'
alias vlc='cvlc --aout=alsa --file-caching=2000 --alsa-audio-device="surround51"'
alias anakin="sudo pacman -Rns \$(pacman -Qtdq)"
alias neofetch="clear; neofetch"
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias sl='ls'

alias mine='ethminer -U --farm-recheck 200 -S u1.ethermine.org:4444 -FS us1.ethermine.org:4444 -O 7fae523edfc0a637e51a13fd3457a0a1c8219676.redar'
alias geth='geth --rpc --rpccorsdomain="http://ethertweet.net"'
alias rainbowstream='docker run -it --rm -v /etc/localtime:/etc/localtime:ro -v $HOME/.rainbow_oauth:/root/.rainbow_oauth -v $HOME/.rainbow_config.json:/root/.rainbow_config.json --name rainbowstream jess/rainbowstream'
alias twitter='rainbowstream'

chdir(){
	mkdir "$1"
	cd "$1"
}

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
