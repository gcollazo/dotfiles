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
source ~/.profile

# Install latest release of node
echo "Installing node..."
nvm install lts/*  --latest-npm

echo "Installing yarn..."
brew install yarn --without-node

# Install Node.js global tools
echo "Installing global modules from npm..."
yarn global add bower
yarn global add ember-cli
yarn global add eslint
yarn global add eslint-config-blimp
yarn global add http-server
yarn global add cordova
yarn global add ios-sim
yarn global add ios-deploy

# Install Python
echo "Installing Python..."
pyenv install 3.6.3
pyenv global 3.6.3

# Install Ruby
echo "Installing Ruby..."
rbenv install 2.5.0
rbenv global 2.5.0

# VSCode packages
echo "Installing VSCode Packages..."
vscode-extensions-install

echo
echo "==> Done!"
