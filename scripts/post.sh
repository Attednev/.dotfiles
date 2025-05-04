#!/usr/bin/env bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

papirus-folders -C bluegrey --theme Papirus-Dark
plasma-apply-cursortheme catppuccin-mocha-rosewater-cursors

paru -S --noconfirm diff-so-fancy

