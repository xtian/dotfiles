#!/usr/bin/env bash

brew bundle

# Enable key repeat in Sublime
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

./copy-dotfiles.sh
