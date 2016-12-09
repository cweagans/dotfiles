# Set up the fpath to read from our functions dir.
typeset -U fpath
fpath+=(~/.config/zsh/functions)

# Tell zsh to autoload functions.
autoload -U $HOME/.config/zsh/functions/*(:t)
