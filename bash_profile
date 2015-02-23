export PASSWORD_STORE_DIR=/Users/cweagans/Dropbox/Workspace/.pass

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export EDITOR='/usr/local/bin/mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

export PATH=$PATH:/Users/cweagans/.composer/vendor/bin

alias vagrantify='wget https://gist.githubusercontent.com/cweagans/4e879a72985905e145df/raw/94472146e8976a19cdd11d07e740b89b7a883e8a/Vagrantfile'
