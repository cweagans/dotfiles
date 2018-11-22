#!/usr/bin/env bash

# If arch linux:
	# install pacman deps
	# install yay deps
	# make sure multilib is enabled to be able to install wine

# todo: remove kitty once alacritty is configured.
packages="alacritty ansible arc-gtk-theme arc-icon-theme asciidoc blender composer cups dep docker feedreader firefox git go hub kitty libreoffice-fresh msmtp mutt neovim notmuch noto-fonts noto-fonts-cjk offlineimap pandoc pinta python python-neovim python-pip sudo texlive-core trash-cli vdirsyncer vlc w3m wget xclip zsh"

aur_packages="bitwarden-bin bitwarden-cli ddev-bin discord-canary dropbox keybase-bin kubernetes-helm kubectl-bin slack-desktop spotify ttf-input ttf-symbola typora vale-bin visual-studio-code-bin yay yadm-git zoom"

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
code --install-extension PeterJausovec.vscode-docker
code --install-extension redhat.vscode-yaml
code --install-extension slevesque.vscode-hexdump
code --install-extension sourcegraph.sourcegraph
code --install-extension vscodevim.vim
code --install-extension vscoss.vscode-ansible
code --install-extension wholroyd.jinja

echo " ---> Making sure that khard/khal/vdirsyncer have work dirs"
[ -d ~/.cache/vdirsyncer ] || mkdir ~/.cache/vdirsyncer
