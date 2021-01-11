# starship
eval "$(starship init zsh)"

# zsh plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# case-insensitive (uppercase from lowercase) completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Language environment
export LANG=en_US.UTF-8

# Default editor
export EDITOR='code --wait'
export VISUAL='code --wait'

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Postgres.app
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# MongoDB.app
export PATH="/Applications/MongoDB.app/Contents/Resources/Vendor/mongodb/bin:$PATH"

# Android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$ANDROID_SDK_ROOT/tools:$PATH"
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
export PATH="$ANDROID_SDK_ROOT/emulator:$PATH"
export PATH="/Applications/Android Studio.app/Contents/gradle/gradle-5.1.1/bin:$PATH"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[[ -r "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"

# pyenv
if which pyenv >/dev/null; then eval "$(pyenv init -)"; fi
export PATH="$HOME/.local/bin:$PATH"

# Aliases
source "$HOME/.aliases"

# Secrets
[ -s "$HOME/.secret" ] && source "$HOME/.secret"
