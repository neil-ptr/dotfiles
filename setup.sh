#!/bin/bash

set -e

# Detect OS
OS="$(uname -s)"

# Package manager and install command
if [[ "$OS" == "Darwin" ]]; then
  PKG_MANAGER="brew"
  INSTALL_CMD="brew install"
elif [[ -f /etc/debian_version ]]; then
  PKG_MANAGER="apt"
  INSTALL_CMD="sudo apt-get install -y"
  sudo apt-get update
else
  echo "Unsupported OS: $OS"
  exit 1
fi

echo "Using package manager: $PKG_MANAGER"

# Install Zsh
if ! command -v zsh &> /dev/null; then
  echo "Installing Zsh..."
  $INSTALL_CMD zsh
fi

DOTFILES_DIR=~/dotfiles
mkdir -p ~/.config

ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim  
ln -sf "$DOTFILES_DIR/wezterm/wezterm.lua" ~/.wezterm.lua
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf
echo "Symbolic links created successfully!"

# Install common tools
for pkg in git curl cmake lua node python3 golang ripgrep tmux; do
  if ! command -v $pkg &> /dev/null; then
    echo "Installing $pkg..."
    $INSTALL_CMD $pkg
  fi
done

# Install btop (fallback to top if unavailable on apt)
if ! command -v btop &> /dev/null; then
  echo "Installing btop..."
  if [[ "$PKG_MANAGER" == "apt" ]]; then
    sudo add-apt-repository -y ppa:arctic-fox/btop
    sudo apt update
    sudo apt install -y btop
  else
    brew install btop
  fi
fi

###### tmux dependencies ######
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing Tmux Plugin Manager (TPM)..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

###### zsh dependencies ######

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
fi

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
fi

# zsh-autocomplete (optional)
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete" ]; then
  echo "Installing zsh-autocomplete..."
  git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete"
fi

###### neovim ######
if ! command -v nvim &> /dev/null; then
  echo "Installing Neovim..."
  $INSTALL_CMD neovim
fi

# Apply Zsh configuration
echo "Setup complete. Run 'exec zsh' or restart your shell to use the new config."
