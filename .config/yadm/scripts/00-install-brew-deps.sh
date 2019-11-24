#!/usr/bin/env bash

# This file is prefaced with "00-" to ensure that it's executed first on a new install.
# Other scripts in this directory depend on Brew dependencies being available, so it's
# important that this behavior not be changed.

echo " -> Installing Homebrew/Mac App Store dependencies"
brew bundle --file=~/.Brewfile
