#!/usr/bin/env bash

echo " -> Install Lunarvim"
git clone https://github.com/LunarVim/LunarVim.git ~/.config/nvim
pushd .config/nvim > /dev/null
  ln -s ../lvim/config.lua init.lua
popd > /dev/null
