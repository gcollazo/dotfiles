#!/bin/bash
echo "==> Running install.sh"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing all of Homebrew..."
brew tap Homebrew/bundle
brew bundle

# Accept Xcode lincense
sudo xcodebuild -license accept

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile

# Install latest release of node
echo "Installing node..."
nvm install lts/*
nvm alias default lts/*

# Install Node.js global tools
echo "Installing global modules with npm..."
npm install -g npm
npm install -g bower
npm install -g ember-cli
npm install -g eslint
npm install -g eslint-config-blimp
npm install -g http-server

# Cordova stuff
npm install -g cordova
npm install -g ios-sim
npm install -g ios-deploy

# Install Python
echo "Installing Python..."
pyenv install 2.7.14
pyenv global 2.7.14
source ~/.profile

# Install Ruby
echo "Installing Ruby..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --ruby

# VSCode packages
echo "Installing VSCode Packages..."
vscode-extensions-update

echo
echo "==> Done!"
