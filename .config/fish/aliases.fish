# ── Tool replacements (transparent, stay as aliases) ──────────────────────────
# These are drop-in replacements — you never need to see the expansion.

alias ls   "eza --icons --group-directories-first"
alias ll   "eza --icons --group-directories-first -la --git"
alias lt   "eza --icons --tree --level=2"
alias lta  "eza --icons --tree --level=3"

# bat config (~/.config/bat/config): no pager, plain style, Catppuccin Mocha.
alias cat  "bat"
alias batp "bat --style=full --paging=always"

alias find "fd"
alias rg   "rg --smart-case"

# ── Short-circuit commands (single purpose, no need to expand) ─────────────────
alias c      "clear"
alias ipv4   "dig +short myip.opendns.com @resolver1.opendns.com"
alias myip   "ipv4"
alias ports  "lsof -iTCP -sTCP:LISTEN -n -P"
alias py     "python3"
alias lg     "lazygit"

alias docker-nuke "docker stop (docker ps -a -q) 2>/dev/null; docker rm (docker ps -a -q) 2>/dev/null; docker system prune -f"
