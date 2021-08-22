#!/usr/bin/env zsh

# Use gpg-agent as my SSH agent.
gpgconf --launch gpg-agent
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
