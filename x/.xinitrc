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
setxkbmap -layout us,ru -variant altgr-intl, -option grp:shifts_toggle,terminate:ctrl_alt_bksp,grp:menu_toggle
devmon --no-gui &
gnome-keyring
nm-applet &
# mpd
# mpc random
# mpc repeat
feh --randomize --bg-fill ~/wallpapers/*[jpg,png] &
redshift -l 51.5074:0.1278 -t 6000:3000 &
# redshift -l -42.87936:147.32941 -t 6000:3000 &

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
xcape -e 'Control_L=Escape;ISO_Level3_Shift=Super_L|I'

# xautolock -time 20 -locker sflock &
syndaemon -t -k -i 0.5 -d

tmux new-session -s default -d
emacs --daemon &

pasystray &

exec i3
