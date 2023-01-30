#!/usr/bin/env bash

brew bundle

# Enable key repeat in Sublime
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

mkdir -p ~/.config/zsh
git -C ~/.config/zsh/git-prompt.zsh pull || git clone --depth=1 https://github.com/woefe/git-prompt.zsh ~/.config/zsh/git-prompt.zsh

./copy-dotfiles.sh
