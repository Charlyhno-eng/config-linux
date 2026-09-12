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

# ---------------------------- Basics ----------------------------

echo "==> Updating packages"
sudo apt update && sudo apt upgrade -y

echo "==> Installing curl and git (prerequisites)"
sudo apt install -y curl git

# --------------------------- Languages ---------------------------

echo "==> Installing Node.js (LTS) via NodeSource"
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
sudo apt install -y nodejs npm

echo "==> Installing Python 3 and pip"
sudo apt install -y python3 python3-pip python3-venv

echo "==> Installing Go"
sudo apt install -y golang-go

# ---------------------------- Tools -----------------------------

echo "==> Installing zsh, bat, btop, polybar, rofi, eza, zoxide"
sudo apt install -y zsh bat btop polybar rofi eza zoxide

echo "==> Installing KeePassXC and SQLite Browser"
sudo apt install -y keepassxc sqlitebrowser

echo "==> Installing LazyGit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit.tar.gz lazygit

echo "==> Installing Yazi"
curl -fsSL https://yazi-rs.github.io/builds/yazi-keyring.gpg | sudo tee /usr/share/keyrings/yazi-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/yazi-keyring.gpg] https://yazi-rs.github.io/builds/ stable main' | sudo tee /etc/apt/sources.list.d/yazi.list >/dev/null
sudo apt update && sudo apt install yazi

# --------------------------- AI Tools ---------------------------

echo "==> Installing dependencies for Handy"
sudo apt install xdotool
sudo apt install libgtk-layer-shell0

echo "==> Installing Herdr"
curl -fsSL https://herdr.dev/install.sh | sh

echo "==> Installing Codex"
npm install -g @openai/codex

# --------------------------- Settings ---------------------------

echo "==> Setting zsh as the default shell for the current user"
chsh -s /usr/bin/zsh "$SUDO_USER"

# ---------------------------- Config ----------------------------

echo "==> Creating Rofi config directory and dumping config"
mkdir -p ~/.config/rofi
rofi -dump-config > ~/.config/rofi/config.rasi

# ----------------------------- End ------------------------------

echo "==> Installation completed."
echo "Log out and back in to have zsh as your default shell."
echo ""
echo ""
echo "--------------------------------------------------"
echo ""
echo ""
echo "Handy : https://github.com/cjpais/Handy/releases"
echo "SyncThing : https://github.com/syncthing/syncthing/releases"
echo "Obsidian : https://obsidian.md/help/install"
echo "Kitty : https://sw.kovidgoyal.net/kitty/binary/"
