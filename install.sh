#!/usr/bin/env bash

set -euo pipefail

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}"
export XDG_BIN_HOME="${XDG_BIN_HOME:-${HOME}/.local/bin}"

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR" || exit 1

PRE_SCRIPT="$DOTFILES_DIR/scripts/pre.sh"
SYMLINK_SCRIPT="$DOTFILES_DIR/scripts/symlink.sh"
POST_SCRIPT="$DOTFILES_DIR/scripts/post.sh"

if [ -x "$PRE_SCRIPT" ]; then
    read -rp "Run pre-install script? [Y/n] " run_pre
    run_pre=${run_pre:-Y}
    if [[ "$run_pre" =~ ^[Yy]$ ]]; then
        echo -e "\nRunning pre-install script..."
        "$PRE_SCRIPT"
    fi
else
    echo -e "\nPre-install script not found or not executable. Skipping."
fi

sh $SYMLINK_SCRIPT "$DOTFILES_DIR"

if [ -x "$POST_SCRIPT" ]; then
    read -rp "\nRun post-install script? [Y/n] " run_post
    run_post=${run_post:-Y}
    if [[ "$run_post" =~ ^[Yy]$ ]]; then
        echo -e "\nRunning post-install script..."
        "$POST_SCRIPT"
    fi
else
    echo -e "\nPost-install script not found or not executable. Skipping."
fi

echo -e "\nInstallation completed!"

