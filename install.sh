#!/bin/bash

# Dotfiles installation script
set -e

echo "Installing dotfiles..."

# Backup existing configs
backup_dir="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"

# Install Awesome config
if [ -d "$HOME/.config/awesome" ]; then
    echo "Backing up existing Awesome config..."
    mv "$HOME/.config/awesome" "$backup_dir/awesome"
fi

echo "Installing Awesome config..."
mkdir -p "$HOME/.config"
cp -r "$(dirname "$0")/.config/awesome" "$HOME/.config/"

# Install Alacritty config
if [ -d "$HOME/.config/alacritty" ]; then
    echo "Backing up existing Alacritty config..."
    mv "$HOME/.config/alacritty" "$backup_dir/alacritty"
fi

echo "Installing Alacritty config..."
mkdir -p "$HOME/.config"
cp -r "$(dirname "$0")/.config/alacritty" "$HOME/.config/"

echo "Dotfiles installed successfully!"
echo "Your old configs are backed up in: $backup_dir"
