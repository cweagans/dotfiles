export GOPATH=~/Code/go
export EDITOR="nvim"

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# $PATH shouldn't be set in this file. See ~/.config/yadm/scripts/mac-paths.sh

# This is needed for yadm encrypt to work on mac for some reason?
# https://github.com/TheLocehiliosan/yadm/issues/33#issuecomment-274167682
export GPG_TTY=$(tty)
