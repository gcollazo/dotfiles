PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

# NVM
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh

# Deal with node.js open file limitations
ulimit -n 10000

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Default editor
export EDITOR='subl -w'

# Virtualenvwapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh

# docker
export DOCKER_HOST=tcp://localhost:4243

# grep color
export GREP_OPTIONS='--color=auto'

# ls color
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Aliases
alias g=git
alias c='cd ~/Dropbox/Code'
alias d='cd ~/Desktop'
alias h='cd ~/'
alias db='cd ~/Dropbox'
alias a='cd /Applications'
alias s='subl .'
alias o='open .'
alias ls='ls -lah'

# Git shortcuts
alias gpush='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpull='git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)'
alias gboom='gpull && gpush && echo BOOM!'
function gi() { curl http://www.gitignore.io/api/$@ ;}

# Network Aliases
alias torssh='ssh -o ProxyCommand="nc -X 4 -x localhost:9150 %h %p"'
function geoip(){ open http://www.ip-adress.com/ip_tracer/"${1}"; }
alias dig="dig ANY +noall +answer $1"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias whois="whois -h whois-servers.net"
alias flushdns='dscacheutil -flushcache'
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

# Other
alias server='python -m SimpleHTTPServer 8888'
alias redis='redis-server'
alias hashmd5='openssl md5'
alias hashsha1='openssl sha1'
alias hashsha256='shasum -a 256'
alias opendjango='open http://localhost:8000'
alias vagrantfile='curl https://gist.github.com/gcollazo/2f996c678a7c9859d97a/raw/Vagrantfile > Vagrantfile'
alias ember='brunch new gh:gcollazo/brunch-with-ember-reloaded $1'
alias npmls='npm list --depth=0 "$@" 2>/dev/null'
alias json='python -mjson.tool'

function mkvirtualenv2() {
    mkvirtualenv $1 --python=/usr/local/opt/python/bin/python
}

function mkvirtualenv3() {
    mkvirtualenv $1 --python=/usr/local/opt/python3/bin/python3.3
}

function mkvirtualenvpypy() {
    mkvirtualenv $1 --python=/usr/local/opt/pypy/bin/pypy
}

# Git Autocomplete
source ~/.git-completion.bash

# Load private stuff
source ~/.dotfiles_private

# Prompt setup
source ~/.prompt
