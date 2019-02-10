#!/usr/bin/env bash

##
# Shows total unread messages in Gnome top bar + a breakdown of each mailbox.
##

echo "📥 `find ~/.cache/mail/*/Inbox/new/ -type f | wc -l`"
echo "---"
for d in ~/.cache/mail/*/; do
    echo "`basename $d`: `find $d/Inbox/new/ -type f | wc -l`"
done
