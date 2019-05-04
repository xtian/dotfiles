#!/usr/bin/env bash

brew bundle

# Enable key repeat in Sublime
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

# Install ruby
gem install bundler

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

./copy-dotfiles.sh

cp -r \
  /Applications/Xcode.app/Contents/SharedFrameworks/DVTKit.framework/Versions/A/Resources/Fonts/SF-Mono-* \
  /Library/Fonts/
