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
brew install starship

brew install ripgrep

brew install nvm

echo "Installing neovim..."
brew install neovim

brew install fsouza/prettierd/prettierd
brew tap homebrew/cask-fonts
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true

# ---------------------------------
# Colors and formatting
# ---------------------------------
b="$(tput bold)"
d='\033[2m' 
y='\033[33;33m'
n='\033[0m'

echo -e "\n\ninstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

for config in ./config/*; do
    echo $config
    target=$HOME/.config/$( basename $config )
    echo -e "Creating symlink for ${d} $config ${n}"
    rm -rf $HOME/.config/$config
    ln -sr $config $target
done

