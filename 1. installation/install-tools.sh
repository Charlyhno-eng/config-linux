#!/bin/bash

set -e

echo "=== Updating system packages ==="
sudo apt update && sudo apt upgrade -y

echo "=== Installing essential terminal tools ==="
sudo apt install -y zsh fzf bat tldr mpv cava lsd conky curl git

echo "=== Creating alias for batcat if needed ==="
if ! command -v bat &> /dev/null; then
    echo "alias bat='batcat'" >> ~/.bashrc
    echo "alias bat='batcat'" >> ~/.zshrc
fi

echo "=== Installing zoxide ==="
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

echo "=== Installing yazi ==="
curl -sS https://raw.githubusercontent.com/sxyazi/yazi/main/install.sh | bash

echo "=== Installing LazyDocker ==="
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

echo "=== Installing Kitty terminal ==="
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Add Kitty to PATH if not already
if ! grep -q '.local/kitty.app/bin' ~/.bashrc; then
    echo 'export PATH="$HOME/.local/kitty.app/bin:$PATH"' >> ~/.bashrc
    echo 'export PATH="$HOME/.local/kitty.app/bin:$PATH"' >> ~/.zshrc
fi

echo "=== Installing Oh My Zsh ==="
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed."
fi

echo "=== Setting Zsh as the default shell ==="
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
fi

echo "=== Updating TLDR cache ==="
tldr --update

echo "=== Installing Zed code editor ==="
curl -f https://zed.dev/install.sh | sh

echo "=== Installation completed! Restart your terminal or log out/in to apply all changes. ==="
