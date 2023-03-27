# $PATH shouldn't be set in this file. See ~/.config/yadm/scripts/mac-paths.sh

# The basics.
export EDITOR=vim
export GOPATH=~/Code/go

# Standard XDG stuff since it's not set on macOS.
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# sd configuration options
export SD_CAT=bat
export SD_ROOT=~/.config/sd

# Set up SSH agent
export SSH_AUTH_SOCK=~/.ssh/agent.sock

# Add a newline in the Geometry prompt
GEOMETRY_PROMPT=(geometry_newline $GEOMETRY_PROMPT)

# Homebrew vars
export HOMEBREW_PREFIX="$(brew --prefix)"
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"
