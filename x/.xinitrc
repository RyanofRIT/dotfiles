#!/usr/bin/env bash
#
# xinitrc

if [ "$HOSTNAME" = archy ]; then
	xrandr --output "$MONITOR1" --primary --mode 1920x1080 --output "$MONITOR2" --mode 1920x1080

else
	xrandr --output "$MONITOR1" --primary --mode 3840x2160 --output "$MONITOR2" --mode 3840x2160
	xrandr --output "$MONITOR1" --left-of "$MONITOR2"

	xwinwrap -g 3840x2160+0+0 -ov -ni -- mpv -wid WID --loop --autofit-smaller=3840x2160 ~/Downloads/other_animated_walls/ram.mp4 &

	xwinwrap -g 3840x2160+3840+0 -ov -ni -- mpv -wid WID --loop --autofit-smaller=3840x2160 ~/Downloads/other_animated_walls/8bit.mkv &

	if [ $(xrandr | grep "\ connected" | wc -l) = 3 ]; then
		xrandr --output "HDMI-0" --right-of "$MONITOR2"
		xwinwrap -g 1920x1080+7680+0 -ov -ni -- mpv -wid WID --loop ~/Pictures/Wallpapers/daft_punk_animated_2.mp4 &
	fi
fi


# xset is a user preference utility for x. m sets mouse acceleration and threshold 
xset m 1/1

xmodmap ~/.Xmodmap

# disable access control so docker containers can attach to x11 server
xhost +

xrdb -merge "$HOME/.Xresources"

foreground="#d9d9d9"
background="#0c0c0c"
cursorColor="#fc971f"
color0="#1a1a1a"
color8="#625e4c"
color1="#f4005f"
color9="#f4005f"
color2="#98e024"
color10="#98e024"
color3="#fd971f"
color11="#e0d561"
color4="#9d65ff"
color12="#9d65ff"
color5="#f4005f"
color13="#f4005f"
color6="#58d1eb"
color14="#58d1eb"
color7="#c4c5b5"
color15="#f6f6ef"
colorBD="#ebebeb"

start_dunst() {
	dunst \
		-lb "$color4" \
		-nb "$color4" \
		-cb "$color4" \
		-lf "$foreground"  \
		-bf "$foreground"  \
		-cf "$foreground"  \
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
exec i3
