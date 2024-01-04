# $PATH shouldn't be set in this file. See ~/.local/share/chezmoi/.chezmoiscripts/darwin/run_once_paths.sh.tmpl

# The basics.
export EDITOR=nvim
export GOPATH=~/Developer/go

# Standard XDG stuff since it's not set on macOS.
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# sd configuration options
export SD_CAT=bat
export SD_ROOT=~/.config/sd

# set imapfilter root
export IMAPFILTER_HOME=~/.config/imapfilter

# Set up 1Password SSH agent
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Add a newline in the Geometry prompt
export GEOMETRY_PROMPT=(geometry_newline $GEOMETRY_PROMPT)

# Configure the Geometry prompt
export GEOMETRY_PROMPT_PLUGINS=(exec_time git kube hostname)

# Configure fzf colors
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Homebrew vars
znap eval brew "brew shellenv | grep -v ' PATH='"

# Make homebrew zsh completions available.
if type brew &>/dev/null; then
  export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
