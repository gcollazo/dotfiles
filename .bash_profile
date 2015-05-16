# Adds homebrew install path
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

# Adds Postgres.app binaries to path
PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# Adds by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

# Adds MongoDB.app to path
PATH="/Applications/MongoDB.app/Contents/Resources/Vendor/mongodb:$PATH"

# NVM
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Go lang
export GOPATH=$HOME/Code/go
PATH=$PATH:$GOPATH/bin

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Default editor
export EDITOR='vim'
export VISUAL='vim'

# docker
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# grep color
export GREP_OPTIONS='--color=auto'

# ls color
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Alias
source ~/.aliases

# Prompt setup
source ~/.prompt
