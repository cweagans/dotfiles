# $PATH shouldn't be set in this file. See ~/.config/yadm/scripts/mac-paths.sh

# The basics.
export EDITOR="nova -w"
export GOPATH=~/Code/go

# Standard XDG stuff since it's not set on macOS.
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# sd configuration options
export SD_CAT=bat
export SD_ROOT=~/Code/sd

# Add a newline in the Geometry prompt
GEOMETRY_PROMPT=(geometry_newline $GEOMETRY_PROMPT)

# Homebrew vars
export HOMEBREW_PREFIX="/usr/local"
export HOMEBREW_CELLAR="/usr/local/Cellar"
export HOMEBREW_REPOSITORY="/usr/local/Homebrew"
export MANPATH="/usr/local/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/usr/local/share/info:${INFOPATH:-}"