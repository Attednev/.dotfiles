#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed alacritty

ln -sfnv "$DOTFILES_DIR/alacritty/" "$HOME/.config/alacritty"

