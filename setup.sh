#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

curl --proto '=https' --tlsv1.2 -sSf -L \
  https://install.determinate.systems/nix | sh -s -- install

./copy-dotfiles.sh

nix run nix-darwin \
  --extra-experimental-features nix-command \
  --extra-experimental-features flakes \
  -- switch --flake ~/.config/nix-darwin

mkdir -p ~/.config/zsh
git -C ~/.config/zsh/git-prompt.zsh pull || git clone --depth=1 https://github.com/woefe/git-prompt.zsh ~/.config/zsh/git-prompt.zsh
