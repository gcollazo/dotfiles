#!/bin/bash
echo "==> Running bootstrap.sh"

echo "Updating OSX..."
sudo softwareupdate --install --all --verbose

echo "Installing Xcode command line tools..."
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
CMD_LINE_TOOLS=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
sudo softwareupdate -i "$CMD_LINE_TOOLS" --verbose
rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

echo "Clonning repo.."
mkdir -p "$HOME/Code"
cd "$HOME/Code"
git clone https://github.com/gcollazo/dotfiles.git
cd dotfiles

# Defaults
./osx.sh

# Symlinks
./symlinks.sh

# Installs
./install.sh
