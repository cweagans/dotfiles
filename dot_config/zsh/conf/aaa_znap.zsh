# Install znap if it's not already present.
if [[ ! -e ~/.config/zsh/znap ]]; then
  git clone https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/znap
fi

source ~/.config/zsh/znap/znap.zsh
zstyle ':znap:*' repos-dir ~/.config/zsh/plugins

# Git flow completions
znap source bobthecow/git-flow-completion

# vi mode
znap source jeffreytse/zsh-vi-mode

# Tab titles
znap source jreese/zsh-titles

# Tailscale CLI completions
znap source HeroesLament/zsh-tailscale-plugin

# Ian Henry's "script directory" tool
znap source ianthehenry/sd

# Powerlevel10k prompt
znap source romkatv/powerlevel10k

# 1password op cli completions
znap source unixorn/1password-op.plugin.zsh

# Misc completions
znap source zsh-users/zsh-completions

# Syntax highlighting
znap source zsh-users/zsh-syntax-highlighting

