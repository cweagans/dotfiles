#!/usr/bin/env zsh

# If ssh-agent isn't running but the pid file exists, clean it up.
if ! pgrep ssh-agent >> /dev/null; then
  [ -e "~/.ssh/agent.pid" ] && rm ~/.ssh/agent.pid
  [ -e "~/.ssh/agent.sock" ] && rm ~/.ssh/agent.sock
fi

if [ ! -S "~/.ssh/agent.sock" ] || [ ! -e "~/.ssh/agent.pid" ]; then
    # Just in case.
    killall ssh-agent >> /dev/null 2>&1

    # Start the homebrew-installed ssh-agent.
    eval $(/usr/local/bin/ssh-agent -a ~/.ssh/agent.sock) >> /dev/null

    # Write the PID out to a file.
    echo $SSH_AGENT_PID > ~/.ssh/agent.pid
else
    # Set up envvars.
    export SSH_AGENT_PID=$(cat ~/.ssh/agent.pid)
    export SSH_AUTH_SOCK=~/.ssh/agent.sock
fi

alias yk="ssh-add -s /usr/local/lib/opensc-pkcs11.so"
