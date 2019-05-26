#!/usr/bin/env bash

##
# Shows count of queued outgoing messages.
##

echo "📤`ls ~/.local/share/mail.queue | wc -l`"

echo "---"
echo "Refresh... | refresh=true"
