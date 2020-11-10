#!/usr/bin/env bash

echo " -> Configuring mac settings"

echo "   - Disabling press and hold so that keys will repeat as expected"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
