PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

# Add MongoDB.app to path
PATH="/Applications/MongoDB.app/Contents/Resources/Vendor/mongodb:$PATH"

# NVM
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# go
export GOPATH=$HOME/Code/go
PATH=$PATH:$GOPATH/bin

# Default editor
export EDITOR='subl -w'

# Virtualenvwapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh

# docker
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# grep color
export GREP_OPTIONS='--color=auto'

# ls color
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Aliases
alias g=git
alias c="cd $HOME/Code"
alias d="cd $HOME/Desktop"
alias h="cd $HOME/"
alias b="cd $HOME/Dropbox"
alias dl="cd $HOME/Downloads"
alias a='cd /Applications'
alias s='subl .'
alias a='atom'
alias o='open .'
alias ls='ls -lah'

# Git shortcuts
alias gpush='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpull='git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)'
alias gboom='gpull && gpush && echo BOOM!'
function gi() { curl https://www.gitignore.io/api/$@ ;}

# Network Aliases
alias torssh='ssh -o ProxyCommand="nc -X 4 -x localhost:9150 %h %p"'
function geoip(){ open https://ipinfo.io/"${1}"; }
function ipinfo(){ open https://ipinfo.io/"${1}"; }
alias dig="dig ANY +noall +answer $1"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias flushdns='dscacheutil -flushcache'
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias scan="nmap -T4 --max-rtt-timeout=500ms --initial-rtt-timeout=200ms --min-rtt-timeout=200ms --open --stats-every 5s $1"
alias sscan="sudo nmap -sS -T4 --max-rtt-timeout=500ms --initial-rtt-timeout=200ms --min-rtt-timeout=200ms --open --stats-every 5s $1"

# Other
alias server='python -m SimpleHTTPServer 8888'
alias redis='redis-server'
alias hashmd5='openssl md5'
alias hashsha1='openssl sha1'
alias hashsha256='shasum -a 256'
alias opendjango='open http://localhost:8000'
alias vagrantfile='curl -O https://gist.githubusercontent.com/gcollazo/2f996c678a7c9859d97a/raw/Vagrantfile'
alias npmls='npm list --depth=0 "$@" 2>/dev/null'
alias json='python -mjson.tool'
alias shadowdisable='defaults write com.apple.screencapture disable-shadow -bool true && killall SystemUIServer'
alias shadowenable='defaults write com.apple.screencapture disable-shadow -bool false && killall SystemUIServer'

function mkvirtualenv2() {
    mkvirtualenv $1 --python=/usr/local/bin/python
}

function mkvirtualenv3() {
    mkvirtualenv $1 --python=/usr/local/bin/python3
}

function mkvirtualenvpypy() {
    mkvirtualenv $1 --python=/usr/local/bin/pypy
}

# Git Autocomplete
source ~/.git-completion.bash

# Prompt setup
source ~/.prompt
