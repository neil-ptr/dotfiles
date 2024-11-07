#!/bin/bash

if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v zsh &> /dev/null; then
  echo "Installing Zsh..."
  brew install zsh
fi

# Define source and target paths
DOTFILES_DIR=~/dotfiles

# Create symlinks for configuration files
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim  # Link the entire nvim directory
ln -sf "$DOTFILES_DIR/wezterm/wezterm.lua" ~/.wezterm.lua

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

