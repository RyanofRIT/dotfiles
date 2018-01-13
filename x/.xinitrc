#!/usr/bin/env bash
#
# xinitrc

if [ "$HOSTNAME" = archy ]; then
	xrandr --output "$MONITOR1" --primary --mode 1920x1080 --output "$MONITOR2" --mode 1920x1080
else
	xrandr --output "$MONITOR1" --primary --mode 3840x2160 --output "$MONITOR2" --mode 3840x2160
	xrandr --output "$MONITOR1" --left-of "$MONITOR2"
	if [ $(xrandr | grep "\ connected" | wc -l) = 3 ]; then
		xrandr --output "HDMI-0" --right-of "$MONITOR2"
	fi
fi

# xset is a user preference utility for x. m sets mouse acceleration and threshold 
xset m 1/1

xmodmap ~/.Xmodmap

# compton config at ~.compton.conf fixes some bugs with x and i3
compton &
dunst &
xrdb -merge "$HOME/.Xresources"
urxvtd --quiet --opendisplay --fork &
exec i3
