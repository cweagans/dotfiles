#!/usr/bin/env bash

# First, install the easy packages.

## The basics
pacman -S --needed base-devel
pacman -S sudo git openssh zsh wget

## Gnome and desktop-ish stuff
pacman -S gnome networkmanager network-manager-applet gnome-tweak-tool gedit gnome-calendar deja-dup

## Ansible
pacman -S python-pip ansible

## Smartcard support
pacman -S ccid pcsclite

## Printing
pacman -S cups hplip

## Steam
## @TODO: Automate enabling multilib?
#pacman -S steam steam-native-runtime   # Requires multilib



# Next, enable some services that we need for a functional install.
systemctl enable NetworkManager
systemctl enable gdm
systemctl enable pcscd
systemctl enable org.cups.cupsd.service




# Install AUR packages. Sigh.

## Prep /usr/src.
chmod g+w /usr/src
chown root:wheel /usr/src

## Install packages.
for PACKAGE in dropbox enpass-bin intellij-idea-ultimate-edition google-chrome-beta chrome-gnome-shell-git spotify terraform zoom
do
  git clone https://aur.archlinux.org/$PACKAGE.git
  pushd /usr/src/$PACKAGE
    makepkg -si
  popd
done



# TODO:

# Kill ssh keyring functionality: https://wiki.archlinux.org/index.php/GNOME/Keyring#Disable_keyring_daemon_components
# Download hp proprietary plugin for printer: hp-plugin -i
# Enable multilib in /etc/pacman.conf for steam
# Enable wheel in /etc/sudoers

# Install and configure GNOME extensions:
# * https://extensions.gnome.org/extension/517/caffeine/
# * https://extensions.gnome.org/extension/1015/gravatar/
# * https://extensions.gnome.org/extension/750/openweather/
# * https://extensions.gnome.org/extension/307/dash-to-dock/
# * https://extensions.gnome.org/extension/19/user-themes/
