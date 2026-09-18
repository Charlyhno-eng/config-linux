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

echo "==> Installing rclone (synchronization with drive"
sudo -v ; curl https://rclone.org/install.sh | sudo bash

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

# ---------------------------- Docker ----------------------------

sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  -o /etc/apt/keyrings/docker.asc

sudo chmod a+r /etc/apt/keyrings/docker.asc

sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt install docker-compose-v2

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

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
