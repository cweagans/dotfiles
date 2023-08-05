# $PATH shouldn't be set in this file. See ~/.local/share/chezmoi/.chezmoiscripts/darwin/run_once_paths.sh.tmpl

# The basics.
export EDITOR=vim
export GOPATH=~/Developer/go

# Standard XDG stuff since it's not set on macOS.
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# sd configuration options
export SD_CAT=bat
export SD_ROOT=~/.config/sd

# Set up 1Password SSH agent
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Configure cweagans/c
export PROJECTS=~/Developer

# Add a newline in the Geometry prompt
GEOMETRY_PROMPT=(geometry_newline $GEOMETRY_PROMPT)

# Homebrew vars
export HOMEBREW_PREFIX="$(brew --prefix)"
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"
