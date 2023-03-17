#!/bin/bash

if test ! $(which brew); then
    echo "Installing homebrew"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing homebrew packages..."

# development tools
brew install git
brew install iterm2 --cask

brew install tmux
brew install zsh
brew install markdown
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

brew install nvm

echo "Installing neovim..."
brew install neovim

