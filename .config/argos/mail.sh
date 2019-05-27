#!/usr/bin/env bash

##
# Shows total unread messages in Gnome top bar + a breakdown of each mailbox.
##

echo "📥`find ~/.cache/mail/*/Inbox/{new,cur}/ -type f | wc -l`  📤`ls ~/.local/share/mail.queue | wc -l`"
echo "---"
for d in ~/.cache/mail/*/; do
    echo "`basename $d`: `find $d/Inbox/{new,cur}/ -type f | wc -l`"
done
echo "Outbox: `ls ~/.local/share/mail.queue | wc -l`"
echo "---"
echo "Refresh... | refresh=true"
