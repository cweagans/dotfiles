#!/usr/bin/env bash

# Index mail with notmuch.
notmuch new

# Notify on new mail.
ACCOUNT=$1
NEWMSGS=$(/bin/ls ~/Mail/$ACCOUNT/INBOX/new | wc -l)
if [ "$NEWMSGS" != "0" ]; then
	notify-send --app-name="OfflineIMAP" "New mail" "$NEWMSGS new messages in $ACCOUNT"
fi

