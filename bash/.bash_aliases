alias lls='ls -la'
alias vim='nvim'
alias t='python ~/bin/t --task-dir ~/.tasks --list tasks'
alias git='hub'
alias vlc='cvlc --aout=alsa --file-caching=2000 --alsa-audio-device="surround51"'
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

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
