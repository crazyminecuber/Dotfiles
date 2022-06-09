#!/bin/bash

#RED='\033[0;31m'
# First bit is foreground, second bit is background (foreground after 32;2 and
# background after 48;2)
#PINKBROWN='\033[38;2;255;82;197;48;2;155;106;0m'
ERR='\033[38;2;251;72;52m'
OK='\033[38;2;152;151;26m'
NC='\033[0m' # No Color

function run {
  if ! pgrep $1 > /dev/null;
  then
    (
    echo "Starting $1"
    exec 2> >(trap "" INT TERM; sed "s/^/`printf "${ERR}[$1 (stderr)]${NC}: "`/" >&2)
    exec > >(trap "" INT TERM; sed "s/^/`printf "${OK}[$1]${NC}: "`/")
    $@&
  )
  fi
}

echo "Autostart"
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
#run redshift-gtk
run clipmenud
run udiskie --tray

run picom
run autorandr -c

run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1



#run applications from startup
