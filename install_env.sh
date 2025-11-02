#!/usr/bin/env bash
set -e

echo "🚀 Installation complète de ton environnement Kitty + Zsh + LazyVim..."

# === 1. Mise à jour du système ===
sudo apt update && sudo apt upgrade -y

# === 2. Dépendances principales ===
sudo apt install -y git curl zsh zsh-autosuggestions zsh-syntax-highlighting build-essential ripgrep fd-find fzf clangd fastfetch python3 python3-pip nodejs npm

# === 3. Installer tree-sitter-cli ===
sudo npm install -g tree-sitter-cli

# === 4. LazyGit (optionnel) ===
if ! command -v lazygit &> /dev/null; then
  echo "📦 Installation de lazygit..."
  sudo add-apt-repository ppa:lazygit-team/release -y
  sudo apt update && sudo apt install -y lazygit
fi

# === 5. Kitty ===
if ! command -v kitty &> /dev/null; then
  echo "📦 Installation de Kitty..."
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

# === 6. Starship ===
if ! command -v starship &> /dev/null; then
  echo "📦 Installation de Starship..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# === 7. Clonage du repo perso (si pas déjà présent) ===
if [ ! -d ~/my-custom-terminal ]; then
  git clone https://github.com/Cyril-glitch/my-custom-terminal.git ~/my-custom-terminal
else
  echo "🌀 Repo déjà présent, mise à jour..."
  cd ~/my-custom-terminal && git pull
  cd ~
fi

# === 8. Polices ===
mkdir -p ~/.fonts
cp -r ~/my-custom-terminal/fonts/* ~/.fonts/ 2>/dev/null || true
fc-cache -fv

# === 9. Configurations terminal & shell ===
mkdir -p ~/.config/kitty
mv -f ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.bak 2>/dev/null || true
cp ~/my-custom-terminal/kitty.conf ~/.config/kitty/

cp ~/my-custom-terminal/.zshrc ~/

mkdir -p ~/.config/fastfetch
cp -r ~/my-custom-terminal/fastfetch/* ~/.config/fastfetch/

mkdir -p ~/.config
cp ~/my-custom-terminal/Starship/nord_segments.toml ~/.config/starship.toml

# === 10. Zsh par défaut ===
if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s "$(which zsh)"
fi

# === 11. Neovim + LazyVim ===
if ! command -v nvim &> /dev/null; then
  sudo apt install -y neovim
fi

# Lazy.nvim bootstrap
if [ ! -d ~/.local/share/nvim/lazy/lazy.nvim ]; then
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
fi

# Copier la config nvim depuis le repo
mkdir -p ~/.config/nvim
cp -r ~/my-custom-terminal/nvim/* ~/.config/nvim/

# Installer les plugins LazyVim
nvim --headless "+Lazy! sync" +qa

# === 12. Nettoyage ===
sudo apt autoremove -y

echo "✅ Installation terminée !"
echo "Redémarre ton terminal et lance Neovim pour vérifier LazyVim."

