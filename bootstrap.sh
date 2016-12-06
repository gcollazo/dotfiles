#!/bin/bash
echo "==> Running bootstrap.sh"

echo "Updating OSX...."
sudo softwareupdate --install --all --verbose

echo "Installing Xcode command line tools..."
sudo xcode-select --install

echo "Clonning repo.."
mkdir -p ~/Code
cd ~/Code
git clone https://github.com/gcollazo/dotfiles.git
cd dotfiles

# Symlinks
./symlinks.sh

# Installs
./install.sh
