#!/bin/sh

# Symlinks

symlink_to_home() {
  FILE=$1
  # Only take action if the input file exists
  if [ -f $FILE ]
  then
    # Symlink the file to the home directory
    echo "Linking $(basename $FILE)"
    ln -sf $FILE ~/$(basename $FILE)
  fi
}

echo ''
echo '› create symlinks'
echo ''

## shell

symlink_to_home ~/dotfiles/shell/.inputrc

### bash

symlink_to_home ~/dotfiles/shell/bash/.bash_profile
symlink_to_home ~/dotfiles/shell/bash/.bashrc

### zsh

symlink_to_home ~/dotfiles/shell/zsh/.zprofile
symlink_to_home ~/dotfiles/shell/zsh/.zshrc

## git

symlink_to_home ~/dotfiles/git/.gitconfig
symlink_to_home ~/dotfiles/git/.gitignore_global

## ruby

symlink_to_home ~/dotfiles/ruby/.ruby-version
symlink_to_home ~/dotfiles/ruby/.rubocop.yml

## brew

symlink_to_home ~/dotfiles/brew/Brewfile

# Applications

cd ~

echo ''
echo '› install and update apps'
echo ''

brew bundle
