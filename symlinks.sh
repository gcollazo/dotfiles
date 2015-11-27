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

# Get file list
function getFilesInDir() {
    find . ! -path . ! -path ./.git ! -path ./.DS_Store -maxdepth 1 -name '.*' -exec basename {} ';'
}

# Set vars
FILES=$(getFilesInDir)
CURRENTPATH=$(pwd)
FORCE=false

# Change value of FORCE
if [ "$1" == "--force" ]; then
    FORCE=true
fi

function createSymlinks() {
    for F in ${FILES[@]}; do
        # Delete files if --force was used
        if [ $FORCE == true ]; then
            red "--> [DELETE]: $HOME/${F}"
            rm $HOME/$F
        fi

        # Make symlink
        yellow "--> [LINK]: ${HOME}/${F} -> ${CURRENTPATH}/${F}"
        ln -s $CURRENTPATH/$F $HOME/$F

        if [ $? -eq 1 ]; then
            echo
            red "--> [ERROR]: You have already have a file named ${F} in your home folder."
            red "    Please backup of your old files."
            red "    Using \"--force\" will allow you to overwrite your existing files."
            echo
            break
        fi
    done
}

# Run
blue "--> dotfiles stuff.."
createSymlinks


# Atom.io
blue "--> Atom.io stuff.."
mkdir -p ~/.atom

yellow "--> [LINK]: config.cson"
ln -sf $PWD/atom/config.cson ~/.atom/config.cson

yellow "--> [LINK]: init.coffee"
ln -sf $PWD/atom/init.coffee ~/.atom/init.coffee

yellow "--> [LINK]: keymap.cson"
ln -sf $PWD/atom/keymap.cson ~/.atom/keymap.cson

yellow "--> [LINK]: snippets.cson"
ln -sf $PWD/atom/snippets.cson ~/.atom/snippets.cson

yellow "--> [LINK]: styles.less"
ln -sf $PWD/atom/styles.less ~/.atom/styles.less


# Unset and source
echo
blue "--> [DONE]"
echo

unset yellow
unset red
unset blue
unset getFilesInDir
unset createSymlinks

source ~/.bash_profile
