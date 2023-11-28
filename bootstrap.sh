#!/usr/bin/env bash
#
# New system setup script
#
set -euf -o pipefail

echo "==> Bootstrapping..."

echo "Updating macOS..."
sudo softwareupdate --install --all --verbose

echo "Installing Xcode command line tools..."
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
CMD_LINE_TOOLS=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
sudo softwareupdate -i "$CMD_LINE_TOOLS" --verbose
rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

echo "Clonning dotfiles repo..."
mkdir -p "$HOME/Developer"
cd "$HOME/Developer" || exit
git clone https://github.com/gcollazo/dotfiles.git
cd dotfiles || exit

# Symlinks
echo "Creating symlinks..."
ln -sf "$HOME/Developer/dotfiles/config/.gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/Developer/dotfiles/config/.hushlogin" "$HOME/.hushlogin"
ln -sf "$HOME/Developer/dotfiles/config/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/Developer/dotfiles/config/.vimrc" "$HOME/.vimrc"
ln -sf "$HOME/Developer/dotfiles/config/.zshrc" "$HOME/.zshrc"

# Defaults
echo "Setting macOS defaults..."

# Configure keyboard
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


# Install
echo "==> Installing software"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing homebrew packages..."
brew tap Homebrew/bundle
brew bundle

# Accept Xcode license
sudo xcodebuild -license accept

echo "🎉 Done!"
