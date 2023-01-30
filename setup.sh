#!/usr/bin/env bash

brew bundle

# Enable key repeat in Sublime
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

# Install ruby
gem install bundler

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

./copy-dotfiles.sh
