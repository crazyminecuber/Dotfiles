#TODO Go through grep man page and select good default flags.
#TODO Fix a way of trashing files instead of deleating them.
#TODO Fix so i only have to hit tab once when i want completions
#DONE Add checks for git and nvim being installed when setting git pager and man
fortune | cowsay

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000000
HISTFILESIZE=20000000

# Alias definitions.  You may want to put all your additions into a separate
# file like ~/.bash_aliases, instead of adding them here directly.  See
# /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.config/aliases ]; then
    . ~/.config/aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Sets colors diffrently on diffrent devices
if [ $(hostname) = "oskar-Surface-Pro-2" ]; then
	#echo Surface-Pro
		export PS1="\n\[\e[01;33m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[01;36m\]\h\[\e[0m\]\[\e[00;37m\] \t \[\e[0m\]\[\e[01;35m\]\w\[\e[0m\]\[\e[01;37m\] \[\e[0m\]\n$ "
elif [ $(hostname) = "RP4" ]; then
	#echo Raspberry-pi
		export PS1="\n\[\e[01;31m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[01;32m\]\h\[\e[0m\]\[\e[00;37m\] \t \[\e[0m\]\[\e[01;35m\]\w\[\e[0m\]\[\e[01;37m\] \[\e[0m\]\n$ "
elif [ $(hostname) = "oskar" ]; then
	#echo Desktop-pc
		export PS1="\n\[\e[01;33m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[01;36m\]\h\[\e[0m\]\[\e[00;37m\] \t \[\e[0m\]\[\e[01;35m\]\w\[\e[0m\]\[\e[01;37m\] \[\e[0m\]\n$ "
elif [ $(hostname) = "octopi" ]; then
	#echo octopi
		export PS1="\[\033[38;5;46m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;22m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;82m\]\W\[$(tput sgr0)\]\\$\[$(tput sgr0)\]"
elif [ $(hostname) = "think-yogi" ]; then
		export     PS1="\n\[\e[38;2;$((0xfa));$((0xbd));$((0x2f))m\]\u\[\e[0m\]"
		PS1+="\[\e[38;2;$((0xfb));$((0x49));$((0x34))m\]0\[\e[0m\]"
		PS1+="\[\e[38;2;$((0xa8));$((0x99));$((0x84))m\]\h\[\e[0m\]"
		PS1+="\[\e[38;2;$((0xb8));$((0xbb));$((0x26))m\][\t]\[\e[0m\]"
		PS1+="\[\e[38;2;$((0xd3));$((0x86));$((0x9b))m\]\w\n\[\e[0m\]"
		#PS1+="\[\e[38;2;$((0xfb));$((0x49));$((0x34))m\]$ \[\e[0m\]"
		PS1+="$ "
else
	echo Warning! Unrecognized hostname from .bashrc! /Oskar
		#export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export     PS1="\n\[\e[38;2;$((0xfa));$((0xbd));$((0x2f))m\]\u\[\e[0m\]"
		PS1+="\[\e[38;2;$((0xfb));$((0x49));$((0x34))m\]0\[\e[0m\]"
		PS1+="\[\e[38;2;$((0xa8));$((0x99));$((0x84))m\]\h\[\e[0m\]"
		PS1+="\[\e[38;2;$((0xb8));$((0xbb));$((0x26))m\][\t]\[\e[0m\]"
		PS1+="\[\e[38;2;$((0xd3));$((0x86));$((0x9b))m\]\w\n\[\e[0m\]"
		#PS1+="\[\e[38;2;$((0xfb));$((0x49));$((0x34))m\]$ \[\e[0m\]"
		PS1+="$ "
fi

set -o vi

set completion-ignore-case on
set show-all-if-ambiguous on

#this is a new change
