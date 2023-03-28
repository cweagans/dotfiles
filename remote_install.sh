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

	# If needed, install chezmoi and Bitwarden CLI (for secret storage).
	if ! type "bw" > /dev/null 2>&1; then
		brew install bitwarden-cli
	fi
	if ! type "chezmoi" > /dev/null 2>&1; then
		brew install chezmoi
	fi

	# Login to Bitwarden
	if [ -z ${BW_SESSION+x} ]; then
		echo "Login to Bitwarden:"
		export BW_SESSION=`bw login --raw`
	else
		echo "Bitwarden vault is unlocked by BW_SESSION envvar"
	fi

	# Bootstrap environment (will prompt for values in chezmoi config).
	chezmoi init --apply --verbose https://github.com/cweagans/dotfiles.git

	# Fix git remote for dotfiles repo.
	git -C $(chezmoi source-path) remote set-url origin git@github.com:cweagans/dotfiles.git
fi
