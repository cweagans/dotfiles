export GOPATH=~/Code/go
export EDITOR="gvim -f"

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

if [[ -x "$(which launchctl)" ]]
then
	launchctl setenv XDG_CACHE_HOME $XDG_CACHE_HOME
	launchctl setenv XDG_CONFIG_HOME $XDG_CONFIG_HOME
	launchctl setenv XDG_DATA_HOME $XDG_DATA_HOME
fi

# Auto-$PATH.
for dir in /usr/local/bin $HOME/bin $HOME/.config/composer/vendor/bin $GOPATH/bin
do
	# @TODO: Check to see if $dir is already in $PATH first.
	if [ -e $dir ]; then
		export PATH=$dir:$PATH
	fi
done
