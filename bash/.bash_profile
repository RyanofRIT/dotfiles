# Add ~/bin to path
export PATH="$PATH:$HOME/bin"

# Add global node modules to path
export PATH="$PATH:$HOME/.local/share/.node_modules/bin"

# Changing Yarn's global install dir seems weird
export PATH="$PATH:`yarn global bin`"

# Some things like python --user install things here
export PATH="$PATH:$HOME/.local/bin"

# Add golang bins to PATH
export PATH="$PATH:$HOME/go/bin"

# specify where global npm packages are installed to
export npm_config_prefix=~/.local/share/.node_modules

# change location of npm cache dir
export npm_config_cache=~/.cache

# change location of npm user config file
export userconfig=~/.local/share

# prevent pylint from creating .pylint.d in home folder
export PYLINTHOME=~/.cache

# move location of less history file
export LESSHISTFILE=~/.cache/.lesshst

# point to python startup file not in home dir
export PYTHONSTARTUP=~/bin/.pythonstartup

# Ruby gems
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.local/share/.gem

export IPFS_PATH=/media/blaze/ipfs

# Source bashrc on login
[[ -f ~/.bashrc ]] && source ~/.bashrc

# archy computer needs to disable piezospeaker not on redar
# setuid on shell scripts not permitted in arch due to security reasons
# sudoers file would need to be editted to bypass sudo command
#if [ "$HOSTNAME" = archy ]; then
#	sudo ~/bin/sustart
#fi

