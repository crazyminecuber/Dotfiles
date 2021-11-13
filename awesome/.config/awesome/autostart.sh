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
run keepassxc "Bigdata/Nextcloud/Viktiga\ dokument/Passwords.kdbx"
run firefox
#run nm-applet
#run redshift-gtk
#killall conky
#run conky -c $HOME/.config/awesome/system-overview

#run applications from startup
