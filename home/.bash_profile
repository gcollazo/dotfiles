# Adds homebrew install path
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

# Adds Postgres.app binaries to path
PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# Adds by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

# Adds MongoDB.app to path
PATH="~/Applications/MongoDB.app/Contents/Resources/Vendor/mongodb:$PATH"

# NVM
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Python path — pip install -t .pip <package name>
# http://blog.zoomeranalytics.com/pip-install-t/
export PYTHONPATH="./.pip:$PYTHONPATH"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Andorid
export ANDROID_HOME="/Users/gcollazo/Library/Android/sdk"

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Default editor
export EDITOR='vim'


# grep color
export GREP_OPTIONS='--color=auto'

# ls color
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Alias
source ~/.aliases

# Prompt setup
source ~/.prompt

# Load dnvm / .net
[ -s "/Users/gcollazo/.dnx/dnvm/dnvm.sh" ] && . "/Users/gcollazo/.dnx/dnvm/dnvm.sh"
PATH="/Users/gcollazo/.dnx/runtimes/dnx-mono.1.0.0-rc1-update1/bin:$PATH"
