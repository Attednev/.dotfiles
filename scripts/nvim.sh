#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed nvim git

ln -sfnv "$DOTFILES_DIR/nvim/" "$HOME/.config/nvim"

