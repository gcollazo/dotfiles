#!/bin/bash
echo "==> Running symlinks.sh"

# Gets a list of files
function getFilesInDir() {
    find "$1" ! -path ./.DS_Store -name '*.*' -exec basename {} ';'
}

# $1 directory to search for files
# $2 destination of symlink
function symlinkFilesTo() {
  IFS=$'\n'
  for F in $(getFilesInDir "$1"); do
    # Make symlink
    echo "- ${2}/${F} -> ${PWD}/${1}/${F}"
    ln -sf "${PWD}/${1}/${F}" "${2}/${F}"
  done
}

# Home files
echo "Making home symlinks..."
symlinkFilesTo home "${HOME}"

# vscode
echo "Making VSCode symlinks..."
mkdir -p "${HOME}"/Library/Application\ Support/Code/User
symlinkFilesTo vscode "${HOME}"/Library/Application\ Support/Code/User

# Done
echo "Done with symlinks..."

# Unset
unset getFilesInDir
unset symlinkFilesTo
