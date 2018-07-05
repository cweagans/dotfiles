#!/usr/bin/env bash

# If arch linux:
	# install pacman deps
	# install yay deps
	# make sure multilib is enabled to be able to install wine

packages="ansible arc-gtk-theme arc-icon-theme asciidoc blender composer cups dep docker feedreader firefox git go hub kitty libreoffice-fresh msmtp mutt neovim notmuch noto-fonts noto-fonts-cjk offlineimap pandoc pinta python-neovim sudo texlive-core trash-cli vlc w3m wget wine wine-mono wine_gecko xclip zsh"

aur_packages="ddev-bin dropbox kubernetes-helm kubernetes-kubectl neovim-gtk slack-desktop snowboard spotify ttf-input typora vale-bin yay-bin yadm-git zoom"

echo " ---> Updating package information"
sudo pacman -Sy

echo " ---> Installing/updating Arch packages"
sudo pacman -S $packages

echo " ---> Installing AUR packages"
yay -S $aur_packages
