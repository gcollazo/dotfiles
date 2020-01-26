#!/bin/bash
echo "==> Running install.sh"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing all of Homebrew..."
brew tap Homebrew/bundle
brew bundle

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Accept Xcode license
sudo xcodebuild -license accept

# Install Python
echo "Installing Python..."
PYTHON27_VERSION="2.7.14"
pyenv install 3.8.1
pyenv install "$PYTHON27_VERSION"
pyenv global 3.8.1

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source "$HOME/.zshrc"

# Install latest release of node
echo "Installing node..."
nvm install lts/* --latest-npm
npm config set python "$HOME/.pyenv/versions/$PYTHON27_VERSION/bin/python"

# VSCode packages
echo "Installing VSCode Packages..."
cat "$HOME/Code/dotfiles/vscode/extensions.txt" | xargs -n 1 code --install-extension

echo
echo "==> Done!"
