#!/bin/bash

# Aliases
alias c="cd ~/Developer"
alias a="cd ~/AppSec"
alias d="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias h="cd ~/"
alias ls="eza --header --long --icons --all --ignore-glob='.DS_Store'"
alias o="open ."
alias v="code ."
alias g="git"
alias tree="eza --icons --all --tree --git-ignore --ignore-glob='.git|.venv|.DS_Store'"
alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias speed="networkQuality -v"
alias pip-clean="pip freeze | xargs pip uninstall -y"
alias venv="python -m venv .venv"
alias aliasconfig="vim ~/Developer/dotfiles/aliases.sh"
alias sshconfig="vim ~/.ssh/config"
alias secretsconfig="vim ~/Developer/dotfiles/secrets.sh"
alias hostsconfig="sudo vim /etc/hosts"

# k8s
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgd="kubectl get deployments"
alias kdp="kubectl describe pod"
alias kaf="kubectl apply -f"
alias kdf="kubectl delete -f"

# Random
alias server='python -m http.server --bind 0.0.0.0'
alias ports='lsof -nP -iUDP -iTCP'

# System
alias update='sudo softwareupdate --install --all --verbose'

# Git
alias gsync='gpull && gpush'
alias gfetch='git fetch --prune --all'
alias gpull='git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)'
alias gpush='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gbranches='git branch -a'
function gi() { curl "https://www.toptal.com/developers/gitignore/api/$1"; }

# ZAP Baseline Scan: Runs OWASP ZAP baseline scan against a target URL
zap() {
    docker run -v "$(pwd):/zap/wrk/:rw" -t ghcr.io/zaproxy/zaproxy:stable zap-baseline.py -t "$@" -l PASS -r "zap_$(date +%s).html"
}

# Gobuster: Directory and DNS enumeration using wordlists
gobuster() {
    docker run --rm -it -v "$(pwd):/workspace" -v "$HOME/Developer/appsec/wordlists:/wordlists" ghcr.io/oj/gobuster  "$@" -o "/workspace/gobuster_$(date +%s).txt"
}

# BBOT: Automated reconnaissance framework
bbot() {
    docker run --rm -it -v "$HOME/.bbot:/root/.bbot" -v "$HOME/.config/bbot:/root/.config/bbot" blacklanternsecurity/bbot:stable "$@"
}

# Fast Scan: Scan only the most popular 1,000 ports with Unix timestamp in the filename
nmap_fast() {
    # -Pn: Treats all hosts as up (skips ICMP ping check, useful for firewalled hosts)
    # -T4: Aggressive timing template for faster scans
    # --top-ports 1000: Scans the 1,000 most popular ports
    # --open: Only displays open ports in the output
    nmap -Pn -T4 --top-ports 1000 --open -oN "fast_scan_$(date +%s).txt" --stats-every 5s "$1"
}

# Vulnerability Scan with NSE Scripts
nmap_vuln() {
    # --script=vuln: Runs Nmap's vulnerability detection scripts (e.g., CVEs, misconfigurations)
    # -p 80,443: Targets common web application ports (HTTP and HTTPS)
    nmap --script=vuln -p 80,443 -oN "vuln_scan_$(date +%s).txt" --stats-every 5s "$1"
}

# Archive / unarchive
function archive() {
  tar --zstd -cf "$1.tar.zst" "$@"
}
function archive-ls() {
  tar -tvf "$@"
}
function unarchive() {
  tar -xvf "$@"
}
function zip-password() {
  zip -er "$1.zip" "$1"
}

# Network
function ipinfo() { curl "https://ipinfo.io/$1"; }

# Show all ip addresses
function ips() {
  if [[ $(uname) == 'Darwin' ]]; then
    interface='en'
  else
    interface='eth'
  fi
  for NUMBER in $(seq 0 9); do
    ip=$(ifconfig "$interface$NUMBER" 2>/dev/null |
      grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' |
      grep -Eo '([0-9]*\.){3}[0-9]*')

    if [ -n "$ip" ]; then
      echo "Local($interface$NUMBER): $ip"
    fi
  done
  echo "Remote:     $(curl -s https://ipinfo.io/ip)"
}

# ssh: expose a local port
function ssh-tunnel-remote-to-local() {
  if [[ -z "$1" ]]; then
    printf '\nLocal port exposed to remote host\n'
    printf '\nUsage:\n'
    printf '\tssh-tunnel-local-to-remote <REMOTE_PORT> <LOCAL_PORT> <CONN>\n\n'
    return
  fi

  REMOTE_PORT="$1"
  LOCAL_PORT="$2"
  CONN="$3"

  ssh -nNT -R "$REMOTE_PORT":localhost:"$LOCAL_PORT" "$CONN"
}

# ssh: connect to remote port
function ssh-tunnel-local-to-remote() {
  if [[ -z "$1" ]]; then
    printf '\nConnect to host, expose host locally\n'
    printf '\nUsage:\n'
    printf '\tssh-tunnel-local-to-remote <LOCAL_PORT> <REMOTE_HOST> <REMOTE_PORT> <CONN>\n\n'
    return
  fi

  LOCAL_PORT="$1"
  REMOTE_HOST="$2"
  REMOTE_PORT="$3"
  CONN="$4"

  ssh -nNT -L "$LOCAL_PORT":"$REMOTE_HOST":"$REMOTE_PORT" "$CONN"
}

# ssh: starts a SOCKS proxy on $LOCAL_PORT
function ssh-proxy() {
  if [[ -z "$1" ]]; then
    printf '\nUsage:\n\tssh-proxy <LOCAL_PORT> <CONN>\n\n'
    return
  fi

  LOCAL_PORT="$1"
  CONN="$2"

  ssh -qNC -D "$LOCAL_PORT" "$CONN"
}

function generate-random-password() {
  openssl rand -base64 32 | tr -d "=+/" | cut -c1-32
}

zshstats () {
  fc -l 1 | \
  awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | \
  column -c3 -s " " -t | sort -nr | nl | head -n20
}

qrcode () {
  local input="$*"
  [ -z "$input" ] && local input="@/dev/stdin"
  curl -d "$input" https://qrcode.show
}

qrsvg () {
  local input="$*"
  [ -z "$input" ] && local input="@/dev/stdin"
  curl -d "${input}" https://qrcode.show -H "Accept: image/svg+xml"
}
