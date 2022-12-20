#!/bin/zsh

if [[ "$(uname)" == "Darwin" ]]; then
	# Install Homebrew.
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Setup Homebrew envvars.
	eval $(/usr/local/bin/brew shellenv)

	# Install chezmoi.
	brew install chezmoi

	# Bootstrap environment (will prompt for values in chezmoi config).
	chezmoi init --apply --verbose https://github.com/cweagans/dotfiles.git

	# Fix git remote for dotfiles repo.
	git -C $(chezmoi source-path) remote set-url origin git@github.com:cweagans/dotfiles.git
fi
