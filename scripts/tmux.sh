#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed tmux git

mkdir -p "$HOME/.local/share/tmux/plugins"
mkdir -p "$HOME/.local/state/tmux"
mkdir -p "$HOME/.local/bin"

curl -o "$HOME/.local/bin/tmux-sessionizer" "https://raw.githubusercontent.com/ThePrimeagen/tmux-sessionizer/refs/heads/master/tmux-sessionizer"
chmod +x "$HOME/.local/bin/tmux-sessionizer"

git clone https://github.com/tmux-plugins/tpm $HOME/.local/share/tmux/plugins/tpm

ln -sfnv "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

