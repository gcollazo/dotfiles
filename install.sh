#!/bin/bash

# Get submodules
echo "Getting submodules..."
git submodule update --init --recursive

# Symlink files
echo "Doing symlinks..."
./symlinks.sh --force

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

echo "Installing utils..."
brew install tree
brew install nmap

echo "Installing Cask..."
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

echo "Installing fonts..."
brew tap caskroom/fonts
brew cask install font-inconsolata
brew cask install font-inconsolata-for-powerline

echo "Installing OS X Apps..."
brew cask install spotify
brew cask install transmission
brew cask install paparazzi
brew cask install viscosity
brew cask install gpgtools
brew cask install mou
brew cask install spotify
brew cask install skype

brew cask install iterm2
brew cask install heroku-toolbelt
brew cask install virtualbox
brew cask install vagrant
brew cask install rowanj-gitx
brew cask install cyberduck
brew cask install postgres
brew cask install sublime-text3
brew cask install imageoptim

echo "Installing development tools..."
brew install bash-completion
brew install git
brew install python3
brew install python
brew install the_silver_searcher

# Install nvm
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | PROFILE=~/.extras bash
source ~/.bash_profile

# Install latest io.js release of node
echo "Installing io.js..."
nvm install iojs
nvm alias default iojs

# Install Node.js global tools
echo "Installing global modules with npm..."
npm install -g npm
npm install -g bower
npm install -g ember-cli
npm install -g jshint
npm install -g nodemon

# Install Python tools
echo "Installing Python tools..."
mkdir ~/.virtualenvs
pip install virtualenvwrapper
pip3 install virtualenvwrapper
pip3 install flake8
