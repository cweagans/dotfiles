# Try to correct the spelling of commands.
setopt CORRECT

# Do parameter, command, and arithmetic expansion in prompts.
setopt PROMPT_SUBST

# Don't run background jobs at a lower priority.
setopt NO_BG_NICE

# Don't beep on ambiguous completions.
setopt NO_LIST_BEEP

# Be more generous about how completion is done with respect to cursor positioning.
setopt COMPLETE_IN_WORD

# Do not exit on EOF.
setopt IGNORE_EOF

# Prevent aliases from being internally substituted before completion is attempted.
setopt COMPLETE_ALIASES

# Prevent the delete key from outputting a ~ instead of doing a forward delete.
# Credit: https://pilif.github.io/2004/10/delete-key-in-zsh/
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# Comments should work as expected in interactive mode.
setopt INTERACTIVECOMMENTS

# Enable direnv.
znap eval direnv "direnv hook zsh"

# Set up zoxide.
# eval $(zoxide init zsh --cmd cd)
znap eval zoxide "zoxide init zsh --cmd cd"
