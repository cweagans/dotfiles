# Reload zsh configuration.
alias reload!='. ~/.zshrc'

# Never actually delete anything. Move it to the Trash first.
alias stdrm='/usr/bin/rm'
alias rm='/opt/homebrew/bin/trash'

# Use bat instead of cat
alias stdcat='/bin/cat'
alias cat='bat --theme=Catppuccin-mocha'

# Run homebrew updates.
alias brewup='brew update && brew upgrade && brew cleanup'

# Play a sound.
alias boop='echo -e "\a\a\a"'

# lsd aliases
alias stdls='/bin/ls'
alias ls='lsd'
alias ll='lsd -la'

# date aliases
alias stddate='/bin/date'
alias date='/opt/homebrew/opt/coreutils/libexec/gnubin/date'

# Why waste time say lot word when few word do trick
alias c='cd'

# Use the homebrew sqlite3
alias sqlite3='/opt/homebrew/opt/sqlite/bin/sqlite3'

# Automatically register sd command aliases defined in sd scripts.
# Credit: https://github.com/ianthehenry/sd/issues/20#issuecomment-1867261771
if command -v rg > /dev/null; then
  pushd $SD_ROOT > /dev/null
  eval $(rg '^# Alias:' --with-filename --no-heading --no-line-number | sed -E -e 's|/| |g' -e 's/([^:]+):# Alias: (.+)/alias \2="sd \1"/')
  popd > /dev/null
fi
