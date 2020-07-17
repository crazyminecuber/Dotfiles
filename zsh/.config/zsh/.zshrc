# TODO Make remappig of caplock work in both tty and X.
# TODO Go through grep man page and select good default flags.
# TODO Fix a way of trashing files instead of deleating them.
# TODO CTRL-R does not work. Also bind to fuzzyfinder, togeter with other things.
# TODO Change options so that when i have typed stuff and hit up arrow, it finds commands from history that are matching instead of taking the one that i most recently typen. See arch wiki.
# TODO Make config files use makefile intead? A good way to learn?
# TODO Test managing dotfiles with bare repository inside docker container.
# TODO Fix so that commands are loaded immediattely to current shell after program install.


#  If not running interactively, don't do anything
[[ $- != *i* ]] && return

# A nice message from the one and only cow
fortune | cowsay
# Enable colors and change prompt:
autoload -U colors && colors
setopt appendhistory autocd

# History in cache directory:
HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=1000000000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.

precmd() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# Suggest aliases for commands
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null
# Search repos for programs that can't be found
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

# Spaceship
SPACESHIP_PROMPT_ORDER=(
	user
	host
	time
	dir
	git
	char
)

SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_SUFFIX=""
SPACESHIP_HOST_COLOR="yellow"
SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_PREFIX="%F{red}0"
SPACESHIP_HOST_COLOR="245"
SPACESHIP_HOST_COLOR_SSH="magenta"
SPACESHIP_HOST_SUFFIX=""
SPACESHIP_CHAR_PREFIX="\n"
SPACESHIP_DIR_PREFIX=" "
SPACESHIP_DIR_SUFFIX=""
SPACESHIP_DIR_TRUNK=0
SPACESHIP_DIR_COLOR="cyan"
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR="green"
SPACESHIP_TIME_PREFIX="["
SPACESHIP_TIME_SUFFIX="]"
SPACESHIP_GIT_PREFIX=" "
SPACESHIP_GIT_SUFFIX=""

# Spaceship Prompt
autoload -U promptinit; promptinit
prompt spaceship

# Alias definitions.  You may want to put all your additions into a separate
# file like ~/.config/aliases, instead of adding them here directly.

if [ -f ~/.config/aliases ]; then
    . ~/.config/aliases
fi

# Broot
source /home/oskar/.config/broot/launcher/bash/br

