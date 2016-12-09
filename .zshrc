# Inspired by zsh config in github.com/holman/dotfiles

# Your project folder that we can `c [tab]` to
export PROJECTS=~/Code

# Stash any private configuration details in ~/.localrc to keep them out of the
# dotfiles repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# Set the NULL_GLOB option so that we don't get any errors in the event that there
# are no matches for any of the following globs.
setopt NULL_GLOB

# Use the nicer extended_glob functionality here.
setopt EXTENDED_GLOB

# Initialize autocomplete.
autoload -U compinit
compinit

# Load conf files (basically anything that doesn't modify $PATH or set up completions).
for file in ~/.config/zsh/conf/***/*.zsh
do
  source $file
done

# Unset NULL_GLOB, as that behavior is generally undesirable.
unsetopt NULL_GLOB
