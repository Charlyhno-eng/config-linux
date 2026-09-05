#!/usr/bin/env bash

# TODO !
# chmod +x install-tools.sh
# sudo ./install-tools.sh

set -e

# Check if the script is run as root (via sudo)
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo:"
  echo "  sudo bash $0"
  exit 1
fi

# ------------------------------------------------------------------------

echo "==> Updating packages"
apt update && apt upgrade -y

echo "==> Installing curl and git (prerequisites)"
apt install -y curl git

# ------------------------------------------------------------------------

echo "==> Installing Node.js (LTS) via NodeSource"
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt install -y nodejs

echo "==> Installing Python 3 and pip"
apt install -y python3 python3-pip python3-venv

echo "==> Installing Go"
apt install -y golang-go

# ------------------------------------------------------------------------

echo "==> Installing zsh, bat, mpv, cava, btop, polybar, rofi, eza, zoxide"
apt install -y zsh bat mpv cava btop polybar rofi eza zoxide || apt install -y zsh batcat mpv cava btop polybar rofi eza zoxide

echo "==> Creating Rofi config directory and dumping config"
mkdir -p ~/.config/rofi
rofi -dump-config > ~/.config/rofi/config.rasi

# ------------------------------------------------------------------------

echo "==> Installing KeePassXC and SQLite Browser"
apt install -y keepassxc sqlitebrowser

echo "==> Installing dependencies for Handy"
sudo apt install xdotool
sudo apt install libgtk-layer-shell0

echo "==> Installing Herdr"
curl -fsSL https://herdr.dev/install.sh | sh

echo "==> Setting zsh as the default shell for the current user"
chsh -s /usr/bin/zsh "$SUDO_USER"

echo "==> Installation completed."
echo "Log out and back in to have zsh as your default shell."
echo ""
echo ""
echo "--------------------------------------------------"
echo ""
echo ""
echo "Handy : https://github.com/cjpais/Handy/releases"
echo "SyncThing : https://github.com/syncthing/syncthing/releases"
echo "Buzz : https://github.com/block/buzz"
