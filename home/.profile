# Adds homebrew install path
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Postgres.app
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# MongoDB.app
export PATH="/Applications/MongoDB.app/Contents/Resources/Vendor/mongodb/bin:$PATH"

# Redis.app
export PATH="/Applications/Redis.app/Contents/Resources/Vendor/redis/bin:$PATH"

# Android SDK
export ANDROID_HOME="/usr/local/Caskroom/android-sdk"

# pyenv
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# grep color
export GREP_OPTIONS='--color=auto'

# ls color
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Default editor
export EDITOR='vim'
export VISUAL='vim'

# Homebrew
export HOMEBREW_NO_ANALYTICS=1

# Alias
source "$HOME/.aliases"

# Prompt setup
source "$HOME/.prompt"

