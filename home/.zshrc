# prompt
eval "$(starship init zsh)"

# general
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt AUTO_CD
setopt auto_list # automatically list choices on ambiguous completion
setopt AUTO_PUSHD
setopt CORRECT_ALL # autocorrect commands
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS # remove older duplicate entries from history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS # remove superfluous blanks from history items
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS # allow comments in interactive shells
setopt PUSHDMINUS
setopt SHARE_HISTORY
unsetopt PUSHD_IGNORE_DUPS

# Completion
autoload -Uz compinit && compinit
setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
unsetopt FLOW_CONTROL
unsetopt MENU_COMPLETE
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# previous completion with shift tab
bindkey '^[[Z' reverse-menu-complete

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Better history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Default editor
export EDITOR='vim'
export VISUAL='vim'

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

# ls color
export CLICOLOR=true
export LSCOLORS=dxfxcxdxbxegedabagacad

# Aliases
source "$HOME/.aliases"

# Secrets
[ -s "$HOME/.secret" ] && source "$HOME/.secret"
