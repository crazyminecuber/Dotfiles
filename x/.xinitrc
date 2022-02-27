#!/bin/sh

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
 for f in /etc/X11/xinit/xinitrc.d/*; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#picom &


export DESKTOP_SESSION=awesome
exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr



