#!/bin/sh

# Install dependencies
brew install offlineimap sqlite mutt w3m msmtp

cd ~
[ -d ~/Mail ] || mkdir ~/Mail
[ -d ~/.mutt ] || mkdir -p ~/.mutt/alias ~/.mutt/cache/headers ~/.mutt/cache/bodies ~/.mutt/certificates ~/.mutt/mailcap ~/.mutt/temp ~/.mutt/sig
[ -e ~/.offlineimaprc ] || ln -s ~/.dotfiles/offlineimaprc ~/.offlineimaprc
[ -e ~/.muttrc ] || ln -s ~/.dotfiles/muttrc ~/.muttrc
[ -e ~/.msmtprc ] || ln -s ~/.dotfiles/msmtprc ~/.msmtprc
[ -e ~/.gitconfig ] || ln -s ~/.dotfiles/gitconfig ~/.gitconfig
[ -e ~/.gitignore_global ] || ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
[ -e ~/Library/LaunchAgents/offlineimap-quickfetch.plist ] || ln -s ~/.dotfiles/offlineimap-quickfetch.plist ~/Library/LaunchAgents/offlineimap-quickfetch.plist
