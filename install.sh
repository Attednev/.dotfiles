#!/usr/bin/env bash

set -euo pipefail

export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR" || exit 1

DIR="$DOTFILES_DIR/scripts"

sudo -v

if ! command -v paru >/dev/null 2>&1; then
    echo -e "\nInstalling paru!"
    sudo pacman -S --noconfirm base-devel git
    git clone https://aur.archlinux.org/paru.git $HOME/paru
    cd $HOME/paru
    makepkg -si --noconfirm
fi

find "$DIR" -type f -name '*.sh' | while read -r script; do
  echo "Executing $script"
  bash "$script"
done

echo -e "\nInstallation completed!"

