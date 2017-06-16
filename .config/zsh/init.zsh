# Install zgen if it's not already present.
if [[ ! -e ~/.config/zsh/zgen ]]; then
	git clone https://github.com/tarjoilija/zgen.git ~/.config/zsh/zgen
fi

export ZGEN_DIR=~/.config/zsh/zgen
source ~/.config/zsh/zgen/zgen.zsh

if ! zgen saved; then
	# Prompt
	zgen load mafredri/zsh-async
	zgen load sindresorhus/pure

	# Jump to project directories.
	zgen load cweagans/c
	
	# Awesome file listing
	zgen load supercrabtree/k

	# Autoset env when cd'ing into a directory
	zgen load Tarrasch/zsh-autoenv

	# Misc completion
	zgen load zsh-users/zsh-completions


	# Write zgen's init.zsh
	zgen save
fi

source ~/.config/zsh/conf/*.zsh
