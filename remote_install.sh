#!/bin/zsh

if [[ "$(uname)" == "Darwin" ]]; then
	# Install Homebrew.
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Setup Homebrew envvars.
	eval $(/usr/local/bin/brew shellenv)

	# Install chezmoi and Bitwarden CLI (for secret storage).
	brew install bitwarden-cli chezmoi

	# Set up Bitwarden session so that Chezmoi has access.
	echo "Login to Bitwarden:"
	while ! bw login --check > /dev/null 2>&1; do
		bw login
	done
	export BW_SESSION="$(bw unlock --raw)"

	# Bootstrap environment (will prompt for values in chezmoi config).
	chezmoi init --apply --verbose https://github.com/cweagans/dotfiles.git

	# Fix git remote for dotfiles repo.
	git -C $(chezmoi source-path) remote set-url origin git@github.com:cweagans/dotfiles.git

	# Clear Bitwarden session.
	unset BW_SESSION
fi
