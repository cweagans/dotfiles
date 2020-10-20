#!/usr/bin/env bash

echo " -> Configuring mac launchd"

echo "   - Setting up mac-env to sync mac environment vars with term env"
launchctl load ~/Library/LaunchAgents/osx-env.plist

# Since we're setting envvars through launchctl, we need to restart Finder
# and then Alfred to ensure that the env changes trickle down. This will
# need to be done whenever the env vars change.
killall Finder
killall Alfred
echo " -> WARNING: Alfred has been stopped. You'll need to manually start it from Finder."
