#!/bin/bash

# Symlink files
echo "Doing symlinks..."
./symlinks.sh

echo "Updating OSX...."
sudo softwareupdate --install --all --verbose

echo "Installing Xcode command line tools..."
sudo xcode-select --install

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing utils..."
brew install jq
brew install mas
brew install nmap
brew install tree

echo "Installing Cask..."
brew tap caskroom/cask

echo "Installing OS X Apps..."
brew cask install arduino
brew cask install arq
brew cask install atom
brew cask install burp-suite
brew cask install cyberduck
brew cask install docker
brew cask install font-inconsolata
brew cask install genymotion
brew cask install gitup
brew cask install gpgtools
brew cask install handbrake
brew cask install imageoptim
brew cask install iterm2
brew cask install licecap
brew cask install mongodb
brew cask install ngrok
brew cask install paparazzi
brew cask install postgres
brew cask install postman
brew cask install robomongo
brew cask install screenflow
brew cask install sketch
brew cask install skitch
brew cask install slack
brew cask install spotify
brew cask install the-unarchiver
brew cask install transmission
brew cask install tunnelblick
brew cask install virtualbox
brew cask install vlc
brew cask install webtorrent
brew cask install wireshark

echo "Installing fonts..."
brew tap caskroom/fonts
brew cask install font-inconsolata

echo "Installing development tools..."
brew install awscli
brew install bash-completion
brew install git
brew install heroku-toolbelt
brew install watchman

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile

# Install latest release of node
echo "Installing node..."
nvm install v6
nvm alias default v6

# Install Node.js global tools
echo "Installing global modules with npm..."
npm install -g npm
npm install -g bower

npm install -g eslint
npm install -g eslint-config-blimp

npm install -g ember-cli

npm install -g nodemon
npm install -g phantomjs
npm install -g http-server

# Cordova stuff
npm install -g cordova
npm install -g ios-sim
npm install -g ios-deploy

# Install Python
echo "Installing Python..."
brew install pyenv
brew install pyenv-virtualenv
pyenv install 2.7.12
pyenv global 2.7.12
source ~/.profile

# Install Ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby -- --ignore-dotfiles

echo "Installing Android dev tools..."
brew cask install java
brew install android-sdk
