# Reload zsh configuration.
alias reload!='. ~/.zshrc'

# Never actually delete anything. Move it to the Trash first.
alias stdrm='/usr/bin/rm'
alias rm='trash'

# Use bat instead of cat
alias stdcat='/bin/cat'
alias cat='bat --theme=Dracula'

# Run homebrew updates.
alias brewup='brew update && brew upgrade && brew cleanup'

# Play a sound.
alias boop='echo -e "\a\a\a"'

# lsd aliases
alias stdls='/bin/ls'
alias ls='lsd'
alias ll='lsd -la'