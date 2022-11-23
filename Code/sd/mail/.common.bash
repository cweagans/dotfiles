#!/usr/bin/env bash

export MAIL_ACCOUNTS=(Gmail Personal Agilesix Digitaldeployment Pineconegrove Netherwire Eagansfoundation)

export MAIL_ROOT="$HOME/Mail"
export MAIL_QUEUE="$MAIL_ROOT/Outbox"

export MSMTP_CONFIG="$HOME/.config/msmtp/config"

# Ensure mail dirs exist.
for d in "${MAIL_ACCOUNTS[@]}"; do
    [ -d "${MAIL_ROOT}/${d}" ] || mkdir -p "${MAIL_ROOT}/${d}"
done

# Ensure outbox exists
[ -d "$MAIL_QUEUE" ] || mkdir -p "$MAIL_QUEUE"
