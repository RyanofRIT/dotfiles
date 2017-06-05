#!/bin/sh

# Set the brightness via xbrightness when redshift status changes vs fake gamma changes

brightness_day=="100"
brightness_transition="70"
brightness_night="50"

# Fade time as 1 minute
fade_time=60000

case $1 in
	period-changed)
		case $3 in
			night)
				xbacklight -set $brightness_night -time $fade_time
				;;
			transition)
				xbacklight -set $brightness_transition -time $fade_time
				;;
			daytime)
				xbacklight -set $brightness_day -time $fade_time
				;;
		esac
		;;
esac
