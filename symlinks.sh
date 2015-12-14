#!/bin/bash

# Colors
function yellow() {
    prompt="$1"
    echo -e -n "\033[32m$prompt"
    echo -e -n '\033[0m'
    echo ''
}

function red() {
    prompt="$1"
    echo -e -n "\033[31m$prompt"
    echo -e -n '\033[0m'
    echo ''
}

function blue() {
    prompt="$1"
    echo -e -n "\033[34m$prompt"
    echo -e -n '\033[0m'
    echo ''
}

# Gets a list of files
function getFilesInDir() {
    find $1 ! -path ./.DS_Store -name '*.*' -exec basename {} ';'
}

# $1 directory to search for files
# $2 destination of symlink
function symlinkFilesTo() {
  IFS=$'\n'
  for F in $(getFilesInDir $1); do
    # Make symlink
    yellow "- ${2}/${F} -> ${PWD}/${1}/${F}"
    ln -sf "${PWD}/${1}/${F}" "${2}/${F}"
  done
}

# Home files
blue "--> home symlinks.."
symlinkFilesTo home ${HOME}

# Sublime Text
blue "--> Sublime Text symlinks"
mkdir -p ${HOME}/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
symlinkFilesTo sublime ${HOME}/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# Atom.io
blue "--> Atom.io symlinks.."
mkdir -p ${HOME}/.atom
symlinkFilesTo atom ${HOME}/.atom

# Done
blue "--> Done!"

# Unset and source
unset yellow
unset red
unset blue
unset getFilesInDir
unset symlinkFilesTo

source ~/.bash_profile
