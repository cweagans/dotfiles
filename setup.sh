#!/bin/sh

# Install dependencies
brew install offlineimap sqlite mutt w3m msmtp khal

cd ~
[ -d ~/Mail ] || mkdir ~/Mail
[ -d ~/.mutt ] || mkdir -p ~/.mutt/alias ~/.mutt/cache/headers ~/.mutt/cache/bodies ~/.mutt/certificates ~/.mutt/mailcap ~/.mutt/temp ~/.mutt/sig
[ -e ~/.offlineimaprc ] || ln -s ~/.dotfiles/offlineimaprc ~/.offlineimaprc
[ -e ~/.muttrc ] || ln -s ~/.dotfiles/muttrc ~/.muttrc
[ -e ~/.msmtprc ] || ln -s ~/.dotfiles/msmtprc ~/.msmtprc
[ -e ~/.gitconfig ] || ln -s ~/.dotfiles/gitconfig ~/.gitconfig
[ -e ~/.gitignore_global ] || ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
[ -e ~/Library/LaunchAgents/homebrew.mxcl.offline-imap.plist ] || ln -sf /usr/local/opt/offline-imap/homebrew.mxcl.offline-imap.plist ~/Library/LaunchAgents
[ -d ~/.khal ] || mkdir ~/.khal
[ -e ~/.khal/khal.conf ] || ln -s ~/.dotfiles/khal.conf ~/.khal/khal.conf
[ -d ~/.dotfiles/vdirsyncer_env ] || virtualenv ~/.dotfiles/vdirsyncer_env
[ -e ~/.dotfiles/vdirsyncer_env/bin/vdirsyncer ] || ~/.dotfiles/vdirsyncer_env/bin/pip install git+git://github.com/untitaker/vdirsyncer.git
[ -d ~/.vdirsyncer ] || mkdir ~/.vdirsyncer
[ -e ~/.vdirsyncer/config ] || ln -s ~/.dotfiles/vdirsyncer_config ~/.vdirsyncer/config

