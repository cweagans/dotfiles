#!/usr/bin/env bash

mkdir -p $HOME/.hammerspoon/Spoons
pushd $HOME/.hammerspoon/Spoons
curl -L -o SpoonInstall.spoon.zip https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip
unzip SpoonInstall.spoon.zip
rm SpoonInstall.spoon.zip
popd
