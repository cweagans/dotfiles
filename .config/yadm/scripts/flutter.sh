#!/usr/bin/env bash

echo " -> Installing flutter"

curl --silent -O https://storage.googleapis.com/flutter_infra/releases/releases_macos.json
releaseURL=$(cat releases_macos.json | jq -r '"https://storage.googleapis.com/flutter_infra/releases/" + [.releases[] | select(.archive | startswith("stable"))][0].archive')
releaseVersion=$(cat releases_macos.json | jq -r '[.releases[] | select(.archive | startswith("stable"))][0].version')

echo " --> Downloading flutter version ${releaseVersion}"
[ -d ~/Code ] || mkdir ~/Code
curl -o ~/Code/flutter.zip $releaseURL
pushd ~/Code
    unzip flutter.zip
popd

echo " --> Cleaning up downloaded data"
rm releases_macos.json
rm ~/Code/flutter.zip

echo " --> Running flutter doctor"
~/Code/flutter/bin/flutter doctor
