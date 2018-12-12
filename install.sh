#!/bin/bash
echo "==> Running install.sh"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing all of Homebrew..."
brew tap Homebrew/bundle
brew bundle

# Accept Xcode license
sudo xcodebuild -license accept

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source "$HOME/.profile"

# Install latest release of node
echo "Installing node..."
nvm install lts/*  --latest-npm

# Install Node.js global tools
echo "Installing global modules from npm..."
npm install -g add cordova

# Install Python
echo "Installing Python..."
pyenv install 3.6.4
pyenv install 2.7.14
pyenv global 3.6.4

# VSCode packages
echo "Installing VSCode Packages..."
cat "$HOME/Code/dotfiles/vscode/extensions.txt" | xargs -n 1 code --install-extension

echo
echo "==> Done!"
