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

# This is needed for yadm encrypt to work on mac for some reason?
# https://github.com/TheLocehiliosan/yadm/issues/33#issuecomment-274167682
export GPG_TTY=$(tty)

# Add a newline in the Geometry prompt
GEOMETRY_PROMPT=(geometry_newline $GEOMETRY_PROMPT)
