# Source bashrc on login
[[ -f ~/.bashrc ]] && source ~/.bashrc

# archy computer needs to disable piezospeaker not on redar
# setuid on shell scripts not permitted in arch due to security reasons
# sudoers file would need to be editted to bypass sudo command
if [ "$HOSTNAME" = archy ]; then
	sudo ~/bin/sustart
fi

# disable access control so docker containers can attach to x11 server
xhost +
