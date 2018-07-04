#!/usr/bin/env bash

if [ "$SHELL" != "/bin/zsh" ]; then
	chsh -s /bin/zsh
else
	echo " ---> The current user's shell is already set to /bin/zsh "
fi
