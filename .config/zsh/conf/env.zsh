export GOPATH=~/Code/go
export EDITOR="code --wait"

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

export PATH=$HOME/bin:$HOME/.config/composer/vendor/bin:$GOPATH/bin:$HOME/Code/npm/bin:$HOME/Code/flutter/bin:$PATH

# This is needed for yadm encrypt to work on mac for some reason?
# https://github.com/TheLocehiliosan/yadm/issues/33#issuecomment-274167682
export GPG_TTY=$(tty)
