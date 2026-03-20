# Secrets (never committed - transfer manually between machines)
[ -f "$HOME/.secrets.env" ] && set -a && . "$HOME/.secrets.env" && set +a

# Cargo (Rust)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# UV / local bin
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
