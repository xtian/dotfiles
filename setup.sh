#!/usr/bin/env bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew tap Homebrew/bundle
brew bundle

# Enable key repeat in Sublime
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

# Install ruby
ruby-install ruby stable
gem install bundler
gem install rails

./copy-dotfiles.sh
