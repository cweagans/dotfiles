# $PATH shouldn't be set in this file. See ~/.local/share/chezmoi/.chezmoiscripts/darwin/run_once_paths.sh.tmpl

# The basics.
export EDITOR=nvim
export GOPATH=~/Developer/go

# Standard XDG stuff since it's not set on macOS.
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# sd configuration options
export SD_CAT=bat
export SD_ROOT=~/.config/sd

# set imapfilter root
export IMAPFILTER_HOME=~/.config/imapfilter

# Set up 1Password SSH agent
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Add a newline in the Geometry prompt
export GEOMETRY_PROMPT=(geometry_newline $GEOMETRY_PROMPT)

# Configure the Geometry prompt
export GEOMETRY_PROMPT_PLUGINS=(exec_time git kube hostname)

# Configure fzf colors
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Homebrew vars
znap eval brew "brew shellenv | grep -v ' PATH='"

# Dracula colors for man pages
# TODO: Replace this with Catppuccin
export MANPAGER="/usr/bin/less -s -M +Gg"
export LESS_TERMCAP_mb=$'\e[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\e[1;34m'      # begin blink
export LESS_TERMCAP_so=$'\e[01;45;37m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[01;36m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'         # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'         # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'         # reset underline
export GROFF_NO_SGR=1                   # for konsole

# Make homebrew zsh completions available.
if type brew &>/dev/null; then
  export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
