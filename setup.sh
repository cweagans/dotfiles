#!/bin/sh

# Install dependencies
brew install offlineimap sqlite mutt contacts msmtp

cd ~
[ -d ~/.mail ] || mkdir ~/.mail
[ -d ~/.mutt ] || mkdir -p ~/.mutt/alias ~/.mutt/cache/headers ~/.mutt/cache/bodies ~/.mutt/certificates ~/.mutt/mailcap ~/.mutt/temp ~/.mutt/sig
[ -e ~/.offlineimaprc ] || ln -s ~/dotfiles/offlineimaprc ~/.offlineimaprc
[ -e ~/.muttrc ] || ln -s ~/dotfiles/muttrc ~/.muttrc
[ -e ~/.msmtprc ] || ln -s ~/dotfiles/msmtprc ~/.msmtprc
[ -e ~/.gitconfig ] || ln -s ~/dotfiles/gitconfig ~/.gitconfig
[ -e ~/.gitignore_global ] || ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
[ -e ~/.bash_profile ] || ln -s ~/dotfiles/bash_profile ~/.bash_profile
[ -e ~/Library/LaunchAgents/offlineimap-quickfetch.plist ] || ln -s ~/dotfiles/offlineimap-quickfetch.plist ~/Library/LaunchAgents/offlineimap-quickfetch.plist

