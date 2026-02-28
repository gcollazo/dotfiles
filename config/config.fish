# ==============================================================================
# Fish Shell Configuration
# ==============================================================================
# Personal configuration for Fish shell
# Author: Giovanni Collazo
# Location: ~/.config/fish/config.fish
# ==============================================================================


# ==============================================================================
# External Sources
# ==============================================================================

# Load secrets and sensitive environment variables
if test -f ~/Developer/dotfiles/secrets.sh
  source ~/Developer/dotfiles/secrets.sh
end


# ==============================================================================
# Environment Variables
# ==============================================================================

# Python - Require virtual environments for pip installations
export PIP_REQUIRE_VIRTUALENV=true

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config

# Go language
export GOPATH="$HOME/Developer/go"

# Java - Android Studio JDK
export JAVA_HOME="$HOME/Applications/Android Studio.app/Contents/jbr/Contents/Home"

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"


# ==============================================================================
# PATH Configuration
# ==============================================================================

# Bun JavaScript runtime
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Flutter SDK
set --export PATH "/Users/gcollazo/Developer/default/flutter/bin" $PATH

# Personal scripts
set --export PATH "/Users/gcollazo/Developer/personal/scripts" $PATH

# PostgreSQL
set --export PATH "/Applications/Postgres.app/Contents/Versions/17/bin" $PATH

# pnpm - Node package manager
set -gx PNPM_HOME "/Users/gcollazo/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# OpenCode
fish_add_path /Users/gcollazo/.opencode/bin


# ==============================================================================
# Shell Integrations & Tools
# ==============================================================================

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Starship prompt
starship init fish | source

# Docker Desktop
source /Users/gcollazo/.docker/init-fish.sh || true

# fnm - Fast Node Manager
eval $(fnm env)

# OrbStack - Docker/Linux alternative
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# 1Password CLI plugins
source ~/.config/op/plugins.sh

# FZF - Fuzzy finder
fzf --fish | source

# Disable fish greeting message
function fish_greeting
end


# ==============================================================================
# Aliases - Navigation & Directory Shortcuts
# ==============================================================================

alias c="cd ~/Developer"                # Developer folder
alias a="cd ~/AppSec"                   # AppSec folder
alias d="cd ~/Desktop"                  # Desktop
alias dl="cd ~/Downloads"               # Downloads
alias h="cd ~/"                         # Home directory
alias o="open ."                        # Open current directory in Finder


# ==============================================================================
# Aliases - File Listing & Viewing
# ==============================================================================

# Enhanced ls using eza
alias ls="eza --header --long --icons --all --git --ignore-glob='.DS_Store'"

# Tree view with eza
alias tree="eza --icons --all --tree --git-ignore --ignore-glob='.git|.venv|.DS_Store'"

# Image preview with fzf
alias lsimg="fzf --preview 'chafa -f kitty {}'"


# ==============================================================================
# Aliases - Editor Shortcuts
# ==============================================================================

alias vs="code ."                                   # VS Code
alias ws="open -na 'WebStorm.app' --args $1"        # WebStorm
alias pc="open -na 'PyCharm.app' --args $1"         # PyCharm
alias gl="open -na 'GoLand.app' --args $1"          # GoLand
alias rr="open -na 'RustRover.app' --args $1"       # RustRover


# ==============================================================================
# Aliases - Configuration File Shortcuts
# ==============================================================================

alias cfg_fish="vim ~/.config/fish/config.fish"          # Edit fish config
alias cfg_alias="vim ~/.config/fish/config.fish"         # Edit fish config (alias)
alias cfg_reload="source ~/.config/fish/config.fish"     # Reload fish config
alias cfg_ssh="vim ~/.ssh/config"                        # Edit SSH config
alias cfg_secrets="vim ~/Developer/dotfiles/secrets.sh"  # Edit secrets
alias cfg_hosts="sudo vim /etc/hosts"                    # Edit hosts file


# ==============================================================================
# Aliases - Git
# ==============================================================================

alias g="git"                                                               # Git shortcut
alias gfetch='git fetch --prune --all'                                      # Fetch all and prune
alias gpull='git pull --rebase origin (git rev-parse --abbrev-ref HEAD)'   # Pull current branch with rebase
alias gpush='git push origin (git rev-parse --abbrev-ref HEAD)'            # Push current branch
alias gsync='gpull && gpush'                                                # Pull and push current branch
alias gbranches='git branch -a'                                             # List all branches


# ==============================================================================
# Aliases - Jujutsu VCS (jj)
# ==============================================================================

alias jjs='jj st'                           # Status
alias jjl='jj log -r "all()" --limit 20'    # Log (last 20)
alias jjf='jj git fetch'                    # Fetch
alias jjp='jj git push'                     # Push


# ==============================================================================
# Aliases - Development Tools
# ==============================================================================

alias server='uvx python -m http.server --bind 0.0.0.0'  # Start HTTP server
alias ports='lsof -nP -iUDP -iTCP'                        # List open ports
alias speed="networkQuality -v"                           # Test network speed


# ==============================================================================
# Aliases - Server Management (Ansible)
# ==============================================================================

alias servers-ping='ansible all -m ping -i ~/Developer/personal/local-network/inventory.ini'
alias servers-status='ansible all -m shell -a "uptime" -i ~/Developer/personal/local-network/inventory.ini'
alias servers-update='ansible-playbook -i ~/Developer/personal/local-network/inventory.ini ~/Developer/personal/local-network/update-servers.yml'


# ==============================================================================
# Functions - Git Utilities
# ==============================================================================

# Generate .gitignore from gitignore.io
# Usage: gi python,node,macos > .gitignore
function gi
  curl "https://www.toptal.com/developers/gitignore/api/$argv[1]"
end


# ==============================================================================
# Functions - Archive & Compression
# ==============================================================================

# Create compressed archive using zstd
# Usage: archive myfile.txt
function archive
  tar --zstd -cf "$argv[1].tar.zst" $argv
end

# List contents of archive
# Usage: archive-ls myfile.tar.zst
function archive-ls
  tar -tvf $argv
end

# Extract archive
# Usage: unarchive myfile.tar.zst
function unarchive
  tar -xvf $argv
end

# Create password-protected ZIP
# Usage: zip-password myfile.txt
function zip-password
  zip -er "$argv[1].zip" "$argv[1]"
end


# ==============================================================================
# Functions - Encryption & Decryption
# ==============================================================================

# Encrypt file using age and 1Password
# Usage: encrypt myfile.txt
function encrypt
  age --encrypt -r (op read "op://Private/age keypair/public") "$argv[1]" > $argv[1].age
end

# Decrypt file using age and 1Password
# Usage: decrypt myfile.txt.age
function decrypt
  op read "op://Private/age keypair/private" | age --decrypt -i - "$argv[1]" > (string replace ".age" "" "$argv[1]")
end

# Archive and encrypt in one step
# Usage: archive_encrypt myfolder
function archive_encrypt
  archive $argv[1]
  encrypt "$argv[1].tar.zst"
  trash "$argv[1].tar.zst"
end

# Decrypt and unarchive in one step
# Usage: decrypt_unarchive myfile.tar.zst.age
function decrypt_unarchive
  decrypt $argv[1]
  unarchive (string replace ".age" "" "$argv[1]")
  trash (string replace ".age" "" "$argv[1]")
end


# ==============================================================================
# Functions - Network Utilities
# ==============================================================================

# Get IP information from ipinfo.io
# Usage: ipinfo 8.8.8.8
function ipinfo
  curl "https://ipinfo.io/$argv[1]"
end

# Display all local and remote IP addresses
# Usage: ips
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


# ==============================================================================
# Functions - Security & Privacy
# ==============================================================================

# Generate secure random password
# Usage: generate-random-password
function generate-random-password
  openssl rand -base64 32 | tr -d "=+/" | cut -c1-32
end

# Generate QR code in terminal
# Usage: qrcode "Hello World"
# Usage: echo "Hello World" | qrcode
function qrcode
  set -l input "$argv"
  if test -z "$input"
    set input "@/dev/stdin"
  end
  curl -d "$input" https://qrcode.show
end

# Generate QR code as SVG
# Usage: qrsvg "Hello World"
function qrsvg
  set -l input "$argv"
  if test -z "$input"
    set input "@/dev/stdin"
  end
  curl -d "$input" https://qrcode.show -H "Accept: image/svg+xml"
end

# Run OWASP ZAP baseline scan
# Usage: zap https://example.com
function zap
  docker run -v (pwd):/zap/wrk/:rw -t ghcr.io/zaproxy/zaproxy:stable zap-baseline.py -t $argv -l PASS -r "zap_"(date +%s)".html"
end


# ==============================================================================
# Functions - Pi-hole Management
# ==============================================================================

# Check Pi-hole status on all DNS servers
# Requires $NS1 and $NS2 environment variables
function pihole-status
  echo "$NS1:"
  ssh admin@$NS1 docker compose --file /home/admin/pihole/compose.yml exec pihole pihole status

  echo ""

  echo "$NS2:"
  ssh admin@$NS2 pihole status
end

# Disable Pi-hole on all DNS servers
function pihole-disable
  ssh admin@$NS1 docker compose --file /home/admin/pihole/compose.yml exec pihole pihole disable
  ssh admin@$NS2 sudo pihole disable
  echo ""
  pihole-status
end

# Enable Pi-hole on all DNS servers
function pihole-enable
  ssh admin@$NS1 docker compose --file /home/admin/pihole/compose.yml exec pihole pihole enable
  ssh admin@$NS2 sudo pihole enable
  echo ""
  pihole-status
end

