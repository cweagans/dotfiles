#!/usr/bin/env bash

# Add zsh to /etc/shells if it's not already there.
if grep -xq "/usr/local/bin/zsh" /etc/shells ; then
	echo "Homebrew-installed zsh is already in /etc/shells."
else
	sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
fi

# @TODO: Only do this if $SHELL != zsh
chsh -s /usr/local/bin/zsh

