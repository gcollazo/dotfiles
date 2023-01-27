# starship
eval "$(starship init zsh)"

# enable the advanced completion system
autoload -U compinit && compinit

# case-insensitive (uppercase from lowercase) completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# enable completion menu
zstyle ':completion:*' menu yes select

# zsh plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# history search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE='true'

# Language environment
export LANG=en_US.UTF-8

# Default editor
export EDITOR='code --wait'
export VISUAL='code --wait'

# homebrew
export PATH="/usr/local/sbin:$PATH"

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

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

# Aliases
source "$HOME/.aliases"
