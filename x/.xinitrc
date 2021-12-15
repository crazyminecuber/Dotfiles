#!/bin/sh

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr &&
xrdb -merge ~/.Xresources &&

xset r rate 200 30

autorandr -c
clipmenud &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom &
udiskie --tray &

setxkbmap -option caps:escape

export DESKTOP_SESSION=awesome
exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
