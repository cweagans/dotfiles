#!/bin/zsh

if ! which -s vagrant > /dev/null; then
  echo "Vagrant not found, skipping plugin installation"
  exit 0
fi

if vagrant plugin list | grep -q vagrant-google; then
  vagrant plugin install vagrant-google
fi
