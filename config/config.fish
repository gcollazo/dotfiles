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
if test -f ~/Developer/dotfiles/secrets.fish
  source ~/Developer/dotfiles/secrets.fish
end


# ==============================================================================
# Environment Variables
# ==============================================================================

# Python - Require virtual environments for pip installations
set -gx PIP_REQUIRE_VIRTUALENV true

# XDG Base Directory
set -gx XDG_CONFIG_HOME $HOME/.config

# Go language
set -gx GOPATH "$HOME/Developer/go"

# Java - Android Studio JDK
set -gx JAVA_HOME "$HOME/Applications/Android Studio.app/Contents/jbr/Contents/Home"

# Android SDK
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
set -gx ANDROID_SDK_ROOT $ANDROID_HOME


# ==============================================================================
# PATH Configuration
# ==============================================================================

# Bun JavaScript runtime
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# Flutter SDK
fish_add_path $HOME/Developer/default/flutter/bin

# Personal scripts
fish_add_path $HOME/Developer/personal/scripts

# PostgreSQL
fish_add_path /Applications/Postgres.app/Contents/Versions/17/bin

# pnpm - Node package manager
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path $PNPM_HOME

# OpenCode
fish_add_path $HOME/.opencode/bin


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
fnm env --shell fish | source

# OrbStack - Docker/Linux alternative
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# 1Password CLI plugins
source ~/.config/op/plugins.sh

# FZF - Fuzzy finder
fzf --fish | source

# Disable fish greeting message
set -g fish_greeting


# ==============================================================================
# Abbreviations - Navigation & Directory Shortcuts
# ==============================================================================

abbr -a c "cd ~/Developer"                # Developer folder
abbr -a a "cd ~/AppSec"                   # AppSec folder
abbr -a d "cd ~/Desktop"                  # Desktop
abbr -a dl "cd ~/Downloads"               # Downloads
abbr -a h "cd ~/"                         # Home directory
abbr -a o "open ."                        # Open current directory in Finder


# ==============================================================================
# Abbreviations - File Listing & Viewing
# ==============================================================================

# Enhanced ls using eza
abbr -a ls "eza --header --long --icons --all --git --ignore-glob='**/.DS_Store'"

# Tree view with eza
abbr -a tree "eza --icons --all --tree --git-ignore --ignore-glob='**/.git|**/.venv|**/.DS_Store'"

# Image preview with fzf
abbr -a lsimg "fzf --preview 'chafa -f kitty {}'"


# ==============================================================================
# Abbreviations - Editor Shortcuts
# ==============================================================================

abbr -a vs "code ."                                   # VS Code
abbr -a ws "open -na 'WebStorm.app' --args"             # WebStorm
abbr -a pc "open -na 'PyCharm.app' --args"              # PyCharm
abbr -a gl "open -na 'GoLand.app' --args"               # GoLand
abbr -a rr "open -na 'RustRover.app' --args"            # RustRover


# ==============================================================================
# Abbreviations - Configuration File Shortcuts
# ==============================================================================

abbr -a cfg_fish "vim ~/.config/fish/config.fish"          # Edit fish config
abbr -a cfg_alias "vim ~/.config/fish/config.fish"         # Edit fish config (alias)
abbr -a cfg_reload "source ~/.config/fish/config.fish"     # Reload fish config
abbr -a cfg_ssh "vim ~/.ssh/config"                        # Edit SSH config
abbr -a cfg_secrets "vim ~/Developer/dotfiles/secrets.sh"  # Edit secrets
abbr -a cfg_hosts "sudo vim /etc/hosts"                    # Edit hosts file


# ==============================================================================
# Abbreviations & Aliases - Git
# ==============================================================================

abbr -a g git                                                               # Git shortcut
abbr -a gfetch "git fetch --prune --all"                                    # Fetch all and prune
alias gpull='git pull --rebase origin (git rev-parse --abbrev-ref HEAD)'   # Pull current branch with rebase
alias gpush='git push origin (git rev-parse --abbrev-ref HEAD)'            # Push current branch
alias gsync='gpull && gpush'                                                # Pull and push current branch
abbr -a gbranches "git branch -a"                                           # List all branches


# ==============================================================================
# Abbreviations - Jujutsu VCS (jj)
# ==============================================================================

abbr -a jjs "jj st"                           # Status
abbr -a jjl 'jj log -r "all()" --limit 20'   # Log (last 20)
abbr -a jjf "jj git fetch"                    # Fetch
abbr -a jjp "jj git push"                     # Push


# ==============================================================================
# Abbreviations - Development Tools
# ==============================================================================

abbr -a server "uv run python -m http.server --bind 0.0.0.0 0"  # Start HTTP server
abbr -a ports "lsof -nP -iUDP -iTCP"                            # List open ports
abbr -a speed "networkQuality -v"                                # Test network speed


# ==============================================================================
# Abbreviations - Server Management (Ansible)
# ==============================================================================

abbr -a servers-ping "ansible all -m ping -i ~/Developer/personal/local-network/inventory.ini"
abbr -a servers-status 'ansible all -m shell -a "uptime" -i ~/Developer/personal/local-network/inventory.ini'
abbr -a servers-update "ansible-playbook -i ~/Developer/personal/local-network/inventory.ini ~/Developer/personal/local-network/update-servers.yml"


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
  tar --zstd -cf "$argv[1].tar.zst" "$argv[1]"
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

