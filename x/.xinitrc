#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrandr --dpi 210
xrdb -merge ~/.Xresources
start-pulseaudio-x11
unclutter &
setxkbmap -layout us,ru -variant altgr-intl, -option grp:shifts_toggle,terminate:ctrl_alt_bksp,grp_led:caps,caps:ctrl_modifier
devmon --no-gui &
gnome-keyring
nm-applet &
mpd
mpc random
mpc repeat
feh --randomize --bg-fill ~/wallpapers/*[jpg,png] &
redshift -l 45.2002:5.7222 -t 6000:4000 &

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
xcape -e 'Control_L=Escape'

xautolock -time 20 -locker sflock &
syndaemon -t -k -i 0.5 -d

# emacs --daemon &

exec i3
