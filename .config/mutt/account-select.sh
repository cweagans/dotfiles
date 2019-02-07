#!/usr/bin/env bash

if [ `date +"%H"` -lt 18 ] && [ `date +"%H"` -ge 07 ]; then
    echo 'set spoolfile = "+Digitaldeployment/Inbox"'
else
    echo 'set spoolfile = "+Gmail/Inbox"'
fi
