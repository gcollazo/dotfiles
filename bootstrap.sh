#!/usr/bin/env bash
#
# New system setup script
#
set -euf -o pipefail

echo "==> Bootstrapping..."

# install xcode cli tools
in_progress=/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
touch ${in_progress}
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  tail -n 1 | sed 's/^[^C]* //')
softwareupdate -i "$PROD" --verbose;
rm ${in_progress}

# Check if git is installed
if ! command -v git >/dev/null; then
  echo "Git is not installed. Please install git first. xcode-select --install"
  exit 1
fi

echo "Clonning dotfiles repo..."
mkdir -p "$HOME/Developer"
cd "$HOME/Developer" || exit
git clone https://github.com/gcollazo/dotfiles.git
cd dotfiles || exit

# Defaults
echo "Setting macOS defaults..."

# Configure keyboard
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


# Install
echo "==> Installing software"

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing homebrew packages..."
brew tap Homebrew/bundle
brew bundle || true

# Symlinks
echo "Creating symlinks..."
ln -sf "$HOME/Developer/dotfiles/config/.gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/Developer/dotfiles/config/.hushlogin" "$HOME/.hushlogin"
ln -sf "$HOME/Developer/dotfiles/config/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/Developer/dotfiles/config/.vimrc" "$HOME/.vimrc"
ln -sf "$HOME/Developer/dotfiles/config/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/Developer/dotfiles/config/ghostty" "$HOME/.config/ghostty/config"
ln -sf "$HOME/Developer/dotfiles/config/config.fish" "$HOME/.config/fish/config.fish"

# Accept Xcode license
sudo xcodebuild -license accept

echo "Logout to make sure all changes are applied."

echo "🎉 Done!"
