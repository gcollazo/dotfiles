#!/bin/bash
echo "==> Running install.sh"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing all of Homebrew..."
brew tap Homebrew/bundle
brew bundle

# Accept Xcode license
sudo xcodebuild -license accept

# Install Python
echo "Installing Python..."
pyenv install 3.11.1
pyenv global 3.11.1

echo
echo "==> Done!"
