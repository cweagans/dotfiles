export GOPATH=~/Code/go
export EDITOR="gvim -f"

# Auto-$PATH.
for dir in /usr/local/bin $HOME/bin $HOME/.config/composer/vendor/bin $GOPATH/bin
do
	# @TODO: Check to see if $dir is already in $PATH first.
	if [ -e $dir ]; then
		export PATH=$dir:$PATH
	fi
done
