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

xrdb -merge ~/.Xresources
#xrdb -merge ~/.config/base16-xresources/base16-3024
start-pulseaudio-x11
unclutter &
xbindkeys
setxkbmap -layout us,ru -variant altgr-intl, -option grp:rctrl_toggle,terminate:ctrl_alt_bksp,grp_led:caps
devmon --no-gui &
mpd ~/.config/mpd/mpd.conf
feh --randomize --bg-fill ~/wallpapers/* &

exec awesome
