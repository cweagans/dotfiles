# Set up bash completion from Homebrew.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Use macvim for commit messages.
export EDITOR='/usr/local/bin/mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

# Add Composer to $PATH.
export PATH=$PATH:/Users/cweagans/.composer/vendor/bin

# Download my Vagrantfile and drop it into the project.
alias vagrantify='wget https://gist.githubusercontent.com/cweagans/4e879a72985905e145df/raw/94472146e8976a19cdd11d07e740b89b7a883e8a/Vagrantfile'

# Don't try to get the remote status. Git handles `git push` just fine even if it's not needed.
export GIT_PROMPT_FETCH_REMOTE_STATUS=0

# Source Bash Git Prompt.
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
