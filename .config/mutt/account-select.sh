#!/usr/bin/env bash

if [ `date +"%H"` -lt 18 ] && [ `date +"%H"` -ge 07 ]; then
    echo 'source ~/.config/mutt/accounts/digitaldeployment.muttrc'
else
    echo 'source ~/.config/mutt/accounts/gmail.muttrc'
fi
