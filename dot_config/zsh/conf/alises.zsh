# Reload zsh configuration.
alias reload!='. ~/.zshrc'

# Never actually delete anything. Move it to the Trash first.
alias stdrm='/usr/bin/rm'
alias rm='trash'

# Use bat instead of cat
alias stdcat='/bin/cat'
alias cat='bat'

# Add yubikey to ssh-agent.
alias yk="ssh-add -s /usr/local/lib/opensc-pkcs11.so"
