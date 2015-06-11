#!/bin/bash

# Symlink files
echo "Doing symlinks..."
./symlinks.sh --force

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

echo "Installing utils..."
brew install nmap
brew install readline
brew install tree
brew install watchman

echo "Installing Cask..."
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

echo "Installing fonts..."
brew tap caskroom/fonts
brew cask install font-inconsolata

echo "Installing OS X Apps..."
brew cask install arq
brew cask install cyberduck
brew cask install gpgtools
brew cask install heroku-toolbelt
brew cask install imageoptim
brew cask install iterm2
brew cask install mongodb
brew cask install mou
brew cask install paparazzi
brew cask install postgres
brew cask install rowanj-gitx
brew cask install skype
brew cask install spotify
brew cask install sublime-text3
brew cask install transmission
brew cask install vagrant
brew cask install virtualbox
brew cask install viscosity

echo "Installing development tools..."
brew install bash-completion
brew install git
brew install pyenv
brew install pyenv-virtualenv

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
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

npm install -g babel-eslint
npm install -g eslint
npm install -g eslint-config-nightmare-mode
npm install -g jscs
npm install -g jshint
npm install -g nodemon
npm install -g phantomjs

# Install Python
echo "Installing Python..."
pyenv install 2.7.9
pyenv global 2.7.9
source ~/.bash_profile
pip install --upgrade pip
pip install flake8

echo "Installing CocoaPods..."
sudo gem install cocoapods

# Install Package Control for ST3
echo "Installing Package Control..."
curl "https://packagecontrol.io/Package Control.sublime-package" > ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package
