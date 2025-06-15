if test -f ~/Developer/dotfiles/secrets.sh
  source ~/Developer/dotfiles/secrets.sh
end

# Aliases
alias c="cd ~/Developer"
alias a="cd ~/AppSec"
alias d="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias h="cd ~/"
alias ls="eza --header --long --icons --all --ignore-glob='.DS_Store'"
alias o="open ."
alias v="code ."
alias ws="open -na 'WebStorm.app' --args $1"
alias pc="open -na 'PyCharm.app' --args $1"
alias gl="open -na 'GoLand.app' --args $1"
alias g="git"
alias tree="eza --icons --all --tree --git-ignore --ignore-glob='.git|.venv|.DS_Store'"
alias speed="networkQuality -v"
alias pip-clean="pip freeze | xargs pip uninstall -y"
alias venv="python -m venv .venv"
alias cfg_alias="vim ~/.config/fish/config.fish"
alias cfg_reload="source ~/.config/fish/config.fish"
alias cfg_ssh="vim ~/.ssh/config"
alias cfg_secrets="vim ~/Developer/dotfiles/secrets.sh"
alias cfg_hosts="sudo vim /etc/hosts"
alias cfg_fish="vim ~/.config/fish/config.fish"

# Random
alias server='python -m http.server --bind 0.0.0.0'
alias ports='lsof -nP -iUDP -iTCP'

# System
alias update='sudo softwareupdate --install --all --verbose'

# Git
alias gsync='gpull && gpush'
alias gfetch='git fetch --prune --all'
alias gpull='git pull --rebase origin (git rev-parse --abbrev-ref HEAD)'
alias gpush='git push origin (git rev-parse --abbrev-ref HEAD)'
alias gbranches='git branch -a'

function gi
  curl "https://www.toptal.com/developers/gitignore/api/$argv[1]"
end

# Archive / unarchive
function archive
  tar --zstd -cf "$argv[1].tar.zst" $argv
end

function archive-ls
  tar -tvf $argv
end

function unarchive
  tar -xvf $argv
end

function zip-password
  zip -er "$argv[1].zip" "$argv[1]"
end

function encrypt
  age --encrypt -r (op read "op://Private/age keypair/public") "$argv[1]" > $argv[1].age
end

function decrypt
  op read "op://Private/age keypair/private" | age --decrypt -i - "$argv[1]" > (string replace ".age" "" "$argv[1]")
end

function archive_encrypt
  archive $argv[1]
  encrypt "$argv[1].tar.zst"
  trash "$argv[1].tar.zst"
end

function decrypt_unarchive
  decrypt $argv[1]
  unarchive (string replace ".age" "" "$argv[1]")
  trash (string replace ".age" "" "$argv[1]")
end

function ipinfo
  curl "https://ipinfo.io/$argv[1]"
end

function ips
  set interface 'en'
  for NUMBER in (seq 0 9)
    set ip (ifconfig "$interface$NUMBER" 2>/dev/null |
      grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' |
      grep -Eo '([0-9]*\.){3}[0-9]*')
    if test -n "$ip"
      echo "Local($interface$NUMBER): $ip"
    end
  end
  echo "Remote:     "(curl -s https://ipinfo.io/ip)
end

function generate-random-password
  openssl rand -base64 32 | tr -d "=+/" | cut -c1-32
end

function qrcode
  set -l input "$argv"
  if test -z "$input"
    set input "@/dev/stdin"
  end
  curl -d "$input" https://qrcode.show
end

function qrsvg
  set -l input "$argv"
  if test -z "$input"
    set input "@/dev/stdin"
  end
  curl -d "$input" https://qrcode.show -H "Accept: image/svg+xml"
end

function zap
    docker run -v (pwd):/zap/wrk/:rw -t ghcr.io/zaproxy/zaproxy:stable zap-baseline.py -t $argv -l PASS -r "zap_"(date +%s)".html"
end

function pihole-status
  echo "$NS1:"
  ssh admin@$NS1 docker compose --file /home/admin/pihole/compose.yml exec pihole pihole status

  echo ""

  echo "$NS2:"
  ssh admin@$NS2 pihole status
end


function pihole-disable
  ssh admin@$NS1 docker compose --file /home/admin/pihole/compose.yml exec pihole pihole disable
  ssh admin@$NS2 sudo pihole disable
  echo ""
  pihole-status
end

function pihole-enable
  ssh admin@$NS1 docker compose --file /home/admin/pihole/compose.yml exec pihole pihole enable
  ssh admin@$NS2 sudo pihole enable
  echo ""
  pihole-status
end


# reset greeting
function fish_greeting
end


eval "$(/opt/homebrew/bin/brew shellenv)"
starship init fish | source
source /Users/gcollazo/.docker/init-fish.sh || true # Added by Docker Desktop

pyenv init - fish | source
export PIP_REQUIRE_VIRTUALENV=true
export XDG_CONFIG_HOME=$HOME/.config

export GOPATH="$HOME/Developer/go"

# fnm node version manager
eval $(fnm env)

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH "/Users/gcollazo/Developer/default/flutter/bin" $PATH
set --export PATH "/Users/gcollazo/Developer/personal/scripts" $PATH
set --export PATH "/Applications/Postgres.app/Contents/Versions/17/bin" $PATH
source ~/.config/op/plugins.sh
alias claude="/Users/gcollazo/.claude/local/claude"
