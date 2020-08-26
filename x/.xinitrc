#!/usr/bin/env bash
#
# xinitrc

# TODO: Stow all dotfiles

case "$HOSTNAME" in
  redar)
    export MONITOR1="DP-2"
    export MONITOR2="DP-4"
    export MONITOR3="HDMI-0"
    xrandr --output "$MONITOR1" --primary --mode 3840x2160 --left-of "$MONITOR2"

    # position my TV if it's connected
    if [ $(xrandr | grep -c "\ connected") = 3 ]; then
      xrandr --output "$MONITOR3" --right-of "$MONITOR2"
    fi

    # use keymap for linux host
    xmodmap ~/.Xmodmap
    ;;
  *)
    setscreen 2560 1080
    # use keymap built for working in a vm on an apple product
    xmodmap ~/.Xmodmap.apple
    ;;
esac

# --no-fehbg prevents a .fehbg executable from being created in home dir
feh --no-fehbg --bg-fill ~/Pictures/Wallpapers/plant_background.jpg

# set npm install location
export npm_config_prefix=~/.node_modules

# xset is a user preference utility for x. m sets mouse acceleration and threshold
xset m 1/1

# disable access control so docker containers can attach to x11 server
xhost +

xrdb -merge "$HOME/.Xresources"

# dunst doesn't read xresources so pull it directly from the config file
foreground=$(xrdb -q | grep foreground | sed 's/.\+#/#/')
color4=$(xrdb -q | grep color4 | sed 's/.\+#/#/')

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

urxvtd --quiet --opendisplay --fork &
nohup ~/bin/python_pipe.py &
exec i3 > ~/.i3.log 2>&1
