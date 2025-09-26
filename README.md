# 🚀 Mon terminal Kitty custom

Ce repo permet de reproduire rapidement mon terminal Kitty personnalisé sur Ubuntu avec :

- **Kitty officiel** comme terminal par défaut  
- **Zsh** avec configuration personnelle  
- **Starship** avec preset Nord  
- **Fastfetch** pour un affichage stylé du système  
- **Image de fond** dans Kitty avec transparence et borderless  

---

## 📦 1. Installation des dépendances

```bash
# Mettre à jour et installer les paquets nécessaires
sudo apt update
sudo apt install -y kitty zsh curl unzip fastfetch

'''
# Installer Starship

curl -sS https://starship.rs/install.sh | sh

🐱 2. Définir Kitty comme terminal par défaut

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which kitty) 50
sudo update-alternatives --config x-terminal-emulator

🔧 3. Patch & Configurations
3.1 Installer les polices

mkdir -p ~/.fonts
cp fonts/* ~/.fonts/
fc-cache -fv

3.2 Zsh

cp .zshrc ~/

3.3 Kitty

mkdir -p ~/.config/kitty
cp kitty.conf ~/.config/kitty/

3.4 Fastfetch

Si tu veux utiliser un preset custom :

cp -r fastfetch/* ~/.config/fastfetch/

3.5 Starship

cp ~/Downloads/nord_segments.toml ~/.config/starship.toml

Et activer Starship dans ton .zshrc :

eval "$(starship init zsh)"

