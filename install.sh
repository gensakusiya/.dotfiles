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

echo -e "\n\ninstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

for config in ./config/*; do
    echo $config
    #target=$HOME/.config/$( basename $config )
    #if [ -e $target ]; then
    #    echo "~${target#$HOME} already exists... Skipping."
    #else
    #    echo "Creating symlink for $config"
    #    ln -s $config $target
    #fi
done

