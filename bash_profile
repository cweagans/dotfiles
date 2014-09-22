export PASSWORD_STORE_DIR=/Users/cweagans/Dropbox/Workspace/.pass

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export EDITOR='/usr/local/bin/mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

export PATH=$PATH:/Users/cweagans/.composer/vendor/bin
