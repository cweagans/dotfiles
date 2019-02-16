#!/usr/bin/env bash

if [ `date +"%H"` -lt 18 ] && [ `date +"%H"` -ge 07 && [ `date +"%u"` != 6 ] && [ `date +"%u"` != 7 ]; then
    echo 'source ~/.config/mutt/accounts/digitaldeployment.muttrc'
else
    echo 'source ~/.config/mutt/accounts/gmail.muttrc'
fi
