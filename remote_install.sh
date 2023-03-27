#!/bin/zsh

if [[ "$(uname)" == "Darwin" ]]; then
	# Install Homebrew.
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Setup Homebrew envvars.
	if [[ $(arch) == "arm64" ]]; then
		eval $(/opt/homebrew/bin/brew shellenv)
	fi
	if [[ $(arch) == "i386" ]]; then
		eval $(/usr/local/bin/brew shellenv)
	fi

	# Install chezmoi and Bitwarden CLI (for secret storage).
	brew install bitwarden-cli chezmoi

	# Bootstrap environment (will prompt for values in chezmoi config).
	chezmoi init --apply --verbose https://github.com/cweagans/dotfiles.git

	# Fix git remote for dotfiles repo.
	git -C $(chezmoi source-path) remote set-url origin git@github.com:cweagans/dotfiles.git

	# Clear Bitwarden session.
	unset BW_SESSION
fi
