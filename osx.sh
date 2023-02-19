#!/bin/bash
echo "==> Running osx.sh"

# Configure keyboard
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
