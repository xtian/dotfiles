#!/usr/bin/env bash

curl --proto '=https' --tlsv1.2 -sSf -L \
  https://install.determinate.systems/nix | sh -s -- install

mkdir -p ~/.config/nix-darwin
cp ./flake.* ~/.config/nix-darwin

nix run nix-darwin -- switch --flake ~/.config/nix-darwin

mkdir -p ~/.config/zsh
git -C ~/.config/zsh/git-prompt.zsh pull || git clone --depth=1 https://github.com/woefe/git-prompt.zsh ~/.config/zsh/git-prompt.zsh

./copy-dotfiles.sh
