#!/bin/zsh

if [[ "$(uname)" == "Darwin" ]]; then
	# Install Homebrew if needed.
	if ! type "brew" > /dev/null 2>&1; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	# Setup Homebrew envvars.
	if [[ $(arch) == "arm64" ]]; then
		eval $(/opt/homebrew/bin/brew shellenv)
	fi
	if [[ $(arch) == "i386" ]]; then
		eval $(/usr/local/bin/brew shellenv)
	fi

	# If needed, install chezmoi, 1Password, and 1Password CLI (for secret storage).
	brew install --cask 1password 1password-cli
	brew install chezmoi

	echo "Open 1Password, log in, and unlock the Eagans vault."
	echo "In Settings -> Developer, check 'Connect with 1Password CLI'."
	echo "In another Terminal window, make sure you can run \"op read 'op://Chezmoi/Home WiFi/username'\" before continuing."
	echo "Press enter to continue."
	read

	# Bootstrap environment (will prompt for values in chezmoi config).
	chezmoi init --apply --verbose https://github.com/cweagans/dotfiles.git

	# Fix git remote for dotfiles repo.
	git -C $(chezmoi source-path) remote set-url origin git@github.com:cweagans/dotfiles.git
fi
