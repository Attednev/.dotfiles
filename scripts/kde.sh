#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed papirus-icon-theme plasma

paru -S --noconfirm catppuccin-cursors-mocha

papirus-folders -C bluegrey --theme Papirus-Dark
plasma-apply-cursortheme catppuccin-mocha-rosewater-cursors

ln -sfnv "$DOTFILES_DIR/kde/Rosewater.colors" "$HOME/.local/share/color-schemes/RosePine.colors"
ln -sfnv "$DOTFILES_DIR/kde/kdeglobals" "$HOME/.config/kdeglobals"

