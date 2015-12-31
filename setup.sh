#!/bin/sh

# Install email and calendar shit.
brew install offlineimap sqlite mutt w3m msmtp khal

# Install a modern bash and other misc stuff.
brew install bash git-hooks

# Append the brew-installed bash to /etc/shells if it's not already there.
if ![ $(grep -xq "/usr/local/bin/bash" /etc/shells) ];
then
    echo "/usr/local/bin/bash" | sudo tee -a /etc/shells > /dev/null
fi

# Change the shell to the brew-installed Bash.
chsh -s /usr/local/bin/bash

# Link all the things.
cd ~
[ -d ~/Mail ] || mkdir ~/Mail
[ -e ~/.bash_profile ] || ln -s ~/.dotfiles/bash_profile ~/.bash_profile
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

