# What i hate about shells: having to copy paste commit id:s and docker
# container id:s and
# Nice to fuzzy list shell variables and pid:s

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
#set -e fish_user_paths
#set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message

if status is-interactive && ! functions --query fisher
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
  mkdir -p ~/.config/fish/completions
  curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish > ~/.config/fish/completions/docker.fish
  arduino-cli completion fish > ~/.config/fish/completions/arduino-cli.fish
end


### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
end

function fish_mode_prompt; end


# set fish_cursor_default     block      blink
# set fish_cursor_insert      line       blink
# set fish_cursor_replace_one underscore blink
# set fish_cursor_visual      block


### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
# set fish_color_normal brcyan
# set fish_color_autosuggestion '#7d7d7d'
# set fish_color_command brcyan
# set fish_color_error '#ff6c6b'
# set fish_color_param brcyan


# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function vicd
  set dst (command vifm --choose-dir - $argv)
  if test -z "$dst"
    echo 'Directory picking cancelled/failed'
    return 1
	end
	cd $dst
end


function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end




### END OF FUNCTIONS ###

source ~/.zshenv




if status is-interactive
# Set vi cursor shape
  if set -q KITTY_INSTALLATION_DIR
      set --global KITTY_SHELL_INTEGRATION enabled
      source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
      set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
  end
  set fish_cursor_default block
  set fish_cursor_insert line
  set fish_cursor_replace_one underscore
  set fish_cursor_visual block
  bind yy fish_clipboard_copy
  bind Y fish_clipboard_copy
  bind p fish_clipboard_paste
  command -v nvim > /dev/null && export MANPAGER='nvim +Man!'
### "nvim" as manpager

  command -v nvim > /dev/null && command -v git > /dev/null &&
	  git config --global core.pager "nvim -R" && git config --global color.pager no
# The bindings for !! and !$
#if [ $fish_key_bindings = "fish_vi_key_bindings" ];
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
#else
    #bind ! __history_previous_command
    #bind '$' __history_previous_command_arguments
#end
    # Commands to run in interactive sessions can go here
  starship init fish | source

  #theme_gruvbox dark medium
  source ~/.config/aliases
  zoxide init fish | source
end

### SETTING THE STARSHIP PROMPT ###

