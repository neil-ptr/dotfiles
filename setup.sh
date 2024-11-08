#!/bin/zsh

if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v zsh &> /dev/null; then
  echo "Installing Zsh..."
  sudo brew install zsh
fi


DOTFILES_DIR=~/dotfiles
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim  
ln -sf "$DOTFILES_DIR/wezterm/wezterm.lua" ~/.wezterm.lua
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf
echo "Symbolic links created successfully!"

# Install required dependencies
echo "Installing required dependencies..."
brew install git curl cmake

# Lua
if ! command -v lua &> /dev/null; then
    echo "Lua could not be found. Installing..."
    brew install lua
fi

# Node.js 
if ! command -v node &> /dev/null; then
  echo "Node.js could not be found. Installing..."
  brew install node
fi

# Python
if ! command -v python3 &> /dev/null; then
  echo "Python could not be found. Installing..."
  brew install python
fi

# Go
if ! command -v go &> /dev/null; then
  echo "Go could not be found. Installing..."
  brew install go
fi

###### tmux dependencies ######
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing Tmux Plugin Manager (TPM)..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

###### zsh dependencies ######

# Powerlevel10k 
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# Oh My Zsh 
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# syntax highlighting zsh
if ! grep -q "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" $HOME/.zshrc; then
  echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc
fi

if ! brew list zsh-autocomplete &>/dev/null; then
  echo "Installing zsh-autocomplete..."
  brew install zsh-autocomplete
fi

# ripgrep
if ! command -v rg &> /dev/null; then
  echo "ripgrep could not be found. Installing..."
  brew install ripgrep
fi

# Install btop if not already installed
if ! command -v btop &> /dev/null; then
  echo "btop could not be found. Installing..."
  brew install btop
fi

if ! brew list zsh-autosuggestions &>/dev/null; then
  echo "Installing zsh-autosuggestions..."
  brew install zsh-autosuggestions
fi

# Tap and install Hurl
if ! brew tap | grep -q "neil-and-void/homebrew-hurl"; then
  echo "Tapping neil-and-void/homebrew-hurl..."
  brew tap neil-and-void/homebrew-hurl
fi
if ! brew list hurl &>/dev/null; then
  echo "Installing hurl..."
  brew install neil-and-void/homebrew-hurl/hurl
fi

###### neovim dependencies ######

# Neovim
if ! command -v nvim &> /dev/null; then
  echo "Installing Neovim..."
  # Adjust installation method based on your OS
  brew install neovim # macOS (Homebrew)
fi

############

# Apply Zsh configuration by sourcing .zshrc
echo "Sourcing ~/.zshrc to apply changes..."
source ~/.zshrc

echo "Setup complete! All configurations are in place."

