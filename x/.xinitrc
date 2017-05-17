#!/usr/bin/env bash
#
# xinitrc

xrandr --output VGA-1 --primary --mode 1920x1080
xset m 1/1
compton &
devmon &
dunst &
xrdb -merge "$HOME/.Xresources"
urxvtd --quiet --opendisplay --fork &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
exec i3
