#!/usr/bin/env bash
#
# xinitrc

if [ "$HOSTNAME" = archy ]; then
	xrandr --output "$MONITOR1" --primary --mode 1920x1080
	feh --bg-fill Pictures/Wallpapers/DaftPunk1.jpg

else
	xrandr --output "$MONITOR1" --primary --mode 3840x2160 --output "$MONITOR2" --mode 3840x2160
	xrandr --output "$MONITOR1" --left-of "$MONITOR2"

	feh --randomize --bg-fill ~/Pictures/Wallpapers/*

	if [ $(xrandr | grep "\ connected" | wc -l) = 3 ]; then
		xrandr --output "HDMI-0" --right-of "$MONITOR2"
	fi
fi

# set npm install location
export npm_config_prefix=~/.node_modules

# xset is a user preference utility for x. m sets mouse acceleration and threshold
xset m 1/1

xmodmap ~/.Xmodmap

# disable access control so docker containers can attach to x11 server
xhost +

xrdb -merge "$HOME/.Xresources"

foreground="#d9d9d9"
color4="#9d65ff"

start_dunst() {
	dunst \
		-lb "$color4" \
		-nb "$color4" \
		-cb "$color4" \
		-lf "$foreground" \
		-bf "$foreground" \
		-cf "$foreground" \
		-fn "${DUNST_FONT:-DroidSansMono 10}" \
		-geometry "${DUNST_SIZE:-300x30-40+40}" &
}

main() {
	start_dunst &
}

main >/dev/null 2>&1

# compton config at ~.compton.conf fixes some bugs with x and i3
compton &
urxvtd --quiet --opendisplay --fork &
nohup ~/bin/python_pipe.py &
exec i3
