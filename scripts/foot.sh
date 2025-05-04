#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed foot

ln -sfnv "$DOTFILES_DIR/foot/" "$HOME/.config/foot"

