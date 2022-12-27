#!/usr/bin/env bash

bwinit() {
	if [ -z ${BW_SESSION+x} ]; then
		echo "Unlock Bitwarden vault:"
		export BW_SESSION=`bw unlock --raw`
	else
		echo "Bitwarden vault is unlocked by BW_SESSION envvar"
	fi

	echo -n "Syncing vault..."
	bw sync
}
