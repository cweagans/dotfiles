# Decide if the last command matches a given pattern.
check_last_command() {
  if [[ ! -z "$SKIP_HOOKS" ]]; then
    return 1
  fi

  local trigger_pattern=$1
  local prev_cmd=$history[$[HISTCMD-1]]

  # Trigger the hook (and exclude common help flags so we're not running things too eagerly).
  if [[ $prev_cmd =~ "$trigger_pattern " ]] && \
     [[ ! $prev_cmd =~ "--help" ]] && \
     [[ ! $prev_cmd =~ "-h" ]]; then
    return 0
  fi

  return 1
}

# When new ghq projects are pulled, index them in zoxide.
after_new_ghq_project() {
  if check_last_command "ghq get"; then
    sd index-projects
  fi
}

# Register the hooks.
autoload -Uz add-zsh-hook
add-zsh-hook precmd after_new_ghq_project

