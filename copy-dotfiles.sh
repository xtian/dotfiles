#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
  rsync \
    --exclude ".DS_Store" \
    --exclude ".git/" \
    --exclude ".gitignore" \
    --exclude "copy-dotfiles.sh" \
    --exclude "README.md" \
    --exclude "setup.sh" \
    --archive \
    --human-readable \
    --no-perms \
    --verbose \
    . ~;

  source ~/.zshrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
