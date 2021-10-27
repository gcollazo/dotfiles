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
pyenv install 3.10.0
pyenv global 3.10.0

# Install awsume
pip install awsume

# Install volta
echo "Installing volta..."
curl https://get.volta.sh | bash

# Install latest release of node
echo "Installing node..."
volta install node

echo
echo "==> Done!"
