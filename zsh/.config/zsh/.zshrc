# DONE Fix a way of trashing files instead of deleating them.
# DONE CTRL-R does not work. Also bind to fuzzyfinder, togeter with other things.
# DONE Fix so that commands are loaded immediattely to current shell after program install.
# DONE fzf completion does not work properly.
# TODO Make remappig of caplock work in both tty and X.
# TODO Go through grep man page and select good default flags.
# TODO fzf for man pages
# TODO Change options so that when i have typed stuff and hit up arrow, it finds commands from history that are matching instead of taking the one that i most recently typen. See arch wiki.
# TODO Make config files use makefile intead? A good way to learn?
# TODO Test managing dotfiles with bare repository inside docker container.
# TODO Make tutorials and motivational videos for my self. I think i need it.
# TODO Learn web scraping
# DONE VI mode copying does not use the same clipboard as i do
# DONE VI cursor is invisible in visual mode. (solutin was to set cursor color
	 # in alacritty
# TODO Clone google drive via rclone
# TODO Spacship rpromt is on second row. I want it on the first. (Open github
	 # issue, cannot resolve myself.
# TODO What is the use of activity notifications. Justa annoying?

#  If not running interactively, don't do anything
[[ $- != *i* ]] && return

# A nice message from the one and only cow
fortune -so | cowsay

# Always reload programs from path
zstyle ':completion:*' rehash true


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
  if [[ ${KEYMAP} == visual ]] ||
     [[ ${KEYMAP} == vicmd ]] ||
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
	jobs
	user
	host
	time
	dir
	char
)

SPACESHIP_RPROMPT_ORDER=(
	venv
	git
)

SPACESHIP_JOBS_SHOW=true
SPACESHIP_JOBS_PREFIX=""
SPACESHIP_JOBS_SUFFIX=" "
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_PREFIX=""
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
SPACESHIP_VENV_PREFIX=""
SPACESHIP_VENV_SUFFIX=""
SPACESHIP_VENV_SYMBOL=" "

# Spaceship Prompt
autoload -U promptinit; promptinit
prompt spaceship

# Alias definitions.  You may want to put all your additions into a separate
# file like ~/.config/aliases, instead of adding them here directly.

if [ -f ~/.config/aliases ]; then
    . ~/.config/aliases
fi

# Fzf-keybinds
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
    source /usr/share/fzf/key-bindings.zsh
	source /usr/share/fzf/completion.zsh
fi
# Broot
source /home/oskar/.config/broot/launcher/bash/br
# Make up and down smarter

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey -M vicmd "k" up-line-or-beginning-search # Up
bindkey -M vicmd "j" down-line-or-beginning-search # Down


# Use correct clipboard
source /usr/share/zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh
# Source .profilc
#[ -f ~/.profile ] && source ~/.profile
