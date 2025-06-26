#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed git clang make rustup base-devel npm

mkdir -p "$HOME/.config/clang-format"
curl -o "$HOME/.config/clang-format/custom.clang-format" "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/.clang-format"

