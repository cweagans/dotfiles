# Install zgenom if it's not already present.
if [[ ! -e ~/.config/zsh/zgenom ]]; then
	git clone https://github.com/jandamm/zgenom.git ~/.config/zsh/zgenom
fi

export ZGENOM_DIR=~/.config/zsh/zgenom
source ~/.config/zsh/zgenom/zgenom.zsh

if ! zgenom saved; then
	# Geometry prompt
	zgenom load geometry-zsh/geometry

	# Jump to project directories.
	zgenom load cweagans/c

	# Autoset env when cd'ing into a directory
	zgenom load Tarrasch/zsh-autoenv

	# Misc completion
	zgenom load zsh-users/zsh-completions

	# Write zgenom's init.zsh
	zgenom save
fi

for file in ~/.config/zsh/conf/***/*.zsh;
do
	source $file
done
