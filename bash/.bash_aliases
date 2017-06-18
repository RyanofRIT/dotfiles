alias lls='ls -la'
alias vim='nvim'
alias t='python ~/bin/t/t.py --task-dir ~/.tasks --list tasks'
alias gttr='gitter-cli'
alias git='hub'
alias ghcal='ghcal -u Ryan-Bell'
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

chdir(){
	mkdir "$1"
	cd "$1"
}
