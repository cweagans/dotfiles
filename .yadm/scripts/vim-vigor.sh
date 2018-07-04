#!/usr/bin/env bash

[ -d ~/.config/nvim ] || git clone git@github.com:vim-vigor/vigor.git ~/.config/nvim
for p in language-prose vigor-ui linting git language-go language-vim completion defaults; do
	echo " ---> Ensuring that the ${p} layer is installed."
	[ -d ~/.config/nvim/layers/${p} ] || git clone git@github.com:vim-vigor/${p}.git ~/.config/nvim/layers/${p}
done
