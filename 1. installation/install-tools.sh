#!/usr/bin/env bash

set -e

# Check if the script is run as root (via sudo)
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo:"
  echo "  sudo bash $0"
  exit 1
fi

echo "==> Updating packages"
apt update && apt upgrade -y

echo "==> Installing curl and git (prerequisites)"
apt install -y curl git

echo "==> Installing Node.js (LTS) via NodeSource"
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt install -y nodejs

echo "==> Installing Python 3 and pip"
apt install -y python3 python3-pip python3-venv

echo "==> Installing Go"
apt install -y golang-go

echo "==> Installing C development tools (GCC, make, etc.)"
apt install -y build-essential

echo "==> Installing Zsh, bat, mpv, cava, btop, polybar"
apt install -y zsh bat mpv cava curl git btop polybar || apt install -y zsh batcat mpv cava curl git btop

echo "==> Installing KeePassXC and SQLite Browser"
apt install -y keepassxc sqlitebrowser

echo "==> Setting zsh as the default shell for the current user"
chsh -s /usr/bin/zsh "$SUDO_USER"

echo "==> Installation completed."
echo "Log out and back in to have zsh as your default shell."
