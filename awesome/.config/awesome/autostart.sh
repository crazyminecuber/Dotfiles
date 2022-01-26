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
run volctl
run keepassxc "Nextcloud/Viktiga\ dokument/Passwords.kdbx"
#run firefox
run brave
xset r rate 200 30
setxkbmap se -variant nodeadkeys
#run nm-applet
run redshift-gtk
nmcli connection down thinker
nmcli connection up thinker
#killall conky
#run conky -c $HOME/.config/awesome/system-overview

#run applications from startup
