#!/usr/bin/env bash
#
# xinitrc
# TODO
# - look into xset params for screensaver 
# - no devmon installed for automounting features
# - redshift installed but not being used. A config file could be added for it as well
# - autocutsel may not be needed as Xresources also specifies cut paste functionality

# start resolution at 1920x1080. xrandr alone shows output and res options
xrandr --output VGA-1 --primary --mode 1920x1080

# xset is a user preference utility for x. m sets mouse acceleration and threshold 
xset m 1/1

# compton config at ~.compton.conf fixes some bugs with x and i3
compton &
devmon &
dunst &
xrdb -merge "$HOME/.Xresources"
urxvtd --quiet --opendisplay --fork &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
exec i3
