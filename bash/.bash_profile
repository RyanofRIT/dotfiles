# Add ~/bin to path
PATH="$PATH:$HOME/bin"

# Add global node modules to path
PATH="$PATH:$HOME/.node_modules/bin"

# Ruby gems
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.gem

# Source bashrc on login
[[ -f ~/.bashrc ]] && source ~/.bashrc

# archy computer needs to disable piezospeaker not on redar
# setuid on shell scripts not permitted in arch due to security reasons
# sudoers file would need to be editted to bypass sudo command
#if [ "$HOSTNAME" = archy ]; then
#	sudo ~/bin/sustart
#fi

