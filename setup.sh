#!/usr/bin/env bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew bundle

# Enable key repeat in Sublime
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

# Install ruby
ruby-install ruby stable
gem install bundler

# Install rust
curl https://sh.rustup.rs -sSf | sh

./copy-dotfiles.sh
