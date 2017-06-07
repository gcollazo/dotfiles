# Adds homebrew install path
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

# Adds Postgres.app binaries to path
PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# Adds MongoDB.app to path
PATH="/Applications/MongoDB.app/Contents/Resources/Vendor/mongodb:$PATH"

# Default editor
export EDITOR='vim'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Andorid
export ANDROID_HOME="/usr/local/opt/android-sdk"

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# ls color
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Alias
source ~/.aliases

# Prompt setup
source ~/.prompt

