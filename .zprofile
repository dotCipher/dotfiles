eval "$(/opt/homebrew/bin/brew shellenv)"

# Load secrets
[ -f "$HOME/.secrets.env" ] && set -a && source "$HOME/.secrets.env" && set +a
