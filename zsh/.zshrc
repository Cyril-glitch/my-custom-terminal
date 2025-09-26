# Ajout de Kitty officiel au PATH
export PATH="$HOME/kitty.app/bin:$PATH"

# ---------------------------
# Starship prompt
# ---------------------------
eval "$(starship init zsh)"

# ---------------------------
# Fastfetch
# ---------------------------
# Lancer fastfetch au démarrage, image/logo fixe
fastfetch

alias clear='clear && fastfetch'

# ---------------------------
# Zsh auto-completion & highlighting
# ---------------------------
# Auto-suggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autocomplete plugin
source $HOME/zsh-autocomplete/zsh-autocomplete.plugin.zsh

