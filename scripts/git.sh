#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed ssh-tools git

paru -S --noconfirm diff-so-fancy

ln -sfnv "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
ln -sfnv "$DOTFILES_DIR/git/gitignore_global" "$HOME/.gitignore_global"

