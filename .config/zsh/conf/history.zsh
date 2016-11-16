# Save input history to ~/.zsh_history.
HISTFILE=~/.zsh_history

# HISTSIZE: Number of lines to read from $HISTFILE at the start of an interactive
# session.
HISTSIZE=10000

# SAVEHIST: Number of lines (counted from the end) from a session to write to
# $HISTFILE when the session ends.
SAVEHIST=10000

# When using !!, make the line appear again with changes and force confirmation.
setopt HIST_VERIFY

# Share history between sessions.
setopt SHARE_HISTORY

# Log the command, when it was started, and how long it ran for.
setopt EXTENDED_HISTORY

# Append history to $HISTFILE instead of overwriting everything.
setopt APPEND_HISTORY

# Append history as execution happens, rather than at the end of a session.
setopt INC_APPEND_HISTORY

# Don't record the same command more than once.
setopt HIST_IGNORE_ALL_DUPS

# Tidy up lines before entering them into history by removing excess blanks.
setopt HIST_REDUCE_BLANKS
