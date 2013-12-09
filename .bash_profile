PATH="/usr/local/bin:$PATH"
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# NVM
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh

# Default editor
export EDITOR='subl -w'

# Virtualenvwapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh

# grep color
export GREP_OPTIONS='--color=auto'

# ls color
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Deal with node.js open file limitations
ulimit -n 10000

function gi() { curl http://gitignore.io/api/$@ ;}

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

# Load private stuff
source ~/.dotfiles_private

# Git Autocomplete
source ~/.git-completion.bash

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
      export TERM=gnome-256color
    elif infocmp xterm-256color >/dev/null 2>&1; then
          export TERM=xterm-256color
        fi

        txtblk='\e[0;30m' # Black - Regular
        txtred='\e[0;31m' # Red
        txtgrn='\e[0;32m' # Green
        txtylw='\e[0;33m' # Yellow
        txtblu='\e[0;34m' # Blue
        txtpur='\e[0;35m' # Purple
        txtcyn='\e[0;36m' # Cyan
        txtwht='\e[0;37m' # White

        bldblk='\e[1;30m' # Black - Bold
        bldred='\e[1;31m' # Red
        bldgrn='\e[1;32m' # Green
        bldylw='\e[1;33m' # Yellow
        bldblu='\e[1;34m' # Blue
        bldpur='\e[1;35m' # Purple
        bldcyn='\e[1;36m' # Cyan
        bldwht='\e[1;37m' # White

        unkblk='\e[4;30m' # Black - Underline
        undred='\e[4;31m' # Red
        undgrn='\e[4;32m' # Green
        undylw='\e[4;33m' # Yellow
        undblu='\e[4;34m' # Blue
        undpur='\e[4;35m' # Purple
        undcyn='\e[4;36m' # Cyan
        undwht='\e[4;37m' # White

        bakblk='\e[40m'   # Black - Background
        bakred='\e[41m'   # Red
        badgrn='\e[42m'   # Green
        bakylw='\e[43m'   # Yellow
        bakblu='\e[44m'   # Blue
        bakpur='\e[45m'   # Purple
        bakcyn='\e[46m'   # Cyan
        bakwht='\e[47m'   # White

        txtrst='\e[0m'    # Text Reset

        function parse_git_dirty() {
          [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
        }

        function parse_git_branch() {
          git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
        }

        PS1="\[${txtgrn}\]\u \[${bldblu}\]at \[${txtylw}\]\h \[${bldblu}\]in \[${bldred}\]\w\[${bldblu}\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[${txtpur}\]\$(parse_git_branch)\[${bldblu}\]\n\$ \[${txtrst}\]"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# RVM Stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
