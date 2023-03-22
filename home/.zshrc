# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# starship
eval "$(starship init zsh)"

# enable the advanced completion system
autoload -U compinit && compinit

# case-insensitive (uppercase from lowercase) completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# enable completion menu
zstyle ':completion:*' menu yes select

# zsh plugins
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

# history search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE='true'

# Language environment
export LANG=en_US.UTF-8

# Default editor
export EDITOR='code --wait'
export VISUAL='code --wait'

# Postgres.app
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Poetry
export PATH="$HOME/.local/bin:$PATH"

# go
export GOPATH="$HOME/Developer/go"
export PATH="$GOPATH/bin:$PATH"

# rust binaries
export PATH="$HOME/.cargo/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Docker Desktop
source "$HOME/.docker/init-zsh.sh" || true

# Aliases
source "$HOME/.aliases"
