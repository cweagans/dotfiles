#!/usr/bin/env bash

echo " -> Create yadm update alias"
yadm gitconfig --local alias.update '!yadm pull && yadm decrypt && yadm bootstrap'
