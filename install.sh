#!/bin/bash

# Setup dotfiles
echo "Setting up dotfiles..."
./bootstrap.sh --force

echo "Installing Homebrew and Cask..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

echo "Installing utils"
brew install wget
brew install tree
brew install nmap

echo "Installing development tools..."
brew install python3
brew install python

# Install nvm
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | PROFILE=~/.extras bash
source ~/.bash_profile

# Install latest v0.10.x release of node
echo "Installing node..."
nvm install 0.10
nvm alias default 0.10

# Install Node.js global tools
echo "Installing global modules with npm..."
npm install -g npm
npm install -g bower
npm install -g ember-cli
npm install -g grunt-cli
npm install -g gulp
npm install -g jshint
npm install -g nodemon

# Install Python tools
echo "Installing Python tools"
mkdir ~/.virtualenvs
pip install virtualenvwrapper
pip3 install flake8

# Setup Sublime Text 3
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
ln -sf $PWD/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -sf $PWD/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
