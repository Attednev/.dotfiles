#!/usr/bin/env bash

sudo pacman -S git papirus-icon-theme nvim alacritty fish zsh

git clone https://aur.archlinux.org/yay.git $HOME/yay
cd $HOME/yay
makepkg -si --noconfirm

yay -S catppuccin-cursors-mocha

mkdir -p "$XDG_DATA_HOME/tmux/plugins"
mkdir -p "$XDG_STATE_HOME/tmux"

curl -o "$XDG_BIN_HOME/tmux-sessionizer" "https://raw.githubusercontent.com/ThePrimeagen/tmux-sessionizer/refs/heads/master/tmux-sessionizer"
chmod +x "$XDG_BIN_HOME/tmux-sessionizer"

git clone https://github.com/tmux-plugins/tpm $XDG_DATA_HOME/tmux/plugins/tpm

