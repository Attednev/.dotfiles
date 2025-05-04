#!/usr/bin/env bash

sudo pacman -S git papirus-icon-theme nvim alacritty fish zsh

git clone https://aur.archlinux.org/paru.git $HOME/paru
cd $HOME/paru
makepkg -si --noconfirm

paru -S --noconfirm catppuccin-cursors-mocha

mkdir -p "$XDG_DATA_HOME/tmux/plugins"
mkdir -p "$XDG_STATE_HOME/tmux"
mkdir -p "$XDG_CONFIG_HOME/clang-format"

curl -o "$XDG_BIN_HOME/tmux-sessionizer" "https://raw.githubusercontent.com/ThePrimeagen/tmux-sessionizer/refs/heads/master/tmux-sessionizer"
chmod +x "$XDG_BIN_HOME/tmux-sessionizer"

curl -o "$XDG_CONFIG_HOME/clang-format/custom.clang-format" "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/.clang-format"

git clone https://github.com/tmux-plugins/tpm $XDG_DATA_HOME/tmux/plugins/tpm

