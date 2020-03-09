#!/usr/bin/env bash

echo " -> Installing espanso"

espanso register

echo " --> Grant accessibility permissions to espanso and then press any key to continue"

read -n 1

espanso start
