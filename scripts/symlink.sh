#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Installation script was called without the dotfiles location"
    return
fi

SYMLINKS_FILE="$DOTFILES_DIR/symlinks.conf"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d-%H%M%S)"
BACKUP_ENABLED=false

if [ -f "$SYMLINKS_FILE" ]; then
    echo -e "\nProcessing symlinks configuration..."
else
    echo -e "\nSymlinks configuration file not found. Skipping symlink creation."
    return
fi

expand_path() {
    local path="$1"
    path=${path//\$HOME/$HOME}
    path=${path//\$PWD/$PWD}
    echo "$path"
}

read -rp $'\nBackup existing files before replacing? [Y/n] ' backup_choice
backup_choice=${backup_choice:-Y}
if [[ "$backup_choice" =~ ^[Yy]$ ]]; then
    BACKUP_ENABLED=true
    echo -e "\nBackups will be stored in: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
fi

while IFS=: read -r source target; do
    [[ -z "$source" || "$source" == \#* ]] && continue

    source=$(expand_path "$source")
    target=$(expand_path "$target")

    if [ ! -e "$source" ]; then
        echo -e "\nSource '$source' does not exist. Skipping."
        continue
    fi


    if [ -L "$target" ] && [ "$(readlink -f "$target")" == "$(readlink -f "$source")" ]; then
        echo "Correct symlink already exists. Skipping."
        continue
    fi

    if [ -e "$target" ] && [ "$BACKUP_ENABLED" = true ]; then
        backup_path="${BACKUP_DIR}${target}"
        echo -e "\nBacking up: $target -> $backup_path"
        mkdir -p "$(dirname "$backup_path")"
        mv -v "$target" "$backup_path"
    fi

    echo -e "\nCreating symlink: $source -> $target"
    mkdir -p "$(dirname "$target")"
    ln -sfnv "$source" "$target"

done < "$SYMLINKS_FILE"


