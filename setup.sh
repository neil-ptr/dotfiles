#!/bin/bash

# Create symlinks for configuration files
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua

echo "Symbolic links created successfully!"

# Install Powerlevel10k if not installed
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Neovim if not installed
if ! command -v nvim &> /dev/null; then
  echo "Installing Neovim..."
  # Adjust installation method based on your OS
  brew install neovim # macOS (Homebrew)
fi

# Install Wezterm if not installed
if ! command -v wezterm &> /dev/null; then
  echo "Installing Wezterm..."
  # Adjust installation method based on your OS
  brew install --cask wezterm # macOS (Homebrew)
fi

# Apply Zsh configuration by sourcing .zshrc
echo "Sourcing ~/.zshrc to apply changes..."
source ~/.zshrc

echo "Setup complete! All configurations are in place."

