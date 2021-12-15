# DONE Fix a way of trashing files instead of deleating them.
# DONE CTRL-R does not work. Also bind to fuzzyfinder, togeter with other things.
# DONE Fix so that commands are loaded immediattely to current shell after program install.
# DONE fzf completion does not work properly.
# DONE Change options so that when i have typed stuff and hit up arrow, it finds commands from history that are matching instead of taking the one that i most recently typen. See arch wiki.
# TODO Make tutorials and motivational videos for my self. I think i need it.
# DONE VI mode copying does not use the same clipboard as i do
# DONE VI cursor is invisible in visual mode. (solutin was to set cursor color
	 # in alacritty
# TODO Clone google drive via rclone
# TODO Spacship rpromt is on second row. I want it on the first. (Open github
	 # issue, cannot resolve myself.
# DONE Load and install plugin manager to make zsh more portable?
# DONE Add color control pattern somewhere (in aliases)
# DONE More portable way of fixing fzf imports
# DONE Text-gitch when startup (had not added lucid)
#!! setopt sets options and is case-insensitive and igores '_'!
#  If not running interactively, don't do anything
# TODO Behöver inte alla filer. Troligtvis bara .profile

# ----------- Check if interactive and install necisarry stuff ---------------

#  If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Variable for zsh-config directory
ZSH_CONFIG_DIR="$HOME/.config/zsh"

# Install zinit in nearby directory if not installed.
if [ ! -d "$ZSH_CONFIG_DIR/zinit/bin" ]
then
	echo "Installing zinit"
	mkdir -p "$ZSH_CONFIG_DIR/zinit"
	git clone https://github.com/zdharma-continuum/zinit.git $ZSH_CONFIG_DIR/zinit/bin
fi

# Install fzf if not installed.
if [ ! -d $ZSH_CONFIG_DIR/fzf ]
then
	echo "Installing fzf"
	git clone --depth 1 https://github.com/junegunn/fzf.git $ZSH_CONFIG_DIR/fzf
	$ZSH_CONFIG_DIR/fzf/install --bin --no-update-rc --xdg
fi

source $ZSH_CONFIG_DIR/zinit/bin/zinit.zsh

# zinit plugins
# Plugin that tells you when there is an alias for the given command
zinit light denysdovhan/spaceship-prompt
zinit ice lucid wait'!0'
# Makes vi-mode use the same clipbard as system
zinit ice lucid wait'!0'
zinit light "kutsan/zsh-system-clipboard"
# Plugin for syntax highlighting
zinit ice lucid wait'!0'
zinit load zdharma-continuum/fast-syntax-highlighting

zinit ice lucid wait'!0'
zinit load zsh-users/zsh-completions
# ---------------------- Commands welcomming the user ------------------------

# A nice message from the one and only cow
#figlet gurk | cowsthink -ns
figlet "Gurk!" | cowthink -pn -T " U"

# --------------------------- Spaceship prompt --------------------------------
# Left normal prompt
SPACESHIP_PROMPT_ORDER=(
	jobs
	user
	host
	time
	dir
	char
)

# Prompt on right side
SPACESHIP_RPROMPT_ORDER=(
	venv
	git
)

# Settings for each spaceship feature
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
#
# Spaceship Prompt
autoload -U promptinit; promptinit
#prompt spaceship


# ------------------------ Smart last commands with up arrow ------------------
# Make up and down suggestions smarter. Matches last run command that starts the
# same way

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey -M vicmd "k" up-line-or-beginning-search # Up
bindkey -M vicmd "j" down-line-or-beginning-search # Down

# ----------------------- History ---------------------------------------------

setopt appendhistory
setopt HIST_IGNORE_DUPS
setopt HIST_VERIFY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY


setopt CORRECT
setopt CORRECT_ALL

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# History in cache directory:
HISTFILE=~/.zsh_history
HISTSIZE=1000000000
SAVEHIST=1000000000

# ----------------------- Completion ---------------------------------------------

# Always reload programs from path
zstyle ':completion:*' rehash true # Makes everything slow? Better way?

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Makes so that i do not have to type cd
setopt autocd
# ----------------------- Vim bindings ---------------------------------------------

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

# ---------------- Late /lazy loading of aliases and plugins -------------------

# Fzf-keybinds and completions
source $ZSH_CONFIG_DIR/fzf/shell/key-bindings.zsh
source $ZSH_CONFIG_DIR/fzf/shell/completion.zsh


if [ -f ~/.config/aliases ]; then
    . ~/.config/aliases
fi

path+=("$HOME/.bin")
export PATH
