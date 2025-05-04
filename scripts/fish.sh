#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed fish

mkdir -p "$HOME/.config/fish"
ln -sfnv "$DOTFILES_DIR/fish/config.fish" "$HOME/.config/fish/config.fish"

