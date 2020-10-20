export GOPATH=~/Code/go
export EDITOR="nvim"

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# If our $PATH doesn't already include composer, then we need to set it manually.
# This file is executed on startup by launchd to set the environment for all GUI
# applications as well, so it's important that this is done conditionally so that
# the path on the terminal doesn't double-set the path.
if [[ "$PATH" != *"composer"* ]]; then
	export PATH=$HOME/bin:$HOME/.config/composer/vendor/bin:$GOPATH/bin:$HOME/Code/npm/bin:$HOME/Code/flutter/bin:$PATH
	export PATH=/usr/local/opt/mysql-client/bin:$PATH
	export PATH=/usr/local/opt/llvm/bin:$PATH
fi

# This is needed for yadm encrypt to work on mac for some reason?
# https://github.com/TheLocehiliosan/yadm/issues/33#issuecomment-274167682
export GPG_TTY=$(tty)
