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
PYTHON27_VERSION="2.7.18" # Needed for npm
pyenv install "$PYTHON27_VERSION"
pyenv install 3.9.0
pyenv global 3.9.0

# Install volta
echo "Installing volta..."
curl https://get.volta.sh | bash

# Install latest release of node
echo "Installing node..."
volta install node
npm config set python "$HOME/.pyenv/versions/$PYTHON27_VERSION/bin/python"

# Install yarn
brew install yarn

# VSCode packages
echo "Installing VSCode Packages..."
cat "$HOME/Code/dotfiles/vscode/extensions.txt" | xargs -n 1 code --install-extension

# zsh prompt
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

echo
echo "==> Done!"
