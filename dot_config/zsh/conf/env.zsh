# $PATH shouldn't be set in this file. See ~/.local/share/chezmoi/.chezmoiscripts/darwin/run_once_paths.sh.tmpl

# The basics.
export EDITOR=vim
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

# Configure cweagans/c
export PROJECTS=~/Developer

# Add a newline in the Geometry prompt
GEOMETRY_PROMPT=(geometry_newline $GEOMETRY_PROMPT)

# Homebrew vars
export HOMEBREW_PREFIX="$(brew --prefix)"
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"

# Dracula colors for man pages
export MANPAGER="/usr/bin/less -s -M +Gg"
export LESS_TERMCAP_mb=$'\e[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\e[1;34m'      # begin blink
export LESS_TERMCAP_so=$'\e[01;45;37m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[01;36m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'         # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'         # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'         # reset underline
export GROFF_NO_SGR=1                   # for konsole

