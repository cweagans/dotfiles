#!/usr/bin/env bash

# If arch linux:
	# install pacman deps
	# install yay deps
	# make sure multilib is enabled to be able to install wine

# todo: remove kitty once alacritty is configured.
packages="ansible arc-gtk-theme arc-icon-theme asciidoc blender composer cups dep docker feedreader firefox git go hub khal khard kitty libreoffice-fresh msmtp mutt neovim notmuch noto-fonts noto-fonts-cjk offlineimap pandoc pinta python python-neovim python-pip sudo texlive-core trash-cli vdirsyncer vlc w3m wget wine wine-mono wine_gecko xclip zsh"

aur_packages="alacritty-git ddev-bin discord dropbox intellij-idea-ultimate-edition intellij-idea-ultimate-edition-jre keybase-bin kubernetes-helm kubectl-bin neovim-gtk slack-desktop spotify ttf-input ttf-symbola typora vale-bin visual-studio-code-bin yay-bin yadm-git zazu-bin zoom"

python_packages="vint"

echo " ---> Updating package information"
sudo pacman -Sy

echo " ---> Installing Arch packages"
sudo pacman -S --needed $packages

echo " ---> Installing AUR packages"
yay -S $aur_packages

echo " ---> Installing Python packages"
pip install vim-vint

echo " ---> Installing vscode packages"
code --install-extension bbenoist.vagrant
code --install-extension dracula-theme.theme-dracula
code --install-extension EditorConfig.EditorConfig
code --install-extension GitHub.vscode-pull-request-github
code --install-extension humao.rest-client
code --install-extension lextudio.restructuredtext
code --install-extension mikestead.dotenv
code --install-extension ms-vscode.Go
code --install-extension redhat.vscode-yaml
code --install-extension slevesque.vscode-hexdump
code --install-extension vscodevim.vim
code --install-extension vscoss.vscode-ansible
code --install-extension wholroyd.jinja

echo " ---> Making sure that khard/khal/vdirsyncer have work dirs"
[ -d ~/.cache/vdirsyncer ] || mkdir ~/.cache/vdirsyncer
