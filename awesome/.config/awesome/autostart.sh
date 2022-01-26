#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#run variety
run flameshot
run xfce4-power-manager
#run blueman-applet
#run volctl
run pasystray
run keepassxc "Nextcloud/Viktiga\ dokument/Passwords.kdbx"
#run firefox
run brave
xset r rate 200 30
setxkbmap se -variant nodeadkeys
#run nm-applet
run redshift-gtk
run autorandr -c

#run applications from startup
