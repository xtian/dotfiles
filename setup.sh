#!/usr/bin/env bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew tap Homebrew/bundle
brew bundle

# Install ruby
ruby-install ruby stable
gem install bundler
gem install rails

./copy-dotfiles.sh
