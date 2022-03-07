#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#run variety
run keepassxc ~/Nextcloud/Documents/viktiga_dokument/Passwords.kdbx
#run flameshot
#run xfce4-power-manager
#run blueman-applet
#run volctl
run pasystray
#run firefox
run brave
run xset r rate 200 30
run setxkbmap se -variant nodeadkeys -option caps:escape
#run nm-applet
run redshift-gtk
run autorandr -c
run clipmenud
run udiskie --tray

run picom

run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1



#run applications from startup
