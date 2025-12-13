#!/usr/bin/env bash

set -e

if [ "$EUID" -ne 0 ]; then
  echo "Merci d'exécuter ce script avec sudo :"
  echo "  sudo bash $0"
  exit 1
fi

echo "==> Mise à jour des paquets"
apt update && apt upgrade -y

echo "==> Installation de curl et git (pré-requis)"
apt install -y curl git

echo "==> Installation de Node.js (LTS) via NodeSource"
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt install -y nodejs

echo "==> Installation de Python 3 et pip"
apt install -y python3 python3-pip python3-venv

echo "==> Installation de Go"
apt install -y golang-go

echo "==> Installation de Zsh, bat, mpv, cava, btop, polybar"

apt install -y zsh bat mpv cava curl git btop polybar || apt install -y zsh batcat mpv cava curl git btop

echo "==> Définir zsh comme shell par défaut pour l'utilisateur courant"
chsh -s /usr/bin/zsh "$SUDO_USER"

echo "==> Installation terminée."
echo "Déconnecte/reconnecte ta session pour que zsh devienne le shell par défaut."
