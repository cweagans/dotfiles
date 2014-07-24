export PASSWORD_STORE_DIR=/Users/cweagans/Dropbox/Workspace/.pass

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

alias eclimd="/opt/homebrew-cask/Caskroom/eclipse-platform/4.4.0/eclipse/eclimd -b"

export EDITOR='/usr/local/bin/mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
