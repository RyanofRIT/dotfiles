#!/usr/bin/env bash
#
# xinitrc

if [ "$HOSTNAME" = archy ]; then
	export MONITOR1="DVI-I-1"
else
	export MONITOR1="DP-2"
	export MONITOR2="DP-4"
	export MONITOR3="HDMI-0"
fi

if [ "$HOSTNAME" = archy ]; then
	xrandr --output "$MONITOR1" --primary --mode 1920x1080
	feh --bg-fill ~/Pictures/Wallpapers/DaftPunk1.jpg
else
	xrandr --output "$MONITOR1" --primary --mode 3840x2160 --left-of "$MONITOR2"

	feh --randomize --bg-fill ~/Pictures/Wallpapers/city.jpg

	if [ $(xrandr | grep "\ connected" | wc -l) = 3 ]; then
		xrandr --output "$MONITOR3" --right-of "$MONITOR2"
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

# dunst doesn't read xresources so pull it directly from the config file
foreground=`xrdb -q | grep foreground | sed 's/.\+#/#/'`
color4=`xrdb -q | grep color4 | sed 's/.\+#/#/'`

main() {
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

main

# compton config at ~.compton.conf fixes some bugs with x and i3
compton &
urxvtd --quiet --opendisplay --fork &
nohup ~/bin/python_pipe.py &
exec i3
